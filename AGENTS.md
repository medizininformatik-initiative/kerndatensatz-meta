# AGENTS.md — kerndatensatz-meta

Vendor-neutral instructions for any coding agent working in this repository.
These instructions describe *what to do*, independent of which agent, runtime,
or model executes them.

## What this repository is

The **MII Kerndatensatz module Meta** — a FHIR R4 Implementation Guide (IG)
authored in FSH and built with SUSHI and the HL7 IG Publisher.

| | |
| --- | --- |
| Package | `de.medizininformatikinitiative.kerndatensatz.meta` |
| Canonical | `https://www.medizininformatik-initiative.de/fhir/modul-meta` |
| IG id / name | `mii-ig-meta` / `MII_IG_Meta` |
| Publication | GitHub Pages: https://medizininformatik-initiative.github.io/kerndatensatz-meta/ |

Meta holds what applies across all KDS modules: the cross-module
SearchParameters (`input/fsh/searchparameters/`) with their collection and
transaction Bundles, the DIZ-Standorte CodeSystem, the licence extension, the
SearchParameter profile and the server CapabilityStatement.

The repository was migrated from Simplifier/Forge onto the MII KDS module
template (`mii-kds-module-template`). The IG template is referenced in `ig.ini`
by repository URL (`ig-template-mii-kds`) until the package
`de.medizininformatikinitiative.template` is published — see
[`docs/recipes/switch-template-to-published.md`](docs/recipes/switch-template-to-published.md).

### Shared assets other MII modules depend on

Meta is also the **host of shared CI assets**. Other repositories fetch these
by path, pinned to a commit — breaking them breaks other modules' builds:

- **`.github/workflows/nginx.conf`** — the client-certificate proxy to the MII
  terminology server (SU-TermServ), fetched at commit `1db2e534` by this repo's
  own build workflows and by other modules. Never move or rename it.
- **The `master` branch** — holds the reusable validation workflows
  `ci_java_validation.yml` / `ci_dotnet_validation.yml` that other modules call
  (`@master` or `@1db2e534`). They no longer exist on `main`/`dev`. Never delete
  `master`.

## Layout

| Path | What it is |
| --- | --- |
| `sushi-config.yaml`, `ig.ini` | IG metadata and build entry point |
| `input/fsh/` | FSH sources (profiles, extensions, code systems, search parameters, examples) |
| `input/pagecontent/`, `input/includes/`, `input/intro-notes/` | English narrative (default language) |
| `input/translations/de/` | German translation of pages, menu and resources |
| `input/resources/` | Hand-authored JSON (expansion-parameters manifest) |
| `.github/workflows/search-param-test/` | Blaze-based SearchParameter integration tests |
| `scripts/` | Publication, convention and dependency-check scripts, each with a `*.test.mjs` |
| `docs/` | Maintainer documentation and task recipes |
| `skills/` | Agent skills (see below) |

**Generated, never committed:** `fsh-generated/` (SUSHI output), `output/`,
`temp/`, `template/`, `input-cache/` and the repo-root `translations/`
(IG Publisher output). All are gitignored.

## Build and test locally

```bash
sushi .                                   # FSH -> fsh-generated/
./_genonce.sh                             # full IG Publisher build -> output/
node --test scripts/*.test.mjs            # script unit tests
node scripts/convention-check.mjs         # module-metadata contract
bash scripts/language-model-check.sh      # English default / German translation guard
```

The dev container (`.devcontainer/`) carries the pinned toolchain; see
[`docs/recipes/first-build-in-devcontainer.md`](docs/recipes/first-build-in-devcontainer.md).

