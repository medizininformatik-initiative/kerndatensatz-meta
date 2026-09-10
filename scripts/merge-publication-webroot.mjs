#!/usr/bin/env node

import {
  cpSync,
  existsSync,
  mkdirSync,
  mkdtempSync,
  readFileSync,
  readdirSync,
  renameSync,
  rmSync,
  statSync,
  writeFileSync,
} from "node:fs";
import { dirname, join, relative, resolve, sep } from "node:path";
import { pathToFileURL } from "node:url";

function findBranchMarkers(root, current = root, markers = []) {
  for (const entry of readdirSync(current, { withFileTypes: true })) {
    if (entry.name === ".git") {
      continue;
    }

    const filename = join(current, entry.name);
    if (entry.isDirectory()) {
      findBranchMarkers(root, filename, markers);
    } else if (entry.isFile() && entry.name === ".branch-name") {
      markers.push(filename);
    }
  }
  return markers;
}

function assertDirectory(path, label) {
  if (!existsSync(path) || !statSync(path).isDirectory()) {
    throw new Error(`${label} does not exist: ${path}`);
  }
}

/**
 * Replace the legacy CI build at the Pages root with a bootstrapped formal
 * webroot while retaining every marker-backed branch preview. The imported
 * historical version deliberately replaces any preview at the same version
 * path.
 */
export function mergePublicationBootstrap({
  publishedDirectory,
  siteDirectory,
  version,
}) {
  const published = resolve(publishedDirectory);
  const site = resolve(siteDirectory);
  assertDirectory(published, "Generated publication webroot");
  assertDirectory(site, "Existing gh-pages checkout");

  if (!existsSync(join(published, "package-list.json"))) {
    throw new Error("Generated publication has no root package-list.json");
  }
  if (!existsSync(join(published, version, "package.tgz"))) {
    throw new Error(`Generated publication has no ${version}/package.tgz`);
  }

  const markerEntries = findBranchMarkers(site)
    .map((marker) => ({
      marker,
      directory: dirname(marker),
      relativeDirectory: relative(site, dirname(marker)),
      branch: readFileSync(marker, "utf8").trim(),
    }))
    .filter(
      ({ relativeDirectory }) =>
        relativeDirectory !== "" && relativeDirectory !== version,
    );

  for (const entry of markerEntries) {
    if (!entry.branch) {
      throw new Error(`Empty branch marker: ${entry.marker}`);
    }
    if (
      markerEntries.some(
        (other) =>
          other !== entry &&
          other.relativeDirectory.startsWith(
            `${entry.relativeDirectory}${sep}`,
          ),
      )
    ) {
      throw new Error(
        `Nested branch deployments are ambiguous: ${entry.relativeDirectory}`,
      );
    }
    if (existsSync(join(published, entry.relativeDirectory))) {
      throw new Error(
        `Publication output collides with preview ${entry.relativeDirectory}`,
      );
    }
  }

  const preserve = mkdtempSync(
    join(dirname(site), ".publication-previews-"),
  );
  const cname = existsSync(join(site, "CNAME"))
    ? readFileSync(join(site, "CNAME"), "utf8")
    : null;

  try {
    for (const entry of markerEntries) {
      const destination = join(preserve, entry.relativeDirectory);
      mkdirSync(dirname(destination), { recursive: true });
      renameSync(entry.directory, destination);
    }

    for (const entry of readdirSync(site)) {
      if (entry !== ".git") {
        rmSync(join(site, entry), { recursive: true, force: true });
      }
    }

    for (const entry of readdirSync(published)) {
      cpSync(join(published, entry), join(site, entry), {
        recursive: true,
        preserveTimestamps: true,
      });
    }

    for (const entry of markerEntries) {
      const source = join(preserve, entry.relativeDirectory);
      const destination = join(site, entry.relativeDirectory);
      mkdirSync(dirname(destination), { recursive: true });
      renameSync(source, destination);
    }

    if (cname !== null) {
      writeFileSync(join(site, "CNAME"), cname, "utf8");
    }
    writeFileSync(join(site, ".nojekyll"), "", "utf8");
    rmSync(join(site, ".branch-name"), { force: true });
    rmSync(join(site, version, ".branch-name"), { force: true });

    for (const entry of markerEntries) {
      const restored = join(site, entry.relativeDirectory, ".branch-name");
      if (!existsSync(restored)) {
        throw new Error(`Preview was not restored: ${entry.relativeDirectory}`);
      }
    }
  } finally {
    rmSync(preserve, { recursive: true, force: true });
  }

  return markerEntries.map(({ branch, relativeDirectory }) => ({
    branch,
    relativeDirectory,
  }));
}

if (import.meta.url === pathToFileURL(process.argv[1] ?? "").href) {
  if (process.argv.length !== 5) {
    console.error(
      "Usage: node scripts/merge-publication-webroot.mjs <published> <site> <version>",
    );
    process.exit(2);
  }

  const previews = mergePublicationBootstrap({
    publishedDirectory: process.argv[2],
    siteDirectory: process.argv[3],
    version: process.argv[4],
  });
  console.log(`Preserved ${previews.length} branch preview(s):`);
  for (const preview of previews) {
    console.log(`- ${preview.branch}: ${preview.relativeDirectory}/`);
  }
}
