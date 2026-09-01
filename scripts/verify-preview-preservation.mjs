#!/usr/bin/env node

import { createHash } from "node:crypto";
import {
  existsSync,
  lstatSync,
  mkdirSync,
  readFileSync,
  readdirSync,
  renameSync,
  rmSync,
  writeFileSync,
} from "node:fs";
import {
  dirname,
  isAbsolute,
  join,
  relative,
  resolve,
  sep,
} from "node:path";
import { pathToFileURL } from "node:url";

const MANIFEST_SCHEMA = 1;
const MARKER = ".branch-name";

function compareNames(left, right) {
  return Buffer.compare(Buffer.from(left, "utf8"), Buffer.from(right, "utf8"));
}

function toManifestPath(path) {
  return path.split(sep).join("/");
}

function isWithin(parent, candidate) {
  return candidate === parent || candidate.startsWith(`${parent}${sep}`);
}

function assertSiteDirectory(site) {
  if (!existsSync(site)) {
    throw new Error(`Pages checkout does not exist: ${site}`);
  }

  const metadata = lstatSync(site);
  if (metadata.isSymbolicLink()) {
    throw new Error(`Pages checkout must not be a symbolic link: ${site}`);
  }
  if (!metadata.isDirectory()) {
    throw new Error(`Pages checkout is not a directory: ${site}`);
  }
}

function normalizeExcludedDirectory(site, value) {
  if (typeof value !== "string" || value.length === 0) {
    throw new Error("Excluded preview directories must not be empty");
  }
  if (isAbsolute(value)) {
    throw new Error(`Excluded preview directory must be relative: ${value}`);
  }

  const absolute = resolve(site, value);
  const relativeDirectory = relative(site, absolute);
  if (
    relativeDirectory === "" ||
    relativeDirectory === ".." ||
    relativeDirectory.startsWith(`..${sep}`) ||
    isAbsolute(relativeDirectory)
  ) {
    throw new Error(
      `Excluded preview directory must be below the Pages root: ${value}`,
    );
  }

  return toManifestPath(relativeDirectory);
}

function inspectTree(root) {
  const markers = [];

  function visit(directory) {
    const entries = readdirSync(directory, { withFileTypes: true }).sort(
      (left, right) => compareNames(left.name, right.name),
    );

    for (const entry of entries) {
      if (directory === root && entry.name === ".git") {
        continue;
      }

      const filename = join(directory, entry.name);
      const relativeFilename = toManifestPath(relative(root, filename));
      const metadata = lstatSync(filename);

      if (metadata.isSymbolicLink()) {
        throw new Error(`Symbolic links are not allowed: ${relativeFilename}`);
      }

      if (entry.name === MARKER) {
        if (!metadata.isFile()) {
          throw new Error(
            `Branch marker must be a regular file: ${relativeFilename}`,
          );
        }
        markers.push(filename);
        continue;
      }

      if (metadata.isDirectory()) {
        visit(filename);
      } else if (!metadata.isFile()) {
        throw new Error(
          `Unsupported filesystem entry in Pages checkout: ${relativeFilename}`,
        );
      }
    }
  }

  visit(root);
  return markers;
}

function readMarker(root, marker) {
  const directory = dirname(marker);
  const relativeDirectory = relative(root, directory);
  const branch = readFileSync(marker, "utf8").trim();

  if (!branch) {
    throw new Error(
      `Empty branch marker: ${toManifestPath(relative(root, marker))}`,
    );
  }
  if (branch.includes("\n") || branch.includes("\r") || branch.includes("\0")) {
    throw new Error(
      `Invalid branch marker: ${toManifestPath(relative(root, marker))}`,
    );
  }

  return {
    absoluteDirectory: directory,
    branch,
    directory: toManifestPath(relativeDirectory),
  };
}

function assertNoNestedMarkers(previews) {
  for (const preview of previews) {
    for (const other of previews) {
      if (
        preview !== other &&
        isWithin(preview.absoluteDirectory, other.absoluteDirectory)
      ) {
        throw new Error(
          `Nested branch deployments are ambiguous: ${preview.directory} and ${other.directory}`,
        );
      }
    }
  }
}

