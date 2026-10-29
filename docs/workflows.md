# How this repository operates

What CI runs for the Meta module, on which trigger, and which repository
variable turns it off. Branching and the commit convention are in
[CONTRIBUTING.md](../CONTRIBUTING.md); the release procedure is in
[release.md](release.md).

## Branching

`main` (release branch, default) · `dev` (integration, previewed at
`branches/dev/`) · short-lived `feature|change|fix|chore/*` off `dev`.
`dev → main` is a **merge commit**. Anything that lands on `main` directly has
to be merged back into `dev` before the next release merge
(`git log origin/dev..origin/main` must be empty).

## Workflows

| Workflow | Trigger | What it does | Output | Toggle (default) | Human-gated? |
| --- | --- | --- | --- | --- | --- |
| `ig-publisher.yml` | push to any branch except `main`/`gh-pages`/`fsh-generated`; `workflow_dispatch` | Builds the IG (SUSHI + IG Publisher) and deploys a preview | `gh-pages/branches/<branch>/` + PR comment | `ENABLE_PREVIEW` (ON) · `ENABLE_VERSION_COMPARISON` (ON) | no |
| `cleanup-gh-pages.yml` | schedule (Sun 00:00 UTC); `workflow_dispatch` (input `dry_run`: list stale previews without deleting) | Prunes previews of deleted branches; keeps root + version paths | pruned `gh-pages` | `ENABLE_PREVIEW` (ON) | no |
| `search-param-tests.yml` | push/PR to `dev`/`main`; `workflow_dispatch` | Generates the SearchParameter bundle with SUSHI from the current FSH and exercises it against Blaze loaded with the MII test data (`search-param-test/`) | test result | — | no |
| `publish-fsh-generated.yml` | push to `main`/`release/**`; `workflow_dispatch` | Runs SUSHI and mirrors `fsh-generated/` + `package.json` to the orphan branch `fsh-generated`, which Simplifier syncs from. Transitional — only while package releases are still provided via Simplifier | `fsh-generated` branch | — | no |
| `convention-check.yml` | push/PR to `dev`/`main`/`release/**`; `workflow_dispatch` (input `strict`: force release mode) | The **single** convention checker: metadata-contract patterns (hard on release branches) + the optional-page decision gate (M9, `docs/optional-pages.md`) + the language-model guard (`scripts/language-model-check.sh`) + the offline test suites (`scripts/*.test.mjs`); the advisory repo ↔ MII-wiki drift review is a manual review, not part of this workflow | check result | `ENABLE_CONVENTION_CHECK` (ON) | no |
| `module-release.yml` | push of a CalVer tag `vYYYY.n.n`; `release: published` (the announcement); `workflow_dispatch` (dry run) | Builds, creates the GitHub Release, announces to the MII Zulip (topic *Releases*), hands off to `go-publish` | release | `ENABLE_MODULE_RELEASE` (ON) · `ENABLE_ZULIP_ANNOUNCE` (ON) | production publish is gated |
| `go-publish.yml` | `workflow_dispatch` **only** | Production `-go-publish`; `publish:false` = full dry run by default | published IG | — | **always human-triggered** |
| `dependency-check.yml` | schedule (Mon 06:00 UTC); `workflow_dispatch` | Version drift (IG Publisher, SUSHI, Jekyll, IG template, FHIR deps) → one tracking issue | `dependencies` issue | `ENABLE_DEPENDENCY_CHECK` (ON) | proposals only |
| `security-scan.yml` | schedule (Mon 07:00 UTC); PR to `dev`; `workflow_dispatch` | OSV + Trivy (fs + dev-container image) | SARIF in Security tab | `ENABLE_SECURITY_SCAN` (ON) | no |

Notes:
- **FHIR validation is performed by the IG Publisher builds.** The former
  Simplifier .NET and standalone Java-validator workflows were removed from
  `dev`/`main`. The reusable `ci_java_validation.yml` / `ci_dotnet_validation.yml`
  that other MII modules still call live on the `master` branch (and at the
  pinned commit `1db2e534`) — keep that branch.
- **`.github/workflows/nginx.conf` is shared.** It is the client-certificate
  proxy to SU-TermServ; this repo's build workflows and other MII modules fetch
  it by path at commit `1db2e534`. Never move or rename it.
- **Terminology** is auto-selected, not a toggle: builds use **SU-TermServ** when the
  client-cert secrets are present, else fall back to HL7 `tx.fhir.org` with a notice.
- **Pages mode** (`vars.PAGES_ACTIONS_ENABLED`) chooses the gh-pages push vs the
  Actions deploy path; either serves the previews. Set it to match Settings →
  Pages ("Deploy from a branch → `gh-pages`" ⇒ leave it unset; "GitHub Actions"
  ⇒ set it to `true`); a mismatch is what makes a preview URL 404. Only
  `go-publish.yml` with `publish: true` *requires* the value `true` — it hard-fails
  without it.
- **Dependabot** is switched by its config presence, not an `if:`.

### The toggle summary

Every repository variable the workflows read. All of them default correctly
when unset; [secrets.md](secrets.md) covers the *secrets* that enable the gated
features.

| Pipeline | Variable | Default |
| --- | --- | --- |
| IG build + preview | `ENABLE_PREVIEW` | ON |
| Preview deploy path | `PAGES_ACTIONS_ENABLED` | unset (gh-pages push mode) |
| Convention check | `ENABLE_CONVENTION_CHECK` | ON |
| Dependency check | `ENABLE_DEPENDENCY_CHECK` | ON |
| Security scan | `ENABLE_SECURITY_SCAN` | ON |
| Publisher version comparison | `ENABLE_VERSION_COMPARISON` | ON (no-op while `version-comparison` is commented out) |
| Module release (CalVer) | `ENABLE_MODULE_RELEASE` | ON |
| MII Zulip announcement | `ENABLE_ZULIP_ANNOUNCE` | ON |
| Production `-go-publish` | manual `workflow_dispatch` + `publish:false` | OFF (gated) |

## Release

The module releases with **CalVer** `YYYY.n.n` via the MII Module Release
Workflow — see [release.md](release.md) and
[recipes/cut-a-release.md](recipes/cut-a-release.md). The formal publication
lands at the root of the GitHub Pages site and under its version path (for
example `2027.0.0-ballot/`); previews live under `branches/<branch>/`.

## Secrets & enabling the gated features

The IG builds and previews without secrets. To enable the optional gated
features — SU-TermServ terminology for Publisher builds and the Zulip release
announcement — see [secrets.md](secrets.md) for the exact `gh secret set`
commands. The workflows are already wired.
