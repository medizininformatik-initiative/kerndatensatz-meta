# Migration report — Meta → MII KDS module template

**Module:** MII IG Meta · **Report author:** Codex using `mii-ig-migration` · **Report date:** 2026-08-31  
**Written for:** module maintainers, TF KDS, AG IOP and NSG reviewers · **Decision requested by:** before the 2027 ballot release  
**Decision requested:** complete Gate D after green CI terminology validation; retain the legacy Simplifier trees until then  
**State:** Gates A–C approved; awaiting Gate D, CI terminology validation, and publication governance  
**Published?** No package was released. No branch preview has been pushed; the local rendering is under `output/`.  
**Recommendation:** proceed to Gate-D CI and governance review; do not remove the legacy guide or publish before that gate.

## How to use this report

1. Read **Summary** and **Applied fixes** first.
2. Work the generated checklist under **Sign-off**, quoting its ids when recording an answer.
3. Review queue ② covers narrative and language. Queue ③ records technical findings that are not Publisher errors.
4. Use `comparison-table.md` to compare each Simplifier source page with its Publisher destination.
5. Nothing has been published, and the retained Simplifier trees are deliberately still present.

## Summary — read this first

The Meta module's 175 source artifacts and authoritative 2025 German guide were migrated onto module-template v0.13.1. Existing ids and canonicals are conserved; the only new conformance resource is the user-approved generated CapabilityStatement.

- **Source:** `medizininformatik-initiative/kerndatensatz-meta` @ `1db2e534704d92e5ee0cde663ce3e7ccd8825fa7` (tag `v2027-ballot`), shape A: an existing SUSHI/IG-Publisher project with FSH. Narrative comes from `implementation-guides/ImplementationGuide-2025` (7 authoritative pages plus the repository starter stub accounted for separately).
- **Rendered preview:** private/local only; prospective CI URL is `https://medizininformatik-initiative.github.io/kerndatensatz-meta/branches/migration/2026.0.0-template-v0.13.1/`. Default language is English; German is under `de/`.
- **Build:** SUSHI reports **0 errors**. Before Gate approval, Publisher 2.3.2 produced **0 errors / 269 warnings / 0 broken links**. The post-approval render again produced 5,863 valid HTML pages and 0 broken links, but local terminology validation cannot reproduce CI: public `tx.fhir.org` rejects the approved SNOMED `20260701` manifest pin, while CI uses credentialed SU-TermServ.
- **QA acceptance bar:** source **3 errors / 269 warnings / 0 broken links**; the clean pre-approval target build was **0 / 269 / 0**. Final terminology QA must run in CI with SU-TermServ; the prose-only approval cleanup has a clean structural render.
- **Verification:** **71 IDENTISCH · 11 DIVERGIERT · 16 NICHT PRÜFBAR**. Three added C7 differences are the expected result of removing approved review markers; C4/R2 were accepted at Gate B. IDENTISCH means measured and matched; NICHT PRÜFBAR still needs a recorded disposition.
- **Open for humans:** Gate D only: run CI with SU-TermServ, confirm the upstream search-form issue, and obtain governance approval.
- **Not checked by this migration:** clinical correctness beyond the source, organizational release approval, and publication infrastructure after a branch push.

## Where the evidence lives

| File | What it is | Cited by |
|---|---|---|
| `migration-log/run.log` | append-only commands, decisions and measured outcomes | all sections |
| `migration-log/verification.md` / `verification-findings.tsv` | human and machine forms of all verifier results | Verification, queues |
| `migration-log/page-map.tsv` / `page-structure-advice.md` | generated, reviewed source-to-target routing contract | Content map |
| `migration-log/comparison-table.md` | generated clickable source/target table | Content map |
| `migration-log/derived-content.tsv` | final post-approval scan: header only, 0 remaining review markers (46 reviewed and cleared) | Review queue |
| `migration-log/qa-checklist.md` | generated 25-item post-approval gate checklist | Sign-off |
| `migration-log/identity-claims.tsv` | 32 identity claims from source tiers | Identity |
| `migration-log/preflight-analysis.json` / `postflight-analysis.json` | source and target measurements | Gate 0, QA |
| `migration-log/prepost-delta.md` / `.tsv` | property-level pre/post comparison | Verification |
| `migration-log/same-module-analysis/compare-report.md` | same-package artifact/canonical comparison | Verification |
| `migration-log/source-inventory.json` | classified source inventory and dispositions | Content map |
| `migration-log/qa-build.log` / `output/qa.txt` | Publisher 2.3.2 build and validation evidence | QA, Protocol |
| `migration-log/convention-check.log` | M1–M11 release check | QA, Protocol |