function uint64(value) {
  const output = Buffer.alloc(8);
  output.writeBigUInt64BE(BigInt(value));
  return output;
}

function addDigestEntry(hash, type, relativePath, content = null) {
  const pathBytes = Buffer.from(relativePath, "utf8");
  hash.update(type);
  hash.update(uint64(pathBytes.length));
  hash.update(pathBytes);

  if (content !== null) {
    hash.update(uint64(content.length));
    hash.update(content);
  }
}

function digestPreview(preview) {
  const hash = createHash("sha256");
  hash.update("fhir-ig-preview-preservation-v1\0");
  let bytes = 0;
  let directories = 0;
  let files = 0;

  function visit(directory, relativeDirectory = "") {
    const entries = readdirSync(directory, { withFileTypes: true }).sort(
      (left, right) => compareNames(left.name, right.name),
    );

    for (const entry of entries) {
      const filename = join(directory, entry.name);
      const relativeFilename = relativeDirectory
        ? `${relativeDirectory}/${entry.name}`
        : entry.name;
      const metadata = lstatSync(filename);

      if (metadata.isSymbolicLink()) {
        throw new Error(
          `Symbolic links are not allowed in preview ${preview.directory}: ${relativeFilename}`,
        );
      }
      if (metadata.isDirectory()) {
        directories += 1;
        addDigestEntry(hash, "D", relativeFilename);
        visit(filename, relativeFilename);
      } else if (metadata.isFile()) {
        const content = readFileSync(filename);
        files += 1;
        bytes += content.length;
        addDigestEntry(hash, "F", relativeFilename, content);
      } else {
        throw new Error(
          `Unsupported filesystem entry in preview ${preview.directory}: ${relativeFilename}`,
        );
      }
    }
  }

  visit(preview.absoluteDirectory);
  return {
    branch: preview.branch,
    bytes,
    digest: `sha256:${hash.digest("hex")}`,
    directories,
    directory: preview.directory,
    files,
  };
}

function collectPreviews(siteDirectory, excludedDirectories = []) {
  const site = resolve(siteDirectory);
  assertSiteDirectory(site);

  const exclusions = new Set(
    excludedDirectories.map((value) =>
      normalizeExcludedDirectory(site, value),
    ),
  );
  const previews = inspectTree(site)
    .map((marker) => readMarker(site, marker))
    // The legacy CI deployment may have a marker at the Pages root. It is not
    // an independently preserved preview and would otherwise contain all
    // marker-backed deployments.
    .filter(({ directory }) => directory !== "");

  assertNoNestedMarkers(previews);

  return previews
    .filter(({ directory }) => !exclusions.has(directory))
    .sort((left, right) => compareNames(left.directory, right.directory))
    .map(digestPreview);
}

function validateManifest(value, filename) {
  if (
    value === null ||
    typeof value !== "object" ||
    Array.isArray(value) ||
    value.schemaVersion !== MANIFEST_SCHEMA ||
    !Array.isArray(value.excludedDirectories) ||
    !Array.isArray(value.previews)
  ) {
    throw new Error(`Invalid preview-preservation manifest: ${filename}`);
  }

  const exclusions = new Set();
  for (const directory of value.excludedDirectories) {
    if (
      typeof directory !== "string" ||
      directory === "" ||
      directory.startsWith("/") ||
      directory === ".." ||
      directory.startsWith("../") ||
      directory.includes("/../") ||
      exclusions.has(directory)
    ) {
      throw new Error(
        `Invalid excluded directory in preview-preservation manifest: ${directory}`,
      );
    }
    exclusions.add(directory);
  }

  const directories = new Set();
  for (const preview of value.previews) {
    if (
      preview === null ||
      typeof preview !== "object" ||
      Array.isArray(preview) ||
      typeof preview.directory !== "string" ||
      preview.directory === "" ||
      typeof preview.branch !== "string" ||
      preview.branch === "" ||
      !Number.isSafeInteger(preview.bytes) ||
      preview.bytes < 0 ||
      !Number.isSafeInteger(preview.directories) ||
      preview.directories < 0 ||
      !Number.isSafeInteger(preview.files) ||
      preview.files < 1 ||
      typeof preview.digest !== "string" ||
      !/^sha256:[0-9a-f]{64}$/.test(preview.digest) ||
      directories.has(preview.directory)
    ) {
      throw new Error(`Invalid preview entry in manifest: ${filename}`);
    }
    directories.add(preview.directory);
  }

  return {
    excludedDirectories: [...value.excludedDirectories],
    previews: [...value.previews].sort((left, right) =>
      compareNames(left.directory, right.directory),
    ),
  };
}

