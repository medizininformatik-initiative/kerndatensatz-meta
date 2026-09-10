## Verification (generated — do not retype)

Produced by `verify-migration.py` from the target tree AND `migration-log/run.log`, the two oracles. **69 IDENTISCH · 10 DIVERGIERT · 16 NICHT PRÜFBAR.**

Verdicts: **IDENTISCH** = matches the source · **DIVERGIERT** = differs, named below · **NICHT PRÜFBAR** = could not be checked, which is **not** a pass and owes a named human an action.

| Layer | Check | What it asks | IDENTISCH | DIVERGIERT | NICHT PRÜFBAR |
|---|---|---|---|---|---|
| conservation | C1 | every source artefact still exists in the migrated module | 1 | 0 | 0 |
| conservation | C2 | every artefact is reachable from the rendered Artifacts page | 2 | 0 | 0 |
| conservation | C3 | every source guide page was migrated or explicitly retired | 8 | 0 | 0 |
| conservation | C4 | the source's narrative text is present somewhere in the target | 1 | 4 | 3 |
| conservation | C5 | menus lead somewhere, and every page is in a menu | 3 | 0 | 1 |
| conservation | C6 | each text passage landed on the page the page map promised | 3 | 0 | 0 |
| conservation | C7 | content the migration wrote is marked as such in the guide | 0 | 2 | 2 |
| fidelity | F1 | module identity is unchanged (id, canonical, version, licence, ...) | 8 | 0 | 1 |
| fidelity | F2 | dependency versions are pinned exactly as the source pinned them | 1 | 0 | 3 |
| fidelity | F3 | the licence is asserted from evidence, never defaulted | 2 | 0 | 0 |
| fidelity | F4 | no mechanical FSH conversion residue is left | 1 | 0 | 0 |
| provenance | P1 | the rendered site reports the template package it was built with | 1 | 0 | 0 |
| provenance | P2 | the module-template ref the skeleton came from is the latest release | 1 | 0 | 0 |
| provenance | P3 | the IG Publisher version matches the workflow pin | 1 | 0 | 1 |
| provenance | P4 | the source guide was pinned to a published version, not 'current' | 0 | 0 | 1 |
| provenance | P5 | ig.ini points at the IG resource the build actually writes | 1 | 0 | 0 |
| rendering | R1 | tables, tabs and images render with content, not empty | 2 | 0 | 1 |
| rendering | R2 | page header and footer metadata render correctly | 0 | 4 | 0 |
| rendering | R3 | a translated page really differs from the default language | 1 | 0 | 0 |
| rendering | R4 | no links point at template example artefacts that were deleted | 0 | 0 | 1 |
| rendering | R5 | every page has a title unit in the translation catalogue | 1 | 0 | 0 |
| log | L0 | a run log exists at all | 1 | 0 | 0 |
| log | L1 | every partial-success warning was acted on | 1 | 0 | 0 |
| log | L2 | every expected step actually wrote a log line | 25 | 0 | 0 |
| log | L3 | no identity contradiction is still open | 3 | 0 | 0 |
| log | L4 | the log's counts agree with what the tree holds | 1 | 0 | 2 |

### DIVERGIERT — each one a stop or a recorded decision

