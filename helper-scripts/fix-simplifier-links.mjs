#!/usr/bin/env node

import fs from "node:fs";
import path from "node:path";

/**
 * Fixes common broken links in SIMPLIFIER export HTML files.
 *
 * Usage:
 *   node scripts/fix-simplifier-links.mjs [rootDir] [--dry-run] [--verbose]
 *   node scripts/fix-simplifier-links.mjs [rootDir] --artifact-target artifacts/fsh-generated/resources/
 *   node scripts/fix-simplifier-links.mjs [rootDir] --artifact-target=artifacts/fsh-generated/resources/
 */
const args = process.argv.slice(2);

const FHIR_BASE = "https://hl7.org/fhir/R4/";
const DEFAULT_ARTIFACT_TARGET = "artifacts/fsh-generated/resources/";

function printUsage() {
  console.log("Usage:");
  console.log("  node scripts/fix-simplifier-links.mjs [rootDir] [options]");
  console.log("");
  console.log("Options:");
  console.log("  --dry-run                    Show what would change, do not write files");
  console.log("  --verbose                    Print per-file replacement stats");
  console.log("  --artifact-target <path>     Replacement for artifacts/package/ links");
  console.log("  --artifact-target=<path>     Same as above");
  console.log("  --help                       Show this help");
}

function ensureTrailingSlash(input) {
  return input.endsWith("/") ? input : `${input}/`;
}

function parseCli(rawArgs) {
  let dryRun = false;
  let verbose = false;
  let rootArg = ".";
  let rootAssigned = false;
  let artifactTarget = DEFAULT_ARTIFACT_TARGET;

  for (let i = 0; i < rawArgs.length; i += 1) {
    const arg = rawArgs[i];

    if (arg === "--dry-run") {
      dryRun = true;
      continue;
    }
    if (arg === "--verbose") {
      verbose = true;
      continue;
    }
    if (arg === "--help") {
      printUsage();
      process.exit(0);
    }
    if (arg === "--artifact-target") {
      const nextArg = rawArgs[i + 1];
      if (!nextArg || nextArg.startsWith("--")) {
        console.error("Missing value for --artifact-target");
        process.exit(1);
      }
      artifactTarget = nextArg;
      i += 1;
      continue;
    }
    if (arg.startsWith("--artifact-target=")) {
      artifactTarget = arg.slice("--artifact-target=".length);
      if (!artifactTarget) {
        console.error("Missing value for --artifact-target");
        process.exit(1);
      }
      continue;
    }
    if (arg.startsWith("--")) {
      console.error(`Unknown option: ${arg}`);
      process.exit(1);
    }
    if (!rootAssigned) {
      rootArg = arg;
      rootAssigned = true;
      continue;
    }
    console.error(`Unexpected argument: ${arg}`);
    process.exit(1);
  }

  return {
    dryRun,
    verbose,
    rootArg,
    artifactTarget: ensureTrailingSlash(artifactTarget),
  };
}

// Recursively collects all HTML files in the export directory.
function walkHtmlFiles(dir, collector = []) {
  const entries = fs.readdirSync(dir, { withFileTypes: true });
  for (const entry of entries) {
    const entryPath = path.join(dir, entry.name);
    if (entry.isDirectory()) {
      if (entry.name === ".git" || entry.name === "node_modules") {
        continue;
      }
      walkHtmlFiles(entryPath, collector);
      continue;
    }
    if (entry.isFile() && entry.name.toLowerCase().endsWith(".html")) {
      collector.push(entryPath);
    }
  }
  return collector;
}

// Normalizes file paths for reliable set lookups across macOS/Windows.
function normalizeForCompare(inputPath) {
  const normalized = path.normalize(inputPath);
  return process.platform === "win32" ? normalized.toLowerCase() : normalized;
}

