# Recipe: first-run setup of a new module

**Goal.** Turn a fresh copy of this template (made with **"Use this template"**)
into a working module repository: get the `dev` branch and branch protection in
place, and remove the template's own release automation, which must not live in a module.

**Who this is for.** Anyone who just created a new module repo from
`mii-kds-module-template` and has never done this before. No prior FHIR tooling
knowledge required.

**Prerequisites.**

- You created a new repository via **"Use this template"** (not a fork).
- You can run [`git`](https://git-scm.com/) and the
  [GitHub CLI `gh`](https://cli.github.com/) locally, and `gh auth login` is
  done. `gh` needs **admin** on the new repo to set branch protection (you have
  it if you created the repo).
- The repo's **dev container** ships the *build* toolchain (Node, SUSHI,
  Ruby/Jekyll, Graphviz) but adds no GitHub CLI feature, so `gh` is not
  available there — run this bootstrap on your host, then use the container for
  building; see
  [`first-build-in-devcontainer.md`](first-build-in-devcontainer.md).

---

## The one decision up front: how you get the `dev` branch

GitHub's **"Use this template"** copies **only the default branch (`main`)**
unless you tell it otherwise. This template is built around a two-branch model —
`main` (stable) and `dev` (integration) — so your module needs `dev`.

You have two ways to get it. **Pick one.**

### Option A — tick "Include all branches" when you create the repo (simplest)

> This copies **every** branch the template repo had at that moment — `dev`,
> which you want, and possibly short-lived working branches. Delete any copy
> that is not `dev` or `main` afterwards (Settings → Branches, or
> `git push origin --delete <branch>`).

On the **"Create a new repository"** page (the one you land on after clicking
"Use this template"), tick the checkbox **"Include all branches"** before
clicking **"Create repository from template"**.

> **Why this is the easy path:** it copies `dev` (and any other branches) along
> with `main`, so you skip creating `dev` by hand. You still run the bootstrap
> below to apply branch protection and remove the template's own release automation —
> just skip the part that creates `dev` (the script detects it already exists).

If you already created the repo **without** ticking it, use Option B.

### Option B — run the first-run bootstrap

The bootstrap creates `dev` from `main` for you, protects both branches, and
removes the template's own release automation. Do this once, right after creating the
repo.

> **What it does NOT remove:** everything the documentation points at stays —
> this recipe, the bootstrap script itself, and every helper in `scripts/`. The
> rule is to remove only what would actively conflict with a module (two release
> systems on one repository), so every reference in your new module still
> resolves.

> **Why you must not skip this:** without `dev`, a newcomer pushes straight to
> `main` and loses the stable/integration model on day one. And a module that
> keeps this template's Release Please files would auto-cut **SemVer** tags that
> fight the MII **CalVer** module release process — one repo, one release
> mechanism.

---

## Steps (Option B, or Option A minus branch creation)

### 1. Clone your new module locally

```bash
gh repo clone <your-org>/<your-module-repo>
cd <your-module-repo>
```

### 2. Dry-run the bootstrap (this changes nothing)

```bash
scripts/first-run-bootstrap.sh
```

Read the output. It prints, in order:

- **Step 1** — the exact `gh` commands it would run to create `dev` and protect
  both branches.
- **Step 2** — the list of files it would remove, **each with a one-line
  "why"**. On a fresh template this is:
  - `.github/workflows/release-please.yml`, `release-please-config.json`,
    `.release-please-manifest.json` — the SemVer release automation for the
    *template* repo.
  - `.github/workflows/notify-zulip.yml` — announces the *template's* SemVer
    releases (your module announces its own CalVer releases instead).
  - `.github/workflows/release-demo.yml` — renders the *template's* Pages demo
    from a SemVer tag. Your module has no such demo: its Pages surface is the
    gated formal-publication output.
  - `CHANGELOG.md` — only if present (the template's SemVer changelog).
- **Post-bootstrap checklist** — the manual steps below.

> **Why a dry-run first:** you see exactly what will change before anything
> happens. The `REMOVE=` line in `scripts/first-run-bootstrap.sh` is the single
> source of truth for that list, and the bullets above are its transcript — if
> it ever tried to touch module content, the helper scripts, or the workflows a
> module keeps (previews, validation, monitoring, the convention check, the
> module release workflow), the script hard-aborts.

### 3. Apply it

```bash
scripts/first-run-bootstrap.sh --apply
```

This creates `dev`, applies branch protection, and **stages** the file removals
with `git rm` (nothing is committed yet). Review and commit on a branch:

```bash
git status                 # see the staged removals
git checkout -b chore/first-run-bootstrap
git commit -m "chore: first-run bootstrap (remove the template's release automation)"
git push -u origin chore/first-run-bootstrap
```

**Before you push:** replace the `{{PLACEHOLDER}}` values (checklist item 1
below) in the same branch — the pull request triggers the IG build, and SUSHI
cannot compile placeholder values, so a bootstrap-only PR comes up red on the
`build` check. If you prefer to merge the bootstrap alone, expect that red
build: it turns green with the placeholder PR.

Open a pull request into `dev` and merge it.

> **Reviews on a solo project:** by default the bootstrap requires **1**
> approval on `main` and **0** on `dev`, so you can merge your own work into
> `dev`. If you are the only maintainer and want to merge into `main` without a
> second person, run `scripts/first-run-bootstrap.sh --apply --main-reviews 0`.

> **Undo a removal** before committing: `git restore --staged --worktree <path>`.

### 4. Work through the post-bootstrap checklist

The bootstrap printed it; the essentials:

1. **Replace every `{{PLACEHOLDER}}`.** Start in `sushi-config.yaml` (its header
   lists every placeholder and what it means), then `ig.ini` (the module slug in
   the `ig =` path only — **leave the `template =` line as it is**: the default
   is the template repository URL, fetched at build time, and
   `template = #ig-template` is the vendored offline fallback; both stay until
   the MII template package is published, see
   [switch-template-to-published.md](switch-template-to-published.md)), then
   `publication-request.json` and `.github/workflows/go-publish.yml`. Run
   `node scripts/convention-check.mjs` — it must stay green.
2. **Enable GitHub Pages:** Settings → Pages → Build and deployment →
   **"GitHub Actions"**. Then set the repository variable
   `PAGES_ACTIONS_ENABLED=true` — only once Pages actually uses "GitHub
   Actions", because `go-publish.yml` refuses to publish otherwise.
   *Branch mode works too:* **"Deploy from a branch" → `gh-pages`** with
   `PAGES_ACTIONS_ENABLED` left unset also serves the CI previews (that is the
   workflow default). What must not happen is a mismatch between the Pages
   setting and the variable — then nothing serves the preview. Formal
   publication requires the "GitHub Actions" pairing, so pick it if you intend
   to publish. See [workflows.md](../workflows.md).
3. **Terminology (optional):** add `SU_TERMSERV_CLIENT_CERT` /
   `SU_TERMSERV_CLIENT_KEY` / `SU_TERMSERV_CLIENT_PASSWORD` to build against
   the MII SU-TermServ; without them the build falls back to the public HL7
   server and does not fail.
4. **Release announcements (optional):** add `ZULIP_API_KEY` to announce your
   module's CalVer releases to the MII Zulip.
5. **Vendored IG template (while the template repos have not moved):** set the
   repository variable `IG_TEMPLATE_REPO_URL` to the clone URL of
   `ig-template-mii-kds`, so `sync-ig-template.yml` keeps your `ig-template/`
   mirror — the offline/reproducibility fallback behind the URL default in
   `ig.ini` — current:

   ```sh
   gh variable set IG_TEMPLATE_REPO_URL --repo <your-org>/<your-module-repo> \
     --body "https://github.com/<template-host-org>/ig-template-mii-kds.git"
   ```

   `<your-org>` is where **your module** lives; `<template-host-org>` is where
   `ig-template-mii-kds` lives (currently `medizininformatik-initiative`) —
   they are usually **not** the same.

   Without it the workflow probes the built-in target-organisation URL and, if
   that is not reachable, **skips with a notice instead of failing** — your
   first PR stays green either way. Delete the variable once the repositories
   live in the target organisation, or delete the whole workflow once `ig.ini`
   uses the published template package
   ([switch-template-to-published.md](switch-template-to-published.md)).
6. **Decide the optional (0..1) menu pages** (can wait, but not past the first
   release): the scaffold ships seven pages the MII menu structure marks
   optional, each carrying a visible banner. Keep or remove each one per
   [optional-pages.md](../optional-pages.md); the convention check lists the
   undecided ones on every run and fails a `release/**` branch while any
   remain (M9).

---

## What needs no setup: the agent skills

Your module already carries the repository-local skills in [`skills/`](../../skills/README.md)
(`wiki-consistency-check`, `docs-steward`) — "Use this template" brought them with it and an agent
can invoke them immediately. Nothing to install, no variable to set.

The IG-measuring and IG-translation skills live in the org catalog `agent-skills` and are **not**
copied into the template (see [`skills/RETIRED.md`](../../skills/RETIRED.md)). When you need one,
install it from the catalog at a pinned release:

```bash
npx skills add forschungsgruppe-digital-health/agent-skills/tree/<release> --skill fhir-ig-analysis fhir-ig-translation --copy
```

---

## Expected result

- `main` and `dev` both exist and are protected (Settings → Branches shows the
  rules).
- The Release Please files (`release-please.yml`, `release-please-config.json`,
  `.release-please-manifest.json`), `notify-zulip.yml`, `release-demo.yml` and
  the template `CHANGELOG.md` are gone; this recipe, `scripts/first-run-bootstrap.sh` and
  the preview, validation, monitoring, convention-check and module-release
  workflows are still there.
- `node scripts/convention-check.mjs` runs green (placeholders count as
  "parameterized" until you resolve them).

## Common errors & fixes

| Symptom | Cause | Fix |
| --- | --- | --- |
| `ERROR: 'gh' not found` | GitHub CLI not installed | Install [`gh`](https://cli.github.com/) and run `gh auth login` on the machine where you run the bootstrap — the dev container does not provide it. Step 2 (the removals) still runs; only step 1 is skipped. |
| `cannot read main; … are you authenticated?` | `gh` not logged in, or run in the wrong repo | `gh auth login`; make sure you are inside the **new module** clone. |
| Branch protection call fails with 403 | Your account lacks admin on the repo | Ask an owner to grant admin, or apply protection manually in Settings → Branches. |
| Convention check fails on a `release/**` branch | A `{{PLACEHOLDER}}` is still unresolved | Resolve the reported field; a module must not release with placeholders. |
| `dev already exists — leaving it as is.` | You used Option A ("Include all branches") | Expected — the script skips creating `dev`. |
| The bootstrap PR's `build` check is red | `{{PLACEHOLDER}}` values are still in `sushi-config.yaml` — SUSHI cannot compile them | Replace the placeholders (checklist item 1), push to the same branch |
