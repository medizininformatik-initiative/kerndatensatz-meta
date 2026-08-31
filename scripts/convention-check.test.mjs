// Unit tests for the convention checker. Run with: node --test scripts/
import { test } from "node:test";
import { readFileSync } from "node:fs";
import assert from "node:assert/strict";
import { evaluate, readTopLevel, readDependencies, readIgIniTemplate, scanOptionalPages } from "./convention-check.mjs";

// A parameterized scaffold sushi-config, as this repo ships it.
const SCAFFOLD = `id: mii-ig-{{MODULE_SLUG}}
canonical: https://www.medizininformatik-initiative.de/fhir/modul-{{MODULE_SLUG}}
name: MII_IG_{{MODULE_NAME}}
title: MII Implementation Guide {{MODULE_TITLE}}
version: "{{CALVER_VERSION}}"
packageId: de.medizininformatikinitiative.kerndatensatz.{{MODULE_SLUG}}
dependencies:
  de.basisprofil.r4: 1.5.4
  hl7.fhir.uv.crmi: 2.0.0
`;

// A fully-resolved, valid module.
const CONCRETE = `id: mii-ig-base
canonical: https://www.medizininformatik-initiative.de/fhir/modul-base
name: MII_IG_Base
title: MII Implementation Guide Core Dataset Base
version: "2026.0.1"
packageId: de.medizininformatikinitiative.kerndatensatz.base
dependencies:
  de.basisprofil.r4: 1.5.4
`;
const CONCRETE_IGINI = "[IG]\ntemplate = de.medizininformatikinitiative.template#0.1.0\n";

function ids(findings, status) {
  return findings.filter((f) => f.status === status).map((f) => f.id);
}

function m5(canonical, release = true) {
  const sushi = CONCRETE.replace(
    "canonical: https://www.medizininformatik-initiative.de/fhir/modul-base",
    `canonical: ${canonical}`
  );
  const { findings } = evaluate({ sushiConfig: sushi, igIni: CONCRETE_IGINI, release });
  return findings.find((f) => f.id === "M5 canonical");
}

test("M5 accepts all three MII canonical spaces (ext/core/bare are published reality)", () => {
  // Measured 2026-08-27 across the medizininformatik-initiative repos:
  // ext ×14, core ×7, bare ×5 — and a canonical is immutable, so the check
  // must accept them all (raised by the Pathologie module team).
  for (const canonical of [
    "https://www.medizininformatik-initiative.de/fhir/modul-base",
    "https://www.medizininformatik-initiative.de/fhir/ext/modul-patho",
    "https://www.medizininformatik-initiative.de/fhir/core/modul-labor",
  ]) {
    assert.equal(m5(canonical).status, "pass", `${canonical} must pass M5`);
  }
});

test("M5 still rejects what is genuinely outside the canonical universe", () => {
  for (const canonical of [
    "https://example.org/fhir/modul-x",                                   // wrong host
    "https://www.medizininformatik-initiative.de/fhir/ext/",              // empty module
    "https://www.medizininformatik-initiative.de/fhir/ext/a/b",           // nested deeper
    "https://www.medizininformatik-initiative.de/fhir/core/ext/modul-x",  // stacked spaces
    "https://www.medizininformatik-initiative.de/fhir/Modul-X",           // uppercase
  ]) {
    assert.equal(m5(canonical).status, "fail", `${canonical} must fail M5`);
  }
  assert.match(m5("https://www.medizininformatik-initiative.de/fhir/ext/a/b").message,
    /allowed canonical spaces/);
});

test("M5 keeps placeholder handling in the ext/core spaces", () => {
  const finding = m5("https://www.medizininformatik-initiative.de/fhir/ext/modul-{{MODULE_SLUG}}", false);
  assert.equal(finding.status, "parameterized");
});

test("extractors read values, strip quotes and comments", () => {
  assert.equal(readTopLevel(SCAFFOLD, "id"), "mii-ig-{{MODULE_SLUG}}");
  assert.equal(readTopLevel(CONCRETE, "version"), "2026.0.1");
  assert.equal(readTopLevel("status: active # a comment\n", "status"), "active");
  // Quoted value WITH a trailing comment: the quotes end the value, the
  // comment is not part of it (annotating above the line is no longer the
  // only safe form - the measured M4 false-failure class).
  assert.equal(readTopLevel('title: "MII Modul X" # decided 2026-08-28\n', "title"), "MII Modul X");
  assert.equal(readTopLevel("license: 'CC0-1.0' # carried from the source\n", "license"), "CC0-1.0");
  // A hash INSIDE the quotes is content, never a comment.
  assert.equal(readTopLevel('title: "MII # 1"\n', "title"), "MII # 1");
  assert.equal(readDependencies(SCAFFOLD).length, 2);
  assert.equal(readIgIniTemplate(CONCRETE_IGINI), "de.medizininformatikinitiative.template#0.1.0");
});

