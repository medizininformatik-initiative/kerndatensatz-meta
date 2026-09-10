#!/usr/bin/env node
// gen-pages-index — GENERATE the gh-pages ROOT index.html as a plain,
// web-server-autoindex-style listing of what the site actually serves.
//
// WHY THIS EXISTS (and what it replaced)
//   The root index used to be a HAND-AUTHORED landing page, conservatively
//   repointed at each release by scripts/update-demo-links.mjs — a rewriter
//   whose anchored regexes failed the release job whenever the prose drifted.
//   Decision 2026-08-28: the root carries no prose worth anchoring. It is now
//   GENERATED, and it enumerates ONLY
//     * branches/dev/       — the development preview
//     * demo/<latest-tag>/  — the latest release demo (= the released state of
//                             main; main deliberately has no branch preview)
//   Everything else the old page carried — the sandbox-module showcase, the
//   FGDH prose links, the docs/releases boilerplate — is gone. Older demos and
//   other branch previews stay DEPLOYED and reachable by URL; they are just
//   deliberately unlisted, and the generated page says so in an HTML comment.
//
// WHAT IT LINKS
//   Only what EXISTS in the gh-pages checkout at generation time. If the
//   latest demo/<tag>/ has no root index.html, its real entry points (de/,
//   en/, qa.html) are listed as sub-links instead.
//
// WHO RUNS IT
//   release-demo.yml after placing demo/<tag>/, and ig-publisher.yml after
//   placing a branch preview (template repository only — a created module's
//   site root stays reserved for the gated -go-publish output), so the index
//   heals on every deploy. Runnable by hand against any gh-pages checkout.
//
// USAGE
//   node scripts/gen-pages-index.mjs <gh-pages-checkout> [owner/repo]
//
//   [owner/repo] defaults to $GITHUB_REPOSITORY, then to the canonical
//   medizininformatik-initiative/mii-kds-module-template.
//
// The pure logic lives in generateIndex() (+ latestDemoTag / discoverPages),
// unit-tested without a workflow run in scripts/gen-pages-index.test.mjs.
// Zero runtime dependencies (Node >= 18).

import { existsSync, readdirSync, statSync, writeFileSync } from "node:fs";
import { join } from "node:path";

const DEFAULT_REPO = "medizininformatik-initiative/mii-kds-module-template";

/** `v1.2.3` (+ optional pre-release/build suffix) — the demo directory shape. */
const VERSION_DIR = /^v(\d+)\.(\d+)\.(\d+)(?:-([0-9A-Za-z.-]+))?(?:\+[0-9A-Za-z.-]+)?$/;

/** Entry points probed when a demo has no root index.html: the bilingual
 * renderings and the QA report, in the order the old landing page listed them. */
const DEMO_ENTRY_CANDIDATES = ["en/", "de/", "qa.html"];

/** Numeric SemVer comparison (so v0.10.0 > v0.9.9, which a string sort gets
 * wrong); a pre-release sorts before its release. Returns <0, 0, >0. */
export function compareSemver(a, b) {
  const pa = VERSION_DIR.exec(a);
  const pb = VERSION_DIR.exec(b);
  if (!pa || !pb) throw new Error(`not a vMAJOR.MINOR.PATCH version: ${pa ? b : a}`);
  for (let i = 1; i <= 3; i += 1) {
    const diff = Number(pa[i]) - Number(pb[i]);
    if (diff !== 0) return diff;
  }
  const [preA, preB] = [pa[4], pb[4]];
  if (preA === preB) return 0;
  if (preA === undefined) return 1; // release > its own pre-releases
  if (preB === undefined) return -1;
  // SemVer section 11: dot-separated identifiers, numeric ones compare
  // numerically (rc.10 > rc.2) and sort before alphanumeric ones.
  const ia = preA.split(".");
  const ib = preB.split(".");
  for (let i = 0; i < Math.max(ia.length, ib.length); i += 1) {
    if (ia[i] === undefined) return -1;
    if (ib[i] === undefined) return 1;
    const na = /^\d+$/.test(ia[i]);
    const nb = /^\d+$/.test(ib[i]);
    if (na && nb) {
      if (Number(ia[i]) !== Number(ib[i])) return Number(ia[i]) - Number(ib[i]);
    } else if (na !== nb) {
      return na ? -1 : 1;
    } else if (ia[i] !== ib[i]) {
      return ia[i] < ib[i] ? -1 : 1;
    }
  }
  return 0;
}

/** The highest release among version-shaped directory names; null if none. */
export function latestDemoTag(names) {
  const versions = names.filter((name) => VERSION_DIR.test(name));
  if (versions.length === 0) return null;
  return versions.reduce((best, next) => (compareSemver(next, best) > 0 ? next : best));
}

/**
 * Inspect a gh-pages checkout for what the index may link.
 *
 * @param {string} root  path to the gh-pages checkout
 * @returns {{dev: boolean, demoTag: string|null, demoEntries: string[]|null}}
 *   `demoEntries` is null when demo/<demoTag>/index.html exists (link the
 *   directory itself), otherwise the entry points that actually exist.
 */
