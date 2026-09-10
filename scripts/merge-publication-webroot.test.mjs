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
import test from "node:test";

import { mergePublicationBootstrap } from "./merge-publication-webroot.mjs";

function write(path, content = "") {
  mkdirSync(join(path, ".."), { recursive: true });
  writeFileSync(path, content);
}

test("imports a historical version and preserves marker-backed previews", () => {
  const fixture = mkdtempSync(join(tmpdir(), "publication-merge-"));
  const published = join(fixture, "published");
  const site = join(fixture, "site");

  write(join(published, "index.html"), "formal root");
  write(join(published, "package-list.json"), "{}");
  write(join(published, "2026.0.0", "package.tgz"), "formal package");
  write(join(published, "2026.0.0", "index.html"), "formal version");
  write(join(published, "history.css"), "history stylesheet");
  write(
    join(published, "assets-hist", "js", "jquery.js"),
    "history jquery",
  );
  write(
    join(published, "dist-hist", "js", "bootstrap.min.js"),
    "history bootstrap",
  );

  write(join(site, ".branch-name"), "main\n");
  write(join(site, "index.html"), "legacy root");
  write(join(site, "stale-root-file.html"), "remove me");
  write(join(site, "CNAME"), "example.org\n");
  write(join(site, "develop", ".branch-name"), "develop\n");
  write(join(site, "develop", "index.html"), "develop preview");
  write(
    join(site, "release", "v2026.0.0", ".branch-name"),
    "release/v2026.0.0\n",
  );
  write(
    join(site, "release", "v2026.0.0", "index.html"),
    "release preview",
  );
  write(join(site, "2026.0.0", ".branch-name"), "2026.0.0\n");
  write(join(site, "2026.0.0", "index.html"), "legacy version");

  const previews = mergePublicationBootstrap({
    publishedDirectory: published,
    siteDirectory: site,
    version: "2026.0.0",
  });

  assert.deepEqual(
    previews.map(({ branch }) => branch).sort(),
    ["develop", "release/v2026.0.0"],
  );
  assert.equal(readFileSync(join(site, "index.html"), "utf8"), "formal root");
  assert.equal(
    readFileSync(join(site, "2026.0.0", "index.html"), "utf8"),
    "formal version",
  );
  assert.equal(
    readFileSync(join(site, "develop", "index.html"), "utf8"),
    "develop preview",
  );
  assert.equal(
    readFileSync(join(site, "release", "v2026.0.0", "index.html"), "utf8"),
    "release preview",
  );
  assert.equal(
    readFileSync(join(site, "history.css"), "utf8"),
    "history stylesheet",
  );
  assert.equal(
    readFileSync(join(site, "assets-hist", "js", "jquery.js"), "utf8"),
    "history jquery",
  );
  assert.equal(
    readFileSync(join(site, "dist-hist", "js", "bootstrap.min.js"), "utf8"),
    "history bootstrap",
  );
  assert.equal(readFileSync(join(site, "CNAME"), "utf8"), "example.org\n");
  assert.ok(existsSync(join(site, ".nojekyll")));
  assert.ok(!existsSync(join(site, ".branch-name")));
  assert.ok(!existsSync(join(site, "2026.0.0", ".branch-name")));
  assert.ok(!existsSync(join(site, "stale-root-file.html")));
});