test("scaffold passes in development mode (placeholders are parameterized)", () => {
  const { findings, ok } = evaluate({ sushiConfig: SCAFFOLD, igIni: "template = TODO-TEMPLATE-REFERENCE", release: false });
  assert.equal(ok, true, "scaffold must be green on non-release branches");
  // M1..M6 are all parameterized on the scaffold.
  assert.deepEqual(
    ids(findings, "parameterized").sort(),
    ["M1 packageId", "M2 id", "M3 name", "M4 title", "M5 canonical", "M6 version"].sort()
  );
  // No template package manifest → 1b is skipped.
  assert.ok(ids(findings, "skip").includes("Section 1b"));
});

test("scaffold FAILS on a release branch (placeholders unresolved)", () => {
  const { findings, ok } = evaluate({ sushiConfig: SCAFFOLD, igIni: "template = TODO-X", release: true });
  assert.equal(ok, false, "unresolved placeholders must fail a release");
  const failed = ids(findings, "fail");
  assert.ok(failed.includes("M1 packageId"));
  assert.ok(failed.includes("M6 version"));
  // The bring-up TODO template is rejected for a release too.
  assert.ok(failed.includes("M7 template pinned"));
});

test("a fully-resolved valid module passes in both modes", () => {
  for (const release of [false, true]) {
    const { ok, findings } = evaluate({ sushiConfig: CONCRETE, igIni: CONCRETE_IGINI, release });
    assert.equal(ok, true, `concrete module must pass (release=${release})`);
    assert.ok(ids(findings, "pass").includes("M1 packageId"));
  }
});

test("malformed concrete values fail", () => {
  const bad = CONCRETE.replace("packageId: de.medizininformatikinitiative.kerndatensatz.base",
    "packageId: com.example.wrong.base")
    .replace("id: mii-ig-base", "id: wrong-base")
    .replace('version: "2026.0.1"', 'version: "1.2.3"'); // SemVer, not CalVer
  const { ok, findings } = evaluate({ sushiConfig: bad, igIni: CONCRETE_IGINI, release: false });
  assert.equal(ok, false);
  const failed = ids(findings, "fail");
  assert.ok(failed.includes("M1 packageId"));
  assert.ok(failed.includes("M2 id"));
  assert.ok(failed.includes("M6 version"));
});

test("a floating dependency pin fails M7 on every branch", () => {
  const floating = CONCRETE.replace("de.basisprofil.r4: 1.5.4", "de.basisprofil.r4: current");
  const { ok, findings } = evaluate({ sushiConfig: floating, igIni: CONCRETE_IGINI, release: false });
  assert.equal(ok, false);
  assert.ok(ids(findings, "fail").includes("M7 no floating pins"));
});

test("a floating ig.ini template fails M7", () => {
  const igIni = "template = fhir2.base.template#current\n";
  const { ok, findings } = evaluate({ sushiConfig: CONCRETE, igIni, release: false });
  assert.equal(ok, false);
  assert.ok(ids(findings, "fail").includes("M7 no floating pins"));
});

// The publication gate in go-publish.yml refuses #cibuild; M7 must refuse it
// too, or a CI-build pin passes every PR and only aborts a formal publication.
test("a #cibuild ig.ini template fails M7", () => {
  const igIni = "template = fhir2.base.template#cibuild\n";
  const { ok, findings } = evaluate({ sushiConfig: CONCRETE, igIni, release: false });
  assert.equal(ok, false);
  assert.ok(ids(findings, "fail").includes("M7 no floating pins"));
});

test("a pinned package reference, the vendored folder and the interim URL all pass M7", () => {
  // The repository-URL form is the sanctioned interim (decision 2026-08-28,
  // docs/concepts.md section 2): it carries no floating LABEL, and the
  // published id#version pin replaces it once the package is on the registry.
  for (const tmpl of ["de.medizininformatikinitiative.template#1.0.0", "#ig-template",
    "https://github.com/medizininformatik-initiative/ig-template-mii-kds"]) {
    const { findings } = evaluate({ sushiConfig: CONCRETE, igIni: `template = ${tmpl}\n`, release: false });
    assert.ok(ids(findings, "pass").includes("M7 no floating pins"), tmpl);
  }
});

