import assert from "node:assert/strict";
import { mkdtempSync, mkdirSync, readFileSync, writeFileSync } from "node:fs";
import { tmpdir } from "node:os";
import { join } from "node:path";
import test from "node:test";

import { fixPublicationHistoryLinks } from "./fix-publication-history-links.mjs";

// Fixture values only: a fictitious example module (MII canonical vs. GitHub
// Pages publication website).
const canonical =
  "https://www.medizininformatik-initiative.de/fhir/modul-example";
const publicationBase =
  "https://example-org.github.io/kds-module-example";

function write(path, content) {
  mkdirSync(join(path, ".."), { recursive: true });
  writeFileSync(path, content);
}

function releasePage(historyUrl, extra = "") {
  return `<!doctype html>
<!--ReleaseHeader--><p id="publish-box">See the <a href="${historyUrl}">Directory of published versions</a>.</p><!--EndReleaseHeader-->
${extra}
`;
}

test("rewrites only canonical history links in publication headers", () => {
  const root = mkdtempSync(join(tmpdir(), "publication-history-links-"));
  const rootPage = join(root, "index.html");
  const versionPage = join(root, "2026.0.1", "profile.html");
  const unrelated = `<a href="${canonical}/history.html">Canonical reference outside the publish box</a>`;
  write(rootPage, releasePage(`${canonical}/history.html`, unrelated));
  write(versionPage, releasePage(`${canonical}/history.html`));

  assert.deepEqual(
    fixPublicationHistoryLinks(root, canonical, publicationBase),
    { files: 2, replacements: 2 },
  );
  assert.match(
    readFileSync(rootPage, "utf8"),
    new RegExp(`${publicationBase}/history\\.html`),
  );
  assert.match(readFileSync(rootPage, "utf8"), new RegExp(unrelated));
  assert.match(
    readFileSync(versionPage, "utf8"),
    new RegExp(`${publicationBase}/history\\.html`),
  );
});

test("preserves marker-backed preview deployments", () => {
  const root = mkdtempSync(join(tmpdir(), "publication-history-preview-"));
  const preview = join(root, "branches", "develop");
  const page = join(preview, "index.html");
  const source = releasePage(`${canonical}/history.html`);
  write(join(preview, ".branch-name"), "develop\n");
  write(page, source);

  assert.deepEqual(
    fixPublicationHistoryLinks(root, canonical, publicationBase),
    { files: 0, replacements: 0 },
  );
  assert.equal(readFileSync(page, "utf8"), source);
});

test("rejects invalid or identical website URLs", () => {
  const root = mkdtempSync(join(tmpdir(), "publication-history-invalid-"));
  assert.throws(
    () => fixPublicationHistoryLinks(root, "not-a-url", publicationBase),
    /not an absolute URL/,
  );
  assert.throws(
    () => fixPublicationHistoryLinks(root, canonical, `${canonical}/`),
    /must be different/,
  );
});
