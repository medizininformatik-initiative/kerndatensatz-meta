// Guards scripts/self-check-substitute.sh — the single source of truth for the
// template repository's self-check placeholder values, shared by
// ig-publisher.yml (branch previews) and release-demo.yml (the published demo).
//
// The property that matters most: in RELEASE mode the demo IG's version is
// derived from the tag. The published demo used to carry a fixed literal
// unrelated to any release (demo/v0.5.2/ rendering "… v2026.0.0"), which is
// exactly what a version-from-the-tag rule prevents.
//
// The script is run against a MINIMAL fixture tree in a temp directory, not
// against the repository, so the test is fast, offline and side-effect free.
//
// Run with:  node --test scripts/self-check-substitute.test.mjs
import { test } from "node:test";
import assert from "node:assert/strict";
import { execFileSync } from "node:child_process";
import { mkdtempSync, mkdirSync, writeFileSync, readFileSync, readdirSync, rmSync } from "node:fs";
import { tmpdir } from "node:os";
import { join } from "node:path";
import { fileURLToPath } from "node:url";

const SCRIPT = fileURLToPath(new URL("./self-check-substitute.sh", import.meta.url));

/** A minimal stand-in for the real scaffold: the three input kinds the script
 * treats differently — a config value, a page, and a placeholder FILE NAME. */
function fixture() {
  const root = mkdtempSync(join(tmpdir(), "self-check-"));
  writeFileSync(
    join(root, "sushi-config.yaml"),
    [
      "id: mii-ig-{{MODULE_SLUG}}",
      "# a comment holding {{MODULE_SLUG}} must not trip the active-placeholder guard",
      'version: "{{CALVER_VERSION}}"',
      "title: MII Implementation Guide {{MODULE_TITLE}}",
      "",
    ].join("\n"),
  );
  // The template line mirrors the real ig.ini's URL default; the script must
  // leave it untouched either way (URL default or the #ig-template fallback).
  writeFileSync(join(root, "ig.ini"), "[IG]\nig = fsh-generated/resources/ImplementationGuide-mii-ig-{{MODULE_SLUG}}.json\ntemplate = https://github.com/medizininformatik-initiative/ig-template-mii-kds\n");
  mkdirSync(join(root, "input", "translations", "de", "pagecontent"), { recursive: true });
  mkdirSync(join(root, "input", "pagecontent"), { recursive: true });
  writeFileSync(join(root, "input", "index.md"), "Version {{CALVER_VERSION}}, year {{CALVER_YEAR}}.\n");
  writeFileSync(join(root, "input", "translations", "de", "ImplementationGuide-mii-ig-{{MODULE_SLUG}}.po"), 'msgid "x"\n');
  // the IG-resource intro pages: placeholder in the NAME and liquid in the body
  writeFileSync(
    join(root, "input", "pagecontent", "ImplementationGuide-mii-ig-{{MODULE_SLUG}}.md"),
    "- [XML](../ImplementationGuide-mii-ig-{{MODULE_SLUG}}.xml)\n\n{% lang-fragment dependency-table.xhtml %}\n",
  );
  writeFileSync(
    join(root, "input", "translations", "de", "pagecontent", "ImplementationGuide-mii-ig-{{MODULE_SLUG}}.md"),
    "- [XML](../ImplementationGuide-mii-ig-{{MODULE_SLUG}}.xml)\n\n{% lang-fragment dependency-table.xhtml %}\n",
  );
  return root;
}

function run(root, env = {}) {
  return execFileSync("bash", [SCRIPT, "--root", root], {
    encoding: "utf8",
    env: { ...process.env, ...env },
  });
}

test("preview mode substitutes the fixed draft CalVer", () => {
  const root = fixture();
  try {
    const out = run(root);
    const config = readFileSync(join(root, "sushi-config.yaml"), "utf8");
    assert.match(config, /^version: "2027\.0\.0-draft\.1"$/m);
    assert.match(config, /^id: mii-ig-template$/m);
    assert.match(config, /^title: MII Implementation Guide Module Template$/m);
    assert.match(out, /CALVER_VERSION=2027\.0\.0-draft\.1/);
  } finally {
    rmSync(root, { recursive: true, force: true });
  }
});