| id | Check | What it asks | Subject | Evidence | Next action | Auto-fixable |
|---|---|---|---|---|---|---|
| `C4-3792cf` | C4 | the source's narrative text is present somewhere in the target | CodeSystem-MII-Standorte.page.md | 1 of 1 PROSE runs of the source page are in no target page (first: from CodeSystem where url = ' select Name:) | map the missing text to a target page section, or record the loss in the report's content map | no |
| `C4-767a0b` | C4 | the source's narrative text is present somewhere in the target | Liste-Kerndatensatz-Suchparameter/Index.page.md | 3 of 3 PROSE runs of the source page are in no target page (first: Auf dieser Seite sind alle im Kerndatensatz definierten Such…) | map the missing text to a target page section, or record the loss in the report's content map | no |
| `C4-9d5552` | C4 | the source's narrative text is present somewhere in the target | MII-IG-Meta/Index.page.md | 4 of 14 PROSE runs of the source page are in no target page (first: Dieser Leitfaden ist im Rahmen der Medizininformatik-Initati…); 6 generated table row(s) excluded -- migration replaces that view with the artefact page (R1 checks THAT) | map the missing text to a target page section, or record the loss in the report's content map | no |
| `C4-ef59ff` | C4 | the source's narrative text is present somewhere in the target | index.md | 1 of 1 PROSE runs of the source page are in no target page (first: # MII IG Modul Meta Feel free to modify this index page with…) | map the missing text to a target page section, or record the loss in the report's content map | no |
| `C7-cce47a` | C7 | content the migration wrote is marked as such in the guide | CodeSystem-mii-cs-meta-diz-standorte-intro | 1 of 1 prose runs of the source page CodeSystem-MII-Standorte.page.md are in no target page (C4), and CodeSystem-mii-cs-meta-diz-standorte-intro carries no DERIVED marker at all -- text was rewritten and the guide does not say so | mark the passage per spec section 9d (the DERIVED comment plus the visible box, in BOTH language mirrors), or restore the source wording; if the text was deliberately dropped, record that in migration-log/page-map.tsv instead | no |
| `C7-0209b1` | C7 | content the migration wrote is marked as such in the guide | index | 4 of 14 prose runs of the source page MII-IG-Meta/Index.page.md are in no target page (C4), and index carries no DERIVED marker at all -- text was rewritten and the guide does not say so | mark the passage per spec section 9d (the DERIVED comment plus the visible box, in BOTH language mirrors), or restore the source wording; if the text was deliberately dropped, record that in migration-log/page-map.tsv instead | no |
| `R2-afba10` | R2 | page header and footer metadata render correctly | output/de id="publish-box" [{{] | on 3 page(s), e.g. StructureDefinition-mii-pr-meta-searchparameter-definitions.html: e applications should not use a retired {{title}} without due consideration Primitive Valu… | rendered header/footer metadata defect -- qa.txt does not report it. Fix the metadata it renders (a jurisdiction code the template cannot resolve is the measured case) | no |
| `R2-48ed52` | R2 | page header and footer metadata render correctly | output/de id="ig-status" [{{] | on 1 page(s), e.g. searchform.html: Search {{title}} (Current Build) | rendered header/footer metadata defect -- qa.txt does not report it. Fix the metadata it renders (a jurisdiction code the template cannot resolve is the measured case) | no |
| `R2-16b769` | R2 | page header and footer metadata render correctly | output/en id="publish-box" [{{] | on 3 page(s), e.g. StructureDefinition-mii-pr-meta-searchparameter-definitions.html: e applications should not use a retired {{title}} without due consideration Primitive Valu… | rendered header/footer metadata defect -- qa.txt does not report it. Fix the metadata it renders (a jurisdiction code the template cannot resolve is the measured case) | no |
| `R2-d1da9a` | R2 | page header and footer metadata render correctly | output/en id="ig-status" [{{] | on 1 page(s), e.g. searchform.html: Search {{title}} (Current Build) | rendered header/footer metadata defect -- qa.txt does not report it. Fix the metadata it renders (a jurisdiction code the template cannot resolve is the measured case) | no |

### NICHT PRÜFBAR — not a pass; each needs a human

| id | Check | What it asks | Subject | Why not mechanisable | Who does what |
|---|---|---|---|---|---|
| `C4-5e068d` | C4 | the source's narrative text is present somewhere in the target | Extension-Lizenzbedingungen.page.md | the source page embeds an element-tree rendering (5 occurrences of the renderer's marker); 2 of 2 runs are in no target page, but prose and rendered view cannot be told apart in it | read the page against its target: migration replaces the VIEW with the artefact page (R1), so only its prose has to be conserved -- and only a human can say which is which here |
| `C4-f51695` | C4 | the source's narrative text is present somewhere in the target | Profil-SearchParameter.page.md | the source page embeds an element-tree rendering (5 occurrences of the renderer's marker); 0 of 2 runs are in no target page, but prose and rendered view cannot be told apart in it | read the page against its target: migration replaces the VIEW with the artefact page (R1), so only its prose has to be conserved -- and only a human can say which is which here |
| `C4-2a8dbd` | C4 | the source's narrative text is present somewhere in the target | Technische-Implementierung/Index.page.md | the source page carries NO prose -- 0 generated table row(s) only | conservation of a generated view is not a text question; confirm the artefact page replaces it (R1) |
| `C5-2d86b5` | C5 | menus lead somewhere, and every page is in a menu | target pages without a source counterpart | references/template-pages.tsv is measured at module-template v0.11.1, but this module vendors v0.13.1 -- a stale manifest produces confident wrong findings in both directions | re-measure template-pages.tsv at the vendored tag (record the tag in the third column), then re-run |
| `C7-bc0345` | C7 | content the migration wrote is marked as such in the guide | Extension-Lizenzbedingungen.page.md | C4 could not tell this page's prose from its embedded element-tree rendering, so whether anything was rewritten here is not measured | read the page against its target (the same human action C4 asks for) and mark whatever the migration wrote per spec section 9d |
| `C7-65e91c` | C7 | content the migration wrote is marked as such in the guide | Profil-SearchParameter.page.md | C4 could not tell this page's prose from its embedded element-tree rendering, so whether anything was rewritten here is not measured | read the page against its target (the same human action C4 asks for) and mark whatever the migration wrote per spec section 9d |
| `F1-6cbfea` | F1 | module identity is unchanged (id, canonical, version, licence, ...) | version | target 2027.0.0-ballot.rc3 vs source 2026.0.0 -- the target version is a human decision (spec 2.1) | confirm the target version at Gate A and record it |
| `F2-fd0e73` | F2 | dependency versions are pinned exactly as the source pinned them | hl7.fhir.uv.crmi | target-only dependency 2.0.0 (not in the source) | confirm at Gate A that this is template machinery (hl7.fhir.uv.crmi is) and not an accidental addition |
| `F2-047205` | F2 | dependency versions are pinned exactly as the source pinned them | hl7.fhir.uv.extensions.r4 | target-only dependency 5.2.0 (not in the source) | confirm at Gate A that this is template machinery (hl7.fhir.uv.crmi is) and not an accidental addition |
| `F2-8f9355` | F2 | dependency versions are pinned exactly as the source pinned them | hl7.terminology.r4 | target-only dependency 7.1.0 (not in the source) | confirm at Gate A that this is template machinery (hl7.fhir.uv.crmi is) and not an accidental addition |
| `P3-c39a79` | P3 | the IG Publisher version matches the workflow pin | IG Publisher currency | the publisher reports itself out of date (current 2.3.3) | upgrading the publisher is a target-repository decision, not a migration one -- record it, do not act on it here |
| `P4-379bde` | P4 | the source guide was pinned to a published version, not 'current' | source guide version | no `?version=` recorded in the run log or the harvest manifest | record the pinned, PUBLISHED guide version like the source commit SHA (spec 5.1c.3) |
| `R1-76f413` | R1 | tables, tabs and images render with content, not empty | source-versus-target rendering | no harvested source HTML (./migration-log/guide-harvest/html) and/or no page map | harvest with --keep-html and write the page map; without a source rendering, 'non-empty where non-empty in the source' has no reference |
| `R4-84ad62` | R4 | no links point at template example artefacts that were deleted | template example links | references/template-artifacts.tsv is verified at module-template v0.11.1, but this module vendors v0.13.1 -- a stale token list looks for the wrong scaffolding in both directions | re-verify the token list at the vendored tag (update the `# template_tag:` header), then re-run |
| `L4-106e61` | L4 | the log's counts agree with what the tree holds | conversion count | no `gofsh-convert … actual=` line in the log | shape B only; for shape A there is nothing to convert |
| `L4-f17740` | L4 | the log's counts agree with what the tree holds | page count | no harvested count in the log and/or no harvest manifest | harvest the guide (step 2c) where the narrative is not in the repo |

**Inputs:** target `.` · source `/tmp/kerndatensatz-meta-source-baseline.CD9uWM` · rendered `/Users/julian/git/kerndatensatz-meta/output` · log `./migration-log/run.log`
