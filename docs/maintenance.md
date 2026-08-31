# Maintenance — dependency & vulnerability monitoring

This repo pins every dependency to a fixed version. Pinning is safe but goes
stale **silently**. Three monitoring layers actively surface available updates
and known vulnerabilities. None of them ever changes a version by itself: every
bump is a proposal that a human reviews and merges.

> **Why three layers:** each tool sees a different slice. Dependabot reads
> standard package manifests; the custom checker reads the FHIR/IG-specific
> pins Dependabot cannot see; the scanners find *known vulnerabilities* rather
> than newer versions. Only together do they cover this repo.

**A module created from this template inherits all of this monitoring** — the
`.github/dependabot.yml`, both workflows, the checker script, and these docs
propagate on "Use this template" and keep running in the module unchanged
(unlike the template's own Release Please files, which the first-run
bootstrap removes). The checker reads pins from the module's own files, so it
reports the module's drift without any adaptation.

## The cadence at a glance

| Layer | What it watches | When | Where results land | Switch |
|---|---|---|---|---|
| **A — Dependabot** (`.github/dependabot.yml`) | GitHub Actions pins; a root npm manifest (when present); dev container **feature** versions (`devcontainers` ecosystem — the dev container is image-only, so there is no Dockerfile for the `docker` ecosystem to read) | weekly, Monday | update PRs targeting `dev`; Dependabot alerts under **Security → Dependabot** | config-file presence + repo Dependabot settings (no `vars.*` toggle — Dependabot is not a gated job) |
| **B — Version checker** (`.github/workflows/dependency-check.yml` + `scripts/check-updates.mjs`) | `de.medizininformatikinitiative.template` (from `ig.ini`), `fhir2.base.template` (transitive; local only when vendored), IG Publisher, SUSHI, Jekyll (from the build workflow env), the FHIR package dependencies (from `sushi-config.yaml`) | Monday 06:00 UTC + manual dispatch | one continuously-updated tracking issue **"Dependency status \<YYYYWww\>"** (label `dependencies`) + a `drift-report` workflow artifact | `vars.ENABLE_DEPENDENCY_CHECK` (ON by default) |
| **C — Security scan** (`.github/workflows/security-scan.yml`) | known vulnerabilities (OSV database), misconfigurations, committed secrets — via OSV-Scanner + Trivy `fs`; plus Trivy `image` over the dev container's digest-pinned base image (OS/base-image vulnerabilities the other scans miss) | Monday 07:00 UTC + every PR to `dev` + manual dispatch | **Security → Code scanning** (SARIF categories `osv-scanner`, `trivy-fs`, `trivy-image`) | `vars.ENABLE_SECURITY_SCAN` (ON by default) |

A disabled workflow still triggers but its jobs show as **skipped** — that is
expected, not an error.

## Where each pin lives (single source of truth)

The checker reads pins from the real files — it is never a second list to keep
in sync:

