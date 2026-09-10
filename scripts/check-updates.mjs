#!/usr/bin/env node
// check-updates.mjs — compares this repo's pinned versions against the latest
// available upstream and prints a Markdown drift report.
//
// Design rules (see docs/maintenance.md):
// - Pins are read from the REAL repo files (ig.ini, sushi-config.yaml, the CI
//   workflow env) so this checker never becomes a second source of truth.
// - Every row links the upstream changelog / release notes so a reviewer can
//   judge the risk of a bump.
// - The script NEVER updates anything itself and ALWAYS exits 0 — drift is
//   reported in the output, not via the exit code (the workflow decides what
//   to do with the report).
// - Zero npm dependencies; Node 22 built-ins only (fetch, node:fs).
// - Network errors are tolerated per row ("lookup failed"), never fatal.
// - Pin files that land in parallel work (sushi-config.yaml, ig.ini, the CI
//   build workflow) are read DEFENSIVELY: a missing file yields a
//   "pin file not found" reminder row, never a crash.
//
// This implementation is kept aligned with the sibling template repo
// (medizininformatik-initiative/ig-template-mii-kds, same file) and with
// the sample IG's scripts/check-updates.py; this repo extends the watch list
// with de.medizininformatikinitiative.template and a fixed set of FHIR package
// dependencies.
//
// Usage:  node scripts/check-updates.mjs [--format=markdown]
// Tests:  node --test scripts/check-updates.test.mjs   (offline, pure functions)

import { readFileSync, readdirSync, existsSync, appendFileSync } from "node:fs";
import { fileURLToPath } from "node:url";
import path from "node:path";

// ---------------------------------------------------------------------------
// Pure functions (unit-tested in check-updates.test.mjs — keep them offline)
// ---------------------------------------------------------------------------

/** Strip a leading "v" so "v2.2.11" and "2.2.11" compare equal. */
export function normalizeVersion(v) {
  if (typeof v !== "string") return v;
  return v.replace(/^v/, "").trim();
}

/**
 * Compare two dotted numeric versions segment by segment (numeric, so
 * "0.10.0" > "0.9.0" — a plain string sort gets this wrong).
 * Returns -1, 0 or 1. Non-numeric segments fall back to string compare.
 */
export function compareVersions(a, b) {
  const as = normalizeVersion(a).split(".");
  const bs = normalizeVersion(b).split(".");
  const len = Math.max(as.length, bs.length);
  for (let i = 0; i < len; i++) {
    const x = as[i] ?? "0";
    const y = bs[i] ?? "0";
    const nx = Number(x);
    const ny = Number(y);
    if (Number.isFinite(nx) && Number.isFinite(ny)) {
      if (nx !== ny) return nx < ny ? -1 : 1;
    } else if (x !== y) {
      return x < y ? -1 : 1;
    }
  }
  return 0;
}

/**
 * Read one dependency pin out of a FHIR template/IG package.json text
 * (e.g. ig-template/package/package.json -> dependencies["fhir2.base.template"]).
 * Returns the pinned version string, or null if the file content is not
 * parseable or the dependency is absent.
 */
export function parsePackageJsonPin(jsonText, depId) {
  try {
    const pkg = JSON.parse(jsonText);
    const v = pkg?.dependencies?.[depId];
    return typeof v === "string" ? v : null;
  } catch {
    return null;
  }
}

/**
 * Extract tool version pins from a GitHub workflow YAML text by env-var name,
 * e.g. `PUBLISHER_VERSION: "2.2.11"` -> "2.2.11". Quoted or unquoted values;
 * commented-out lines are ignored. Returns null when the key is not present.
 */
export function parseWorkflowEnvPin(yamlText, key) {
  const re = new RegExp(`^\\s*${key}:\\s*["']?([^"'\\s#]+)["']?`, "m");
  for (const line of yamlText.split("\n")) {
    if (line.trimStart().startsWith("#")) continue;
    const m = line.match(re);
    if (m) return m[1];
  }
  return null;
}

/**
 * Parse the `dependencies:` block of a sushi-config.yaml into { id: version }.
 * Taken over from the MII KDS sample IG's scripts/check-updates.py: only pinned
 * (version starts with a digit), non-commented entries count; the block ends
 * at the first non-indented line.
 */
