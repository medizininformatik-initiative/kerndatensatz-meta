#!/usr/bin/env node
// meta-pin-drift — warns when this module's DIRECT pins of HL7 Terminology
// (THO) and the HL7 Extensions Pack drift from the versions the PINNED meta
// package (de.medizininformatikinitiative.kerndatensatz.meta) ships.
//
// WHY the module pins the two directly: the IG Publisher's auto-add guard
// consults only THIS IG's own dependsOn (PublisherIGLoader + its
// AutoDepsTest, verified at the pinned publisher release) — without a direct
// pin every build silently injects the LATEST THO/extensions release; a
// transitive pin in meta cannot control the version. Meta remains the KDS
// family's intended source of truth for the pair, so drift against it is
// worth a warning — and "meta pins neither" (true for meta 2026.0.0) is a
// notice, not a problem: the module's pins are then authoritative.
//
// Contract (same as check-updates.mjs): ALWAYS exits 0 — findings surface as
// a markdown section and, under GitHub Actions, as ::warning:: annotations.
// Zero npm dependencies; Node 22 built-ins only.
//
// Usage:
//   node scripts/meta-pin-drift.mjs [--root <dir>] [--markdown-out <file>]
//                                   [--meta-package-json <file>]
//   --root              repository root (default: the script's parent repo)
//   --markdown-out      write the markdown section to a file instead of stdout
//   --meta-package-json read meta's package.json from a local file instead of
//                       downloading the package (offline mode; used by tests)
import { readFileSync, writeFileSync } from "node:fs";
import { gunzipSync } from "node:zlib";
import { fileURLToPath } from "node:url";
import path from "node:path";
import { parseSushiDependencies } from "./check-updates.mjs";

const META_ID = "de.medizininformatikinitiative.kerndatensatz.meta";
// FHIR package registries, queried with the npm protocol: GET <registry>/<id>
// returns the metadata document, and versions[<v>].dist.tarball names the
// tarball to download. packages.fhir.org is the canonical FHIR registry;
// packages.simplifier.net speaks the same protocol and serves as fallback.
// DELIBERATELY never the IG's own download section or its GitHub repo: the
// registry is the canonical distribution channel — a repo or Pages artifact
// can diverge from (or outlive) what implementers actually resolve.
const REGISTRIES = ["https://packages.fhir.org", "https://packages.simplifier.net"];

// Family matching mirrors the publisher's own guards (dependsOnUTG /
// dependsOnExtensions in PublisherIGLoader): substring for the THO family,
// exact id list for the extensions family.
export const FAMILIES = [
  {
    label: "HL7 Terminology (THO)",
    match: (id) => id.includes("hl7.terminology"),
  },
  {
    label: "HL7 Extensions Pack",
    match: (id) =>
      [
        "hl7.fhir.uv.extensions",
        "hl7.fhir.uv.extensions.r3",
        "hl7.fhir.uv.extensions.r4",
        "hl7.fhir.uv.extensions.r5",
        "hl7.fhir.uv.extensions.r6",
      ].includes(id),
  },
];

/** First { id, version } in deps matching the family, or null. */
export function familyPin(deps, family) {
  for (const [id, version] of Object.entries(deps ?? {})) {
    if (family.match(id)) return { id, version };
  }
  return null;
}

/** Extract one file from a gzipped tar (npm/FHIR package layout). */
export function fileFromTgz(tgzBytes, wantedName) {
  const tar = gunzipSync(tgzBytes);
  let offset = 0;
  while (offset + 512 <= tar.length) {
    const name = tar
      .subarray(offset, offset + 100)
      .toString("utf8")
      .replace(/\0.*$/s, "");
    if (!name) break; // two zero blocks end the archive
    const size =
      parseInt(tar.subarray(offset + 124, offset + 136).toString("utf8").trim(), 8) || 0;
    if (name === wantedName || name === `./${wantedName}`) {
      return tar.subarray(offset + 512, offset + 512 + size).toString("utf8");
    }
    offset += 512 + Math.ceil(size / 512) * 512;
  }
  return null;
}

/**
 * Compare the module's family pins against meta's. Pure — takes both dep maps,
 * returns { lines (markdown bullets), warnings (annotation texts) }.
 */