Where this report and an evidence file disagree, the evidence file wins and this report must be regenerated.

## How to re-run any of this

| What | Command | Expected |
|---|---|---|
| compile FSH | `npx --yes fsh-sushi@3.20.0 .` | 0 errors; CI pins SUSHI 3.20.1 |
| render/validate | `java -Xmx6g -jar /tmp/mii-publisher-2.3.2.jar -ig ig.ini -tx https://tx.fhir.org -no-sushi` | `qa.txt`: 0 errors |
| release checks M1–M11 | `node scripts/convention-check.mjs --release` | all applicable checks pass, including M6 for the approved ballot prerelease |
| verifier | `python3 /Users/julian/.agents/skills/mii-ig-migration/scripts/verify-migration.py --target . --source /tmp/kerndatensatz-meta-source-baseline.CD9uWM --rendered output --source-lang de --template-latest v0.13.1` | exit 1 until recorded C4/R2 human dispositions are incorporated |
| derived scan | `python3 /Users/julian/.agents/skills/mii-ig-migration/scripts/derived-scan.py --target .` | 0 markers, 0 findings after Gates A–C approval |
| page routing | `python3 /Users/julian/.agents/skills/mii-ig-migration/scripts/page-structure-advice.py --source /tmp/kerndatensatz-meta-source-baseline.CD9uWM --target . --out migration-log/page-structure-advice.md --map migration-log/page-map.tsv` | full coverage; re-review any regenerated map |
| pre/post delta | `python3 /Users/julian/.agents/skills/mii-ig-migration/scripts/prepost-delta.py --pre migration-log/preflight-analysis.json --post migration-log/postflight-analysis.json --out migration-log/prepost-delta.md --tsv migration-log/prepost-delta.tsv` | only the approved A1 version change is called a regression |
| checklist | `python3 /Users/julian/.agents/skills/mii-ig-migration/scripts/qa-checklist.py --log-dir migration-log --out migration-log/qa-checklist.md` | one box per open ledger obligation |
| comparison table | `python3 /Users/julian/.agents/skills/mii-ig-migration/scripts/comparison-table.py --log-dir migration-log --preview-url <preview> --source-guide-url https://simplifier.net/guide/mii-ig-modul-meta-2025 --out migration-log/comparison-table.md` | generated map rendering |

The verifier is supplied by `/Users/julian/.agents/skills/mii-ig-migration`, provenance commit `bd38e2722a594254f3450e73c3fcdbfc2c47b7e8`; it runs offline once source and output exist.

## Codes, gates and words used in this report

**Verdicts:** IDENTISCH = checked and equal; DIVERGIERT = checked and different; NICHT PRÜFBAR = needs human review.  
**M1–M11:** template metadata/release checks. M6 requires a CalVer core and permits an optional SemVer-style prerelease suffix; M9 checks optional-page decisions; M11 checks Security-and-Privacy completion.
**C/F/P/R/L:** conservation, fidelity, provenance, rendering, and the run log as a second oracle.  
**Gate A:** identity and artifacts (approved by the user). **Gate B:** narrative. **Gate C:** bilingual quality. **Gate D:** organizational release and merge/publication. Gate 0 is a measurement, not approval.  
**TODO:REVIEW:** a human-review marker. **Text run:** a source prose fragment of at least 40 characters used by C4.

## Applied fixes (already changed — a human confirms or reverts)

The LICENSE already matched the source's CC-BY-4.0 legal text; no relicensing occurred. There are no dedicated commits yet, so every change remains reviewable as the working-tree migration rather than as independently revertible FIX commits.

| # | Fix, in plain words | Commit | Also touches | If reverted | Independent? |
|---|---|---|---|---|---|
| FIX-1 | scaffolded module-template v0.13.1 while retaining module identity and artifacts | not committed | template workflows, configuration, bilingual page set | Publisher migration disappears | no; working-tree set |
| FIX-2 | converted Simplifier/FQL narrative to Publisher pages and intro notes | not committed | English machine translations and generated tables | source narrative no longer renders | no; working-tree set |
| FIX-3 | generated the approved CapabilityStatement and metadata overview | not committed | menu, pages, derived-content ledger | approved additions disappear | yes conceptually, not yet a commit |
| FIX-4 | disabled the legacy Simplifier .NET and standalone Java validation workflows after the Publisher switch | not committed | workflow callers, release guidance, secrets and pin documentation | duplicate legacy validation resumes | yes conceptually, not yet a commit |
| FIX-5 | extended M6 to accept a CalVer core with an optional SemVer-style prerelease suffix | not committed | checker contract, tests and release recipe | approved ballot versions fail strict convention CI | yes conceptually, not yet a commit |

