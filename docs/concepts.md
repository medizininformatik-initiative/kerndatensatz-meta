# Concepts — how this module template works and why

Read this after the [Glossary](glossary.md). It explains the ideas behind this
repository.

## 1. What this repository is

This is a **GitHub template repository**: click **"Use this template"** and you get
a fresh copy that is a ready-to-run MII KDS **module IG** project. You then replace
the `{{…}}` placeholders with your module's details, and you have a buildable,
MII-branded FHIR Implementation Guide.

> **Why a template repository, not a library:** an IG project is *your* code — you
> edit its profiles and pages. A template gives you a correct, complete starting
> point (CI, release automation, docs, an example profile) that you then own,
> instead of assembling it from scratch.

## 2. How it references the MII template — URL now, published package later

The **look** of the IG comes from a separate template package,
[`de.medizininformatikinitiative.template`](https://github.com/medizininformatik-initiative/ig-template-mii-kds)
This scaffold references it in `ig.ini`, in one of three forms (decision
2026-08-28):

- **Interim URL (the default today):**
  `template = https://github.com/medizininformatik-initiative/ig-template-mii-kds`.
  The IG Publisher fetches the repository zip at build time — the default
  branch, i.e. the released state on `main`. Nothing vendored can go stale;
  the trade is that a build needs network access and follows `main` rather
  than a pinned version.
- **Vendored (offline / reproducibility fallback):** a copy lives in
  `ig-template/`, referenced as `template = #ig-template`, kept in sync from
  the companion repository's `dev` branch by the `sync-ig-template` workflow.
  Use it when a build must run offline or byte-stable against a committed copy.
- **Published (the endgame):** `template = de.medizininformatikinitiative.template#<version>`
  — a pinned `id#version` resolves through the FHIR package server only, so
  this waits on the publication decision ([#1](../../../issues/1),
  [#2](../../../issues/2)). Switch with
  [recipes/switch-template-to-published.md](recipes/switch-template-to-published.md);
  the vendored folder and the sync machinery dissolve then.

> **Why the URL now:** the package has no registry entry yet, and a vendored
> copy that builds never exercise goes stale invisibly. The URL keeps every
> build on the template's released state; the published pin later restores
> byte-stable rebuilds.

## 3. The metadata contract (CRMI)

`sushi-config.yaml` is not just config — it is a **contract**. It claims the CRMI
ImplementationGuide profiles and carries the same `artifact-*` extensions as the
reference module kerndatensatz-basis, so the module is a properly described,
versioned, shareable publication unit. The `convention-check` job enforces the
naming patterns (packageId, id, name, title, canonical, CalVer version). Fill
every `{{PLACEHOLDER}}`; the comments in the file tell you what each one means.

## 4. Two layers you must not confuse

The single most important idea for a maintainer: **this template repository
releases itself with SemVer; a module you create releases itself with CalVer and
carries no Release Please at all.** [workflows.md](workflows.md) sets the two
layers side by side; the [first-run bootstrap](recipes/first-run-setup.md) is
what enforces the separation.

> **Why one mechanism per repo:** SemVer tags fighting CalVer tags corrupt the
> version history.

## 5. What propagates to a module, and what does not

The bootstrap **keeps** everything a module needs to live and **removes** only
the files that maintain *this template repo itself*. The authoritative list is
the `REMOVE=` line in `scripts/first-run-bootstrap.sh`, which the dry run
prints; the first-run tooling itself stays, so the recipe a module links to
still resolves — see [first-run-setup.md](recipes/first-run-setup.md).

> **Why previews propagate but Release Please does not:** a branch preview is a
> per-repo development aid every module wants; Release Please is a versioning
> authority that would conflict with the module's CalVer process. Different purpose,
> different fate.

The **page set and the menu** propagate too, and they stay the module's to edit —
the IG template supplies presentation only. The mandatory (1..1) entries follow
the MII-agreed menu structure; the optional (0..1) entries are decided per
module ([optional-pages.md](optional-pages.md)). See
[page-structure.md](page-structure.md) for that boundary and why it was drawn
there.

## 6. Registries, publication and governance

A finished module is published as a FHIR package and a website (GitHub Pages under
the creating org; the canonical stays the MII URL). Production publication runs
through the **gated** `-go-publish` — never automatically. The naming, terminology
policy and release process are defined in the
[MII meta wiki](https://github.com/medizininformatik-initiative/kerndatensatz-meta/wiki);
when it and this repo disagree, the wiki wins. See [further-reading.md](further-reading.md).