export function compareFamilyPins(moduleDeps, metaDeps, metaVersion) {
  const lines = [];
  const warnings = [];
  for (const family of FAMILIES) {
    const mod = familyPin(moduleDeps, family);
    const meta = familyPin(metaDeps, family);
    if (!mod) {
      const msg =
        `${family.label}: this module does not pin it — the IG Publisher will ` +
        `inject the LATEST release at build time (restore the direct pin in ` +
        `sushi-config.yaml).`;
      lines.push(`- ⚠️ ${msg}`);
      warnings.push(msg);
    } else if (!meta) {
      lines.push(
        `- ${family.label}: module pins \`${mod.id}@${mod.version}\`; meta ` +
          `${metaVersion} pins none — the module's pin is authoritative (expected today).`,
      );
    } else if (mod.version === meta.version) {
      lines.push(
        `- ${family.label}: \`${mod.id}@${mod.version}\` — in step with meta ${metaVersion}.`,
      );
    } else {
      const msg =
        `${family.label}: module pins ${mod.id}@${mod.version} but meta ` +
        `${metaVersion} ships ${meta.id}@${meta.version} — align the module's ` +
        `pin (meta is the family's source of truth).`;
      lines.push(`- ⚠️ ${msg}`);
      warnings.push(msg);
    }
  }
  return { lines, warnings };
}

/**
 * npm-protocol resolution of meta's package.json dependencies: metadata doc
 * first, then the tarball the registry itself points to via dist.tarball.
 * Tries each registry in order; throws with the collected reasons when none
 * yields the version.
 */
export async function metaDepsFromRegistries(metaVersion, registries = REGISTRIES) {
  const reasons = [];
  for (const registry of registries) {
    try {
      const metaRes = await fetch(`${registry}/${META_ID}`, {
        headers: { accept: "application/json" },
      });
      if (!metaRes.ok) throw new Error(`metadata HTTP ${metaRes.status}`);
      const doc = await metaRes.json();
      const entry = doc?.versions?.[metaVersion];
      if (!entry) throw new Error(`version ${metaVersion} not in the metadata document`);
      const tarballUrl = entry?.dist?.tarball;
      if (!tarballUrl) throw new Error(`no dist.tarball for ${metaVersion}`);
      const tgzRes = await fetch(tarballUrl);
      if (!tgzRes.ok) throw new Error(`tarball HTTP ${tgzRes.status}`);
      const pkgJson = fileFromTgz(
        Buffer.from(await tgzRes.arrayBuffer()),
        "package/package.json",
      );
      if (!pkgJson) throw new Error("package/package.json not found in the tarball");
      return JSON.parse(pkgJson).dependencies ?? {};
    } catch (error) {
      reasons.push(`${registry}: ${error.message}`);
    }
  }
  throw new Error(reasons.join("; "));
}

async function main() {
  const args = process.argv.slice(2);
  const opt = (flag) => {
    const i = args.indexOf(flag);
    return i >= 0 ? args[i + 1] : null;
  };
  const root =
    opt("--root") ?? path.join(path.dirname(fileURLToPath(import.meta.url)), "..");
  const mdOut = opt("--markdown-out");
  const metaJsonPath = opt("--meta-package-json");

  const moduleDeps = parseSushiDependencies(
    readFileSync(path.join(root, "sushi-config.yaml"), "utf8"),
  );
  const metaVersion = moduleDeps[META_ID];

  let lines = [];
  let warnings = [];
  if (!metaVersion) {
    const msg = `sushi-config.yaml does not pin ${META_ID} — cannot compare the THO/extensions pins.`;
    lines.push(`- ⚠️ ${msg}`);
    warnings.push(msg);
  } else {
    let metaDeps = null;
    try {
      if (metaJsonPath) {
        metaDeps = JSON.parse(readFileSync(metaJsonPath, "utf8")).dependencies ?? {};
      } else {
        metaDeps = await metaDepsFromRegistries(metaVersion);
      }
    } catch (error) {
      const msg = `could not read meta ${metaVersion} from the FHIR package registries (${error.message}) — drift not checked this run.`;
      lines.push(`- ⚠️ ${msg}`);
      warnings.push(msg);
    }
    if (metaDeps !== null) {
      ({ lines, warnings } = compareFamilyPins(moduleDeps, metaDeps, metaVersion));
    }
  }

  const markdown = [
    "",
    "## THO / Extensions Pack — lockstep with meta",
    "",
    ...lines,
    "",
  ].join("\n");
  if (mdOut) writeFileSync(mdOut, markdown);
  else process.stdout.write(markdown + "\n");

  if (process.env.GITHUB_ACTIONS === "true") {
    for (const w of warnings) process.stdout.write(`::warning::${w}\n`);
  }
  // Always 0: this check proposes and warns, it never gates.
}

const isMain =
  process.argv[1] && import.meta.url === new URL(`file://${process.argv[1]}`).href;
if (isMain) {
  await main();
}
