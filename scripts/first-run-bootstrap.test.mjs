// The bootstrap's removal list is executable behaviour that one document
// transcribes for the reader: docs/recipes/first-run-setup.md prints it as the
// expected dry-run output, and the reader is told to compare the two. That
// transcript has drifted from the script twice already, so these tests pin the
// two together: the `REMOVE=` line in scripts/first-run-bootstrap.sh is the
// single source of truth, and the recipe's bullets must name exactly it.
//
// Runs offline via `node --test scripts/*.test.mjs` — the glob
// convention-check.yml runs on every push and pull request, in the template
// AND in every created module (the bootstrap keeps both files: they are on the
// NEVER list). Deliberately NOT in go-publish.yml's explicit test list, which
// covers the publication scripts only.
import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import { fileURLToPath } from "node:url";
import test from "node:test";

const repository = fileURLToPath(new URL("../", import.meta.url));
const SCRIPT = "scripts/first-run-bootstrap.sh";
const RECIPE = "docs/recipes/first-run-setup.md";

const script = readFileSync(repository + SCRIPT, "utf8");
const recipe = readFileSync(repository + RECIPE, "utf8");

// One of the two `local NAME="a b c"` lists the script declares.
function listFromScript(name) {
  const m = script.match(new RegExp(`^\\s*local ${name}="([^"]*)"`, "m"));
  assert.ok(m, `${SCRIPT} must declare a \`local ${name}=\` list`);
  return m[1].trim().split(/\s+/);
}

// The paths the recipe transcribes under "the list of files it would remove",
// i.e. every backticked token until the next top-level bullet.
function pathsFromRecipe() {
  const marker = "On a fresh template this is:";
  const start = recipe.indexOf(marker);
  assert.ok(start !== -1, `${RECIPE} must transcribe the dry-run removal list`);
  const rest = recipe.slice(start + marker.length);
  const end = rest.search(/\n- \*\*/);
  assert.ok(end !== -1, `${RECIPE}: the removal bullets must end at the next step`);
  return [...rest.slice(0, end).matchAll(/`([^`]+)`/g)].map((m) => m[1]);
}

test("the recipe transcribes exactly the script's REMOVE list", () => {
  const documented = [...new Set(pathsFromRecipe())].sort();
  const removed = [...new Set(listFromScript("REMOVE"))].sort();
  assert.deepEqual(
    documented,
    removed,
    `${RECIPE} and ${SCRIPT}'s REMOVE= line disagree — the doc is the transcript, the script wins`,
  );
});

test("the bootstrap and its recipe are NEVER-protected", () => {
  const never = listFromScript("NEVER");
  assert.ok(never.includes(RECIPE), `${SCRIPT}: NEVER must protect ${RECIPE}`);
  assert.ok(
    never.includes("scripts") || never.includes(SCRIPT),
    `${SCRIPT}: NEVER must protect the bootstrap itself`,
  );
});

test("no removal target collides with a NEVER-protected path", () => {
  const never = listFromScript("NEVER");
  for (const target of listFromScript("REMOVE")) {
    for (const protectedPath of never) {
      assert.ok(
        target !== protectedPath && !target.startsWith(protectedPath + "/"),
        `${SCRIPT}: removal target '${target}' collides with protected '${protectedPath}' — the script would abort with exit 3`,
      );
    }
  }
});
