#!/usr/bin/env node

import {
  existsSync,
  readdirSync,
  readFileSync,
  renameSync,
  statSync,
  writeFileSync,
} from "node:fs";
import { join, resolve } from "node:path";
import { pathToFileURL } from "node:url";

const RELEASE_HEADER = /<!--ReleaseHeader-->[\s\S]*?<!--EndReleaseHeader-->/g;

function normalizeBaseUrl(value, label) {
  let parsed;
  try {
    parsed = new URL(value);
  } catch {
    throw new Error(`${label} is not an absolute URL: ${value}`);
  }
  if (!/^https?:$/.test(parsed.protocol)) {
    throw new Error(`${label} must use HTTP or HTTPS: ${value}`);
  }
  return value.replace(/\/$/, "");
}

function walk(root, visit) {
  for (const entry of readdirSync(root, { withFileTypes: true })) {
    if (entry.name === ".git") {
      continue;
    }

    const filename = join(root, entry.name);
    if (entry.isDirectory()) {
      if (existsSync(join(filename, ".branch-name"))) {
        continue;
      }
      walk(filename, visit);
    } else if (entry.isFile()) {
      visit(filename);
    }
  }
}

function replaceInReleaseHeaders(source, oldUrl, newUrl) {
  let replacements = 0;
  const output = source.replace(RELEASE_HEADER, (header) => {
    const occurrences = header.split(oldUrl).length - 1;
    replacements += occurrences;
    return occurrences === 0 ? header : header.replaceAll(oldUrl, newUrl);
  });
  return { output, replacements };
}

/**
 * Publisher builds the publish-box history URL from the FHIR canonical even
 * when canonical-mismatch permits releases to live on a different website.
 * Rewrite only that exact URL inside Publisher release-header markers. Branch
 * previews are skipped so publication does not modify independent deployments.
 */
export function fixPublicationHistoryLinks(
  rootDirectory,
  canonicalUrl,
  publicationBaseUrl,
) {
  const root = resolve(rootDirectory);
  if (!existsSync(root) || !statSync(root).isDirectory()) {
    throw new Error(`Publication webroot does not exist: ${root}`);
  }

  const canonical = normalizeBaseUrl(canonicalUrl, "FHIR canonical");
  const publicationBase = normalizeBaseUrl(
    publicationBaseUrl,
    "Publication base",
  );
  if (canonical === publicationBase) {
    throw new Error("FHIR canonical and publication base must be different");
  }

  const oldUrl = `${canonical}/history.html`;
  const newUrl = `${publicationBase}/history.html`;
  let files = 0;
  let replacements = 0;

  walk(root, (filename) => {
    if (!filename.endsWith(".html")) {
      return;
    }
    const source = readFileSync(filename, "utf8");
    const fixed = replaceInReleaseHeaders(source, oldUrl, newUrl);
    if (fixed.replacements === 0) {
      return;
    }

    const temporary = `${filename}.history-link.tmp`;
    writeFileSync(temporary, fixed.output, "utf8");
    renameSync(temporary, filename);
    files += 1;
    replacements += fixed.replacements;
  });

  const broken = [];
  walk(root, (filename) => {
    if (!filename.endsWith(".html")) {
      return;
    }
    const source = readFileSync(filename, "utf8");
    for (const header of source.matchAll(RELEASE_HEADER)) {
      if (header[0].includes(oldUrl)) {
        broken.push(filename);
        break;
      }
    }
  });
  if (broken.length > 0) {
    throw new Error(
      `Canonical history links remain in publication headers:\n${broken
        .map((file) => `- ${file}`)
        .join("\n")}`,
    );
  }

  return { files, replacements };
}

if (import.meta.url === pathToFileURL(process.argv[1] ?? "").href) {
  if (process.argv.length !== 5) {
    console.error(
      "Usage: node scripts/fix-publication-history-links.mjs <webroot> <canonical> <publication-base>",
    );
    process.exit(2);
  }

  const result = fixPublicationHistoryLinks(
    process.argv[2],
    process.argv[3],
    process.argv[4],
  );
  console.log(
    `Updated ${result.replacements} publication history link(s) in ${result.files} file(s).`,
  );
}