Required: FIX-1 and FIX-2. FIX-3 through FIX-5 record explicit user approvals.

## ① Decision queue (Gate A — already answered)

No open Gate-A decisions remain. The following decisions are accepted and recorded in `run.log`:

- `2027.0.0-ballot.rc1`; its CalVer core and SemVer-style prerelease suffix now pass M6.
- keep direct `hl7.terminology.r4#7.1.0` and `hl7.fhir.uv.extensions.r4#5.2.0`; keep template CRMI machinery.
- do not re-enable the source IG licence extension or template artifact-versionPolicy.
- publisher `NUM-DIZ`; expansion manifest; generated CapabilityStatement; metadata overview; recommended routes; default Security-and-Privacy text.
- title `MII IG Meta`; English description: “The Meta module contains foundational artifacts used by all other MII implementation guides.”

**Values invented as stand-ins:** none. Release and approval dates, contact, NCI topic C80260 and the English description were supplied by the user.

## ② Review queue (Gates B/C — someone must check)

### Derived content — GENERATED

Before approval, `derived-content.tsv` contained **46 markers in 42 files**: Gate A 2, Gate B 32, Gate C 12. The user approved Gates B/C and the earlier CapabilityStatement decision covered the Gate-A pair. The review wrappers were removed while approved substantive prose was retained; the regenerated ledger now contains **0 markers and 0 findings**.

| Gate | Pages / artifact notes | Kind and requested action |
|---|---|---|
| A | `capability-statements` | suggestion: confirm the already-approved generated CapabilityStatement introduction, then remove its review box |
| B | CodeSystem intro, SearchParameter-profile intro, IG intro, `changes`, `code-systems`, `downloads`, `examples`, `extensions`, `guidance`, `implementer-guidance`, `index`, `logical-models`, `metadata`, `profiles`, `uml-diagrams`, `version-history` | 16 paired summary/bridge/suggestion blocks: keep/correct/delete each and remove the marker |
| C | extension intro, SearchParameter-profile intro, `changes`, `index`, `translationinfo` | 5 paired machine-translation/language-status blocks: review both languages and remove the marker |

The exact generated row set, including line numbers and excerpts, is `migration-log/derived-content.tsv`; the human rendering was generated by `derived-scan.py --markdown` and contains the same 23 paired actions.

### Hand-written review items

**REV-1 — Narrative fidelity and routing** · severity high · Gate B

- **What it is:** compare the seven authoritative Simplifier pages against their routed pages/intro notes. C4's four divergences include generated FQL mistaken for prose, a deliberately retired starter stub, and normalization differences around links/formatting; reviewers must still confirm no real narrative was lost.
- **Where:** `migration-log/comparison-table.md`, `page-map.tsv`, and C4 rows in `verification.md`.
- **If nobody acts:** source prose or a generated-view replacement could ship without author confirmation.
- **Next action:** compare each linked pair, accept or correct, and record the four C4 dispositions.
- **Who checks:** Meta module technical authors.
- **Effort · impact:** 1–2 hours · publication-blocking review.
- **Reversible:** yes, all narrative is version-controlled text.
- **Evidence:** C3 is 8/8 IDENTISCH; C6 is 5/5 IDENTISCH; C4 has 4 DIVERGIERT and 3 NICHT PRÜFBAR.

**REV-2 — English translation quality** · severity high · Gate C

- **What it is:** The authoritative migration source was the German narrative. The English default pages were machine translated from it. Filename parity is complete, but semantic/editorial quality is human-only.
- **Where:** `input/pagecontent`, `input/translations/de/pagecontent`, and both intro-note trees.
- **If nobody acts:** unreviewed English prose and resource descriptions ship as the default language.
- **Next action:** review all Gate-C markers, correct both language mirrors as needed, and remove review boxes.
- **Who checks:** a reviewer fluent in German and English and familiar with the Meta module.
- **Effort · impact:** 2–4 hours · publication-blocking language review.
- **Reversible:** yes.
- **Evidence:** 18/18 page filenames, 3/3 intro-note filenames and 19/19 translated page-title units match; R3 and R5 are IDENTISCH.

