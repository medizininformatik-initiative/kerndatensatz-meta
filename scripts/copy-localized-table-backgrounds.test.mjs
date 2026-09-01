import assert from "node:assert/strict";
import {
  existsSync,
  mkdtempSync,
  mkdirSync,
  readFileSync,
  writeFileSync,
} from "node:fs";
import { tmpdir } from "node:os";
import { join } from "node:path";
import { spawnSync } from "node:child_process";
import { fileURLToPath } from "node:url";
import test from "node:test";

const script = fileURLToPath(
  new URL("./copy-localized-table-backgrounds.sh", import.meta.url),
);

function write(path, content) {
  mkdirSync(join(path, ".."), { recursive: true });
  writeFileSync(path, content);
}

function run(...args) {
  return spawnSync("bash", [script, ...args], { encoding: "utf8" });
}

test("copies only missing table backgrounds into existing language directories", () => {
  const root = mkdtempSync(join(tmpdir(), "localized-table-backgrounds-"));
  write(join(root, "tbl_bck0.png"), "root zero");
  write(join(root, "tbl_bck10.png"), "root ten");
  write(join(root, "other.png"), "unrelated");
  mkdirSync(join(root, "tbl_bck-directory.png"));
  write(join(root, "en", "tbl_bck0.png"), "localized zero");
  mkdirSync(join(root, "de"));

  const result = run(root);

  assert.equal(result.status, 0, result.stderr);
  assert.match(result.stdout, /Copied 3 missing/);
  assert.equal(
    readFileSync(join(root, "en", "tbl_bck0.png"), "utf8"),
    "localized zero",
  );
  assert.equal(
    readFileSync(join(root, "en", "tbl_bck10.png"), "utf8"),
    "root ten",
  );
  assert.equal(
    readFileSync(join(root, "de", "tbl_bck0.png"), "utf8"),
    "root zero",
  );
  assert.equal(
    readFileSync(join(root, "de", "tbl_bck10.png"), "utf8"),
    "root ten",
  );
  assert.ok(!existsSync(join(root, "en", "other.png")));
  assert.ok(!existsSync(join(root, "en", "tbl_bck-directory.png")));
});

test("does not create absent language directories", () => {
  const root = mkdtempSync(join(tmpdir(), "localized-table-backgrounds-"));
  write(join(root, "tbl_bck0.png"), "root zero");

  const result = run(root);

  assert.equal(result.status, 0, result.stderr);
  assert.match(result.stdout, /Copied 0 missing/);
  assert.ok(!existsSync(join(root, "en")));
  assert.ok(!existsSync(join(root, "de")));
});

test("check mode fails for a missing localized file and passes after copying", () => {
  const root = mkdtempSync(join(tmpdir(), "localized-table-backgrounds-"));
  write(join(root, "tbl_bck0.png"), "root zero");
  mkdirSync(join(root, "en"));

  const missing = run(root, "--check");
  assert.equal(missing.status, 1);
  assert.match(missing.stderr, /Missing localized table background/);

  assert.equal(run(root).status, 0);
  const complete = run(root, "--check");
  assert.equal(complete.status, 0, complete.stderr);
  assert.match(complete.stdout, /are complete/);
});

test("rejects a missing output directory and unknown modes", () => {
  const root = mkdtempSync(join(tmpdir(), "localized-table-backgrounds-"));

  assert.equal(run(join(root, "missing")).status, 1);
  assert.equal(run(root, "--unknown").status, 2);
});
