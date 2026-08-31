// Guards scripts/meta-pin-drift.mjs — the THO/Extensions-Pack lockstep check.
//
// The property that matters most: a module that DROPS its direct THO or
// extensions pin must be warned about, because the IG Publisher then silently
// injects the latest release at build time (its auto-add guard reads only the
// IG's own dependsOn — verified in PublisherIGLoader at the pinned release).
// Meta's pins, where present, are the family's source of truth.
//
// Offline: the comparison logic is tested pure, and the CLI path uses
// --meta-package-json fixtures — no network.
//
// Run with:  node --test scripts/meta-pin-drift.test.mjs
import { test } from "node:test";
import assert from "node:assert/strict";
import { execFileSync } from "node:child_process";
import { mkdtempSync, writeFileSync, readFileSync, rmSync } from "node:fs";
import { tmpdir } from "node:os";
import { join } from "node:path";
import { fileURLToPath } from "node:url";
import { compareFamilyPins, familyPin, FAMILIES } from "./meta-pin-drift.mjs";

const SCRIPT = fileURLToPath(new URL("./meta-pin-drift.mjs", import.meta.url));

const MODULE_DEPS = {
  "de.medizininformatikinitiative.kerndatensatz.meta": "2026.0.0",
  "hl7.terminology.r4": "7.3.0",
  "hl7.fhir.uv.extensions.r4": "5.3.0",
};

test("in step with meta: no warnings", () => {
  const { lines, warnings } = compareFamilyPins(
    MODULE_DEPS,
    { "hl7.terminology.r4": "7.3.0", "hl7.fhir.uv.extensions.r4": "5.3.0" },
    "2026.0.0",
  );
  assert.equal(warnings.length, 0);
  assert.ok(lines.every((l) => l.includes("in step with meta")));
});

test("meta pins neither (today's 2026.0.0): notice, not warning", () => {
  const { lines, warnings } = compareFamilyPins(MODULE_DEPS, {}, "2026.0.0");
  assert.equal(warnings.length, 0);
  assert.ok(lines.every((l) => l.includes("module's pin is authoritative")));
});

test("drift against meta warns per family", () => {
  const { warnings } = compareFamilyPins(
    MODULE_DEPS,
    { "hl7.terminology.r4": "7.1.0", "hl7.fhir.uv.extensions.r4": "5.3.0" },
    "2026.0.0",
  );
  assert.equal(warnings.length, 1);
  assert.match(warnings[0], /7\.3\.0/);
  assert.match(warnings[0], /7\.1\.0/);
  assert.match(warnings[0], /source of truth/);
});

test("a module that dropped its direct pin is warned (publisher would inject latest)", () => {
  const { warnings } = compareFamilyPins(
    { "de.medizininformatikinitiative.kerndatensatz.meta": "2026.0.0" },
    { "hl7.terminology.r4": "7.3.0" },
    "2026.0.0",
  );
  assert.equal(warnings.length, 2, "one warning per unpinned family");
  assert.ok(warnings.every((w) => /inject the LATEST release/.test(w)));
});

test("family matching mirrors the publisher's guards (variants count)", () => {
  const tho = FAMILIES[0];
  assert.ok(familyPin({ "hl7.terminology.r5": "1.0.0" }, tho), "r5 variant matches");
  const ext = FAMILIES[1];
  assert.ok(familyPin({ "hl7.fhir.uv.extensions": "5.3.0" }, ext), "unsuffixed id matches");
  assert.equal(familyPin({ "hl7.fhir.uv.extensions.weird": "1.0.0" }, ext), null,
    "unknown extension-family id does not match (exact list, like the publisher)");
});

test("CLI: fixture meta package.json, markdown out, exit 0", () => {
  const root = mkdtempSync(join(tmpdir(), "meta-drift-"));
  try {
    writeFileSync(
      join(root, "sushi-config.yaml"),
      [
        "dependencies:",
        "  de.medizininformatikinitiative.kerndatensatz.meta: 2026.0.0",
        "  hl7.terminology.r4: 7.3.0",
        "  hl7.fhir.uv.extensions.r4: 5.3.0",
        "pages:",
        "",
      ].join("\n"),
    );
    writeFileSync(
      join(root, "meta.json"),
      JSON.stringify({ dependencies: { "hl7.terminology.r4": "7.2.0" } }),
    );
    const md = join(root, "out.md");
    execFileSync(
      "node",
      [SCRIPT, "--root", root, "--meta-package-json", join(root, "meta.json"), "--markdown-out", md],
      { encoding: "utf8" },
    );
    const out = readFileSync(md, "utf8");
    assert.match(out, /## THO \/ Extensions Pack — lockstep with meta/);
    assert.match(out, /⚠️.*7\.3\.0.*7\.2\.0/, "drift row rendered");
    assert.match(out, /Extensions Pack.*pins none.*authoritative/, "absent-in-meta notice rendered");
  } finally {
    rmSync(root, { recursive: true, force: true });
  }
});
