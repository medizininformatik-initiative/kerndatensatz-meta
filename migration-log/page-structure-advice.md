# Page-structure advice

**This report PROPOSES and never edits a module.** It reads the source and target repositories read-only; its only writes are this report and the page-map v2 TSV (`--map`) - the map is the PRIMARY output and the contract step 5 consumes, this report is its rendering. Every routing row below is the branch the MEASUREMENTS support - a human (or the skill at step 5) decides and applies it.

| Input | Value |
| --- | --- |
| source repo | `/tmp/kerndatensatz-meta-source-baseline.CD9uWM` |
| target repo | `.` |
| routing table | `/Users/julian/.agents/skills/mii-ig-migration/references/routing-table.tsv` (17 patterns) |
| Gate 0 preflight | `/Users/julian/git/kerndatensatz-meta/migration-log/preflight-analysis.json` |
| artefact census | fsh-generated/resources (176 resources; cross-checked by Gate 0's generated_crosscheck) |
| page map | `migration-log/page-map.tsv` |
| generated | 2026-08-31T13:15:07Z |
| script | `page-structure-advice.py` v1.3.0 |

Contract limits in force: menu total <= 33, dropdown children <= 10, top level <= 8, menu depth <= 2; size gate at > 2500 words, > 4 merged sources, or ANY repeated heading title; hub at >= 3 children.

## 1. Source page tree

The tree is taken from the FIRST of four inputs that yields pages: **(a)** the `pages:` block of the source `sushi-config.yaml`, **(b)** the authoritative Simplifier guide tree under `implementation-guides/` (spec 5.1a), **(c)** a flat count of `input/pagecontent/*.md`.

**Input used: (b) the Simplifier guide tree `implementation-guides/ImplementationGuide-2025`, walked from its `toc.yaml`.**

### 1.0 Simplifier guide trees found

Every tree under `implementation-guides/` is listed - the choice is never made silently. Dispositions follow spec 5.1a: #1 authoritative, #2 parallel-language harvest seed, #3 historical/shared retained, #4 unrecognized.

| Guide tree | Title | Version (dir name) | Version (guide.yaml) | Lang | `*.page.md` on disk | Disposition |
| --- | --- | --- | --- | --- | ---: | --- |
| `ImplementationGuide-2025` | MII IG Meta v2026 | 2025 | 2026.0.0 | - | 7 | **AUTHORITATIVE** - steps 5.4/5.5 operate on this tree |
| `ImplementationGuide-Common` | - | - | - | - | 0 | unrecognized directory - needs a retain/retire proposal (5.1a #4) |
| `MedizininformatikInitiative-ImplementationGuide-Template` | Medizininformatik Initiative - ImplementationGuide - Template 2023+ | - | 2.0 | - | 16 | shared assets - retain unchanged (5.1a #3) |

**Chosen: `ImplementationGuide-2025`** - HUMAN OVERRIDE: --guide-tree ImplementationGuide-2025 (the spec 5.1a ranking below was not applied).

The module's narrative language read from `sushi-config.yaml` `language:` is **not stated**.

**A human can override this choice**: re-run with `--guide-tree <directory name>`. The ranking above is evidence, not a verdict - confirm it against the rendered IG and record it in the inventory (Gate B reviews it).

### 1.1 Depth histogram

Walked from `implementation-guides/ImplementationGuide-2025/toc.yaml`: an entry whose `filename` ends in `.page.md` is a page, any other `filename` is a sub-directory holding its own `toc.yaml`. A sub-directory is a LEVEL, not a page, so every page of one directory shares one level (that is how Simplifier renders a folder), and the levels are shifted so the shallowest page sits at level 1 - this guide's root `toc.yaml` lists only a folder, which adds no page level. Routing still needs a page parent, so each directory is represented by its `Index.page.md` and its remaining pages plus its sub-folders' representatives become that page's children; a parent may therefore share its children's level.

| Level | Pages | Share |
| --- | ---: | ---: |
| 1 | 2 | 29% |
| 2 | 4 | 57% |
| 3 | 1 | 14% |
| **total** | **7** | 100% |

Maximum depth used: **3**. Total words across the 7 source pages: **752**. Pages in `input/pagecontent/`: **1**.

### 1.2 Parent-child tree

```
`- Index  `MII-IG-Meta/Index.page.md`
   |- Release Notes  `MII-IG-Meta/Release-notes.page.md`
   `- Index  `MII-IG-Meta/Technische-Implementierung/Index.page.md`
      |- CodeSystem: MII Standorte  `MII-IG-Meta/Technische-Implementierung/CodeSystem-MII-Standorte.page.md`
      |- Extension: Lizenzbedingungen  `MII-IG-Meta/Technische-Implementierung/Extension-Lizenzbedingungen.page.md`
      |- Profil: SearchParameter   `MII-IG-Meta/Technische-Implementierung/Profil-SearchParameter.page.md`
      `- Index  `MII-IG-Meta/Technische-Implementierung/Liste-Kerndatensatz-Suchparameter/Index.page.md`
```

## 2. Target page measurements

Words = whitespace tokens after removing HTML comments, table separator rows and the markup characters `>`, `|`, `*`, `_`, `` ` ``. Headings, list items, table cells and fenced code all count: the gate measures what the reader has to traverse. Repeated titles are compared case-sensitively; each repeat costs one publisher-appended anchor (`-2`, `-3`, ...). Merged sources are the distinct `<!-- source: X.md -->` section markers the migration itself left behind.

| Page | Words | h2 | h3 | h4 | other h | Repeated titles | Anchor collisions | Merged sources | Size gate |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | --- |
| `ImplementationGuide-mii-ig-meta.md` | 286 | 0 | 5 | 0 | 0 | 0 | 0 | 0 | ok |
| `capability-statements.md` | 31 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | ok |
| `changes.md` | 560 | 0 | 1 | 1 | 1 | 0 | 0 | 0 | ok |
| `code-systems.md` | 148 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | ok |
| `downloads.md` | 325 | 0 | 0 | 7 | 0 | 0 | 0 | 0 | ok |
| `examples.md` | 43 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | ok |
| `extensions.md` | 121 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | ok |
| `guidance.md` | 130 | 0 | 2 | 0 | 0 | 0 | 0 | 0 | ok |
| `implementer-guidance.md` | 32 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | ok |
| `index.md` | 17 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | ok |
| `logical-models.md` | 33 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | ok |
| `metadata.md` | 2198 | 0 | 1 | 7 | 1 | 0 | 0 | 0 | ok |
| `operations.md` | 104 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | ok |
| `profiles.md` | 77 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | ok |
| `researcher-guidance.md` | 111 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | ok |
| `search-parameters.md` | 112 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | ok |
| `security-and-privacy.md` | 444 | 0 | 0 | 3 | 0 | 0 | 0 | 0 | ok |
| `translationinfo.md` | 80 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | ok |
| `uml-diagrams.md` | 42 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | ok |
| `value-sets.md` | 178 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | ok |
| `version-history.md` | 548 | 0 | 0 | 6 | 0 | 0 | 0 | 0 | ok |

## 3. Menu budget

Clickable entries are the menu's real destinations: every `<li><a>` except the dropdown toggles, which only repeat their first child's href.

| Metric | Measured | Contract limit | Headroom |
| --- | ---: | ---: | ---: |
| total clickable entries | 26 | 33 | 7 |
| widest dropdown (Artifacts) | 11 | 10 | -1 |
| top-level entries | 7 | 8 | 1 |
| menu depth used | 2 | 2 | 0 |

| Dropdown | Children | Free (of 10) |
| --- | ---: | ---: |
| Guidance | 5 | 5 |
| Conformance | 5 | 5 |
| Artifacts | 11 | -1 |
| Metadata | 2 | 8 |

After the proposals in section 4: total 7 free, top level 1 free, freest dropdown Metadata (8 free).

## 4. Routing proposal (spec 9d/9e)

One row per source page. The branch number is the spec's; the measurement column is the number that forced it. Branch-4 rows state the presentation (4a) and the visibility (4b), and, where a menu entry fits, the remaining budget after it. `Words` is the source page's own size, counted the same way as the target pages in section 2.

| # | Source page | Lvl | Children | Words | Branch | Proposed destination | Measurement |
| ---: | --- | ---: | ---: | ---: | --- | --- | --- |
| 1 | `MII-IG-Meta/Index.page.md` | 1 | 2 | 260 | 3 merge into agreed page | index.md | agreed page named 'index' exists in the target |
| 2 | `MII-IG-Meta/Release-notes.page.md` | 1 | 0 | 154 | 3 merge into agreed page | changes.md | semantic match 'releasenotes' -> changes (routing-table) |
| 3 | `MII-IG-Meta/Technische-Implementierung/Index.page.md` | 2 | 4 | 3 | 2 section on index page | h3/h4 section on code-systems.md <br>_(folder landing page - NOT matched against the target's index.md or an artefact id; routed by its own children)_ | 4 children, 2 anchoring distinct artefacts (CodeSystem) |
| 4 | `MII-IG-Meta/Technische-Implementierung/CodeSystem-MII-Standorte.page.md` | 2 | 0 | 35 | 1 intro-note | input/intro-notes/CodeSystem-mii-cs-meta-diz-standorte-intro.md | tokens match on mii-cs-meta-diz-standorte (1 candidate artefact) |
| 5 | `MII-IG-Meta/Technische-Implementierung/Extension-Lizenzbedingungen.page.md` | 2 | 0 | 116 | 2 section on index page | h3/h4 section on code-systems.md | child of family overview MII-IG-Meta/Technische-Implementierung/Index.page.md (no anchor of its own) |
| 6 | `MII-IG-Meta/Technische-Implementierung/Profil-SearchParameter.page.md` | 2 | 0 | 121 | 1 intro-note | input/intro-notes/StructureDefinition-mii-pr-meta-searchparameter-intro.md | tokens match on mii-pr-meta-searchparameter (1 candidate artefact) |
| 7 | `MII-IG-Meta/Technische-Implementierung/Liste-Kerndatensatz-Suchparameter/Index.page.md` | 3 | 0 | 63 | 2 section on index page | h3/h4 section on code-systems.md <br>_(folder landing page - NOT matched against the target's index.md or an artefact id; routed by its own children)_ | child of family overview MII-IG-Meta/Technische-Implementierung/Index.page.md (no anchor of its own) |

Branch totals: 1 intro-note = 2, 2 section on index page = 3, 3 merge into agreed page = 2.

## 5. Report queue 1 items

_None from the menu budget._

## 6. Suggested `5.4c page-routing` run-log lines

One per source page (union pages included), ready for the migration run log. The `5.4c page-routing` step IS the advice run that GENERATES the page map (`--map`) - the map is machine-written, never hand-written; these lines are only its run-log form.

```
5.4c page-routing	MII-IG-Meta/Index.page.md	branch=3	index.md	agreed page named 'index' exists in the target
5.4c page-routing	MII-IG-Meta/Release-notes.page.md	branch=3	changes.md	semantic match 'releasenotes' -> changes (routing-table)
5.4c page-routing	MII-IG-Meta/Technische-Implementierung/Index.page.md	branch=2	h3/h4 section on code-systems.md	4 children, 2 anchoring distinct artefacts (CodeSystem)
5.4c page-routing	MII-IG-Meta/Technische-Implementierung/CodeSystem-MII-Standorte.page.md	branch=1	input/intro-notes/CodeSystem-mii-cs-meta-diz-standorte-intro.md	tokens match on mii-cs-meta-diz-standorte (1 candidate artefact)
5.4c page-routing	MII-IG-Meta/Technische-Implementierung/Extension-Lizenzbedingungen.page.md	branch=2	h3/h4 section on code-systems.md	child of family overview MII-IG-Meta/Technische-Implementierung/Index.page.md (no anchor of its own)
5.4c page-routing	MII-IG-Meta/Technische-Implementierung/Profil-SearchParameter.page.md	branch=1	input/intro-notes/StructureDefinition-mii-pr-meta-searchparameter-intro.md	tokens match on mii-pr-meta-searchparameter (1 candidate artefact)
5.4c page-routing	MII-IG-Meta/Technische-Implementierung/Liste-Kerndatensatz-Suchparameter/Index.page.md	branch=2	h3/h4 section on code-systems.md	child of family overview MII-IG-Meta/Technische-Implementierung/Index.page.md (no anchor of its own)
5.4c page-routing	index.md	branch=3	index.md	agreed page named 'index' exists in the target
5.4c page-routing	map rows=10 retired=2 coverage=ok	map=migration-log/page-map.tsv
```

## 7. Page map (v2) and coverage

The page map is the CONTRACT of the narrative migration: this run generates and validates it, step 5 consumes ONLY it, step 8 checks against it. Columns: `source_page`, `target` (repo-relative path or `RETIRED`), `reason`, `branch` (spec 9e 1-4; 5 = RETIRED), `measure`. One row per page of the source page universe - the authoritative guide tree UNION `input/pagecontent` UNION on-disk pages no toc lists.

Rows: **10** total - 8 routed source pages (7 from the primary tree, 1 union pages outside it) and 2 RETIRED guide-tree summary row(s).

### 7.1 Union pages outside the primary tree

Pages of the universe the primary page tree does not list - routed by the same passes, after it (menu budget included).

| Source page | Branch | Target | Measurement |
| --- | --- | --- | --- |
| `index.md` | 3 | `input/pagecontent/index.md` | agreed page named 'index' exists in the target <br>_(union page: in input/pagecontent but not in the primary page tree)_ |

### 7.2 RETIRED guide trees

| Tree | Reason |
| --- | --- |
| `ImplementationGuide-Common/**` | unrecognized directory - needs a retain/retire proposal (5.1a #4) |
| `MedizininformatikInitiative-ImplementationGuide-Template/**` | shared assets - retain unchanged (5.1a #3) |

### 7.3 Coverage validation

Universe re-derived from disk: **8** page(s). Every one needs a row with a non-empty target; every RETIRED row needs a reason. The exit code reports the result (0 covered, 1 not).

**Covered.** All 8 universe pages have a target row; every RETIRED row carries a reason.

## 8. M9 optional-page / other-bucket proposal (Gate 0 census)

Counts: generated_crosscheck.counts (fsh-generated/resources). Rule (spec 9a): count 0 -> REMOVE the optional page, count > 0 -> KEEP and fill it; artefacts are never deleted to force a removal. Each proposal is a `5.4a` run-log line and a HUMAN decision - this table only measures.

| Optional page | Census key | Count | Proposal |
| --- | --- | ---: | --- |
| `extensions.md` | `extensions` | 1 | **KEEP** (fill it, delete the banner + OPTIONAL-PAGE marker in both languages) |
| `search-parameters.md` | `searchparameters` | 170 | **KEEP** (fill it, delete the banner + OPTIONAL-PAGE marker in both languages) |
| `operations.md` | `operations` | 0 | **REMOVE** per the template's docs/optional-pages.md procedure |
| `value-sets.md` | `valuesets` | 0 | **REMOVE** per the template's docs/optional-pages.md procedure |
| `code-systems.md` | `codesystems` | 1 | **KEEP** (fill it, delete the banner + OPTIONAL-PAGE marker in both languages) |
| `researcher-guidance.md` | - | - | no artefact count decides it - source narrative does (human decision) |
| `metadata.md` | - | - | no artefact count decides it - source narrative does (human decision) |

_The census reports no `other`-bucket artefact types._

Declared-vs-generated mismatches Gate 0 reports (2) - the GENERATED counts above are the authoritative ones: `examples` 5->2, `searchparameters` 167->170.