// Checks whether an href points to a local HTML file that exists in this export.
function isLocalHtmlTarget(hrefValue, currentFile, htmlFileSet) {
  const pathWithoutHash = hrefValue.split("#")[0];
  const pathWithoutQuery = pathWithoutHash.split("?")[0];
  if (!pathWithoutQuery.toLowerCase().endsWith(".html")) {
    return false;
  }

  let decodedPath = pathWithoutQuery;
  try {
    decodedPath = decodeURIComponent(pathWithoutQuery);
  } catch {
    // Keep the original value if decoding fails.
  }

  const targetAbsPath = path.resolve(path.dirname(currentFile), decodedPath);
  return htmlFileSet.has(normalizeForCompare(targetAbsPath));
}

/**
 * Applies three rules:
 * 1) artifacts/package/... -> configured artifacts target
 * 2) href="/resolve?..."   -> href="https://simplifier.net/resolve?..."
 * 3) non-local *.html href -> prefixed with https://hl7.org/fhir/R4/
 */
function patchContent(content, currentFile, htmlFileSet, artifactTarget) {
  let updated = content;
  let replaceArtifactsCount = 0;
  let replaceResolveCount = 0;
  let replaceFhirCount = 0;

  updated = updated.replace(/artifacts\/package\//g, () => {
    replaceArtifactsCount += 1;
    return artifactTarget;
  });

  updated = updated.replace(/href\s*=\s*(['"])\/resolve\?/g, (_full, quote) => {
    replaceResolveCount += 1;
    return `href=${quote}https://simplifier.net/resolve?`;
  });

  updated = updated.replace(/href\s*=\s*(['"])([^"'<>]+)\1/g, (_full, quote, hrefValue) => {
    if (
      hrefValue.startsWith("#") ||
      hrefValue.startsWith("/") ||
      hrefValue.startsWith("//") ||
      /^[a-zA-Z][a-zA-Z\d+.-]*:/.test(hrefValue)
    ) {
      return _full;
    }

    const pathWithoutHash = hrefValue.split("#")[0];
    const pathWithoutQuery = pathWithoutHash.split("?")[0];
    if (!pathWithoutQuery.toLowerCase().endsWith(".html")) {
      return _full;
    }

    if (isLocalHtmlTarget(hrefValue, currentFile, htmlFileSet)) {
      return _full;
    }

    replaceFhirCount += 1;
    return `href=${quote}${FHIR_BASE}${hrefValue}${quote}`;
  });

  return {
    updated,
    replaceArtifactsCount,
    replaceResolveCount,
    replaceFhirCount,
  };
}

function run() {
  const config = parseCli(args);
  const rootDir = path.resolve(config.rootArg);

  if (!fs.existsSync(rootDir) || !fs.statSync(rootDir).isDirectory()) {
    console.error(`Directory not found: ${rootDir}`);
    process.exit(1);
  }

  const htmlFiles = walkHtmlFiles(rootDir);
  const htmlFileSet = new Set(htmlFiles.map((file) => normalizeForCompare(file)));
  let changedFiles = 0;
  let totalArtifacts = 0;
  let totalResolve = 0;
  let totalFhir = 0;

  for (const file of htmlFiles) {
    const original = fs.readFileSync(file, "utf8");
    const result = patchContent(original, file, htmlFileSet, config.artifactTarget);

    if (result.updated === original) {
      continue;
    }

    changedFiles += 1;
    totalArtifacts += result.replaceArtifactsCount;
    totalResolve += result.replaceResolveCount;
    totalFhir += result.replaceFhirCount;

    if (!config.dryRun) {
      fs.writeFileSync(file, result.updated, "utf8");
    }
    if (config.verbose) {
      const rel = path.relative(rootDir, file) || path.basename(file);
      console.log(
        `${rel}: artifacts=${result.replaceArtifactsCount}, resolve=${result.replaceResolveCount}, fhir=${result.replaceFhirCount}`
      );
    }
  }

  console.log(`Scanned HTML files: ${htmlFiles.length}`);
  console.log(`Changed files: ${changedFiles}${config.dryRun ? " (dry-run)" : ""}`);
  console.log(`Replacements:`);
  console.log(`  artifacts/package -> ${config.artifactTarget}: ${totalArtifacts}`);
  console.log(`  href='/resolve?...' -> href='https://simplifier.net/resolve?...': ${totalResolve}`);
  console.log(`  non-local .html links -> https://hl7.org/fhir/R4/: ${totalFhir}`);
}

run();
