# Pre/post delta — the two ig-stats measurements compared

| Side | Measurement |
|---|---|
| pre | preflight-analysis.json (mii-ig-meta, 1db2e53, 2026-08-31T11:40:08Z) |
| post | postflight-analysis.json (mii-ig-meta, 1db2e53, 2026-08-31T14:09:20Z) |

Verdicts: **unchanged** 25 · **improved** 1 · **expected-change** 7 · **REGRESSION** 1 · **not-measurable** 0.

## ⛔ Regressions — properties that got WORSE

Each one blocks the migration until it is fixed or explained; an explanation belongs in the migration report, not in a merge commit.

- **`identity.version`**: `2026.0.0` → `2027.0.0-ballot.rc1` — machine-identity field changed -- the migrated package is no longer the same package

## Identity

| Property | Pre | Post | Verdict | Why |
|---|---|---|---|---|
| `identity.id` | mii-ig-meta | mii-ig-meta | unchanged |  |
| `identity.canonical` | https://www.medizininformatik-initiative.de/fhir/modul-meta | https://www.medizininformatik-initiative.de/fhir/modul-meta | unchanged |  |
| `identity.packageId` | de.medizininformatikinitiative.kerndatensatz.meta | de.medizininformatikinitiative.kerndatensatz.meta | unchanged |  |
| `identity.name` | MII_IG_Meta | MII_IG_Meta | unchanged |  |
| `identity.version` | 2026.0.0 | 2027.0.0-ballot.rc1 | **REGRESSION** | machine-identity field changed -- the migrated package is no longer the same package |
| `identity.fhirVersion` | 4.0.1 | 4.0.1 | unchanged |  |
| `identity.license` | CC-BY-4.0 | CC-BY-4.0 | unchanged |  |
| `identity.calver` | true | true | unchanged |  |
| `identity.publisher` | Medizininformatik Initiative | NUM-DIZ | expected-change | descriptive metadata, not machine identity -- confirm the change is deliberate in the report |
| `identity.status` | active | active | unchanged |  |
| `identity.title` | MII IG Meta | MII IG Meta | unchanged |  |

## Preflight flags

| Property | Pre | Post | Verdict | Why |
|---|---|---|---|---|
| `licence.contradictory` | true | true | unchanged |  |
| `dependency_health.injection_risk` | true | false | improved | the dependency-injection risk the source carried is cleared |
| `narrative_sources.dual_source` | true | true | unchanged |  |

## Artefact counts

| Property | Pre | Post | Verdict | Why |
|---|---|---|---|---|
| `mode` | static | static | unchanged |  |
| `artifacts.profiles` | 1 | 1 | unchanged |  |
| `artifacts.extensions` | 1 | 1 | unchanged |  |
| `artifacts.valuesets` | 0 | 0 | unchanged |  |
| `artifacts.codesystems` | 1 | 1 | unchanged |  |
| `artifacts.logicals` | 0 | 0 | unchanged |  |
| `artifacts.capabilitystatements` | 0 | 1 | expected-change | the count rose by 1 -- artefacts added by the migration; the report names what and why |
| `artifacts.questionnaires` | 0 | 0 | unchanged |  |
| `artifacts.searchparameters` | 167 | 167 | unchanged |  |
| `artifacts.operations` | 0 | 0 | unchanged |  |
| `artifacts.examples` | 5 | 5 | unchanged |  |
| `artifacts.rulesets` | 21 | 64 | expected-change | the count rose by 43 -- artefacts added by the migration; the report names what and why |
| `artifacts.invariants` | 1 | 1 | unchanged |  |
| `artifacts.mappings` | 0 | 0 | unchanged |  |
| `artifacts.other_total` | 0 | 0 | unchanged |  |
| `artifacts.total` | 175 | 176 | expected-change | the total rose by 1 -- consistent with the per-class rises above |

## Narrative pages

| Property | Pre | Post | Verdict | Why |
|---|---|---|---|---|
| `narrative.pages` | 11 | 29 | expected-change | narrative routing (spec 9d/9e) moves pages between pagecontent, intro-notes and translations -- conservation of the CONTENT is checked by the verifier against page-map.tsv |
| `narrative.intro_note_pages` | 0 | 3 | expected-change | narrative routing (spec 9d/9e) moves pages between pagecontent, intro-notes and translations -- conservation of the CONTENT is checked by the verifier against page-map.tsv |
| `narrative.translation_pages` | 0 | 18 | expected-change | narrative routing (spec 9d/9e) moves pages between pagecontent, intro-notes and translations -- conservation of the CONTENT is checked by the verifier against page-map.tsv |

## Directives

| Property | Pre | Post | Verdict | Why |
|---|---|---|---|---|
| `directives.total` | 48 | 48 | unchanged |  |