test("template package manifest (Section 1b) is validated when present", () => {
  const good = { name: "de.medizininformatikinitiative.template", type: "fhir.template", version: "0.1.0", dependencies: { "fhir2.base.template": "0.1.0" } };
  const r1 = evaluate({ sushiConfig: null, packageJson: good });
  assert.ok(ids(r1.findings, "pass").includes("T4 base template pinned"));

  const bad = { name: "wrong", type: "fhir.ig", version: "current", dependencies: { "fhir2.base.template": "current" } };
  const r2 = evaluate({ sushiConfig: null, packageJson: bad });
  assert.equal(r2.ok, false);
  assert.ok(ids(r2.findings, "fail").includes("T4 base template pinned"));
});

test("missing sushi-config yields a skip, not a crash", () => {
  const { findings } = evaluate({ sushiConfig: null });
  assert.ok(ids(findings, "skip").includes("Section 1a"));
});

test("M8 — the demonstration page blocks a release, but not development", () => {
  // Shipped so an author can see the mechanisms working; it renders the
  // scaffold's starter artefacts, so publishing it in a real module would ship
  // someone else's example profile as content. Deleting it at creation would
  // mean nobody reads it, so the gate is at release, not at creation.
  const dev = evaluate({ demoPagePresent: true, release: false });
  const rel = evaluate({ demoPagePresent: true, release: true });
  const gone = evaluate({ demoPagePresent: false, release: true });

  assert.equal(dev.findings.find((f) => f.id === "M8")?.status, "pass");
  assert.equal(rel.findings.find((f) => f.id === "M8")?.status, "fail");
  assert.equal(rel.ok, false, "a release with the demo page still present must fail");
  assert.equal(gone.findings.find((f) => f.id === "M8"), undefined);

  // The message must name every file, or the author fixes one and re-runs.
  const msg = rel.findings.find((f) => f.id === "M8").message;
  for (const f of [
    "input/pagecontent/rendering-artifacts.md",
    "input/translations/de/pagecontent/rendering-artifacts.md",
    "sushi-config.yaml",
    "input/includes/menu.xml",
    "input/translations/de/includes/menu.xml",
  ]) {
    assert.ok(msg.includes(f), `the failure message should name ${f}`);
  }
});

test("M9 — undecided optional pages block a release, but not development", () => {
  // The approved MII module menu marks some entries OPTIONAL (0..1). Each
  // ships with an OPTIONAL-PAGE marker + banner; the gate is at release so the
  // scaffold can present the choice without failing every PR.
  const undecided = [
    { page: "extensions.md", en: "marked", de: "marked" },
    { page: "operations.md", en: "marked", de: "marked" },
  ];
  const dev = evaluate({ optionalPages: undecided, release: false });
  const rel = evaluate({ optionalPages: undecided, release: true });

  assert.equal(dev.findings.find((f) => f.id === "M9 optional pages")?.status, "pass");
  assert.equal(dev.ok, true, "undecided optional pages must be green in development");
  assert.equal(rel.findings.find((f) => f.id === "M9 optional pages")?.status, "fail");
  assert.equal(rel.ok, false, "a release with undecided optional pages must fail");

  // The failure message must teach both exits: keep (delete banner in both
  // languages) and remove (the documented per-entry procedure).
  const msg = rel.findings.find((f) => f.id === "M9 optional pages").message;
  for (const s of ["docs/optional-pages.md", "input/translations/de/pagecontent", "menu.xml", ".po"]) {
    assert.ok(msg.includes(s), `the failure message should mention ${s}`);
  }
});

test("M9 — a half-applied decision (marker asymmetry) fails on every branch", () => {
  for (const release of [false, true]) {
    const { ok, findings } = evaluate({
      optionalPages: [{ page: "value-sets.md", en: "unmarked", de: "marked" }],
      release,
    });
    assert.equal(ok, false, `asymmetry must fail (release=${release})`);
    const f = findings.find((x) => x.id === "M9 optional pages");
    assert.equal(f.status, "fail");
    assert.ok(f.message.includes("BOTH languages"));
  }
  // A page removed in one language only is asymmetric too.
  const half = evaluate({
    optionalPages: [{ page: "code-systems.md", en: "absent", de: "marked" }],
    release: false,
  });
  assert.equal(half.ok, false);
});

test("M9 — decided everywhere (or no scan) yields pass / no finding", () => {
  const decided = evaluate({ optionalPages: [], release: true });
  assert.equal(decided.findings.find((f) => f.id === "M9 optional pages")?.status, "pass");
  assert.equal(decided.ok, true);

  // Unit-test callers that pass no tree scan get no M9 finding at all.
  const noScan = evaluate({ release: true });
  assert.equal(noScan.findings.find((f) => f.id === "M9 optional pages"), undefined);
});

