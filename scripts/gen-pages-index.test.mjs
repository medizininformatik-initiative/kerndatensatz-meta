// Guards scripts/gen-pages-index.mjs — the generator that writes the gh-pages
// ROOT index.html as a plain autoindex-style listing.
//
// Why these properties and not others: the page's whole contract is "list
// exactly what the decision of 2026-08-28 says, and only what exists". So the
// tests pin
//   * the two listed surfaces (branches/dev/, demo/<latest-tag>/) and their
//     absence when not yet deployed,
//   * the SemVer pick of "latest" (numeric — v0.10.0 > v0.9.9, where a string
//     sort silently regresses the demo),
//   * that the retired showcase/prose surfaces never resurface, and
//   * the do-not-edit + deliberately-unlisted markers.
//
// Run with:  node --test scripts/gen-pages-index.test.mjs
import { test } from "node:test";
import assert from "node:assert/strict";
import { mkdtempSync, mkdirSync, rmSync, writeFileSync } from "node:fs";
import { tmpdir } from "node:os";
import { join } from "node:path";

import {
  compareSemver,
  discoverPages,
  generateIndex,
  latestDemoTag,
} from "./gen-pages-index.mjs";

const REPO = "medizininformatik-initiative/mii-kds-module-template";

test("compareSemver: numeric pre-release identifiers compare numerically", () => {
  assert.ok(compareSemver("v0.13.0-rc.10", "v0.13.0-rc.2") > 0, "rc.10 > rc.2");
  assert.ok(compareSemver("v0.13.0-rc.2", "v0.13.0") < 0, "pre-release < release");
});

test("normal case: lists the dev preview and the latest demo, nothing else", () => {
  const html = generateIndex({ repo: REPO, dev: true, demoTag: "v0.13.0", demoEntries: null });
  assert.match(html, /<a href="branches\/dev\/">branches\/dev\/<\/a>/);
  assert.match(html, /<a href="demo\/v0\.13\.0\/">demo\/v0\.13\.0\/<\/a>/);
  assert.match(html, /released state of <code>main<\/code>/);
  assert.match(html, new RegExp(`<a href="https://github.com/${REPO}">mii-kds-module-template</a>`));
  // Exactly the two links into the site itself — nothing unlisted leaks in.
  const localLinks = [...html.matchAll(/href="(?!https?:)([^"]+)"/g)].map((m) => m[1]);
  assert.deepEqual(localLinks, ["branches/dev/", "demo/v0.13.0/"]);
});

