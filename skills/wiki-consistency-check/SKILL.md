---
name: wiki-consistency-check
description: >-
  THE single convention checker for the MII KDS template repositories and the
  module IGs built from them. Checks a repository against the MII meta wiki
  (kerndatensatz-meta/wiki) — naming conventions, terminology policy, reusable
  validation workflows, dev container, release/versioning, language, folder
  structure — AND enforces the hard module-metadata contract (packageId, id,
  name, title, canonical, version scheme, no floating dependency pins).
  Report-only: it never merges anything; fixes it proposes go through a pull
  request targeting dev.
license: CC-BY-4.0
---

# wiki-consistency-check (repository ↔ MII meta wiki + metadata contract)

**This is the single convention checker for the project.** The wiki-drift
check and the module-metadata contract live in ONE checker — do not build a
second linter next to it.

> **Why one checker:** two overlapping linters drift apart and confuse a
> maintainer about which is authoritative. One check run, one source of truth,
> covering both wiki drift and the metadata contract.

This is the **same single convention checker** the project uses in the template
package repo
([`ig-template-mii-kds`](https://github.com/medizininformatik-initiative/ig-template-mii-kds)):
both repos share the same check-matrix contract (`references/check-matrix.md`,
Sections 1a module / 1b template package). This copy is **scoped to the module
scaffold** — it additionally implements the hard Section-1a assertions
mechanically and placeholder-aware via
[`../../scripts/convention-check.mjs`](../../scripts/convention-check.mjs) (which the
template package repo does not carry, having no `{{PLACEHOLDER}}` values). It is
adapted from the skill of the same name in the MII KDS sample IG
([`mii-kds-sample-ig-inoffiziell`](https://github.com/forschungsgruppe-digital-health/mii-kds-sample-ig-inoffiziell),
CC-BY-4.0).

## What runs where

- The **hard module-metadata contract** (Section 1 of
  [`references/check-matrix.md`](references/check-matrix.md)) is implemented
  mechanically by [`../../scripts/convention-check.mjs`](../../scripts/convention-check.mjs)
  and run in CI by `.github/workflows/convention-check.yml`
  (toggle `ENABLE_CONVENTION_CHECK`, ON by default). That script is
  **placeholder-aware** (see below) and hard-fails on a violation.
- The **advisory wiki-drift findings** (Section 2) are compared against the
  live wiki by an agent or a maintainer running this skill; they are reported,
  never failed.

## This repository is the module scaffold — placeholder-aware checking

This repo is a GitHub **template repository**: its `sushi-config.yaml`, `ig.ini`,
and workflows carry `{{PLACEHOLDER}}` values that a created module fills in. The
hard **module** assertions (Section 1a) therefore apply to the **modules created
from this scaffold**, and on this scaffold itself they are checked in
**parameterized mode**:

- A field whose value contains a `{{PLACEHOLDER}}` is treated as
  **"parameterized — check the surrounding pattern only"** and passes (for
  example `id: mii-ig-{{MODULE_SLUG}}` passes because it matches the expected
  parameterized shape `mii-ig-<slug>`).
- A field with a concrete value is validated against the full rule.
- On a **release branch** (`release/**`) an unresolved `{{PLACEHOLDER}}` is a
  **failure** — a module must not release with placeholders left in.

> This repo has no IG-Publisher template *package* manifest
> (`package/package.json`); the **template package** assertions (Section 1b)
> apply to `ig-template-mii-kds`, not here. The mechanical checker simply skips
> them when the file is absent.

## Two check classes

1. **Hard assertions — the module-metadata contract.** A small, fixed set of
   metadata rules (see the clearly marked section in
   [`references/check-matrix.md`](references/check-matrix.md)). A violation is
   a **failure** (in CI: non-zero exit). The matrix states per assertion
   whether it applies to **template repositories** or to **module IGs**.
2. **Advisory wiki-drift findings.** Everything compared against the current
   wiki text. Deviations are **reported, not failed** (soft-fail): the wiki can
   change at any time, so a human decides whether the repo or the expectation
   must move.

## Source of truth

[MII meta wiki](https://github.com/medizininformatik-initiative/kerndatensatz-meta/wiki)
— clone it locally for a check run:

```bash
git clone https://github.com/medizininformatik-initiative/kerndatensatz-meta.wiki.git
```

The pages to read per check area are listed in
[`references/check-matrix.md`](references/check-matrix.md). The current online
version of the wiki is always authoritative; do not check against cached or
remembered wiki content.

## Procedure

1. **Fetch the wiki.** Clone (or fetch) the wiki and read the pages named in
   the check matrix.
2. **Run the hard assertions.** Run `node scripts/convention-check.mjs`
   (add `--release` when checking a release branch). It evaluates every
   metadata assertion that applies to this repository type, placeholder-aware,
   and records pass/fail with the exact observed value.
3. **Compare the advisory areas.** For each check area, compare the repo
   artifact against the wiki statement (list in
   [`references/check-matrix.md`](references/check-matrix.md)).
4. **Report.** Output a table: area · repo state · expected (wiki/contract) ·
   `OK`/`DEVIATION`/`UNCLEAR` · recommendation. In CI, put the table into the
   job summary/log. Hard-assertion failures make the run fail; advisory
   findings do not.
5. **Never change anything on its own.** Report and propose only. Corrections
   are made by humans, or after explicit approval — and always as a pull
   request **targeting `dev`** (never `main`, never an auto-merge).

## Limits

- Wiki content changes; the current online version is always authoritative.
- The check covers structure, metadata, and conventions — not the clinical or
  domain content of profiles.
- `UNCLEAR` means the wiki statement and the repo artifact could not be
  compared mechanically; escalate to a human instead of guessing.

## References

- [`references/check-matrix.md`](references/check-matrix.md) — the concrete
  check points (repo file ↔ wiki page) and the hard module-metadata contract.
- [`../../scripts/convention-check.mjs`](../../scripts/convention-check.mjs) — the
  mechanical, placeholder-aware implementation of the Section 1 hard assertions.
