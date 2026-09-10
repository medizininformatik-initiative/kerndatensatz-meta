# Org move — this repository's home is `medizininformatik-initiative`

**Since 2026-08-27** this repository and its companion
[`ig-template-mii-kds`](https://github.com/medizininformatik-initiative/ig-template-mii-kds)
live in the `medizininformatik-initiative` organisation — the target their
canonical URLs and package ids named from the start. The move was executed as a
**mirror push into pre-created repositories** (full git history, all branches
and tags; releases recreated; open issues migrated with provenance headers),
because the empty target repositories already existed and a name-colliding
transfer was therefore not possible. The previous home,
`forschungsgruppe-digital-health/mii-kds-module-template`, is **archived as a
read-only snapshot**: its issue and pull-request numbers cited in the
[CHANGELOG](../CHANGELOG.md) and in migrated issues keep resolving there, and
its GitHub Pages keep serving previews published before the move.

This note replaces the pre-move `docs/project-status.md` and
`docs/migration-cleanup.md` and carries their surviving decisions:

## Decisions that survive the move

| Question | Answer |
| --- | --- |
| Is the template registered in [`FHIR/ig-registry`](https://github.com/FHIR/ig-registry)? | **No — and it must not be** until the explicit decision: [#1](../../../issues/1). |
| Is the package published to a FHIR package registry? | **No.** Since 2026-08-28 modules consume the template by **repository URL** (`ig.ini`: `template = https://github.com/medizininformatik-initiative/ig-template-mii-kds` — the interim form; the publisher fetches the released `main` at build time). The vendored `ig-template/` folder (`template = #ig-template`), re-vendored from the companion's `dev` by `scripts/sync-ig-template.sh`, remains the offline/reproducibility fallback. Publication is the explicit decision [#2](../../../issues/2); the switch a module then performs is [docs/recipes/switch-template-to-published.md](recipes/switch-template-to-published.md). |
| Why is registration deliberately deferred? | An `ig-registry` entry and a package-registry release are *public, hard-to-retract commitments* that imply an owner and a support promise. Until the TF KDS adopts the approach, keeping it unregistered lets the design change freely without stranding consumers or squatting an identifier. |
| Who owns the template after 2026? | **Decided (2026-08-28): the MII until 2026-12-31, NUM-DIZ from 2027-01-01** — the funded handover as MII funding ends and NUM-DIZ takes over IG development and maintenance. Contacts (researched 2026-08-28): MII — Koordinationsstelle der Medizininformatik-Initiative at TMF e.V., Charlottenstr. 42, 10117 Berlin, <info@medizininformatik-initiative.de>, +49 30 2200247-0; NUM — NUM-Koordinierungsstelle at Charité – Universitätsmedizin Berlin (head: Ralf Heyder), Luisenstraße 13, 10117 Berlin, <forschungsnetzwerk-unimedizin@charite.de>, NUM-DIZ project coordination: Annalena Herzog. The TF KDS remains the governance venue for the **endorsement** question only (next row): [#7](../../../issues/7). |
| Is this an MII-endorsed artifact? | **Governance is not settled yet** — functional and released, adopted as a proposal to the **MII Taskforce Kerndatensatz (TF KDS)**. The open decisions live in the [issue tracker](../../../issues); recorded limits and decided non-fixes in [maintenance.md](maintenance.md). |
| The `IG_TEMPLATE_REPO_URL` repository variable | **Gone by design.** It bridged CI while the companion repository's new home was still empty; `scripts/resolve-ig-template-source.sh` now resolves its default (the `medizininformatik-initiative` URL) directly. |

## Branch state — `main` and `dev` are reconciled

The documented model is that `main` only ever receives a `dev → main` merge
([CONTRIBUTING.md](../CONTRIBUTING.md)). The 2026-07/08 divergence described in
the pre-move status page was reconciled before the move; the mirror carried the
reconciled state. Anyone needing the full forensic account finds it in the
archived pre-move repository's `docs/project-status.md`.