export function parseSushiDependencies(yamlText) {
  const deps = {};
  let inBlock = false;
  for (const line of yamlText.split("\n")) {
    if (/^dependencies:/.test(line)) {
      inBlock = true;
      continue;
    }
    if (!inBlock) continue;
    if (/^\S/.test(line)) break; // end of the dependencies block
    if (line.trimStart().startsWith("#")) continue;
    const m = line.match(/^\s+([a-z0-9.\-]+):\s*([0-9][^\s#]*)/);
    if (m) deps[m[1]] = m[2];
  }
  return deps;
}

/**
 * Parse the `template = <id>#<version>` line of an ig.ini.
 * Returns { id, version } — version is null for a path/URL/floating reference
 * (e.g. the interim repository-URL form `template = https://…`, or a bare
 * path form `template = ig-template`).
 * INI comments (`;` and `#` at line start) are skipped. Returns null when no
 * template line exists or the input is not a string.
 */
export function parseIgIniTemplate(iniText) {
  if (typeof iniText !== "string") return null;
  for (const line of iniText.split("\n")) {
    const t = line.trim();
    if (t.startsWith(";") || t.startsWith("#")) continue;
    const m = t.match(/^template\s*=\s*(.+)$/);
    if (!m) continue;
    const value = m[1].trim();
    const hash = value.indexOf("#");
    if (hash === -1) return { id: value, version: null };
    return { id: value.slice(0, hash), version: value.slice(hash + 1).trim() || null };
  }
  return null;
}

/**
 * Union of the FIXED watch list and the pins actually found in
 * sushi-config.yaml. Every watched id always yields a row (pinned: null when
 * absent — the caller renders the reminder); extra pinned deps beyond the
 * watch list are appended so nothing pinned goes unwatched.
 */
export function mergeWatchedDeps(watchedIds, foundDeps) {
  const rows = watchedIds.map((id) => ({ id, pinned: foundDeps?.[id] ?? null }));
  for (const [id, pinned] of Object.entries(foundDeps ?? {})) {
    if (!watchedIds.includes(id)) rows.push({ id, pinned });
  }
  return rows;
}

/**
 * Pick the newest *released* version from a FHIR package-list.json object
 * (HL7/ig-template-base2 publishes releases ONLY there — the repo has no
 * GitHub releases or tags). Entries with status "ci-build" (the floating
 * "current") are ignored. Returns null when no release entry exists.
 */
export function latestFromPackageList(packageList) {
  const releases = (packageList?.list ?? [])
    .filter((e) => e.status === "release" && typeof e.version === "string")
    .map((e) => e.version);
  if (releases.length === 0) return null;
  return releases.sort(compareVersions).pop();
}

/**
 * Resolve the latest published version of the module template package
 * (de.medizininformatikinitiative.template) from the two possible sources:
 * the FHIR package registry metadata (null when packages.fhir.org 404s —
 * i.e. not yet published there) and, as fallback, the GitHub releases of
 * the repo named by TEMPLATE_REPO (currently
 * medizininformatik-initiative/ig-template-mii-kds; swept to the target
 * org at transfer — null when the repo has no release yet). Returns { latest, source }; when neither source has
 * a version: { latest: null, source: "not yet published" } — graceful, not
 * an error.
 */
export function resolveTemplateLatest(pkgMeta, latestRelease) {
  if (pkgMeta) {
    const v =
      pkgMeta?.["dist-tags"]?.latest ??
      Object.keys(pkgMeta?.versions ?? {}).sort(compareVersions).pop() ??
      null;
    if (v) return { latest: v, source: "packages.fhir.org" };
  }
  if (latestRelease?.tag_name) {
    return {
      latest: normalizeVersion(latestRelease.tag_name),
      source: "GitHub releases",
    };
  }
  return { latest: null, source: "not yet published" };
}

/** Row status: ok | update available | pin not found | lookup failed. */
export function statusFor(pinned, latest) {
  if (pinned == null) return "pin not found";
  if (latest == null) return "lookup failed";
  return normalizeVersion(pinned) === normalizeVersion(latest)
    ? "ok"
    : "update available";
}

/**
 * Status for the template-package row: "not yet published" (from
 * resolveTemplateLatest) wins over the generic classification, so a missing
 * registry entry is reported gracefully instead of as "lookup failed".
 */
export function templateStatusFor(pinned, resolved) {
  if (resolved?.source === "not yet published") return "not yet published";
  return statusFor(pinned, resolved?.latest ?? null);
}

/** Escape a value for use inside a Markdown table cell. */
export function escapeCell(value) {
  return String(value ?? "?").replaceAll("|", "\\|").replaceAll("\n", " ");
}

/**
 * Render rows [{artifact, pinned, latest, status, link}] as a Markdown table.
 */
export function buildTable(rows) {
  const header =
    "| Artifact | Pinned | Latest | Status | Changelog / release notes |\n" +
    "|---|---|---|---|---|";
  const body = rows
    .map(
      (r) =>
        `| ${escapeCell(r.artifact)} | ${escapeCell(r.pinned ?? "—")} | ` +
        `${escapeCell(r.latest ?? "—")} | ${escapeCell(r.status)} | ${r.link} |`,
    )
    .join("\n");
  return `${header}\n${body}`;
}

/** True when at least one row proposes an update. */
export function hasUpdates(rows) {
  return rows.some((r) => r.status === "update available");
}

// ---------------------------------------------------------------------------
// Network lookups (main only — tests never reach these)
// ---------------------------------------------------------------------------

const GITHUB_TOKEN = process.env.GITHUB_TOKEN ?? "";

async function fetchJson(url, { github = false, allow404 = false } = {}) {
  const headers = { "user-agent": "mii-kds-module-template-update-check" };
  if (github && GITHUB_TOKEN) {
    // Authenticated GitHub API calls avoid the anonymous rate limit
    // (lesson from the MII KDS sample IG checker).
    headers.authorization = `Bearer ${GITHUB_TOKEN}`;
    headers.accept = "application/vnd.github+json";
  }
  const res = await fetch(url, { headers, signal: AbortSignal.timeout(30_000) });
  if (res.status === 404 && allow404) return null; // "does not exist (yet)" is data here
  if (!res.ok) throw new Error(`${res.status} ${res.statusText} for ${url}`);
  return res.json();
}

const TEMPLATE_PKG_ID = "de.medizininformatikinitiative.template";
// The repository that HOSTS the template releases — its home in the
// medizininformatik-initiative organisation since the 2026-08-27 org move
// (docs/org-move.md); the pre-move repository is an archived snapshot.
const TEMPLATE_REPO = "medizininformatik-initiative/ig-template-mii-kds";

// The FIXED FHIR package watch list: these always get a row, even
// before sushi-config.yaml has landed. Extra pins found in sushi-config.yaml
// are watched on top.
const WATCHED_FHIR_DEPS = [
  "de.basisprofil.r4",
  "de.medizininformatikinitiative.kerndatensatz.meta",
  "hl7.fhir.uv.crmi",
  "hl7.fhir.uv.xver-r5.r4",
  // Pinned DIRECTLY by design — the publisher injects the latest release
  // when an IG does not declare them itself (see scripts/meta-pin-drift.mjs).
  "hl7.terminology.r4",
  "hl7.fhir.uv.extensions.r4",
];

const LINKS = {
  igPublisher: "https://github.com/HL7/fhir-ig-publisher/releases",
  sushi: "https://github.com/FHIR/sushi/releases",
  jekyll: "https://github.com/jekyll/jekyll/releases",
  base2: "https://github.com/HL7/ig-template-base2/blob/main/package-list.json",
  template: `https://github.com/${TEMPLATE_REPO}/releases`,
  fhirPkg: (id) => `https://simplifier.net/packages/${id}`,
};

const upstream = {
  igPublisher: async () =>
    normalizeVersion(
      (
        await fetchJson(
          "https://api.github.com/repos/HL7/fhir-ig-publisher/releases/latest",
          { github: true },
        )
      ).tag_name,
    ),
  sushi: async () =>
    (await fetchJson("https://registry.npmjs.org/fsh-sushi/latest")).version,
  jekyll: async () =>
    (await fetchJson("https://rubygems.org/api/v1/gems/jekyll.json")).version,
  base2: async () =>
    latestFromPackageList(
      await fetchJson(
        "https://raw.githubusercontent.com/HL7/ig-template-base2/main/package-list.json",
      ),
    ),
  // The MII IG template: packages.fhir.org once published, else the
  // template repo's GitHub releases, else "not yet published" (graceful).
  templatePkg: async () => {
    const pkgMeta = await fetchJson(`https://packages.fhir.org/${TEMPLATE_PKG_ID}`, {
      allow404: true,
    });
    const latestRelease = await fetchJson(
      `https://api.github.com/repos/${TEMPLATE_REPO}/releases/latest`,
      { github: true, allow404: true },
    );
    return resolveTemplateLatest(pkgMeta, latestRelease);
  },
  fhirPkg: async (id) => {
    const meta = await fetchJson(`https://packages.fhir.org/${id}`);
    return (
      meta?.["dist-tags"]?.latest ??
      Object.keys(meta?.versions ?? {}).sort(compareVersions).pop() ??
      null
    );
  },
};

// ---------------------------------------------------------------------------
// Pin discovery — read the REAL pins from the repo (defensively: parallel
// tasks may not have landed the pin files yet; report "pin not found" rows
// instead of crashing).
// ---------------------------------------------------------------------------

function readFileIfExists(file) {
  return existsSync(file) ? readFileSync(file, "utf8") : null;
}

/**
 * The module template pin lives in ig.ini
 * (`template = de.medizininformatikinitiative.template#<version>` — the
 * endgame once the package is published); today it is the interim
 * repository-URL form, or the vendored fallback `template = #ig-template`,
 * both reported as not-a-pin.
 */
function readTemplatePin() {
  const text = readFileIfExists("ig.ini");
  if (text == null) return { state: "no-file" };
  const parsed = parseIgIniTemplate(text);
  if (parsed == null) return { state: "no-line" };
  if (parsed.version == null || !/^\d/.test(parsed.version)) {
    return { state: "not-a-pin", ref: parsed.version ? `${parsed.id}#${parsed.version}` : parsed.id };
  }
  return { state: "pinned", version: parsed.version };
}

/**
 * fhir2.base.template is pinned INSIDE the template package (the IG template's
 * package/package.json), i.e. transitively for this repo. Only the vendored
 * fallback copy (ig-template/) carries a local pin to read.
 */
function readBaseTemplatePin() {
  const text = readFileIfExists("ig-template/package/package.json");
  if (text == null) return null;
  return parsePackageJsonPin(text, "fhir2.base.template");
}

/**
 * Tool pins (IG Publisher, SUSHI, Jekyll) live as env vars in the CI build
 * workflows. Report the pin from the workflow whose staleness actually ships —
 * the publication path — then fall back to the remaining workflows. An explicit
 * process.env value (set by the calling workflow) wins over both.
 *
 * The blocks are supposed to be identical; scripts/toolchain-pins.test.mjs
 * fails the build when they are not, so the order below only decides which
 * file gets reported while a drift PR is open.
 */
function readToolPin(envKey, workflowTexts) {
  if (process.env[envKey]) return process.env[envKey];
  for (const text of workflowTexts) {
    const v = parseWorkflowEnvPin(text, envKey);
    if (v != null) return v;
  }
  return null;
}

const PUBLICATION_WORKFLOW = "go-publish.yml";

function readWorkflowTexts() {
  const dir = ".github/workflows";
  if (!existsSync(dir)) return [];
  const files = readdirSync(dir)
    .filter((f) => f.endsWith(".yml") || f.endsWith(".yaml"))
    .sort();
  // readdirSync order is filesystem-dependent — read the publication workflow
  // first so the reported pin never depends on the runner's filesystem.
  const ordered = files.includes(PUBLICATION_WORKFLOW)
    ? [PUBLICATION_WORKFLOW, ...files.filter((f) => f !== PUBLICATION_WORKFLOW)]
    : files;
  return ordered.map((f) => readFileSync(path.join(dir, f), "utf8"));
}

// ---------------------------------------------------------------------------
// Main
// ---------------------------------------------------------------------------

async function lookup(get) {
  try {
    return (await get()) ?? null;
  } catch {
    return null;
  }
}

export async function collectRows() {
  const workflowTexts = readWorkflowTexts();
  const rows = [];

  // Tool pins from the CI workflow env (land with the build workflow task).
  const tools = [
    { artifact: "IG Publisher", envKey: "PUBLISHER_VERSION", get: upstream.igPublisher, link: LINKS.igPublisher },
    { artifact: "SUSHI (fsh-sushi)", envKey: "SUSHI_VERSION", get: upstream.sushi, link: LINKS.sushi },
    { artifact: "Jekyll", envKey: "JEKYLL_VERSION", get: upstream.jekyll, link: LINKS.jekyll },
  ];
  for (const tool of tools) {
    const pinned = readToolPin(tool.envKey, workflowTexts);
    const latest = pinned == null ? null : await lookup(tool.get);
    rows.push({
      artifact: tool.artifact,
      pinned: pinned ?? `pin not found (\`${tool.envKey}\` not set in any workflow env)`,
      latest,
      status: statusFor(pinned, latest),
      link: tool.link,
    });
  }

  // The MII IG template — the highest-value pin to watch here.
  const templatePin = readTemplatePin();
  const templateResolved = (await lookup(upstream.templatePkg)) ?? {
    latest: null,
    source: null, // network failure, NOT "not yet published"
  };
  rows.push({
    artifact: `\`${TEMPLATE_PKG_ID}\``,
    pinned:
      templatePin.state === "pinned"
        ? templatePin.version
        : templatePin.state === "no-file"
          ? "pin file not found (`ig.ini` missing)"
          : templatePin.state === "no-line"
            ? "pin not found (no `template =` line in `ig.ini`)"
            : `\`${templatePin.ref}\` — not a version pin (URL/vendored/floating); ` +
              "see docs/recipes/switch-template-to-published.md",
    latest:
      templateResolved.source === "not yet published"
        ? "not yet published"
        : templateResolved.latest,
    status: templateStatusFor(
      templatePin.state === "pinned" ? templatePin.version : null,
      templateResolved,
    ),
    link: LINKS.template,
  });

  // The base template underneath the MII IG template. Pinned transitively (in
  // the template package); only the vendored fallback copy has a local pin.
  const basePinned = readBaseTemplatePin();
  const baseLatest = await lookup(upstream.base2);
  const baseVendored = existsSync("ig-template/package/package.json");
  rows.push({
    artifact: "fhir2.base.template",
    pinned:
      basePinned ??
      (baseVendored
        ? "pin not found (no `dependencies[\"fhir2.base.template\"]` entry in the vendored template)"
        : `no local pin (pinned transitively inside \`${TEMPLATE_PKG_ID}\`)`),
    latest: baseLatest,
    // Without a vendored copy the pin is DELIBERATELY not local — a bump goes
    // through the template package, so "pin not found" would be misleading.
    status:
      basePinned == null && !baseVendored && baseLatest != null
        ? "transitive — bump via the template pin"
        : statusFor(basePinned, baseLatest),
    link: LINKS.base2,
  });

  // FHIR package dependencies: the fixed watch list ALWAYS gets rows (also
  // before sushi-config.yaml lands — defensive); extra pins found in
  // sushi-config.yaml are watched on top.
  const sushiConfig = readFileIfExists("sushi-config.yaml");
  const foundDeps = sushiConfig == null ? {} : parseSushiDependencies(sushiConfig);
  for (const dep of mergeWatchedDeps(WATCHED_FHIR_DEPS, foundDeps)) {
    const latest = await lookup(() => upstream.fhirPkg(dep.id));
    rows.push({
      artifact: `\`${dep.id}\``,
      pinned:
        dep.pinned ??
        (sushiConfig == null
          ? "pin file not found (`sushi-config.yaml` missing)"
          : "pin not found (not pinned in `sushi-config.yaml`)"),
      latest,
      status: statusFor(dep.pinned, latest),
      link: LINKS.fhirPkg(dep.id),
    });
  }

  return rows;
}

export function renderReport(rows) {
  return [
    "### Dependency status",
    "",
    buildTable(rows),
    "",
    "> Bumps are **proposed only** — never auto-merged, never auto-floated.",
    "> Review the linked changelog, update the pin in its real location, and —",
    "> for an IG Publisher bump — recompute the jar's SHA-256 next to the new",
    "> version. Steps: `docs/recipes/review-a-dependency-update.md`.",
    "",
    "> `pin not found` rows are expected until the file/workflow that carries",
    "> the pin has landed; they are a reminder, not an error. `not yet",
    "> published` on the template package is expected until the IG template's first",
    "> release reaches a registry.",
    "",
  ].join("\n");
}

async function main() {
  // Only --format=markdown is supported; the flag exists so the workflow
  // invocation stays explicit and future formats stay possible.
  const rows = await collectRows();
  process.stdout.write(renderReport(rows));
  if (process.env.GITHUB_OUTPUT) {
    // Machine-readable signal for the workflow (sample-IG lesson).
    appendFileSync(
      process.env.GITHUB_OUTPUT,
      `has_updates=${hasUpdates(rows) ? "true" : "false"}\n`,
    );
  }
  process.exitCode = 0; // drift is data, not an error
}

const invokedDirectly =
  process.argv[1] &&
  path.resolve(process.argv[1]) === fileURLToPath(import.meta.url);
if (invokedDirectly) {
  await main();
}
