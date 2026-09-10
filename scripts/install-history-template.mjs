#!/usr/bin/env node

import {
  cpSync,
  existsSync,
  lstatSync,
  mkdirSync,
  readFileSync,
  readdirSync,
  rmSync,
} from "node:fs";
import { dirname, isAbsolute, relative, resolve, sep } from "node:path";
import { pathToFileURL } from "node:url";

function assertSafeEntry(entry) {
  if (
    entry === "" ||
    entry === "." ||
    isAbsolute(entry) ||
    /^[A-Za-z]:[\\/]/.test(entry) ||
    entry.split(/[\\/]/).includes("..")
  ) {
    throw new Error(`Unsafe history template path: ${entry}`);
  }
}

function assertContained(root, path, label) {
  const relativePath = relative(root, path);
  if (
    relativePath === ".." ||
    relativePath.startsWith(`..${sep}`) ||
    isAbsolute(relativePath)
  ) {
    throw new Error(`${label} escapes its root: ${path}`);
  }
}

function assertNoSymbolicLinks(path) {
  const stat = lstatSync(path);
  if (stat.isSymbolicLink()) {
    throw new Error(`History template contains a symbolic link: ${path}`);
  }
  if (stat.isDirectory()) {
    for (const entry of readdirSync(path)) {
      assertNoSymbolicLinks(resolve(path, entry));
    }
  }
}

function parseManifest(manifest) {
  const entries = [];
  const seen = new Set();
  let inFiles = false;

  for (const rawLine of manifest.split(/\r?\n/)) {
    const line = rawLine.trim();
    if (line === "" || line.startsWith(";") || line.startsWith("#")) {
      continue;
    }
    if (line.startsWith("[") && line.endsWith("]")) {
      inFiles = line === "[files]";
      continue;
    }
    if (!inFiles) {
      continue;
    }

    const separator = line.indexOf("=");
    if (separator === -1) {
      throw new Error(`Invalid history manifest entry: ${line}`);
    }
    const entry = line.slice(0, separator).trim();
    const mode = line.slice(separator + 1).trim();
    assertSafeEntry(entry);
    if (mode !== "overwrite" && mode !== "if-missing") {
      throw new Error(`Unknown history manifest mode for ${entry}: ${mode}`);
    }
    if (seen.has(entry)) {
      throw new Error(`Duplicate history manifest entry: ${entry}`);
    }
    seen.add(entry);
    entries.push({ entry, mode });
  }

  if (entries.length === 0) {
    throw new Error("History template manifest has no [files] entries");
  }
  return entries;
}

/**
 * Install the static support files that Publisher normally creates for an
 * initial publication. With publication-request.json first:false, Publisher
 * regenerates history.html but deliberately does not copy these files.
 */
export function installHistoryTemplate({
  templateDirectory,
  webrootDirectory,
}) {
  const template = resolve(templateDirectory);
  const webroot = resolve(webrootDirectory);
  const manifestPath = resolve(template, "manifest.ini");

  if (!existsSync(manifestPath) || !lstatSync(manifestPath).isFile()) {
    throw new Error(`History template manifest does not exist: ${manifestPath}`);
  }
  mkdirSync(webroot, { recursive: true });

  const entries = parseManifest(readFileSync(manifestPath, "utf8"));
  const installed = [];
  const preserved = [];

  for (const { entry, mode } of entries) {
    const source = resolve(template, entry);
    const destination = resolve(webroot, entry);
    assertContained(template, source, "History template source");
    assertContained(webroot, destination, "History template destination");

    if (!existsSync(source)) {
      throw new Error(`History template source does not exist: ${source}`);
    }
    assertNoSymbolicLinks(source);

    if (mode === "if-missing" && existsSync(destination)) {
      preserved.push(entry);
      continue;
    }

    if (mode === "overwrite") {
      rmSync(destination, { force: true, recursive: true });
    }
    mkdirSync(dirname(destination), { recursive: true });
    cpSync(source, destination, {
      recursive: true,
      preserveTimestamps: true,
    });
    installed.push(entry);
  }

  return { installed, preserved };
}

if (import.meta.url === pathToFileURL(process.argv[1] ?? "").href) {
  if (process.argv.length !== 4) {
    console.error(
      "Usage: node scripts/install-history-template.mjs <template> <webroot>",
    );
    process.exit(2);
  }

  const result = installHistoryTemplate({
    templateDirectory: process.argv[2],
    webrootDirectory: process.argv[3],
  });
  console.log(
    `Installed ${result.installed.length} history template ` +
      `entr${result.installed.length === 1 ? "y" : "ies"}; preserved ` +
      `${result.preserved.length} existing ` +
      `entr${result.preserved.length === 1 ? "y" : "ies"}.`,
  );
}