function compareSnapshots(expected, actual) {
  const expectedDirectories = expected.map(({ directory }) => directory);
  const actualDirectories = actual.map(({ directory }) => directory);
  if (JSON.stringify(expectedDirectories) !== JSON.stringify(actualDirectories)) {
    throw new Error(
      `Preview deployment set changed: expected [${expectedDirectories.join(", ")}], found [${actualDirectories.join(", ")}]`,
    );
  }

  for (let index = 0; index < expected.length; index += 1) {
    const before = expected[index];
    const after = actual[index];
    for (const field of [
      "branch",
      "digest",
      "files",
      "directories",
      "bytes",
    ]) {
      if (before[field] !== after[field]) {
        throw new Error(
          `Preview ${before.directory} changed (${field}: expected ${before[field]}, found ${after[field]})`,
        );
      }
    }
  }
}

export function snapshotPreviewDeployments({
  siteDirectory,
  manifestFile,
  excludedDirectories = [],
}) {
  const site = resolve(siteDirectory);
  const normalizedExclusions = [...new Set(
    excludedDirectories.map((value) =>
      normalizeExcludedDirectory(site, value),
    ),
  )].sort(compareNames);
  const previews = collectPreviews(site, normalizedExclusions);
  const manifest = {
    schemaVersion: MANIFEST_SCHEMA,
    excludedDirectories: normalizedExclusions,
    previews,
  };

  const output = resolve(manifestFile);
  mkdirSync(dirname(output), { recursive: true });
  const temporary = `${output}.tmp-${process.pid}`;
  try {
    writeFileSync(temporary, `${JSON.stringify(manifest, null, 2)}\n`, "utf8");
    renameSync(temporary, output);
  } finally {
    rmSync(temporary, { force: true });
  }

  return manifest;
}

export function verifyPreviewDeployments({ siteDirectory, manifestFile }) {
  const input = resolve(manifestFile);
  if (!existsSync(input)) {
    throw new Error(`Preview-preservation manifest does not exist: ${input}`);
  }

  let parsed;
  try {
    parsed = JSON.parse(readFileSync(input, "utf8"));
  } catch (error) {
    throw new Error(
      `Could not read preview-preservation manifest ${input}: ${error.message}`,
    );
  }

  const expected = validateManifest(parsed, input);
  const actual = collectPreviews(
    siteDirectory,
    expected.excludedDirectories,
  );
  compareSnapshots(expected.previews, actual);
  return actual;
}

function usage() {
  console.error(
    "Usage:\n" +
      "  node scripts/verify-preview-preservation.mjs snapshot <site> <manifest> [excluded-relative-dir...]\n" +
      "  node scripts/verify-preview-preservation.mjs verify <site> <manifest>",
  );
}

if (import.meta.url === pathToFileURL(process.argv[1] ?? "").href) {
  const [command, siteDirectory, manifestFile, ...excludedDirectories] =
    process.argv.slice(2);

  try {
    if (
      command === "snapshot" &&
      siteDirectory &&
      manifestFile
    ) {
      const manifest = snapshotPreviewDeployments({
        siteDirectory,
        manifestFile,
        excludedDirectories,
      });
      console.log(
        `Snapshotted ${manifest.previews.length} marker-backed preview deployment(s).`,
      );
    } else if (
      command === "verify" &&
      siteDirectory &&
      manifestFile &&
      excludedDirectories.length === 0
    ) {
      const previews = verifyPreviewDeployments({
        siteDirectory,
        manifestFile,
      });
      console.log(
        `Verified ${previews.length} marker-backed preview deployment(s) byte-for-byte.`,
      );
    } else {
      usage();
      process.exitCode = 2;
    }
  } catch (error) {
    console.error(error.message);
    process.exitCode = 1;
  }
}
