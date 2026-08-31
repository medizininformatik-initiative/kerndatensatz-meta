# Skills that left this repository

The tombstone list for `skills/`. A skill that used to live here and no longer does is recorded
below, permanently, with where it went — so that "was it renamed, was it moved, or did it just
break?" is answerable without reading Git history.

Nothing on this list was withdrawn. Each entry was **moved to the organization's skill catalog**,
[`forschungsgruppe-digital-health/agent-skills`](https://github.com/forschungsgruppe-digital-health/agent-skills),
where it has since been developed further. The catalog is the single source of truth for those
skills; this repository keeps no copies of them (see [`README.md`](README.md)).

## Tombstones

| Skill | Removed | Moved to | Catalog name | Why |
| --- | --- | --- | --- | --- |
| `ig-analyze` | 2026-08 | `agent-skills` | [`fhir-ig-analysis`](https://github.com/forschungsgruppe-digital-health/agent-skills/blob/main/skills/fhir-ig-analysis/SKILL.md) | Ported to the catalog and reworked there: the analyser now ships **inside** the skill instead of being reached by parent traversal into `scripts/`, and the measurement defects found in its first real-task run were fixed. A pinned vendored copy remained here as `skills/fhir-ig-analysis` until **2026-08-28**, when the vendored copies left too (same doctrine as the retired vendored `ig-template`: no stale copies) — consumers install from the catalog. |
| `ig-translate` | 2026-08 | `agent-skills` | [`fhir-ig-translation`](https://github.com/forschungsgruppe-digital-health/agent-skills/blob/main/skills/fhir-ig-translation/SKILL.md) | Ported to the catalog and generalised there from the fixed `en`→`de` direction to any language pair, deriving the pair from the guide's own `i18n-default-lang` / `i18n-lang` instead of assuming it. A pinned vendored copy remained here as `skills/fhir-ig-translation` until **2026-08-28**, when the vendored copies left too — consumers install from the catalog. |

Both catalog skills record this repository as their provenance, naming the commit they were taken
from.

The helper scripts each skill owned went with it and are **no longer in `scripts/`**:
`scripts/ig-stats.py` is now `skills/fhir-ig-analysis/scripts/ig-stats.py` in the catalog, and
`scripts/ig-translate.sh` is now `skills/fhir-ig-translation/scripts/ig-translate.sh`. No workflow
in this repository ever invoked either of them; they were run by hand by a maintainer.

## Where they are now

Both live **only in the catalog**. From 2026-08 to 2026-08-28 pinned vendored copies were kept
here under their catalog names, synced by a `scripts/sync-skills.sh` + `skills-lock.json` +
`sync-skills.yml` machinery; on **2026-08-28** the copies and the machinery were removed — the
same doctrine as the retired vendored `ig-template`: no stale copies.

To use a catalog skill — here, in a module created from this template, or anywhere else — install
it from the catalog at a pinned release:

```bash
npx skills add forschungsgruppe-digital-health/agent-skills/tree/<release> --skill fhir-ig-analysis fhir-ig-translation --copy
```

**Pin the ref, and pin it the `/tree/<ref>` way.** The shorter `owner/repo@v0.15.1` form does *not*
pin — in that CLI `@` introduces a skill *name*, and the install silently comes from the default
branch. See the catalog's
[`docs/consuming-skills.md`](https://github.com/forschungsgruppe-digital-health/agent-skills/blob/main/docs/consuming-skills.md),
which also covers the pinned-sync-workflow and submodule paths.

Note when installing **inside this checkout**: `.claude/skills` and `.agents/skills` are symlinks
to `skills/`, so an install targeting those paths writes into `skills/` itself — installed catalog
skills are your working copies, not tracked content of this repository.

## What stays here

`docs-steward` and `wiki-consistency-check` are **not** in the catalog and are not going there as
they stand: `wiki-consistency-check` is bound to this repository's `scripts/convention-check.mjs`
and to the MII meta wiki, and both repositories' copies are deliberately scoped differently. They
remain local skills.