**SearchParameter changes:** when you add or change a SearchParameter, add or
adjust a test in `.github/workflows/search-param-test/test-search.sh`. The
matching resources must exist in
[`mii-testdata`](https://github.com/medizininformatik-initiative/mii-testdata).
See [the test README](.github/workflows/search-param-test/README.md).

## Workflows

| Workflow | Purpose |
| --- | --- |
| `ig-publisher.yml` | Branch preview to `gh-pages/branches/<branch>/` on every push except `main` |
| `search-param-tests.yml` | SUSHI + Blaze SearchParameter tests on push/PR to `dev`/`main` |
| `convention-check.yml` | Script tests, metadata contract, language guard |
| `module-release.yml` | CalVer tag `vYYYY.n.n` → release build, draft GitHub Release, Zulip announcement |
| `go-publish.yml` | Formal `-go-publish` to the GitHub Pages root — **manual, human-gated** |
| `publish-fsh-generated.yml` | Mirrors SUSHI output to the `fsh-generated` branch, which Simplifier syncs from — transitional, while package releases are still provided via Simplifier |
| `cleanup-gh-pages.yml` | Weekly removal of previews of deleted branches |
| `dependency-check.yml`, `security-scan.yml` | Weekly version-drift and vulnerability reports |

Details: [`docs/workflows.md`](docs/workflows.md).

## Branching and pull-request rules

Full walkthrough in [`CONTRIBUTING.md`](CONTRIBUTING.md). The short form the
agent must follow:

- **Never commit to `main` or `dev` directly.** All work happens on a
  short-lived branch (`feature/*`, `change/*`, `fix/*`, `chore/*`) **off `dev`**.
- Every change arrives as a **pull request targeting `dev`** — one focused
  change per PR. PRs into `dev` are squash-merged after green CI and human
  review; the working branch is then deleted.
- `dev` → `main` is the **release gate**: a human decision, merged as a merge
  commit (not a squash). Never open or merge it unprompted.
- **Back-merge rule.** If anything lands on `main` without going through `dev`,
  `main` must be merged back into `dev` (as a merge commit) before the next
  `dev → main` merge. Check `git log origin/dev..origin/main` before branching.
- **Conventional Commits** for every commit message and PR title
  (`feat`, `fix`, `docs`, `chore`, `ci`, `build`, `refactor`, `test`).

## Attribution rule

Commits, PR titles/bodies, file headers, and docs carry **no AI attribution**:
no AI co-author trailers, no tool or model names, no "generated by" notes.
Author identity is the configured human committer.

## Guardrails

- **Releases are CalVer `YYYY.n.n`** (pre-releases such as `2027.0.0-ballot`)
  via `module-release.yml` and `go-publish.yml`. `version` in
  `sushi-config.yaml`, `package.json` and `publication-request.json` must agree.
  No SemVer, no Release Please.
- **Never commit generated output** — `fsh-generated/`, `output/`,
  `translations/`. CI regenerates what it needs from the FSH sources.
- **Keep the shared assets in place** — `.github/workflows/nginx.conf` and the
  `master` branch (see above).
- **Fixed versions only.** Never use `current`/`latest`/`dev`/`cibuild` as a
  version label in anything built (dependencies, tool versions, container
  images). SUSHI, IG Publisher and Jekyll are pinned in each workflow's `env:`
  block; `scripts/toolchain-pins.test.mjs` fails when they drift apart. The
  interim template URL in `ig.ini` is the one sanctioned exception until the
  template package is published.
- **The single convention checker** is `wiki-consistency-check` +
  `scripts/convention-check.mjs`. Do not add a second metadata linter.
  `scripts/language-model-check.sh` is a separate concern, not a second linter.
- **English is the IG's default language, German the translation**
  (`i18n-default-lang: en`, sources under `input/translations/de/`) — the same
  model as `kerndatensatz-basis`. Every English page needs its German mirror
  with the same file name. Prose asserting the reverse fails
  `scripts/language-model-check.sh` in CI — fix the prose, never the guard.
- **Do not change canonical URLs** of published artifacts. Legacy canonicals
  outside the module canonical are listed under `special-url` in
  `sushi-config.yaml`.
- Checker/analysis skills are report-only: they propose, humans decide; no
  auto-merge; any change is a PR targeting `dev`.
- **Never trigger a publication or announcement** (`go-publish.yml`, release
  publication, Zulip, Simplifier package upload); those are human-gated.

## Skills

Every skill an agent can invoke here lives in [`skills/`](skills/) — one folder
per skill, with the instructions in `SKILL.md` (agent-skills format). Consult
them before doing the corresponding task by hand
([`skills/README.md`](skills/README.md) is the index).

Written here:

- [`skills/wiki-consistency-check/`](skills/wiki-consistency-check/SKILL.md)
  — **the single convention checker**: repo ↔ MII meta wiki drift plus the hard
  module-metadata contract; report-only, PRs target `dev`. Mechanized by
  [`scripts/convention-check.mjs`](scripts/convention-check.mjs).
- [`skills/docs-steward/`](skills/docs-steward/SKILL.md) — checks and repairs
  this repository's documentation: verifies every link, path and factual claim
  against the repo itself. Findings are reported for a human to decide on; any
  resulting change is a pull request targeting `dev`.

### Skills from the org catalog (installed, not copied)

Measuring an IG and translating one belong to the organization's skill catalog,
[`forschungsgruppe-digital-health/agent-skills`](https://github.com/forschungsgruppe-digital-health/agent-skills),
which is their single source of truth. This repository keeps **no copies** (see
[`skills/RETIRED.md`](skills/RETIRED.md)). Install what you need at a pinned
release:

| Task | Catalog skill |
| --- | --- |
| Measure / compare Implementation Guides (read-only statistics, hygiene, maturity) | `fhir-ig-analysis` |
| Produce a guide's translation supplements (translate or harvest) | `fhir-ig-translation` |

```bash
npx skills add forschungsgruppe-digital-health/agent-skills/tree/<release> --skill fhir-ig-analysis fhir-ig-translation --copy
```

Pin with the `/tree/<ref>` form — `owner/repo@v0.15.1` does *not* pin: in that
CLI `@` introduces a skill *name*, and the install silently comes from the
default branch. Because `.claude/skills` and `.agents/skills` are symlinks to
`skills/`, an install inside this checkout lands in `skills/` — installed
catalog skills are working copies, not tracked content.

A skill that needs another one states it as a **precondition** and prints the
exact install command for the user to run; it never installs anything itself.

### Discovery paths (symlinks, not copies)

Some agent runtimes look for skills in a runtime-specific directory. Those
directories are committed as **relative symlinks** to the single source:

```
.claude/skills  -> ../skills
.agents/skills  -> ../skills
```

On Windows, git checks out symlinks as plain text files unless symlink support
is enabled (`git config core.symlinks true` before checkout, plus Developer Mode
or admin rights). If a runtime cannot follow the links, read `skills/`
directly. Never hand-copy the content into the runtime directories.