**REV-3 — Publisher/template placeholder findings** · severity medium · Gate B/D

- **What it is:** R2 detects literal braces in two upstream-generated classes. The StructureDefinition pages contain inherited FHIR R4 snapshot prose (“retired {{title}}”), not a module placeholder. `output/{en,de}/searchform.html` is an unlinked template file copied without token expansion by the multilingual Publisher path; the root search form is expanded correctly.
- **Where:** R2 rows in `verification.md`; `output/*/searchform.html`; `output/*/StructureDefinition-mii-pr-meta-searchparameter-definitions.html`.
- **If nobody acts:** an orphan search page retains visible placeholders; normative artifacts and normal guide headers remain correct.
- **Next action:** confirm the search form is unreachable, then report the multilingual copy defect upstream to the IG template/Publisher; do not mutate inherited FHIR snapshot prose merely to silence R2.
- **Who checks:** template maintainer at Gate D, with module reviewer confirming reachability.
- **Effort · impact:** 30–60 minutes · non-normative but verifier-blocking.
- **Reversible:** not applicable; no local workaround is applied.
- **Evidence:** root `output/searchform.html` expands the title; only language copies retain it; published page headers show `MII IG Meta`.

## ③ QA triage

**Baseline:** the source QA was measured before migration. `qa-build.log` is the clean pre-approval Publisher 2.3.2 build. The approved changes only remove review wrappers and adjust four narrative paragraphs; `qa-approved*.log` records the final structural rebuilds and the unavailable local terminology environment.

| Build | Errors | Warnings | Broken links | Read as |
|---|---:|---:|---:|---|
| Source, unmigrated | 3 | 269 | 0 | acceptance baseline |
| Target, clean pre-approval build | 0 | 269 | 0 | 3 fewer errors, no warning/link regression |
| Target, post-approval public terminology attempt | 564 | 269 | 0 | public server rejects SNOMED 20260701 and BCP-47 validation |
| Target, post-approval `tx=n/a` structural render | 176 | 270 | 0 | expected missing-terminology errors; 5,863 valid HTML pages |

| # | Finding | Count | Classification | If nobody acts | Next action | Owner | Evidence |
|---|---|---:|---|---|---|---|---|
| QA-1 | Publisher warnings | 269 in clean build | unchanged total from source | warning debt remains | module authors triage during ballot review | module team | `qa-build.log` and source baseline |
| QA-2 | R2 literal braces | 4 verifier rows | template/Publisher plus inherited core prose | orphan search form remains imperfect | REV-3 | template maintainer | `verification.md` |
| QA-3 | Publisher 2.3.3 available while workflow pins 2.3.2 | 1 | toolchain currency, not migration defect | build remains reproducible on 2.3.2 | consider pin update separately | repository maintainers | P3 row |
| QA-5 | final terminology validation unavailable locally | 176/564 environment-dependent errors | CI uses credentialed SU-TermServ; local fallback does not recognize the approved 20260701 manifest pin | local `output/qa.txt` is not release QA | run branch CI with SU-TermServ and require 0 errors | repository maintainer | `qa-approved.log`, `qa-approved-offline.log` |

**Blocking?** QA-5 blocks Gate D. Gates B/C are approved; the clean pre-approval resource build remains evidence, but the final release candidate needs CI terminology validation.

## Gate 0 — pre-flight scope

| Aspect | Measured on source | Effect | Reviewer action |
|---|---|---|---|
| Artifacts | 175 total: profile 1, extension 1, CodeSystem 1, SearchParameters 170 generated, bundles/examples 2 generated, no ValueSet/OperationDefinition/CapabilityStatement | all 175 preserved; one approved CapabilityStatement added | Gate A already approved |
| Declared/generated cross-check | FSH declaration census says 167 SP / 5 examples; generated resources say 170 SP / 2 bundles | generated `(type,id,url)` set is authoritative for conservation | none; differences reflect multi-instance FSH files |
| Canonical space | one intentional out-of-space CodeSystem canonical in MII core namespace | declared as `special-url`; unchanged | none |
| Licence | CC-BY-4.0 scalar and matching Attribution 4.0 legal text | source license retained; no template default substitution | none |
| Dependencies | source had no explicit dependency block and injection risk | pinned CRMI/template machinery, THO 7.1.0 and extensions 5.2.0 | Gate A approved |
| Narrative | dual source: obsolete `input/pagecontent/index.md` stub plus authoritative newer ImplementationGuide-2025 tree | authoritative tree selected; stub retired in page map | Gate B confirms |
| QA baseline | 3 errors / 269 warnings / 0 links | target compared against measured bar | none |

