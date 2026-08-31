# How this repository operates — two layers

This repo has **two lives**, and keeping them apart is essential:

- **Layer 1 — this template repository itself** (how the template is maintained and
  released).
- **Layer 2 — a module created from it** (how *your* module builds and releases
  after "Use this template").

Read both. A reader must never confuse "how this template repo releases itself" with
"how a module I create releases itself." Details live in the linked docs.

The two tables below cover **every** file in `.github/workflows/` — 12 workflows:
three that belong to the template repository only (Layer 1) and nine that a created
module inherits (Layer 2). If you add a workflow, add a row; a workflow that is
not in one of these tables is undocumented, and that is a defect.

## Branching (both layers)

Same model as described in [CONTRIBUTING.md](../CONTRIBUTING.md): `main` (stable,
default) · `dev` (integration) · short-lived `feature|change|fix/*` off `dev`;
`dev → main` is a **merge commit**. A **new module starts with `main` only** unless
you tick *Include all branches* or run the [first-run bootstrap](recipes/first-run-setup.md),
which creates `dev` for you.

In *this* repository the two branches diverged once and were reconciled on
2026-08-06; anything landing on `main` directly has to be back-merged into `dev`
— [org-move.md](org-move.md#branch-state--main-and-dev-are-reconciled)
has the history and the rule.

---

## Layer 1 — how THIS template repository operates

The template repo is *tooling*: it releases itself with **SemVer** via Release
Please, previews its own demo build, and monitors its own dependencies.

| Workflow | Trigger | What it does | Toggle (default) | Fate in a created module |
| --- | --- | --- | --- | --- |
| `release-please.yml` | push to `main` | Opens the SemVer release PR (tag + changelog) | `ENABLE_RELEASE_PLEASE` (ON) | **REMOVED by bootstrap** |
| `notify-zulip.yml` | `release: published` | Announces the template release to the MII Zulip (topic *Template Releases*) | `ENABLE_ZULIP_ANNOUNCE` (ON) · `ANNOUNCE_PUBLIC_ZULIP` (OFF) | **REMOVED by bootstrap** |
| `release-demo.yml` | `release: published`; `workflow_dispatch` (inputs `tag`, `update_landing_page`) | Rebuilds the Pages **demo from the released tag** with the same pinned toolchain, verifies the render carries that version, publishes it to `gh-pages/demo/<tag>/` and regenerates the root index (`scripts/gen-pages-index.mjs`). See [§ The published demo](#the-published-demo) | `ENABLE_RELEASE_DEMO` (ON) · `ENABLE_VERSION_COMPARISON` (ON) · `PAGES_ACTIONS_ENABLED` | **REMOVED by bootstrap** |

> **How it is triggered.** Not by a `release` event: release-please publishes the
> release with the default `GITHUB_TOKEN`, and GitHub suppresses workflow triggers
> raised by that token, so a release trigger would never fire and the demo would
> keep serving the previous release. `release-please.yml` calls this workflow
> directly in the run that created the release; `workflow_dispatch` re-renders a
> given tag by hand.

Also removed by the bootstrap: `release-please-config.json`,
`.release-please-manifest.json` and the template `CHANGELOG.md`. The bootstrap
script and its recipe are **not** removed — a module's docs link to both. The
authoritative list is the `REMOVE=` line in `scripts/first-run-bootstrap.sh`,
which the dry run prints; see
[first-run-setup.md](recipes/first-run-setup.md).

> **Why these go:** they version, announce and showcase *the template*. A module
> must not carry SemVer automation that fights its own CalVer release process,
> and its Pages surface is the gated formal-publication output, not a demo.

## Layer 2 — what a created MODULE inherits and runs

Everything below **propagates** to a module (the bootstrap keeps it). This is how
*your* module builds, validates and releases.

| Workflow | Trigger | What it does | Output | Toggle (default) | Human-gated? |
| --- | --- | --- | --- | --- | --- |
| `ig-publisher.yml` | push to any branch except `main`/`gh-pages`/`fsh-generated`; `workflow_dispatch` | Builds the IG (SUSHI + IG Publisher) and deploys a preview. **On this template repo only**, the self-check build also demonstrates a version comparison at `comparison-demo/` in the preview, rendered with the FHIR validator's `-compare` (the publisher's own `version-comparison` needs a formal publication history at the canonical, which the scaffold never has): the last dev preview's package is relabelled `2027.0.0-draft.0` and compared to the build — on `dev` a self-comparison (what a no-changes report looks like), on a feature branch the real delta against `dev`. A created module enables `version-comparison` from its second formal publication. **On this template repo only**, every preview deploy also regenerates the `gh-pages` root index (`scripts/gen-pages-index.mjs`) | `gh-pages/branches/<branch>/` + PR comment | `ENABLE_PREVIEW` (ON) · `ENABLE_VERSION_COMPARISON` (ON; `false` disables the whole feature — the publisher's `version-comparison` in every build workflow, including `release-demo.yml`, *and* the template repo's demo report) | no |
| `cleanup-gh-pages.yml` | schedule (Sun 00:00 UTC); `workflow_dispatch` (input `dry_run`: list stale previews without deleting) | Prunes previews of deleted branches; keeps root + version paths | pruned `gh-pages` | `ENABLE_PREVIEW` (ON) | no |
| `validation.yml` | push to `dev`/`main`; any pull request; `workflow_dispatch` | Runs the **MII reusable validation** workflows | validation report | `ENABLE_VALIDATION` (ON) | no (skips on the template repo itself) |
| `convention-check.yml` | push/PR to `dev`/`main`/`release/**`; `workflow_dispatch` (input `strict`: force release mode) | The **single** convention checker: metadata-contract patterns (hard on release branches) + the optional-page decision gate (M9, `docs/optional-pages.md`) + the language-model guard (`scripts/language-model-check.sh`) + the offline test suites (`scripts/*.test.mjs`, and on the template repo `scripts/*.template-test.mjs`); the advisory repo ↔ MII-wiki drift review is a manual review, not part of this workflow | check result | `ENABLE_CONVENTION_CHECK` (ON) | no |
| `module-release.yml` | push of a CalVer tag `vYYYY.n.n`; `release: published` (the announcement); `workflow_dispatch` (dry run) | Builds, creates the GitHub Release, announces to the MII Zulip (topic *Releases*), hands off to `go-publish` | release | `ENABLE_MODULE_RELEASE` (ON) · `ENABLE_ZULIP_ANNOUNCE` (ON) | production publish is gated |
| `go-publish.yml` | `workflow_dispatch` **only** | Production `-go-publish`; `publish:false` = full dry run by default | published IG | — | **always human-triggered** |
| `dependency-check.yml` | schedule (Mon 06:00 UTC); `workflow_dispatch` | Version drift (IG Publisher, SUSHI, Jekyll, both templates, FHIR deps) → one tracking issue | `dependencies` issue | `ENABLE_DEPENDENCY_CHECK` (ON) | proposals only |
| `security-scan.yml` | schedule (Mon 07:00 UTC); PR to `dev`; `workflow_dispatch` | OSV + Trivy (fs + dev-container image) | SARIF in Security tab | `ENABLE_SECURITY_SCAN` (ON) | no |
| `sync-ig-template.yml` | schedule (Mon 05:00 UTC); `workflow_dispatch`; PR to `dev` (check only) | Keeps the vendored `ig-template/` (the offline/reproducibility fallback behind the URL default in `ig.ini`) in step with `ig-template-mii-kds@dev`; opens a PR on drift, fails a PR whose mirror is stale | sync PR | `ENABLE_TEMPLATE_SYNC` (ON) | never auto-merges |

Notes:
- **The reusable validation needs two files in the repo root**, at fixed paths the
  MII workflows read: `qc/custom.rules.yaml` (the Simplifier quality-control rule
  set — MII naming conventions) and `advisor.json` (the errors the HL7 Java
  validator may ignore). Both ship with the template; `qc/custom.rules.yaml`
  carries `{{MODULE_SLUG}}`/`{{MODULE_NAME}}`/`{{CALVER_VERSION}}` placeholders
  like the rest of the scaffold. The .NET job is configured upstream to always
  pass, so a naming violation appears in its log, not as a red check.
- **Terminology** is auto-selected, not a toggle: builds use **SU-TermServ** when the
  client-cert secrets are present, else fall back to HL7 `tx.fhir.org` with a notice.
- **Pages mode** (`vars.PAGES_ACTIONS_ENABLED`) chooses the gh-pages push vs the
  Actions deploy path; either serves the previews. Set it to match Settings →
  Pages ("Deploy from a branch → `gh-pages`" ⇒ leave it unset; "GitHub Actions"
  ⇒ set it to `true`); a mismatch is what makes a preview URL 404. Only
  `go-publish.yml` with `publish: true` *requires* the value `true` — it hard-fails
  without it.
- **Dependabot** is switched by its config presence, not an `if:`.
- **The vendored-template sync** needs the `IG_TEMPLATE_REPO_URL` variable while
  the template repos have not moved (see
  [recipes/first-run-setup.md](recipes/first-run-setup.md) step 5). If the
  source is unreachable the job skips with a notice instead of failing.
- On **this template repo**, some jobs intentionally skip or substitute demo
  placeholder values (the repo ships `{{…}}` values); in a real module they run for
  real. The workflow header comments say which.

### The toggle summary

The full inventory — every repository variable the workflows read, in both
layers. All of them default correctly when unset; [secrets.md](secrets.md)
covers the *secrets* that enable the gated features.

| Pipeline | Variable | Default |
| --- | --- | --- |
| IG build + preview | `ENABLE_PREVIEW` | ON |
| Preview deploy path | `PAGES_ACTIONS_ENABLED` | unset (gh-pages push mode) |
| Reusable validation | `ENABLE_VALIDATION` | ON |
| Convention check | `ENABLE_CONVENTION_CHECK` | ON |
| Dependency check | `ENABLE_DEPENDENCY_CHECK` | ON |
| Security scan | `ENABLE_SECURITY_SCAN` | ON |
| Vendored template sync | `ENABLE_TEMPLATE_SYNC` | ON |
| Publisher version comparison | `ENABLE_VERSION_COMPARISON` | ON (no-op while `version-comparison` is commented out) |
| Module release (CalVer) | `ENABLE_MODULE_RELEASE` | ON |
| Release Please (template only) | `ENABLE_RELEASE_PLEASE` | ON |
| Released Pages demo (template only) | `ENABLE_RELEASE_DEMO` | ON |
| MII Zulip announcement | `ENABLE_ZULIP_ANNOUNCE` | ON |
| MII Zulip sender (template only) | `MII_ZULIP_BOT_EMAIL` | `kds-github-bot@mii.zulipchat.com` |
| Public FHIR Zulip announcement (template only) | `ANNOUNCE_PUBLIC_ZULIP` | OFF |
| Public FHIR Zulip sender (template only) | `FHIR_ZULIP_BOT_EMAIL` | unset |
| Production `-go-publish` | manual `workflow_dispatch` + `publish:false` | OFF (gated) |

The rows marked **template only** have no effect in a module: the bootstrap
deletes `release-please.yml`, `notify-zulip.yml` and `release-demo.yml`, so a
module's announcement is governed by `ZULIP_API_KEY` and `ENABLE_ZULIP_ANNOUNCE`
alone.
`IG_TEMPLATE_REPO_URL`, `SUSHI_VERSION` and `JAVA_VALIDATOR_VERSION` are plain
variables, not toggles — the last two override the versions `validation.yml`
passes to the MII reusable workflows, and unset means the pinned defaults there
(see [maintenance.md](maintenance.md#where-each-pin-lives-single-source-of-truth)).

---

## Release — the two schemes, never mixed

- **This template repo:** **SemVer** via Release Please on `main` (Layer 1).
- **A module:** **CalVer** `YYYY.n.n` via the MII Module Release Workflow —
  see [release.md](release.md) and [recipes/cut-a-release.md](recipes/cut-a-release.md).
  A module has **no Release Please** after the bootstrap.

---

## The published demo

**Layer 1 only** — a module does not have one; skip this section if you are
reading as a module author.

The [Pages root index](https://medizininformatik-initiative.github.io/mii-kds-module-template/)
advertises one rendering as *what a module built from this template renders as,
out of the box*, for the current template release. **It tracks the latest
release automatically** via `release-demo.yml`; there is no manual promotion
step and there must not be one again.

### What the automation guarantees

| | |
| --- | --- |
| **Built from the tag** | The job checks the released tag out into `release-src/` and builds only that. The workspace root stays on the workflow's own ref, so the publishing tooling (`scripts/gen-pages-index.mjs`, `scripts/self-check-substitute.sh`) is current even when re-rendering an old tag. |
| **The render names its release** | The demo's `{{CALVER_VERSION}}` is substituted by `scripts/self-check-substitute.sh` with `SELF_CHECK_RELEASE_TAG` set, producing `2027.0.0-template.<tag without v>`. After the build the generated `ImplementationGuide` is read back and the job **fails** unless it carries exactly that value. |
| **The links follow** | `gh-pages/index.html` is regenerated in the same commit as the demo it points at, so path, rendered content and link move together or not at all. |
| **Same toolchain as every other build** | The pins are copied under the same names as `ig-publisher.yml` / `go-publish.yml` / `module-release.yml`, and `scripts/toolchain-pins.test.mjs` fails the build if they drift apart. |

> **Why this exists.** The demo used to be copied by hand out of a
> feature-branch preview built *before* Release Please bumped the version — the
> path claimed one release, the content another
> (`demo/v0.5.2/en/index.html` rendering `… Module Template v2026.0.0`), and the
> QA report inside was the pre-release one.

### Why the demo version looks like that

The demo's version has to satisfy two things at once: it must keep the MII
**CalVer `YYYY.n.n`** shape this scaffold teaches a module author, and it must
name the template release it was rendered from. `2027.0.0-template.0.5.2` does
both — a valid SemVer pre-release, so nothing downstream chokes on it, whose
suffix is the tag. It is derived in exactly one place
(`scripts/self-check-substitute.sh`), which also reports the value it wrote so
`release-demo.yml` asserts against the source of truth instead of re-deriving
the formula.

The *preview* builds keep the fixed draft `2027.0.0-draft.1`: a branch preview
is not a release and must not claim one.

### How the root index is produced

`index.html` on `gh-pages` is **generated**, never hand-edited (decision
2026-08-28 — it replaced a hand-authored landing page that
`scripts/update-demo-links.mjs`, now retired, conservatively repointed at each
release). `scripts/gen-pages-index.mjs` writes a plain, autoindex-style page
that enumerates exactly two surfaces, and only when they exist in the
`gh-pages` checkout at generation time:

- `branches/dev/` — the development preview, and
- `demo/<latest-tag>/` — the latest release demo (the released state of
  `main`; `main` deliberately has no branch preview). "Latest" is the highest
  SemVer among the `demo/v*` directories (numeric — `v0.10.0` beats `v0.9.9`).
  If that demo has no root `index.html`, its real entry points (`en/`, `de/`,
  `qa.html`) are listed as sub-links instead.

Nothing else is listed: older demos and other branch previews stay deployed
and reachable by URL, deliberately unlisted (the page says so in an HTML
comment, next to its do-not-edit marker). `release-demo.yml` regenerates the
index after publishing a demo, and `ig-publisher.yml` regenerates it after
every branch-preview deploy (template repository only), so it heals itself.
Dry-run it against any checkout of the `gh-pages` branch:

```bash
git worktree add /tmp/gh-pages gh-pages
node scripts/gen-pages-index.mjs /tmp/gh-pages \
  medizininformatik-initiative/mii-kds-module-template
git -C /tmp/gh-pages diff   # inspect, then discard: git worktree remove --force /tmp/gh-pages
```

### Retention and the reserved paths

Previous `demo/<tag>/` directories are **never pruned** — they are permanent,
externally linkable renderings, and removing one would break links this project
does not control. `cleanup-gh-pages.yml` cannot sweep them either: it removes
only directories carrying a `.branch-name` marker, and `release-demo.yml`
deliberately writes none (a guard fails the job if one appears). Only the
root index's *current* links move; superseded demos stay reachable at their
stable URLs. The job prints the accumulated `demo/` size and warns above the
1 GB Pages limit — retiring a demo means updating every link to it in the same
change.

The site **root** and every version-like path stay reserved for the gated
`-go-publish` output, as always; `demo/` is not one of them, and this workflow
writes nowhere else.

### Re-rendering a release by hand

Dispatch `release-demo.yml` with the `tag` input — after a toolchain bump, or to
publish the demo for a tag released before the workflow existed. Set
`update_landing_page: false` to publish `demo/<tag>/` without regenerating the
root index. A **pre-release** is skipped on the `release: published`
trigger; dispatch it manually if you want one rendered.

## Secrets & enabling the gated features

A module builds and previews without secrets. To enable the optional gated
features — SU-TermServ terminology (for both the build and the reusable
validation) and the Zulip release announcement — see
[docs/secrets.md](secrets.md) for the exact `gh secret set` commands (including
why one secret name suffices: `validation.yml` maps `SU_TERMSERV_CLIENT_*` onto
the reusable workflow's `CDS_DEV_CLIENT_*` inputs at the call site). The
workflows are already wired.
