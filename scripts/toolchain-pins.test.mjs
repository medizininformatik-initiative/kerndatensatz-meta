// The toolchain pins (IG Publisher + its SHA-256, SUSHI, Jekyll) are declared
// once per build workflow, because a workflow cannot read another workflow's
// `env:` block. Nothing shares them — so this test makes the drift detectable
// instead: it fails the moment the blocks stop agreeing.
//
// docs/maintenance.md ("Where each pin lives") is the prose side of the same
// rule. Run with:  node --test scripts/toolchain-pins.test.mjs
import { test } from "node:test";
import assert from "node:assert/strict";
import { readFileSync, existsSync } from "node:fs";
import { fileURLToPath } from "node:url";

import { parseWorkflowEnvPin } from "./check-updates.mjs";

const repository = fileURLToPath(new URL("../", import.meta.url));

const WORKFLOWS = [
  ".github/workflows/go-publish.yml",
  ".github/workflows/ig-publisher.yml",
  ".github/workflows/module-release.yml",
  // Template-repo only — the first-run bootstrap removes it from a created
  // module, which readIfPresent below tolerates. It matters here because the
  // release demo is the artifact the Pages root index calls "the release": a
  // demo rendered by a different IG Publisher than the previews it is compared
  // against would be a silent difference in exactly that artifact.
  ".github/workflows/release-demo.yml",
];

const KEYS = ["PUBLISHER_VERSION", "PUBLISHER_SHA256", "SUSHI_VERSION", "JEKYLL_VERSION"];

function readIfPresent(relativePath) {
  const file = `${repository}${relativePath}`;
  return existsSync(file) ? readFileSync(file, "utf8") : null;
}

/** The build workflows that exist here — a created module may drop one. */
function presentWorkflows() {
  return WORKFLOWS.map((file) => ({ file, text: readIfPresent(file) })).filter((w) => w.text !== null);
}

for (const key of KEYS) {
  test(`${key} is identical in every build workflow`, () => {
    const present = presentWorkflows();
    if (present.length < 2) return; // nothing to compare

    const values = present.map(({ file, text }) => {
      const value = parseWorkflowEnvPin(text, key);
      assert.ok(value, `${file} has no ${key} env pin`);
      return { file, value };
    });

    const [first, ...rest] = values;
    for (const other of rest) {
      assert.equal(
        other.value,
        first.value,
        `${other.file} pins ${key}=${other.value}, ${first.file} pins ${first.value}`,
      );
    }
  });
}
