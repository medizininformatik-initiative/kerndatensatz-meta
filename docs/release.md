# Releasing a module (MII CalVer — the reference)

This page is the **reference** for how a module built from this template is
released. It maps the automation in
[`.github/workflows/module-release.yml`](../.github/workflows/module-release.yml)
one-to-one onto the MII
**[Module Release Workflow](https://github.com/medizininformatik-initiative/kerndatensatz-meta/wiki/Module-Release-Workflow)**
(the authoritative wiki page), and says plainly which steps are **automated** and
which are **human-gated**.

> **Who is this for:** a maintainer who has already created a module from this
> template and wants to cut a version. New to the module itself? Start with the
> README and `docs/recipes/create-a-new-module.md` first.

> The click-by-click walkthrough lives in the companion recipe
> `docs/recipes/cut-a-release.md`. Read this page once to understand the model;
> follow the recipe each time you release.

---

## The one hard rule: CalVer here, SemVer there — never mix

- **Modules** (this repo, and every repo created from this template) are
  released **only** with **CalVer `YYYY.n.n`** via the **MII Module Release
  Workflow** — the tag-driven, human-gated automation described below. **Never
  Release Please.**
- **The two template repos** (`ig-template-mii-kds` and `mii-kds-module-template`
  itself) release **themselves** with **SemVer** via **Release Please**. That is
  *tooling* versioning, and it lives only on those template repos.

> **Why the hard boundary:** two release systems on one repo corrupt the version
> history — a module carrying Release Please would auto-cut SemVer tags that
> fight the MII CalVer process. One repo, one release mechanism. That is why the
> **first-run bootstrap removes** all five template-only files from a new
> module — Release Please (`release-please.yml`, `release-please-config.json`,
> `.release-please-manifest.json`), `notify-zulip.yml` and the template
> `CHANGELOG.md` — but **keeps** `module-release.yml`, `go-publish.yml`, and the
> preview workflow. See `docs/recipes/first-run-setup.md`.

### CalVer format

`YYYY.n.n` — for example `2027.0.0`, then `2027.0.1` for a patch in the same
sequence, then `2027.0.0` for the next annual sequence. A pre-release adds a
suffix: `2027.0.0-rc.1`, `2027.0.0-draft.1` (valid SemVer prerelease
identifiers; the module-release workflow marks any tag containing `-` as a
prerelease, and the preview build labels itself `2027.0.0-draft.1` this way).

- **Tag** = the version prefixed with `v`: `v2026.0.1` (the basis precedent —
  `kerndatensatz-basis` tags `v2026.0.0` / `v2026.0.1` on `main`).
- The release automation triggers on the tag glob `v[0-9]+.[0-9]+.[0-9]+*`
  (exactly the pattern `kerndatensatz-basis` uses).

---

## What is automated vs. human-gated (at a glance)

| Release step | Who | Where |
| --- | --- | --- |
| Prepare the release branch, bump the version, open the PR, merge | **Human** | your machine + GitHub |
| Reusable FHIR validation on the release PR (error gate) | Automated | `validation.yml` |
| Push the CalVer tag | **Human** | `git push origin v2026.0.1` |
| Build the IG from the tagged commit (buildability gate) | Automated | `module-release.yml` → `build` |
| Create the **draft** GitHub Release with generated notes | Automated | `module-release.yml` → `release` |
| Edit notes, attach the package, **publish** the draft | **Human** | GitHub Releases |
| Announce the published release on the MII Zulip (topic `Releases`) | Automated | `module-release.yml` → `notify_zulip` |
| Formal FHIR publication (`-go-publish`) — dry run, then real | **Human** | `go-publish.yml` (manual) |

> **Why a *draft* release, not a published one:** the automation cuts a draft so
> a human always reviews the notes and attaches the package before anything goes
> public. Publishing is the deliberate human act that fires the announcement.

> **Why the build gate:** a tag that does not build never becomes a release, and
> the build captures `package.tgz` as a workflow artifact. QA *counts* are
> reported but not required to be zero — the intended error gate is the
> reusable validation workflow, which runs on every PR. **Known gap:** its
> Java job reads a repo-root `package.json` this scaffold does not ship, so on
> a created module that job currently fails until the `package.json` decision
> in [issue #141](../../../issues/141) is made; the .NET QC job is unaffected.

---

## Step by step, mapped to the MII Module Release Workflow

The headings below match the wiki's numbered steps. This template is
**IG-Publisher-native** (it builds with SUSHI + the HL7 IG Publisher, not the
Simplifier bake pipeline), so the Simplifier-specific wiki sub-steps are replaced
by the IG-Publisher / `go-publish.yml` path — noted inline where they differ.

### 1. Create the release branch — *human*

```bash
git checkout dev
git pull origin dev
git checkout -b release/v2026.0.1   # release/** arms the strict convention check
```

> **Why off `dev`, not `main`:** this template uses the `dev` → `main` branching
> model (see `CONTRIBUTING.md`). Release preparation happens on a short-lived
> branch off `dev`; the release itself is the `dev` → `main` promotion. (The wiki
> branches off `main` because the reference modules use a single-branch model —
> the branch names differ, the intent is identical.)

### 2. Update the version — *human*

> **From the second formal publication on: enable the version comparison.**
> Set `version-comparison: "<previous released version>"` in
> `sushi-config.yaml` (the commented block explains the two prerequisites —
> the canonical must serve `package-list.json`, which the first formal
> publication provides, and the previous package must be loadable, which
> `scripts/seed-comparison-cache.sh` covers from the GitHub Release assets).
> The build then publishes a machine-generated delta at
> `comparison-v<previous>/index.html` and annotates changed elements on the
> artifact pages — link that report from the version's changelog section,
> next to the prose explanation of any breaking change. Until the first
> formal publication the comparator has no version history to read; this
> template repo demonstrates the report anyway with the validator's compare
> command on its preview (`comparison-demo/` — see `docs/workflows.md`).

> **First release of a module: delete the scaffold's demonstration page
> first.** The convention check hard-fails a `release/**` branch while it is
> present (M8) and its message lists every file to remove; the same list is in
> [render existing artifacts](recipes/render-existing-artifacts.md) step 4.
> The same gate covers the **optional (0..1) pages**: any page still carrying
> its `OPTIONAL-PAGE` banner fails the release check (M9) until you keep or
> remove it per [optional-pages.md](optional-pages.md) — and the **scaffold's
> illustrative examples** (M11): the highlighted *Person* example in the
> module-specific section of `security-and-privacy.md` must be deleted (both
> languages) before the first release; write your module's own aspects there
> or adopt the section's documented default text.

Bump the CalVer version everywhere it appears **in this template**. The wiki's
file list names Simplifier's `package.json` and `guide.yaml`, which are not
present here; the surface in this scaffold is:

- **`sushi-config.yaml`**
  - `version:` — the module version (e.g. `version: "2026.0.1"`).
  - the `package-source` extension's `version` sub-extension (`valueString`) —
    keep it equal to `version`.
  - the sequence `start:` year — the `YYYY` part (e.g. `2026`).
  - `date:` — the ISO publication date (`YYYY-MM-DD`). `go-publish.yml`
    hard-fails when it does not equal the publication date (its
    *Validate release input and publication request* step).
  - the `resource-approvalDate` extension's `valueDate` — the date *this*
    release was approved by whoever governs your module (for a KDS module, its
    responsible MII body). If no formal approval step applies, use the date you
    decided to release and say so in `input/pagecontent/metadata.md` (and its
    German mirror): the extension records an approval date, it does not create
    an approval process.
- **`publication-request.json`**
  - `version` — the CalVer version.
  - `path` — ends in the version (`.../<version>`); update it too.
  - `sequence` — the `YYYY` sequence year.
  - `desc` — a one-line human description of *this* release.
  - `first` — set to `true` only for a module's very first release; set it to
    `false` for every release after that.
- **`input/fsh/rulesets/`** — the three files that stamp the version onto every
  conformance resource, so an unbumped ruleset ships artifacts pointing at the
  previous release:
  - `version.fsh` — `version` / `^version` and the package-source version.
  - `meta-profile.fsh` — `meta.profile[+] = "<canonical>|<version>"`.
  - `cps-rules.fsh` — `supportedProfile[+] = "<profile>|<version>"`.
  See [`input/fsh/rulesets/README.md`](../input/fsh/rulesets/README.md) for the
  placeholder-to-file table.
- **Approval-date call sites** — every `insert CRMIApprovalDate(<date>)` in
  `input/fsh/` (e.g. `input/fsh/profiles/example-patient.fsh`). `crmi.fsh`
  takes the date at the call site, so bumping the ruleset is not enough.
- **The narrative pages** — `index.md`, `changes.md`, `metadata.md` and
  `version-history.md`, and their German mirrors under
  `input/translations/de/pagecontent/`, print the version in prose.

> **Why keep the three `sushi-config.yaml` spots in sync:** the metadata
> contract asserts only that `version:` itself is CalVer (M6 in
> `scripts/convention-check.mjs`). **Nothing compares the embedded copies** —
> the `package-source` version, the sequence year and the ruleset literals are
> re-read by hand, or extend `scripts/convention-check.mjs` to assert them
> against `sushi-config.yaml`.

> **Terminology & release notes:** author the module's changelog in the IG's
> release-notes page (`input/pagecontent/…`). Terminology is selected
> automatically by the build (SU-TermServ when the client certificate secret is
> present, else the public HL7 fallback `https://tx.fhir.org`) — see
> [`docs/maintenance.md`](./maintenance.md) and the workflow header.

### 3–4. Open the release PR and pass validation — *human + automated*

```bash
git add -A
git commit -m "chore: prepare release v2026.0.1"
git push origin release/v2026.0.1
```

Open a PR from `release/v2026.0.1` into `dev` (then promote `dev` → `main` per
`CONTRIBUTING.md`). The **reusable FHIR validation workflow** (`validation.yml`) runs on the
PR and is the authoritative error gate (the wiki's `DOTNET_FHIR_VALIDATION` /
`JAVA_FHIR_VALIDATION`). Wait for it to pass before merging.

> **Why validate before tagging:** the tag is the point of no return — it drives
> release creation. Catch FHIR errors on the PR, not after the tag is public.

### 5. Merge, then tag — *human triggers, automation reacts*

After the release reaches `main`:

```bash
git checkout main
git pull origin main
git tag v2026.0.1
git push origin v2026.0.1
```

Pushing the tag triggers **`module-release.yml`** (automated):

- the **`build`** job builds the IG (pinned SUSHI + IG Publisher, terminology
  auto-selected) and uploads `package.tgz` + the QA report as the
  `module-release-build` artifact;
- the **`release`** job then creates a **draft** GitHub Release named for the tag,
  with GitHub's auto-generated notes plus a body template to fill in.

> **On the un-instantiated template repo this workflow does nothing:** a `guard`
> job detects unreplaced `{{…}}` placeholders and every downstream job skips with
> a `::notice`. Only a real, bootstrapped module runs it for real. This also
> keeps a template-repo SemVer tag from ever driving the module path.

### 6. Package publishing — *does not apply*

The wiki's Simplifier "bake pipeline" step has no counterpart here: the
authoritative FHIR package is produced by the IG Publisher and published via the
gated **`go-publish.yml`** in step 8.

### 7. Finalize and publish the GitHub Release — *human*

1. Open the **draft** release the automation created.
2. Edit the notes; remove the `<!-- DELETE START/END -->` blocks.
3. Attach the module's `package.tgz` (from the `module-release-build` artifact
   the `build` job uploaded).
4. Change the release from **draft** to **published**.

Publishing fires the **`notify_zulip`** job (automated): it posts to the MII
Zulip organisation, stream `MII-Kerndatensatz`, **topic `Releases`**.

> **Why topic `Releases` (not `Template Releases`):** `Releases` is the **module**
> topic; the *template repos* announce their SemVer tooling releases under
> `Template Releases`. Keeping the two topics apart keeps the CalVer/SemVer split
> legible in chat too.

> **The announcement key:** `notify_zulip` maps `secrets.ZULIP_API_KEY`
> to an env var; when the key is absent the job **skips with a `::notice`, it
> never fails the release**. A human adds the key once (MII bot
> `kds-github-bot@mii.zulipchat.com`).

### 8. Formal FHIR publication — *human*

The release is now visible on GitHub, but the IG is **not yet formally
published**. Do that through the gated
[`.github/workflows/go-publish.yml`](../.github/workflows/go-publish.yml):

1. Actions → **"Publish release with IG Publisher"** → **Run workflow**.
2. First run: `release_ref = v2026.0.1`, **`publish = false`** — this is a
   **complete dry run** (build + stage + validate, nothing written anywhere).
3. Review the dry-run output and the exported `ig-registry.patch`.
4. Only after review, run it again with **`publish = true`** to commit `gh-pages`
   and deploy — the FHIR IG Registry change is exported as a patch for a
   **human-submitted** upstream PR; it is never pushed automatically.

> **Why go-publish stays fully manual:** formal publication is
> irreversible in practice and touches the public FHIR ecosystem. `module-release.yml`
> only *points at* go-publish (in the release notes and the job summary) — it
> never dispatches it. The maintainer owns the decision to publish, every time.

### Post-release checklist (from the wiki)

- [ ] Verify the release is visible on GitHub.
- [ ] Run `go-publish` (dry run → publish) and submit the IG-registry PR.
- [ ] Announce to any other relevant stakeholders.
- [ ] Update the MII
      [CDS Modules version overview](https://github.com/medizininformatik-initiative/kerndatensatz-meta/wiki/%C3%9Cbersicht-%C3%BCber-Versionen-der-Kerndatensatz%E2%80%90Module).

---

## Toggles

The release automation honours two repo-variable switches (unset = the default
shown; set the variable to flip it):

| Variable | Default | Effect |
| --- | --- | --- |
| `ENABLE_MODULE_RELEASE` | ON | gates the `build` + `release` jobs; set to `false` to disable the automated release path |
| `ENABLE_ZULIP_ANNOUNCE` | ON | gates the `notify_zulip` job; set to `false` to disable the MII announcement |

> **Toggles never override the gates:** even with everything enabled, `go-publish`
> stays manual and its `publish` input defaults to `false`. The full
> workflow inventory and every toggle is listed in `docs/workflows.md`.

---

## See also

- The workflow itself:
  [`.github/workflows/module-release.yml`](../.github/workflows/module-release.yml)
  (header comment documents purpose, triggers, toggles, and the gates).
- The gated publication workflow:
  [`.github/workflows/go-publish.yml`](../.github/workflows/go-publish.yml).
- The click-by-click recipe: `docs/recipes/cut-a-release.md` (companion to this
  reference).
- Dependency & vulnerability cadence: [`docs/maintenance.md`](./maintenance.md).
- The authoritative source: the MII
  [Module Release Workflow](https://github.com/medizininformatik-initiative/kerndatensatz-meta/wiki/Module-Release-Workflow)
  wiki page — MII conventions win; if this page and the wiki ever conflict,
  follow the wiki and flag it.
