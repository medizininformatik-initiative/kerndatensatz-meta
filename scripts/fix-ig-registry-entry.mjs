#!/usr/bin/env node

import {
  existsSync,
  readFileSync,
  renameSync,
  statSync,
  writeFileSync,
} from "node:fs";
import { resolve } from "node:path";
import { pathToFileURL } from "node:url";

function readJsonFile(filename, label) {
  const path = resolve(filename);
  if (!existsSync(path) || !statSync(path).isFile()) {
    throw new Error(`${label} does not exist: ${path}`);
  }

  const source = readFileSync(path, "utf8");
  try {
    return { path, source, value: JSON.parse(source) };
  } catch (error) {
    throw new Error(`${label} is not valid JSON: ${error.message}`);
  }
}

function requiredString(object, property, label) {
  const value = object?.[property];
  if (typeof value !== "string" || value.trim() === "") {
    throw new Error(`${label} must contain a nonempty ${property}`);
  }
  return value;
}

function normalizeUrl(value, label) {
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

function escapeRegExp(value) {
  return value.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
}

function findEnclosingObject(source, property, value) {
  const pattern = new RegExp(
    `${escapeRegExp(JSON.stringify(property))}\\s*:\\s*${escapeRegExp(JSON.stringify(value))}`,
    "g",
  );
  const matches = [...source.matchAll(pattern)];
  if (matches.length !== 1) {
    throw new Error(
      `Expected exactly one registry entry with ${property} ${value}; found ${matches.length}`,
    );
  }

  const target = matches[0].index;
  const stack = [];
  let inString = false;
  let escaped = false;
  for (let index = 0; index < target; index += 1) {
    const character = source[index];
    if (inString) {
      if (escaped) {
        escaped = false;
      } else if (character === "\\") {
        escaped = true;
      } else if (character === '"') {
        inString = false;
      }
    } else if (character === '"') {
      inString = true;
    } else if (character === "{") {
      stack.push(index);
    } else if (character === "}") {
      stack.pop();
    }
  }

  const start = stack.at(-1);
  if (start === undefined) {
    throw new Error(`Could not locate the registry object for ${value}`);
  }

  let depth = 0;
  inString = false;
  escaped = false;
  for (let index = start; index < source.length; index += 1) {
    const character = source[index];
    if (inString) {
      if (escaped) {
        escaped = false;
      } else if (character === "\\") {
        escaped = true;
      } else if (character === '"') {
        inString = false;
      }
    } else if (character === '"') {
      inString = true;
    } else if (character === "{") {
      depth += 1;
    } else if (character === "}") {
      depth -= 1;
      if (depth === 0) {
        return { start, end: index + 1 };
      }
    }
  }

  throw new Error(`Registry object for ${value} is not closed`);
}

function replaceSingleProperty(source, property, valuePattern, value) {
  const pattern = new RegExp(
    `(${escapeRegExp(JSON.stringify(property))}\\s*:\\s*)${valuePattern}`,
    "g",
  );
  const matches = [...source.matchAll(pattern)];
  if (matches.length !== 1) {
    throw new Error(
      `Expected exactly one ${property} property in the generated registry ` +
        `entry; found ${matches.length}`,
    );
  }
  return source.replace(pattern, `$1${value}`);
}

function findPlaceholder(value, path = "guide") {
  if (value === "??") {
    return path;
  }
  if (Array.isArray(value)) {
    for (let index = 0; index < value.length; index += 1) {
      const found = findPlaceholder(value[index], `${path}[${index}]`);
      if (found) return found;
    }
  } else if (value && typeof value === "object") {
    for (const [property, child] of Object.entries(value)) {
      const found = findPlaceholder(child, `${path}.${property}`);
      if (found) return found;
    }
  }
  return null;
}

function assertEqual(actual, expected, label, errors) {
  if (actual !== expected) {
    errors.push(`${label}: expected ${JSON.stringify(expected)}, found ${JSON.stringify(actual)}`);
  }
}

function validateEntry(
  entry,
  request,
  packageMetadata,
  canonical,
  history,
  languages,
) {
  const packageId = requiredString(request, "package-id", "Publication request");
  const version = requiredString(request, "version", "Publication request");
  const publicationPath = normalizeUrl(
    requiredString(request, "path", "Publication request"),
    "Publication path",
  );
  const ciBuild = normalizeUrl(
    requiredString(request, "ci-build", "Publication request"),
    "CI build URL",
  );
  const errors = [];

  assertEqual(
    requiredString(packageMetadata, "name", "Package metadata"),
    packageId,
    "package.name",
    errors,
  );
  assertEqual(
    requiredString(packageMetadata, "version", "Package metadata"),
    version,
    "package.version",
    errors,
  );
  assertEqual(
    normalizeUrl(
      requiredString(packageMetadata, "canonical", "Package metadata"),
      "Package canonical",
    ),
    canonical,
    "package.canonical",
    errors,
  );
  if (
    !Array.isArray(packageMetadata.fhirVersions) ||
    packageMetadata.fhirVersions.length === 0 ||
    packageMetadata.fhirVersions.some(
      (fhirVersion) =>
        typeof fhirVersion !== "string" || fhirVersion.trim() === "",
    )
  ) {
    throw new Error("Package metadata must contain nonempty fhirVersions");
  }

  assertEqual(entry["npm-name"], packageId, "npm-name", errors);
  assertEqual(
    entry.name,
    requiredString(request, "title", "Publication request"),
    "name",
    errors,
  );
  assertEqual(
    entry.category,
    requiredString(request, "category", "Publication request"),
    "category",
    errors,
  );
  assertEqual(
    entry.description,
    requiredString(request, "registry-description", "Publication request"),
    "description",
    errors,
  );
  assertEqual(
    entry.authority,
    requiredString(request, "registry-authority", "Publication request"),
    "authority",
    errors,
  );
  assertEqual(
    entry.country,
    requiredString(request, "registry-country", "Publication request"),
    "country",
    errors,
  );
  assertEqual(entry.canonical, canonical, "canonical", errors);
  assertEqual(
    normalizeUrl(entry["ci-build"] ?? "", "Generated CI build URL"),
    ciBuild,
    "ci-build",
    errors,
  );
  assertEqual(entry.history, history, "history", errors);
  if (JSON.stringify(entry.language) !== JSON.stringify(languages)) {
    errors.push(
      `language: expected ${JSON.stringify(languages)}, found ${JSON.stringify(entry.language)}`,
    );
  }
  if (!Array.isArray(entry.product) || !entry.product.includes("fhir")) {
    errors.push('product must contain "fhir"');
  }

  const editions = entry.editions?.filter(
    (candidate) => candidate?.["ig-version"] === version,
  );
  if (!Array.isArray(editions) || editions.length !== 1) {
    errors.push(
      `editions must contain exactly one ${version} entry; found ${editions?.length ?? 0}`,
    );
  } else {
    const edition = editions[0];
    assertEqual(
      edition.name,
      requiredString(request, "sequence", "Publication request"),
      "edition.name",
      errors,
    );
    assertEqual(edition.package, `${packageId}#${version}`, "edition.package", errors);
    assertEqual(
      normalizeUrl(edition.url ?? "", "Generated edition URL"),
      publicationPath,
      "edition.url",
      errors,
    );
    if (
      JSON.stringify(edition["fhir-version"]) !==
      JSON.stringify(packageMetadata.fhirVersions)
    ) {
      errors.push(
        `edition.fhir-version: expected ` +
          `${JSON.stringify(packageMetadata.fhirVersions)}, found ` +
          `${JSON.stringify(edition["fhir-version"])}`,
      );
    }
  }

  const placeholder = findPlaceholder(entry);
  if (placeholder) {
    errors.push(`${placeholder} still contains the placeholder "??"`);
  }
  if (errors.length > 0) {
    throw new Error(`Generated registry entry is invalid:\n- ${errors.join("\n- ")}`);
  }
}

/**
 * Correct Publisher output when the generated registry entry derives its
 * history URL from the FHIR canonical or initializes language to English only.
 * Preserve the formatting of the complete upstream registry, then validate the
 * entry that will be submitted to FHIR/ig-registry.
 */
export function fixIgRegistryEntry(
  registryFilename,
  requestFilename,
  packageFilename,
  canonicalUrl,
  historyUrl,
  languages,
) {
  const registry = readJsonFile(registryFilename, "FHIR IG registry");
  const request = readJsonFile(requestFilename, "Publication request").value;
  const packageMetadata = readJsonFile(packageFilename, "Package metadata").value;
  const canonical = normalizeUrl(canonicalUrl, "FHIR canonical");
  const history = normalizeUrl(historyUrl, "Registry history URL");
  if (!Array.isArray(languages) || languages.length === 0) {
    throw new Error("At least one registry language is required");
  }
  if (
    new Set(languages).size !== languages.length ||
    languages.some(
      (language) =>
        !/^[A-Za-z]{2,8}(-[A-Za-z0-9]{1,8})*$/.test(language),
    )
  ) {
    throw new Error(
      `Invalid or duplicate registry languages: ${languages.join(", ")}`,
    );
  }

  const packageId = requiredString(request, "package-id", "Publication request");
  const initialEntries = registry.value.guides?.filter(
    (guide) => guide?.["npm-name"] === packageId,
  );
  if (!Array.isArray(initialEntries) || initialEntries.length !== 1) {
    throw new Error(
      `Expected exactly one generated registry entry for ${packageId}; ` +
        `found ${initialEntries?.length ?? 0}`,
    );
  }

  const range = findEnclosingObject(registry.source, "npm-name", packageId);
  let entrySource = registry.source.slice(range.start, range.end);
  if (initialEntries[0].history !== history) {
    entrySource = replaceSingleProperty(
      entrySource,
      "history",
      '"(?:\\\\.|[^"\\\\])*"',
      JSON.stringify(history),
    );
  }
  if (
    JSON.stringify(initialEntries[0].language) !== JSON.stringify(languages)
  ) {
    entrySource = replaceSingleProperty(
      entrySource,
      "language",
      '\\[(?:\\s*"(?:\\\\.|[^"\\\\])*"\\s*,?)*\\s*\\]',
      `[${languages.map((language) => JSON.stringify(language)).join(", ")}]`,
    );
  }

  const correctedSource =
    registry.source.slice(0, range.start) +
    entrySource +
    registry.source.slice(range.end);
  let corrected;
  try {
    corrected = JSON.parse(correctedSource);
  } catch (error) {
    throw new Error(`Corrected FHIR IG registry is not valid JSON: ${error.message}`);
  }
  const entries = corrected.guides?.filter(
    (guide) => guide?.["npm-name"] === packageId,
  );
  if (!Array.isArray(entries) || entries.length !== 1) {
    throw new Error(`Corrected registry does not contain one ${packageId} entry`);
  }
  validateEntry(
    entries[0],
    request,
    packageMetadata,
    canonical,
    history,
    languages,
  );

  const changed = correctedSource !== registry.source;
  if (changed) {
    const temporary = `${registry.path}.entry-fix.tmp`;
    writeFileSync(temporary, correctedSource, "utf8");
    renameSync(temporary, registry.path);
  }
  return { changed, packageId, history, languages };
}

if (import.meta.url === pathToFileURL(process.argv[1] ?? "").href) {
  if (process.argv.length < 8) {
    console.error(
      "Usage: node scripts/fix-ig-registry-entry.mjs <fhir-ig-list.json> " +
        "<publication-request.json> <package.json> <canonical> <history-url> " +
        "<language> [language...]",
    );
    process.exit(2);
  }

  const result = fixIgRegistryEntry(
    process.argv[2],
    process.argv[3],
    process.argv[4],
    process.argv[5],
    process.argv[6],
    process.argv.slice(7),
  );
  console.log(
    `${result.changed ? "Corrected" : "Validated"} ${result.packageId}: ` +
      `history ${result.history}; languages ${result.languages.join(", ")}.`,
  );
}