export function discoverPages(root) {
  if (!statSync(root).isDirectory()) throw new Error(`not a directory: ${root}`);
  const dev = existsSync(join(root, "branches", "dev"));
  const demoRoot = join(root, "demo");
  const demoTag = existsSync(demoRoot) ? latestDemoTag(readdirSync(demoRoot)) : null;
  let demoEntries = null;
  if (demoTag !== null && !existsSync(join(demoRoot, demoTag, "index.html"))) {
    demoEntries = DEMO_ENTRY_CANDIDATES.filter((entry) =>
      existsSync(join(demoRoot, demoTag, entry.endsWith("/") ? join(entry, "index.html") : entry)),
    );
  }
  return { dev, demoTag, demoEntries };
}

function escapeHtml(text) {
  return String(text)
    .replaceAll("&", "&amp;")
    .replaceAll("<", "&lt;")
    .replaceAll(">", "&gt;")
    .replaceAll('"', "&quot;");
}

/**
 * Render the root index. Pure — takes the discovered state, returns HTML.
 *
 * @param {object} options
 * @param {string}          options.repo         `owner/name` GitHub slug
 * @param {boolean}         options.dev          branches/dev/ exists
 * @param {string|null}     options.demoTag      latest demo/<tag>/, or null
 * @param {string[]|null}   options.demoEntries  entry points when the demo has
 *                                               no root index.html, else null
 * @returns {string} the complete index.html
 */
export function generateIndex({ repo, dev, demoTag, demoEntries }) {
  const slug = String(repo);
  const name = escapeHtml(slug.split("/").pop());
  const repoUrl = `https://github.com/${escapeHtml(slug)}`;

  const items = [];
  if (dev) {
    items.push(
      `<li><a href="branches/dev/">branches/dev/</a> <span class="d">— development preview</span></li>`,
    );
  }
  if (demoTag !== null) {
    const tag = escapeHtml(demoTag);
    const label = `<span class="d">— latest release demo (the released state of <code>main</code>)</span>`;
    if (demoEntries === null) {
      items.push(`<li><a href="demo/${tag}/">demo/${tag}/</a> ${label}</li>`);
    } else {
      const subs = demoEntries
        .map((entry) => {
          const e = escapeHtml(entry);
          return `<li><a href="demo/${tag}/${e}">${e}</a></li>`;
        })
        .join("\n");
      items.push(`<li>demo/${tag}/ ${label}\n<ul>\n${subs}\n</ul>\n</li>`);
    }
  }
  if (items.length === 0) {
    items.push(`<li><span class="d">(nothing deployed yet)</span></li>`);
  }

  return `<!DOCTYPE html>
<!-- generated by scripts/gen-pages-index.mjs - do not edit by hand -->
<!-- Older demo/<tag>/ renderings and other branches/<branch>/ previews stay
     deployed and reachable at their URLs, but are deliberately unlisted. -->
<html lang="en"><head><meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${name}</title>
<style>
body{font-family:ui-monospace,SFMono-Regular,Menlo,Consolas,monospace;font-size:.95rem;max-width:44rem;margin:2.5rem auto;padding:0 1rem;line-height:1.6;background:#ffffff;color:#1c1c1c}
a{color:#0b57d0;text-decoration:none}
a:hover{text-decoration:underline}
h1{font-size:1rem;font-weight:600;margin:0 0 .25rem}
ul{list-style:none;margin:0;padding-left:0}
ul ul{padding-left:2ch}
li{margin:.15rem 0}
code{font:inherit}
.d{color:#666}
hr{border:0;border-top:1px solid #999;margin:.75rem 0}
@media (prefers-color-scheme: dark){
body{background:#111111;color:#dddddd}
a{color:#8ab4f8}
.d{color:#9a9a9a}
hr{border-top-color:#555}
}
</style></head>
<body>
<h1>Index of <a href="${repoUrl}">${name}</a></h1>
<hr>
<ul>
${items.join("\n")}
</ul>
<hr>
</body></html>
`;
}

// ── CLI ────────────────────────────────────────────────────────────────────
const invokedDirectly =
  process.argv[1] && import.meta.url === new URL(`file://${process.argv[1]}`).href;

if (invokedDirectly) {
  const [root, repoArg] = process.argv.slice(2);
  if (!root) {
    console.error("usage: node scripts/gen-pages-index.mjs <gh-pages-checkout> [owner/repo]");
    process.exit(2);
  }
  const repo = repoArg || process.env.GITHUB_REPOSITORY || DEFAULT_REPO;
  let state;
  try {
    state = discoverPages(root);
  } catch (error) {
    console.error(`::error::gen-pages-index: ${error.message}`);
    process.exit(1);
  }
  writeFileSync(join(root, "index.html"), generateIndex({ repo, ...state }));
  console.log(
    `gen-pages-index: wrote ${join(root, "index.html")} — ` +
      `dev preview ${state.dev ? "listed" : "absent"}; ` +
      `latest demo ${
        state.demoTag === null
          ? "none"
          : state.demoTag +
            (state.demoEntries === null ? "" : ` (entry points: ${state.demoEntries.join(", ") || "none found"})`)
      }.`,
  );
}
