# Concepts — how this module is built and why

Read this after the [Glossary](glossary.md). It explains the ideas behind this
repository.

## 1. What this repository is

The MII Kerndatensatz module **Meta**: a FHIR Implementation Guide project
(FSH sources, narrative pages, SUSHI + IG Publisher build, CI and release
automation). It was migrated from Simplifier/Forge onto the MII KDS module
template (`mii-kds-module-template`), which is where the CI, release automation
and most of these docs come from. The repository now owns all of it.

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
- **Vendored (offline / reproducibility fallback):** not used in this
  repository. A local copy referenced as `template = #ig-template` would work
  for an offline or byte-stable build, but it is not committed here.
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

## 4. One release mechanism

The module releases with **CalVer** (`YYYY.n.n`) via the MII Module Release
Workflow (`module-release.yml` + the human-gated `go-publish.yml`) and never with
Release Please / SemVer — that belongs to the template tooling repositories only.

> **Why one mechanism per repo:** SemVer tags fighting CalVer tags corrupt the
> version history.

## 5. Page set and menu

The **page set and the menu** are the module's to edit —
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
