# `skills/` — the agent skills of this repository

One folder per skill, instructions in `SKILL.md` ([agent-skills
format](https://agentskills.io)). `.claude/skills` and `.agents/skills` are relative symlinks to
this directory, so every agent runtime reads the identical content.

Every skill in this directory is **written here** — this repository is its source of truth.
Skills that belong to the org catalog are not kept as copies here; install them from the catalog
(see below).

## Written here — this repository is their source of truth

| Skill | What it does |
| --- | --- |
| [`wiki-consistency-check/`](wiki-consistency-check/SKILL.md) | The single convention checker: repo ↔ MII meta wiki drift plus the hard module-metadata contract. Mechanized by [`../scripts/convention-check.mjs`](../scripts/convention-check.mjs). |
| [`docs-steward/`](docs-steward/SKILL.md) | Checks and repairs this repository's documentation — links, paths and factual claims verified against the repo itself. |

Edit these here. Report-only by design: they propose, a human decides, and any change lands as a
pull request targeting `dev`.

## From the org catalog — install, do not copy

The IG-measuring and IG-translation skills belong to the organization's skill catalog,
[`agent-skills`](https://github.com/forschungsgruppe-digital-health/agent-skills), which is their
single source of truth:

| Task | Catalog skill | Was |
| --- | --- | --- |
| Measure / compare Implementation Guides (read-only statistics, hygiene, maturity) | `fhir-ig-analysis` | `skills/ig-analyze` + `scripts/ig-stats.py` |
| Produce a guide's translation supplements (translate or harvest) | `fhir-ig-translation` | `skills/ig-translate` + `scripts/ig-translate.sh` |
| Migrate a Simplifier/Forge-published KDS module onto this scaffold | `mii-ig-migration` | never local |

This repository keeps **no copies** of them (vendored copies existed until 2026-08-28 — see
[`RETIRED.md`](RETIRED.md)). Install from the catalog at a pinned release when you need one:

```bash
npx skills add forschungsgruppe-digital-health/agent-skills/tree/<release> --skill fhir-ig-analysis fhir-ig-translation --copy
```

Pin with the `/tree/<ref>` form — `owner/repo@v0.15.1` does *not* pin: in that CLI `@` introduces a
skill *name*, and the install silently comes from the default branch. All consumption paths are in
the catalog's
[`docs/consuming-skills.md`](https://github.com/forschungsgruppe-digital-health/agent-skills/blob/main/docs/consuming-skills.md).
Inside this checkout, remember `.claude/skills` and `.agents/skills` are symlinks to `skills/`, so
an install lands in `skills/` — installed catalog skills are working copies, not tracked content.

## Skills never install other skills

A skill that needs another one states it as a **precondition** and prints the exact install command
for the user to run. It never installs anything itself: `allowed-tools` grants permissions, it does
not declare dependencies; an auto-install would write into the user's project as a side effect of an
unrelated invocation and make the run depend on a network fetch nobody asked for.

## What used to be here

[`RETIRED.md`](RETIRED.md) — the tombstone list: every skill that left this directory, where it went
and why.