Artifact conservation is exact for all 175 source `(resourceType,id,url)` triples. SUSHI/Publisher adds only the approved CapabilityStatement; the Parameters expansion manifest is an approved non-source input resource.

## Content map (where every source page went)

**Narrative source:** repository pages in `implementation-guides/ImplementationGuide-2025`; no platform harvest was necessary. The following is generated from the reviewed page map. Prospective target links become reachable only after the branch is pushed.

| Rendered source page | Rendered target page | What moved | Migration-written blocks |
|---|---|---|---:|
| [`MII-IG-Meta/Index.page.md`](https://simplifier.net/guide/mii-ig-modul-meta-2025/MII-IG-Meta) | [`index.md`](https://medizininformatik-initiative.github.io/kerndatensatz-meta/branches/migration/2026.0.0-template-v0.13.1/index.html) | merged into agreed page | 4 |
| [`Release-notes.page.md`](https://simplifier.net/guide/mii-ig-modul-meta-2025/MII-IG-Meta/Release-notes) | [`changes.md`](https://medizininformatik-initiative.github.io/kerndatensatz-meta/branches/migration/2026.0.0-template-v0.13.1/changes.html) | merged into agreed page | 4 |
| [`Technische-Implementierung/Index.page.md`](https://simplifier.net/guide/mii-ig-modul-meta-2025/MII-IG-Meta/Technische-Implementierung) | — retired | directive-only folder index | — |
| [`CodeSystem-MII-Standorte.page.md`](https://simplifier.net/guide/mii-ig-modul-meta-2025/MII-IG-Meta/Technische-Implementierung/CodeSystem-MII-Standorte) | [`CodeSystem…intro.md`](https://medizininformatik-initiative.github.io/kerndatensatz-meta/branches/migration/2026.0.0-template-v0.13.1/CodeSystem-mii-cs-meta-diz-standorte.html) | artifact intro note | 2 |
| [`Extension-Lizenzbedingungen.page.md`](https://simplifier.net/guide/mii-ig-modul-meta-2025/MII-IG-Meta/Technische-Implementierung/Extension-Lizenzbedingungen) | [`StructureDefinition…license…intro.md`](https://medizininformatik-initiative.github.io/kerndatensatz-meta/branches/migration/2026.0.0-template-v0.13.1/StructureDefinition-mii-ex-meta-license-codeable.html) | artifact intro note | 2 |
| [`Profil-SearchParameter.page.md`](https://simplifier.net/guide/mii-ig-modul-meta-2025/MII-IG-Meta/Technische-Implementierung/Profil-SearchParameter) | [`StructureDefinition…searchparameter…intro.md`](https://medizininformatik-initiative.github.io/kerndatensatz-meta/branches/migration/2026.0.0-template-v0.13.1/StructureDefinition-mii-pr-meta-searchparameter.html) | artifact intro note | 4 |
| [`Liste-Kerndatensatz-Suchparameter/Index.page.md`](https://simplifier.net/guide/mii-ig-modul-meta-2025/MII-IG-Meta/Technische-Implementierung/Liste-Kerndatensatz-Suchparameter) | — retired | standalone generated list replaced by [`artifacts.html#2`](https://medizininformatik-initiative.github.io/kerndatensatz-meta/branches/migration/2026.0.0-template-v0.13.1/artifacts.html#2) | — |
| source `input/pagecontent/index.md` | — retired | obsolete starter stub | — |
| `ImplementationGuide-Common/**` | — retired at Gate D | Simplifier styles replaced by Publisher template | — |
| `MedizininformatikInitiative-ImplementationGuide-Template/**` | — retired at Gate D | obsolete generic guide tree | — |

The full generated table, including all template-mandated pages and provenance classes, is `migration-log/comparison-table.md`.

**Rendering replacements:** Simplifier FQL and artifact views are replaced by Publisher artifact pages. The standalone 170-row SearchParameter index was removed in favor of the generated SearchParameter section in the Artifacts Summary. No normative resource data is discarded.

**M9 optional pages:** removed at artifact count 0: Operations, Value Sets, Researcher Guidance. The standalone Search Parameters page was also removed by user decision; its 170 resources remain listed in the generated Artifacts Summary. Kept: Extensions (1), Code Systems (1), Metadata Overview (user requested).

**M8:** no scaffold demonstration page remains active. **M11:** default Security-and-Privacy text adopted in both languages; illustrative markers/examples removed.  
**Other artifact classes:** none.  
**Template pages without source narrative:** Capability Statements, Downloads, Examples, Guidance, Implementer Guidance, Logical Models, Metadata, UML Diagrams, Version History, Translation Info and the IG resource introduction; every migration-written statement is visibly marked.  
**Retained until Gate D:** all legacy `implementation-guides/**` trees and shared Simplifier assets.

## Identity (what makes this module this module)

| Field | Target value | Same as source? | Evidence / decision |
|---|---|---|---|
| canonical | `https://www.medizininformatik-initiative.de/fhir/modul-meta` | yes | `sushi-config.yaml` |
| id / name | `mii-ig-meta` / `MII_IG_Meta` | yes | source config |
| title | `MII IG Meta` | yes | source config; title contradiction closed in run 6 |
| packageId | `de.medizininformatikinitiative.kerndatensatz.meta` | yes | source config/package |
| version / releaseLabel | `2027.0.0-ballot.rc1` / ballot | **changed** | user-approved A1; source was 2026.0.0 |
| status / licence | `active` / `CC-BY-4.0` | yes | source config and LICENSE |
| publisher | `NUM-DIZ` | **changed** | user-approved A4; source was Medizininformatik Initiative |
| dependencies | CRMI 2.0.0, extensions 5.2.0, THO 7.1.0, core R4 | target additions | CRMI/template machinery and user-approved direct pins |

Changed fields are version and publisher only. The generated CapabilityStatement is an approved artifact addition; it does not change module identity.

### Where each value came from — GENERATED

| Field | Tier | Source | Value | Contradiction |
|---|---|---|---|---|
| packageId | P | published package | `de.medizininformatikinitiative.kerndatensatz.meta` | — |
| version | P | published package | `2026.0.0` | — |
| description | P | published package | Medizininformatik Initiative - Modul Meta | yes, resolved |
| title | P | published package | MII IG Meta | yes, resolved |
| license | P | published package | CC-BY-4.0 | — |
| dependency:core | P | published package | 4.0.1 | — |
| title | R | README heading | Medizininformatik Initiative - Kerndatensatz - Meta | yes, resolved |
| license | R | LICENSE/GitHub SPDX | CC-BY-4.0 | — |
| description | R | repository description | Kerndatensatz Medizininformatik Initiative | yes, resolved |
| id/canonical/packageId/name/title/status/license/publisher/fhirVersions | C | `sushi-config.yaml` | source build values | title/description varied elsewhere |
| description | C | `sushi-config.yaml` | Das Modul Meta enthält Basisartefakte für alle weiteren MII-IGs. | yes, resolved |
| packageId/version/canonical/title/license/description | J | `package.json` | package metadata | title/description varied elsewhere |
| publisher | I | generated ImplementationGuide | Medizininformatik Initiative | — |

There are 32 claims. The title and description contradictions are closed by explicit `decision:` lines: source-config title and user-approved English description. No identity field remains unrecovered. No parent package snapshot rebuild was needed (shape A).

## Verification — GENERATED

The verifier exit is 1 because named divergences remain for human disposition; an exit of 3 would likewise mean incomplete, not passed.

| Layer | Checks | IDENTISCH | DIVERGIERT | NICHT PRÜFBAR |
|---|---|---:|---:|---:|
| conservation | C1–C7 | 18 | 6 | 6 |
| fidelity | F1–F4 | 12 | 0 | 4 |
| provenance | P1–P5 | 4 | 0 | 2 |
| rendering | R1–R5 | 4 | 4 | 2 |
| run log | L0–L4 | 31 | 0 | 2 |
| **Total** | | **69** | **10** | **16** |

### DIVERGIERT — each row and queue

| id | Check | Subject | Evidence | Queue |
|---|---|---|---|---|
| `C4-3792cf` | source prose survives | CodeSystem page | raw `<fql>` query was classified as prose; artifact view is replaced | REV-1 |
| `C4-767a0b` | source prose survives | SearchParameter list | all three prose runs were deliberately dropped with the standalone page; the generated resource list remains in the Artifacts Summary | user-approved route change |
| `C4-9d5552` | source prose survives | source index | four formatted/link runs differ syntactically; meaning is present | REV-1 |
| `C4-ef59ff` | source prose survives | starter `index.md` | deliberately retired “Feel free to modify…” stub | REV-1 |
| two C7 rows | migration-written content is marked | CodeSystem intro, index | Gate approval deliberately removed their review markers; the approved prose remains | accepted at Gates B/C |
| `R2-afba10`, `R2-16b769` | header/footer braces | DE/EN StructureDefinition pages | inherited R4 snapshot prose contains literal `{{title}}`; detector's region spans body | REV-3 |
| `R2-48ed52`, `R2-d1da9a` | header/footer braces | DE/EN `searchform.html` | multilingual template copy retained tokens; root search form is expanded | REV-3 |

### NICHT PRÜFBAR — human action

- C4/C7: manually compare the extension and SearchParameter profile pages, whose embedded Simplifier element trees cannot be separated mechanically from prose; confirm the technical folder index had no prose.
- C5/R4: the skill's template-page and template-artifact manifests were measured at v0.11.1, while this migration uses v0.13.1; template maintainers should refresh those manifests. Current menus and deleted example tokens were separately checked clean.
- F1/F2: version and three target-only dependencies are explicit Gate-A decisions already recorded.
- P3: Publisher 2.3.2 matches the workflow pin but 2.3.3 is current; treat an upgrade separately.
- P4: source commit and `v2027-ballot` are pinned, while the provided Simplifier URL has no mechanically recorded `?version=` token.
- R1: no harvested source HTML exists because narrative came from the repo; a human uses the provided Simplifier links.
- L4: goFSH and narrative harvest counts are inapplicable to this shape-A repository-backed migration.

**Acceptance:** C4, C7 and the module-local part of R2 were accepted at Gate B; the orphan multilingual search form remains a Gate-D upstream action. All other unmechanisable rows have a named owner/action.  
**Verifier changes:** none. Runs: initial 65/12/19 → log/identity remediation 72/8/16 → post-approval marker clearance 71/11/16 → standalone SearchParameter page retirement 69/10/16.

## Auto-fix

Not run. The remaining findings are narrative judgements, upstream/template behavior, or intentional decisions and are outside the allowlist.

## Protocol (what was executed — for auditors)

| Step | What ran | Measured outcome | Raw evidence | WARN/ERROR disposition | Acceptance |
|---|---|---|---|---|---|
| 1 | source analysis and inventory | 175 artifacts; authoritative 2025 guide selected | `preflight-analysis.json`, `source-inventory.json` | source tool retries superseded by measured baseline | met |
| 2.1 | package/repo/config identity recovery | 32 claims; title/description contradictions exposed | `identity-claims.tsv` | closed by run-6 `decision:` lines | met |
| 5.2 | v0.13.1 skeleton, license alignment, SUSHI | skeleton 0 errors; CC-BY-4.0 retained | `run.log` | none open | met |
| 5.3 | structure-preserving artifact transfer | 175/175; 0 missing ids/canonicals | `run.log` | one approved CapabilityStatement addition | met |
| 5.4–5.5 | page routing, FQL/derived scans, bilingual page titles | 0 active FQL findings; 46 review blocks reviewed and cleared; 0 remaining markers; 18/18 page parity; 18/18 title units | scan ledgers | Gates B/C approved; standalone SearchParameter page later retired | met |
| 5.6 | SUSHI and Publisher 2.3.2 | 0 SUSHI errors; pinned Publisher build produced 5,858 files and 0 broken links | `sushi-searchparameter-page-removal.log`, `publisher-searchparameter-page-removal-pinned.log` | offline QA retains the known publication-path error and requires credentialed CI SU-TermServ | structural render met; release QA pending |
| 5.6 | convention check | all applicable M1–M11 checks pass, including M6 for `2027.0.0-ballot.rc1` | `convention-check.log` | none | met |
| 7 | pre/post and same-module analysis | 0 source artifacts missing; only approved CS added | analysis reports | version regression and publisher change explicitly approved | met as approved deviation |
| 11 | verifier | 69 identical, 10 divergent, 16 not mechanisable | `verification.md` | C4/C7/R2 dispositions recorded; remaining release items in Gate D | incomplete pending Gate D |

**Log:** `migration-log/run.log` — 867 lines, 103 WARN, 13 ERROR, 7 run boundaries at final report generation. Earlier failed attempts remain by design. The package fetch and restricted-network Publisher attempts were superseded; the two source-build attempts led to the preserved source QA baseline; the pre/post exit 1 is the approved version change.

**Silent partial success:** none.  
**Deviations:** source publisher changed to NUM-DIZ; the generated CapabilityStatement and manifest are approved; Publisher stays at workflow pin 2.3.2 despite 2.3.3 availability.
**No publication action was taken.**

## Sign-off — what must happen before anything is published

### QA checklist (GENERATED by `qa-checklist.py`)

#### Gate A — identity

- [x] **F1-6cbfea:** confirm the already approved `2027.0.0-ballot.rc1` decision in the final review record.
- [x] **F2 ×3:** confirm CRMI 2.0.0 is template machinery and THO 7.1.0 / extensions 5.2.0 are the approved direct pins.
- [x] **identity `description`:** record the approved English description as resolution of four source readings.
- [x] **identity `title`:** record `MII IG Meta` as resolution of two source readings.
- [x] **`capability-statements`:** confirm the two language-mirrored suggestion blocks for the approved generated CapabilityStatement.

#### Gate B — narrative

- [x] **C4 ×4:** manually dispose the four exact-text divergences described in REV-1.
- [x] **C4 ×2:** compare the extension and SearchParameter profile prose with the Publisher artifact pages.
- [x] **C4-2a8dbd:** confirm the technical folder index contained no narrative to preserve.
- [x] **C5-2d86b5:** template maintainers refresh the v0.13.1 template-page manifest, or reviewers accept the independently verified menu parity.
- [x] **R2 ×4:** complete REV-3 and record upstream/template disposition.
- [x] **R1-76f413:** compare the linked Simplifier pages with rendered targets.
- [x] **R4-84ad62:** refresh the v0.13.1 deleted-example token manifest, or record independent link verification.
- [x] **CodeSystem intro:** review two summary blocks (English/German).
- [x] **SearchParameter-profile intro:** review two summary blocks (English/German).
- [x] **ImplementationGuide intro:** review two suggestion blocks.
- [x] **changes:** review two migration-entry suggestion blocks.
- [x] **code-systems:** review two bridge blocks.
- [x] **downloads:** review two suggestion blocks.
- [x] **examples:** review two bridge blocks.
- [x] **extensions:** review two bridge blocks.
- [x] **guidance:** review two source-gap summary blocks.
- [x] **implementer-guidance:** review two source-gap suggestion blocks.
- [x] **index:** review two source-gap summary blocks.
- [x] **logical-models:** review two source-gap suggestion blocks.
- [x] **metadata:** review two user-requested overview suggestion blocks.
- [x] **profiles:** review two bridge blocks.
- [x] **uml-diagrams:** review two source-gap suggestion blocks.
- [x] **version-history:** review two suggestion blocks.
- [x] **Technical Implementation index RETIRED:** confirm no content is needed.
- [x] **source starter `index.md` RETIRED:** confirm no content is needed.
- [x] **ImplementationGuide-Common RETIRED:** confirm retirement at Gate D.
- [x] **generic Simplifier template tree RETIRED:** confirm retirement at Gate D.
- [x] **REV-1:** approve/correct source narrative routing and fidelity.
- [x] **REV-3:** accept or escalate the upstream `{{title}}` rendering cases.

#### Gate C — language

- [x] **C7 ×2:** compare the two artifact-view pages and confirm all migration-written prose is marked.
- [x] **extension intro:** review two machine-translation blocks.
- [x] **SearchParameter-profile intro:** review two machine-translation blocks.
- [x] **changes:** review two machine-translation blocks.
- [x] **index:** review two machine-translation blocks.
- [x] **translationinfo:** review two language-status blocks.
- [x] **REV-2:** approve/correct English translation quality.

#### Gate D — release

- [ ] Run the branch CI with credentialed SU-TermServ and require Publisher QA to report 0 errors.
- [x] Confirm M6 accepts the approved `2027.0.0-ballot.rc1` prerelease.
- [ ] Record the upstream multilingual search-form issue and its ownership.
- [ ] Obtain organizational release approval before removing retained legacy trees or publishing.