test("release mode derives the demo version from the tag", () => {
  const root = fixture();
  try {
    run(root, { SELF_CHECK_RELEASE_TAG: "v0.5.2" });
    const config = readFileSync(join(root, "sushi-config.yaml"), "utf8");
    // CalVer shape (what the scaffold teaches) carrying the template release it
    // was built from — so the render cannot claim an unrelated version.
    assert.match(config, /^version: "2027\.0\.0-template\.0\.5\.2"$/m);
    assert.match(readFileSync(join(root, "input", "index.md"), "utf8"), /Version 2027\.0\.0-template\.0\.5\.2, year 2027\./);
  } finally {
    rmSync(root, { recursive: true, force: true });
  }
});

test("release mode reports the version it wrote via GITHUB_OUTPUT", () => {
  const root = fixture();
  const outputFile = join(root, "gh-output.txt");
  writeFileSync(outputFile, "");
  try {
    run(root, { SELF_CHECK_RELEASE_TAG: "v1.2.3", GITHUB_OUTPUT: outputFile });
    // release-demo.yml asserts the built ImplementationGuide against THIS value
    // rather than re-deriving the formula, so it must be reported.
    assert.match(readFileSync(outputFile, "utf8"), /^demo_version=2027\.0\.0-template\.1\.2\.3$/m);
  } finally {
    rmSync(root, { recursive: true, force: true });
  }
});

test("a placeholder in a FILE NAME is renamed, not just substituted", () => {
  const root = fixture();
  try {
    run(root);
    const names = readdirSync(join(root, "input", "translations", "de"));
    // Left unrenamed the publisher silently ignores the catalogue and German
    // pages fall back to English titles.
    assert.deepEqual(names.sort(), ["ImplementationGuide-mii-ig-template.po", "pagecontent"]);
    // The IG-resource intro pages (EN + DE mirror) are renamed too — their
    // sushi-config pages: key substitutes to the same name, so an unrenamed
    // file is a hard "missing source file" build failure.
    for (const dir of [join(root, "input", "pagecontent"), join(root, "input", "translations", "de", "pagecontent")]) {
      assert.deepEqual(readdirSync(dir), ["ImplementationGuide-mii-ig-template.md"]);
      const body = readFileSync(join(dir, "ImplementationGuide-mii-ig-template.md"), "utf8");
      assert.match(body, /ImplementationGuide-mii-ig-template\.xml/, "contents substituted");
      assert.match(body, /{% lang-fragment dependency-table\.xhtml %}/, "liquid left untouched");
    }
  } finally {
    rmSync(root, { recursive: true, force: true });
  }
});

test("a non-release tag is rejected", () => {
  const root = fixture();
  try {
    assert.throws(
      () => run(root, { SELF_CHECK_RELEASE_TAG: "main" }),
      /is not a vMAJOR\.MINOR\.PATCH tag/,
    );
  } finally {
    rmSync(root, { recursive: true, force: true });
  }
});

test("a value missing from the table fails instead of shipping a placeholder", () => {
  const root = fixture();
  try {
    writeFileSync(join(root, "input", "index.md"), "An unknown {{NOT_IN_THE_TABLE}} slot.\n");
    let failure;
    try {
      run(root);
    } catch (error) {
      failure = error;
    }
    assert.ok(failure, "an unsubstituted placeholder must fail the build");
    // The guard writes its ::error:: annotation to stdout, which execFileSync
    // exposes on the thrown error rather than in its message.
    assert.match(String(failure.stdout), /unsubstituted \{\{PLACEHOLDER\}\}/);
  } finally {
    rmSync(root, { recursive: true, force: true });
  }
});
