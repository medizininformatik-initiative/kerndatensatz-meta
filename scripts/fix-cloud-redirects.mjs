#!/usr/bin/env node

import {
  existsSync,
  readdirSync,
  readFileSync,
  renameSync,
  rmSync,
  statSync,
  writeFileSync,
} from "node:fs";
import { dirname, join, resolve } from "node:path";
import { pathToFileURL } from "node:url";

const PUBLISHER_SIGNATURES = [
  "function Redirect($url)",
  "$_SERVER['HTTP_ACCEPT']",
  "PHP has failed badly",
];

function isPublisherRedirect(source) {
  return PUBLISHER_SIGNATURES.every((signature) => source.includes(signature));
}

function escapeHtml(value) {
  return value
    .replaceAll("&", "&amp;")
    .replaceAll("<", "&lt;")
    .replaceAll(">", "&gt;")
    .replaceAll('"', "&quot;")
    .replaceAll("'", "&#39;");
}

function redirectHtml(htmlTarget, jsonTarget, xmlTarget) {
  const htmlAttribute = escapeHtml(htmlTarget);
  const jsonAttribute = escapeHtml(jsonTarget);
  const xmlAttribute = escapeHtml(xmlTarget);
  const htmlText = escapeHtml(htmlTarget);

  return `<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8"/>
  <meta http-equiv="refresh" content="0; url=${htmlAttribute}"/>
  <link rel="canonical" href="${htmlAttribute}"/>
  <title>Redirecting&hellip;</title>
  <script type="text/javascript">window.location.replace(${JSON.stringify(htmlTarget)});</script>
</head>
<body>
  <p>This FHIR resource is published at <a href="${htmlAttribute}">${htmlText}</a>. Redirecting now&hellip;</p>
  <p>Machine-readable formats: <a href="${jsonAttribute}">JSON</a> &middot; <a href="${xmlAttribute}">XML</a></p>
</body>
</html>
`;
}

function parseRedirectTargets(source, filename) {
  const htmlMatch = source.match(
    /elseif\s*\(strpos\(\$accept,\s*'html'\)\s*!==\s*false\)\s*\r?\n\s*Redirect\('([^']+)'\);/,
  );
  const targets = [...source.matchAll(/Redirect\('([^']+)'\);/g)].map(
    (match) => match[1],
  );
  const jsonTarget = targets.find((target) => target.endsWith(".json"));
  const xmlTarget = targets.find((target) => target.endsWith(".xml"));

  if (!htmlMatch || !jsonTarget || !xmlTarget) {
    throw new Error(`Could not parse Publisher redirect targets from ${filename}`);
  }

  return { htmlTarget: htmlMatch[1], jsonTarget, xmlTarget };
}

function walk(root, visit, { skipMarkedDirectories = false } = {}) {
  for (const entry of readdirSync(root, { withFileTypes: true })) {
    if (entry.name === ".git") {
      continue;
    }

    const filename = join(root, entry.name);
    if (entry.isDirectory()) {
      if (
        skipMarkedDirectories &&
        existsSync(join(filename, ".branch-name"))
      ) {
        continue;
      }
      walk(filename, visit, { skipMarkedDirectories });
    } else if (entry.isFile()) {
      visit(filename);
    }
  }
}

/**
 * Convert the two static-host-incompatible redirect forms when Publisher
 * emits them: Apache-style index.php files and PHP accidentally written to
 * index.html.
 *
 * This is intentionally limited to the exact Publisher template signature and
 * remains an idempotent compatibility guard across Publisher updates.
 */
export function fixCloudRedirects(rootDirectory) {
  const root = resolve(rootDirectory);
  if (!existsSync(root) || !statSync(root).isDirectory()) {
    throw new Error(`Publication webroot does not exist: ${root}`);
  }

  const candidates = [];
  walk(
    root,
    (filename) => {
      if (filename.endsWith("/index.php") || filename.endsWith("/index.html")) {
        const source = readFileSync(filename, "utf8");
        if (isPublisherRedirect(source)) {
          candidates.push({ filename, source });
        }
      }
    },
    { skipMarkedDirectories: true },
  );

  for (const { filename, source } of candidates) {
    const { htmlTarget, jsonTarget, xmlTarget } = parseRedirectTargets(
      source,
      filename,
    );
    const output = join(dirname(filename), "index.html");
    const generated = redirectHtml(htmlTarget, jsonTarget, xmlTarget);

    if (
      output !== filename &&
      existsSync(output) &&
      readFileSync(output, "utf8") !== generated
    ) {
      throw new Error(`Refusing to overwrite an unrelated redirect: ${output}`);
    }

    const temporary = `${output}.cloud-redirect.tmp`;
    writeFileSync(temporary, generated, "utf8");
    renameSync(temporary, output);
    if (filename !== output) {
      rmSync(filename);
    }
  }

  const broken = [];
  walk(
    root,
    (filename) => {
      if (filename.endsWith("/index.php")) {
        const source = readFileSync(filename, "utf8");
        if (isPublisherRedirect(source)) {
          broken.push(filename);
        }
      }
      if (filename.endsWith(".html")) {
        const source = readFileSync(filename, "utf8").trimStart();
        if (source.startsWith("<?php")) {
          broken.push(filename);
        }
      }
    },
    { skipMarkedDirectories: true },
  );

  if (broken.length > 0) {
    throw new Error(
      `Broken cloud redirects remain:\n${broken.map((file) => `- ${file}`).join("\n")}`,
    );
  }

  return candidates.length;
}

if (import.meta.url === pathToFileURL(process.argv[1] ?? "").href) {
  if (process.argv.length !== 3) {
    console.error("Usage: node scripts/fix-cloud-redirects.mjs <webroot>");
    process.exit(2);
  }

  const converted = fixCloudRedirects(process.argv[2]);
  console.log(`Converted ${converted} Publisher redirect(s) for static hosting.`);
}