test("M11 — scaffold illustrative examples block a release, but not development", () => {
  // security-and-privacy.md ships a highlighted Person example in its
  // module-specific section, marked ILLUSTRATIVE-EXAMPLE; like the M9
  // banners it is a visible "decide me" that must not survive into a release.
  const present = [{ page: "security-and-privacy.md", en: "marked", de: "marked" }];
  const dev = evaluate({ illustrativeExamples: present, release: false });
  const rel = evaluate({ illustrativeExamples: present, release: true });

  assert.equal(dev.findings.find((f) => f.id === "M11 illustrative examples")?.status, "pass");
  assert.equal(dev.ok, true, "a scaffold example must be green in development");
  assert.equal(rel.findings.find((f) => f.id === "M11 illustrative examples")?.status, "fail");
  assert.equal(rel.ok, false, "a release shipping a scaffold example must fail");

  // The failure message must teach the exit: delete the box + marker in both
  // languages, then write own content or adopt the default text.
  const msg = rel.findings.find((f) => f.id === "M11 illustrative examples").message;
  for (const s of ["input/pagecontent", "input/translations/de/pagecontent", "default text"]) {
    assert.ok(msg.includes(s), `the failure message should mention ${s}`);
  }
});

test("M11 — a half-removed example (marker asymmetry) fails on every branch", () => {
  for (const release of [false, true]) {
    const { ok, findings } = evaluate({
      illustrativeExamples: [{ page: "security-and-privacy.md", en: "unmarked", de: "marked" }],
      release,
    });
    assert.equal(ok, false, `asymmetry must fail (release=${release})`);
    const f = findings.find((x) => x.id === "M11 illustrative examples");
    assert.equal(f.status, "fail");
    assert.ok(f.message.includes("BOTH languages"));
  }
});

test("M11 — removed everywhere (or no scan) yields pass / no finding", () => {
  const removed = evaluate({ illustrativeExamples: [], release: true });
  assert.equal(removed.findings.find((f) => f.id === "M11 illustrative examples")?.status, "pass");
  assert.equal(removed.ok, true);

  const noScan = evaluate({ release: true });
  assert.equal(noScan.findings.find((f) => f.id === "M11 illustrative examples"), undefined);
});

test("scanOptionalPages pairs the languages of this repository's scaffold", () => {
  const root = new URL("..", import.meta.url).pathname;
  const entries = scanOptionalPages(root);
  // TEMPLATE REPO vs CREATED MODULE: a created module legitimately REMOVES
  // optional pages and deletes the markers of KEPT ones (the M9 decision), so
  // the full-scaffold state below holds only where the placeholders do —
  // detected the same way the self-check does, by an unreplaced
  // {{MODULE_SLUG}} in sushi-config.yaml (this test ships into created
  // modules; asserting the template's committed state there broke a real
  // migration's CI). In every repository, whatever optional pages DO exist
  // must agree across the two languages.
  const sushi = readFileSync(`${root}/sushi-config.yaml`, "utf8");
  // Detected by the PARSED id value, never by a substring of the whole file:
  // a module that keeps the placeholder documentation as COMMENTS still
  // contains "{{MODULE_SLUG}}" textually, and the substring test forced the
  // full-scaffold assertions below onto a real module that had legitimately
  // removed optional pages per its M9 decision (issue #165, measured on the
  // Onkologie migration). The full-scaffold pins further down are DELIBERATE
  // for the template repository itself — they catch scanner regressions — and
  // with this detection they can no longer reach a created module.
  const isTemplateRepo = String(readTopLevel(sushi, "id") ?? "").includes("{{");
  for (const e of entries) {
    assert.equal(e.en, e.de,
      `${e.page}: the EN and DE copies must agree on the OPTIONAL-PAGE marker (undecided in both, or decided in both)`);
  }
  if (isTemplateRepo) {
    assert.ok(entries.length >= 7, "the scaffold ships at least 7 optional pages");
    for (const e of entries) {
      assert.equal(e.en, "marked", `${e.page} must carry the marker in English`);
    }
    const names = entries.map((e) => e.page);
    for (const p of ["researcher-guidance.md", "extensions.md", "search-parameters.md",
      "operations.md", "value-sets.md", "code-systems.md", "metadata.md"]) {
      assert.ok(names.includes(p), `${p} should be scanned as optional`);
    }
  }
});