test("no-dev-yet: the branches/dev entry is omitted, the demo stays", () => {
  const html = generateIndex({ repo: REPO, dev: false, demoTag: "v0.13.0", demoEntries: null });
  assert.doesNotMatch(html, /branches\/dev/);
  assert.match(html, /demo\/v0\.13\.0\//);
});

test("no-demo-yet: the demo entry is omitted, the dev preview stays", () => {
  const html = generateIndex({ repo: REPO, dev: true, demoTag: null, demoEntries: null });
  assert.doesNotMatch(html, /href="demo\//);
  assert.match(html, /href="branches\/dev\/"/);
});

test("neither deployed yet: the page still renders, with an empty-state line", () => {
  const html = generateIndex({ repo: REPO, dev: false, demoTag: null, demoEntries: null });
  assert.doesNotMatch(html, /href="branches\/dev|href="demo\//);
  assert.match(html, /nothing deployed yet/);
});

test("a demo without a root index.html is listed via its real entry points", () => {
  const html = generateIndex({
    repo: REPO,
    dev: true,
    demoTag: "v0.13.0",
    demoEntries: ["en/", "de/", "qa.html"],
  });
  assert.doesNotMatch(html, /<a href="demo\/v0\.13\.0\/">/);
  assert.match(html, /<a href="demo\/v0\.13\.0\/en\/">en\/<\/a>/);
  assert.match(html, /<a href="demo\/v0\.13\.0\/de\/">de\/<\/a>/);
  assert.match(html, /<a href="demo\/v0\.13\.0\/qa\.html">qa\.html<\/a>/);
});

test("semver ordering is numeric: v0.10.0 > v0.9.9, and a pre-release loses to its release", () => {
  assert.ok(compareSemver("v0.10.0", "v0.9.9") > 0);
  assert.ok(compareSemver("v0.9.9", "v0.10.0") < 0);
  assert.ok(compareSemver("v1.0.0", "v0.99.99") > 0);
  assert.ok(compareSemver("v0.13.0-rc.1", "v0.13.0") < 0);
  assert.equal(compareSemver("v0.13.0", "v0.13.0"), 0);
  assert.equal(latestDemoTag(["v0.5.2", "v0.9.9", "v0.10.0", "v0.6.1"]), "v0.10.0");
  // Non-version directory names never win (or crash) the pick.
  assert.equal(latestDemoTag(["notes", "v0.9.9", ".nojekyll"]), "v0.9.9");
  assert.equal(latestDemoTag(["notes"]), null);
  assert.equal(latestDemoTag([]), null);
});

test("the retired showcase and prose surfaces never resurface", () => {
  const html = generateIndex({ repo: REPO, dev: true, demoTag: "v0.13.0", demoEntries: null });
  // The sandbox-module showcase, the FGDH prose links, the docs/releases
  // boilerplate: all deliberately gone (decision 2026-08-28).
  assert.doesNotMatch(html, /sandbox/i);
  assert.doesNotMatch(html, /Real modules built from this template/i);
  assert.doesNotMatch(html, /forschungsgruppe-digital-health\.github\.io/);
  assert.doesNotMatch(html, /Use this template/i);
  assert.doesNotMatch(html, /Forschungsgruppe Digital Health/);
  assert.doesNotMatch(html, /releases<\/a>|\/tree\/main\/docs/i);
  // The one external link is the repository itself, in the header line.
  const external = [...html.matchAll(/href="(https?:[^"]+)"/g)].map((m) => m[1]);
  assert.deepEqual(external, [`https://github.com/${REPO}`]);
});

test("the do-not-edit and deliberately-unlisted markers are present as comments", () => {
  const html = generateIndex({ repo: REPO, dev: true, demoTag: "v0.13.0", demoEntries: null });
  assert.match(html, /<!-- generated by scripts\/gen-pages-index\.mjs - do not edit by hand -->/);
  assert.match(html, /deliberately unlisted/);
  // Self-contained: no external stylesheet, script, image or font.
  assert.doesNotMatch(html, /<link|<script|<img|@import|url\(/);
});

// ── discoverPages against a real directory tree ────────────────────────────

function fixture(build) {
  const root = mkdtempSync(join(tmpdir(), "gen-pages-index-"));
  try {
    build(root);
    return discoverPages(root);
  } finally {
    rmSync(root, { recursive: true, force: true });
  }
}

test("discoverPages: full site — dev preview + highest demo with a root index.html", () => {
  const state = fixture((root) => {
    mkdirSync(join(root, "branches", "dev"), { recursive: true });
    writeFileSync(join(root, "branches", "dev", "index.html"), "<html></html>");
    for (const tag of ["v0.9.9", "v0.10.0", "v0.5.2"]) {
      mkdirSync(join(root, "demo", tag), { recursive: true });
      writeFileSync(join(root, "demo", tag, "index.html"), "<html></html>");
    }
  });
  assert.deepEqual(state, { dev: true, demoTag: "v0.10.0", demoEntries: null });
});

test("discoverPages: a demo without a root index.html reports its existing entry points", () => {
  const state = fixture((root) => {
    mkdirSync(join(root, "demo", "v0.10.0", "en"), { recursive: true });
    writeFileSync(join(root, "demo", "v0.10.0", "en", "index.html"), "<html></html>");
    mkdirSync(join(root, "demo", "v0.10.0", "de"), { recursive: true });
    writeFileSync(join(root, "demo", "v0.10.0", "de", "index.html"), "<html></html>");
    writeFileSync(join(root, "demo", "v0.10.0", "qa.html"), "<html></html>");
  });
  assert.deepEqual(state, { dev: false, demoTag: "v0.10.0", demoEntries: ["en/", "de/", "qa.html"] });
});

test("discoverPages: an empty gh-pages checkout reports nothing to link", () => {
  const state = fixture(() => {});
  assert.deepEqual(state, { dev: false, demoTag: null, demoEntries: null });
});