| Pin | Location |
|---|---|
| `de.medizininformatikinitiative.template` | `ig.ini` → the `template =` line. Today it is the interim repository URL (follows the template's released `main` — no version pin; the checker reports it as unpinned); the endgame is `template = de.medizininformatikinitiative.template#<version>` once published — follow [`recipes/switch-template-to-published.md`](recipes/switch-template-to-published.md) |
| `fhir2.base.template` | inside the template package (transitive) — locally only in the vendored fallback copy (`ig-template/package/package.json`) |
| FHIR package dependencies (`de.basisprofil.r4`, `de.medizininformatikinitiative.kerndatensatz.meta`, `hl7.fhir.uv.crmi`, `hl7.fhir.uv.xver-r5.r4`, …) | `sushi-config.yaml` → `dependencies:` block |
| IG Publisher / SUSHI / Jekyll | `env:` values (`PUBLISHER_VERSION`, `PUBLISHER_SHA256`, `SUSHI_VERSION`, `JEKYLL_VERSION`) in each build workflow — `ig-publisher.yml`, `module-release.yml`, `go-publish.yml` and (template repo only) `release-demo.yml`. A workflow cannot read another workflow's `env:`, so the four blocks are copies and must stay identical — `scripts/toolchain-pins.test.mjs` fails the build if they drift. The checker reads `go-publish.yml`. **Also sweep the copy-paste block in `docs/recipes/first-build-in-devcontainer.md`** (publisher URL + jar SHA + expected `sushi --version` output) — it is covered by no test and has gone stale before |
| Jekyll gem checksum | `go-publish.yml` → `JEKYLL_GEM_SHA256` (**only** there — the release path verifies the gem bytes). **Covered by no test and not watched by the checker**: a Jekyll bump that updates the four `JEKYLL_VERSION` blocks but not this checksum passes every test and then fails `go-publish` at its `gem fetch … sha256sum --check` step. Recompute with `gem fetch jekyll -v <version> && sha256sum jekyll-<version>.gem` |
| Ruby (for Jekyll) | `ruby-version: "3.3"` in the `ruby/setup-ruby` steps of `ig-publisher.yml`, `module-release.yml` and (template repo only) `release-demo.yml`; `go-publish.yml` deliberately uses the runner's system Ruby. CI floats the patch level on purpose; the dev container exact-pins (see the dev-container row) |
| SUSHI, once more, for the reusable validation | `validation.yml` → the reusable-workflow input `SUSHI_VERSION: ${{ vars.SUSHI_VERSION \|\| '<version>' }}`. A different mechanism, so bump it in the same PR as the three `env:` blocks; the toolchain test asserts the fallback literal matches them |
| HL7 Java validator | `validation.yml` → `JAVA_VALIDATOR_VERSION: ${{ vars.JAVA_VALIDATOR_VERSION \|\| '<version>' }}`. **Not watched by the checker** — it mirrors the reusable workflow's own default at the pinned `kerndatensatz-meta` SHA, so re-check it whenever that SHA is re-resolved |
| GitHub Actions | commit-SHA pins in `.github/workflows/*.yml` (with `# vX.Y.Z` comments) |
| Publication support repos (`HL7/fhir-ig-history-template`, `HL7/fhir-web-templates`) | commit-SHA `ref:` pins in `go-publish.yml` **only** (the two checkout steps). **Not watched by the checker** — re-resolve by hand when preparing a release; the comment at each pin records the last resolution date |
| SU-TermServ proxy: the `medizininformatik-initiative/kerndatensatz-meta` `nginx.conf` ref **and** the nginx proxy image digest | commit-SHA / digest pins in all three build workflows — `ig-publisher.yml`, `module-release.yml`, `go-publish.yml`. Keep the three identical, for the same reason as the toolchain pins above; nothing cross-checks these. **Not watched by the checker** — re-resolve all three by hand when preparing a release |
| MII reusable validation workflows (`kerndatensatz-meta/.github/workflows/ci_dotnet_validation.yml`, `ci_java_validation.yml`) | `uses: …@<commit-SHA>` in `validation.yml`. **Not watched by the checker** — re-resolve by hand; the trailing comment records the last resolution date |
| Dev container (base-image digest, feature versions, SUSHI/Jekyll installs) | `.devcontainer/devcontainer.json` — features come as Dependabot PRs; the image digest and the `postCreateCommand` tool pins are bumped manually. **Kept pin-for-pin identical (same image digest and tool pins; the `name` field and comments differ) to the dev container in [`ig-template-mii-kds`](https://github.com/medizininformatik-initiative/ig-template-mii-kds)** — the template package and the modules built from it must agree on the toolchain, so bump both repos in the same sweep; drifted pins mean a module builds in one environment and fails in the other |

Until a pin's file lands, the tracking issue shows a `pin not found` row — a
reminder, not an error. Two more expected row states:

- **`not yet published`** on `de.medizininformatikinitiative.template`: the
  checker looks on `packages.fhir.org` first and falls back to the template
  repo's GitHub releases; until the template's first release reaches either, this
  row cannot compare versions. It resolves itself once the package is
  published.
- **`transitive — bump via the template pin`** on `fhir2.base.template`: this
  repo does not pin the base template directly — bumping the
  `de.medizininformatikinitiative.template` pin in `ig.ini` is how a newer
  base template arrives. The row exists so base2 releases stay visible.

## Honest coverage limits — read this before trusting a green scan

The layer-C scanners cover the **tooling** ecosystems only (npm, gem,
Docker/OS packages, GitHub Actions). They do **not** meaningfully cover:

- **FHIR content packages** (`de.medizininformatikinitiative.template`,
  `fhir2.base.template`, `de.basisprofil.r4`, MII Kerndatensatz packages, …)
  — not indexed in any vulnerability database.
- **The IG Publisher jar** — a downloaded binary, likewise not indexed.

For those artifacts the **layer-B version checker is the available safeguard**:
staying on the latest reviewed release is the only systematic mitigation.
A green Security tab therefore does *not* mean "the FHIR toolchain is known
to be safe" — it means "no known vulnerability in the scannable ecosystems".
This limit applies equally to every module created from this template.

Two further dev-container limits, stated plainly:

- The `trivy-image` job scans the **pinned base image**, not a fully built dev
  container: feature layers and the `postCreateCommand` installs (SUSHI,
  Jekyll) are not in the scanned image. Their manifests are covered by the
  fs/OSV scans and layer B.
- **Nothing auto-bumps the base-image digest.** Dependabot's `devcontainers`
  ecosystem updates feature versions only. A `trivy-image` finding against the
  base image is the signal to bump the digest manually (resolve the new digest
  for the tag, update `devcontainer.json`, PR to `dev`).

## Ground rules

- **Never auto-merge, never auto-float.** Every bump is a PR/issue a human
  reviews (changelog first) and merges into `dev`.
- **Version and checksum move together.** An IG Publisher bump always includes
  the recomputed jar SHA-256 — never one without the other.
- Update PRs (Dependabot) target `dev`, never `main`. The version checker
  only opens a tracking issue — it never opens a PR.

## How-tos

- Review a proposed bump: [`docs/recipes/review-a-dependency-update.md`](recipes/review-a-dependency-update.md)
- Triage a Security-tab finding: [`docs/recipes/triage-a-vulnerability-alert.md`](recipes/triage-a-vulnerability-alert.md)
- Run the checker locally: `node scripts/check-updates.mjs` (Node 22, no npm
  install needed; exits 0 always — drift is in the output)
- Run its unit tests (offline): `node --test scripts/check-updates.test.mjs`

## Accepted risks

Findings assessed as not applicable (and dismissed in the Security tab) are
recorded here so the reasoning survives the alert.

| Date | Finding (CVE/GHSA + artifact) | Why accepted | Review by |
|---|---|---|---|
| _none yet_ | | | |

## Recorded limits and decisions

<!-- Moved here from docs/open-tasks.md when the task board moved to the
     issue tracker (2026-08-16). DECIDED records and observed-behavior claims,
     not open tasks. -->

### Verified by observation, not by specification

Both are load-bearing claims this repository makes. They match what the pinned
IG Publisher does today, but neither is documented by HL7, so a toolchain bump
should re-check them.

- **The conformance summary table's *Expectation* column is derived from the
  English keywords SHALL/SHOULD/MAY.** This is the reason the statement list is
  English-only.
  [HL7 ig-guidance](https://build.fhir.org/ig/FHIR/ig-guidance/conformance-statements.html)
  documents the `§…§` marker and the `§§§` table but names no Expectation
  column. To settle it, run one build with a German-marked statement and record
  what the table shows in this file.
- **The `de-DE` Translation extension on `^title` does not reach the artifacts
  index.** The German `^description` renders on the artifact's own page; the
  German `^title` renders nowhere, and `artifacts.html` keeps the
  default-language text. Recorded where the mechanism is documented.

### Known limits of the guards

The guards are worth more than the drift they catch, so their reach is stated
rather than assumed.

- **The `SU_TERMSERV_CLIENT_CERT_PASSWORD` anti-drift assertion runs on the
  template repository only.** It lives in
  `scripts/publication-url-consistency.template-test.mjs`, which asserts
  un-replaced placeholders and therefore cannot run in a created module. A
  re-introduction of the wrong secret name *inside a module* would not be
  caught.
- **`qc/custom.rules.yaml` is not verified end to end.** The MII reusable
  validation that reads it only runs on created modules, never here, so its
  `parse` glob has not been observed against a real run. The .NET job is
  configured upstream to pass regardless, so the worst case is log noise.
- **`scripts/language-model-check.sh` is curated, not exhaustive.** It matches
  line by line, so a claim split across a line break passes. It was tested
  against 20 phrasings and catches every wording that has actually occurred
  here. If you add a phrasing, add the pattern; do not weaken the existing ones.
- **Three SHA-pinned support repositories are not watched by the dependency
  checker** (`HL7/fhir-ig-history-template`, `HL7/fhir-web-templates`,
  `medizininformatik-initiative/kerndatensatz-meta`). They are re-resolved by
  hand; the workflow comments say so rather than claiming automation that does
  not exist.
- **The IG statistics report's German prose is no longer this repository's task.**
  The tool that writes it (`scripts/ig-stats.py`) and the skill that owned it
  (`skills/ig-analyze`) moved to the organization's skill catalog as
  `fhir-ig-analysis` — see [`../skills/RETIRED.md`](../skills/RETIRED.md). This
  repository keeps no copy (the vendored copy left on 2026-08-28); the skill is
  installed from the catalog when needed and its content is maintained there. The
  two items recorded here (report prose still German while every document here is
  English-source, and `recommendations` rows still framed as a migration) belong
  to that skill now and were carried over with it; track them there, not here.
- **Two pins in `validation.yml` are not watched by any layer.** The
  reusable-workflow inputs `SUSHI_VERSION` and `JAVA_VALIDATOR_VERSION` are
  written as `${{ vars.X || '<version>' }}`, which the checker's env parser
  cannot read. `scripts/toolchain-pins.test.mjs` at least holds the SUSHI
  fallback equal to the three build workflows; nothing compares
  `JAVA_VALIDATOR_VERSION` against upstream — re-check it whenever the
  `kerndatensatz-meta` SHA is re-resolved.

### Cross-repo consistency — decided, not pending

This repository and the IG template share a number of documentation filenames —
compare them with `comm -12` over `git ls-files docs` in both checkouts. That was
once real duplication; it is not any more. **No shared file is identical**, and the
closest pairs differ for good reasons — `org-move.md` because each names
the other repository, `glossary.md` because this scaffold defines nine terms the
template repository has no use for, `further-reading.md` because Release Please
is a template-repo entry a module must not follow.

No sync mechanism is planned. A module created from this template must be
self-contained: replacing its copy of `glossary.md` or `maintenance.md` with a
link back to the template would break the moment the module is developed
independently, which is the whole point of a template.

