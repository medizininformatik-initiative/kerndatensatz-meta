# `scripts/`

Every executable helper in this repository. One directory, one concern: things
you run. The split between a `tools/` and a `scripts/` directory was not one a
reader could predict, so there is only this one.

The name matters: `go-publish.yml` checks this repository out into `automation/`
and calls `automation/scripts/...`, so the path is a contract with the
publication workflow.

## Publication automation

Imported from
[kerndatensatz-basis](https://github.com/medizininformatik-initiative/kerndatensatz-basis)
(`main`). These support the gated formal-publication workflow
(`.github/workflows/go-publish.yml`), which runs their unit tests by an EXPLICIT
list — not a glob, because this directory now holds unrelated helpers too.

| Script | What it does |
| --- | --- |
| `copy-localized-table-backgrounds.sh` | Copies the per-language table background assets into the staged site |
| `fix-cloud-redirects.mjs` | Rewrites cloud redirects in the staged publication webroot |
| `fix-ig-registry-entry.mjs` | Produces the reviewable FHIR IG Registry patch |
| `fix-publication-history-links.mjs` | Repairs history links across published versions |
| `install-history-template.mjs` | Installs the HL7 history template into the webroot |
| `merge-publication-webroot.mjs` | Merges the new version into the existing publication webroot |
| `verify-preview-preservation.mjs` | Asserts no branch preview was destroyed by a publication |

## Module helpers

| Script | What it does | Run by |
| --- | --- | --- |
| `convention-check.mjs` | Asserts the MII metadata contract (id/canonical/name/packageId, pinned versions) and that OPTIONAL (0..1) menu pages are decided before a release (M9, `docs/optional-pages.md`) | `convention-check.yml` |
| `language-model-check.sh` | Fails the build when prose contradicts the English-default / German-translation language model | `convention-check.yml` |
| `check-updates.mjs` | Reports drift between the pinned toolchain and what upstream released | `dependency-check.yml` |
| `set-su-termserv-secrets.sh` | Validates an SU-TermServ client certificate and uploads it as repository secrets | a maintainer, once |
| `seed-comparison-cache.sh` | Places the previous release's `package.tgz` (a GitHub Release asset) into `~/.fhir/packages` so the publisher's `version-comparison` can load it; no-op while the parameter is commented out | `ig-publisher.yml`, `module-release.yml`, `go-publish.yml` (before the publisher) |
| `publish-simplifier.sh` | Uploads the published `package.tgz` from GitHub Pages to Simplifier (`fhir publish-package`) after checking its manifest and running `hapi-smoketest.sh` | a maintainer, by hand, while packages are still provided via Simplifier |
| `hapi-smoketest.sh` | Loads a package into a throwaway HAPI FHIR server as a smoke test | `publish-simplifier.sh`, or by hand |

## Moved out of this directory

`ig-stats.py` and `ig-translate.sh` were the tooling of the `ig-analyze` and `ig-translate` skills.
Both skills moved to the organization's skill catalog and took their scripts with them, so the
tooling now ships *inside* the skill instead of being reached by parent traversal out of
`skills/…` into here. They are `fhir-ig-analysis` and `fhir-ig-translation` in
[`agent-skills`](https://github.com/forschungsgruppe-digital-health/agent-skills); this repository
keeps no copies of them (the vendored copies left on 2026-08-28) — install from the catalog when
needed. See [`../skills/README.md`](../skills/README.md) and
[`../skills/RETIRED.md`](../skills/RETIRED.md). No workflow invoked either script.

## Tests

```bash
node --test scripts/*.test.mjs            # every unit test (what CI runs on a PR)
```

`toolchain-pins.test.mjs` tests the repository rather than a script: it fails
when the `env:` pin blocks of the build workflows stop agreeing (they must be
copies — a workflow cannot read another workflow's `env:`), and when a
SUSHI-only workflow (`publish-fsh-generated.yml`, `search-param-tests.yml`)
pins a different SUSHI version.
