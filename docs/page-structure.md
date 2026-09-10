# Page structure — the agreed KDS module menu (and who owns it)

> **"MII" naming policy.** MII funding ends 2026 and NUM-DIZ takes over, so
> every MII mention may be re-evaluated. In page content, "MII" appears only
> in **proper names and identifiers** (the *MII Core Dataset /
> MII-Kerndatensatz*, the *MII Broad Consent*, the `MII_*` naming
> conventions, package ids, canonical URLs, org/site links) and **past-tense
> provenance**. Ongoing processes, scope and governance are phrased
> time-robustly: "KDS-wide", "the Meta module", "the governance bodies of the
> core-dataset process". Do not write MII as the acting institution of a
> present-tense sentence. (Same rule in the IG template's styleguide §6.)

> **Repository links in pages.** Rendered pages link repository files through
> the `{{GITHUB_ORG}}/{{REPO_NAME}}` placeholders (a created module links its
> own repository from day one; the template's own demo substitutes the
> documented self-check values, which name the target organisation — those
> links resolve only after the move, and the IG Publisher reports them under
> broken links in `qa.html`; CI deliberately does not gate on that count).
> Links to `kerndatensatz-meta`/`kerndatensatz-basis` are plain URLs — those
> repos exist today.

**Ownership (Option A).** The KDS module IG **page structure** — which pages
exist and the navigation menu — lives **here, in the module template**,
alongside the page content. The IG template (`ig-template-mii-kds`) is
**presentation-only** (header, footer, CSS, logo); it does not define or own
the page set.

> **Why:** this is standard FHIR practice — a template provides *presentation*,
> an IG provides *content and structure*. It is also the simplest: everything a
> module needs is in one place, there is nothing to sync against another repo,
> and a module author edits the menu and pages directly.
> *(The alternative considered was Option B — the IG template owns a canonical
> `structure/` that modules mirror + re-sync. It was set aside because the IG
> Publisher cannot inject a template menu automatically, so Option B would add
> a cross-repo sync burden for no rendered difference.)*

## The agreed structure

The menu implements the TF-KDS-agreed module menu structure (agreed in the
template discussion, 2026). **(1..1)** = mandatory in every module; **(0..1)**
= optional, decided per module — see [optional-pages.md](optional-pages.md)
for the decision checklist and the per-entry removal procedure.

| Menu entry | Card. | Target |
| --- | --- | --- |
| Home | 1..1 | `index.html` |
| **Guidance** | 1..1 | dropdown (parent → `guidance.html`) |
| — Guidance | 1..1 | `guidance.html` |
| — Guidance for Researchers | 0..1 | `researcher-guidance.html` |
| — Guidance for Implementers | 1..1 | `implementer-guidance.html` |
| — Datasets and Descriptions | 1..1 | **link-only** → `logical-models.html` (same target as *Artifacts → Logical Models*; NEITHER Artifacts-Summary anchor is usable — see below) |
| — UML Diagrams | 1..1 | `uml-diagrams.html` |
| **Conformance** | 1..1 | dropdown (parent → Meta-module Conformance, external) |
| — Conformance | 1..1 | **link-only** → Meta module (interim: meta wiki `Conformance`) |
| — General Requirements | 1..1 | **link-only** → Meta module (interim: `Conformance#anforderungsdokumentation`) |
| — Must Support | 1..1 | **link-only** → Meta module (interim: `Conformance#must-support-ms`) |
| — Handling Missing Data | 1..1 | **link-only** → Meta module (interim: `Conformance#fehlende-daten`) |
| — Security and Privacy | 1..1 | `security-and-privacy.html` (three-stage static content: overarching data protection concept → DIMP → module-specific aspects; stage 3's CONTENT is optional — a module without own aspects adopts the section's default text, and the scaffold's highlighted *Person* example must be removed before the first release, gated by convention check M11) |
| **Artifacts** | 1..1 | dropdown (parent → `artifacts.html`) |
| — Artifacts Summary | 1..1 | `artifacts.html` (generated) |
| — Profiles | 1..1 | `profiles.html` |
| — Extensions | 0..1 | `extensions.html` |
| — Capability Statements | 1..1 | `capability-statements.html` |
| — Search Parameters | 0..1 | `search-parameters.html` |
| — Operations | 0..1 | `operations.html` |
| — Logical Models | 1..1 | `logical-models.html` |
| — Value Sets | 0..1 | `value-sets.html` |
| — Code Systems | 0..1 | `code-systems.html` |
| — Examples | 1..1 | `examples.html` |
| — Rendering Artifacts (demo) | scaffold-only | `rendering-artifacts.html` — not part of the agreed structure; removed before release (convention check M8) |
| Downloads | 1..1 | `downloads.html` |
| Changelog | 1..1 | `changes.html` |
| **Metadata** | 1..1 | dropdown (parent → `version-history.html` — the mandatory child, so the optional overview can be removed without re-targeting) |
| — Metadata Overview | 0..1 | `metadata.html` |
| — Versioning | 1..1 | `version-history.html` |

Not in the menu but in the `pages:` tree: `translationinfo.md` (linked from the
translation banner) and `ImplementationGuide-mii-ig-<slug>.md` — the
hand-authored intro of the generated ImplementationGuide resource page
(dependency table via `{% lang-fragment dependency-table.xhtml %}`,
cross-version analysis, global profiles, copyright statements — the
kerndatensatz-basis idiom; linked from the Home page's Contents list).

## Link-only entries — the two mechanisms

**Datasets and Descriptions → `logical-models.html`.** The module's datasets
ARE its logical models, so the entry shares its target with *Artifacts →
Logical Models* — two menu paths, one stable page. The TF-KDS instruction's
literal target — the Logical-Models section of the Artifacts Summary
("Sec. 15.0.2" in kerndatensatz-basis) — has **no usable link target** with
the current tooling; both anchor kinds were tried and rejected:

- **The numeric anchor `#2` is positional.** The IG Publisher derives
  `IG.definition.grouping` from the artifact categories present in the input;
  the base template's `createArtifactSummary.xslt` renders one section per
  grouping (heading text from the pinned `stringsArtifacts-<lang>.po`
  catalogs) and emits `<a name="{position()}">` — the grouping's index. `#2`
  is the Logical-Models section only for the full standard artifact set: the
  optional Operations/Search Parameters insert Behavior groupings before it,
  a missing CapabilityStatement pulls it forward, explicit `groups:` reorder
  freely. The scaffold's own preview rendered `#2` = Example Instances.
- **The named anchor `#structures-logical-models` (DE:
  `#strukturen-logische-modelle`) exists only at runtime.** The base template
  ships AnchorJS (`anchor-hover.js` → `anchors.add()`), which slugifies the
  section headings into ids **in the browser** — the fragment scrolls
  correctly for a human. But the IG Publisher's link validator sees only the
  build-time anchors: it flags the menu link as a **broken-link ERROR on
  every page's QA report** (~40 repetitions) and injects a marker anchor
  (`<a name="lNNN">`) into the menu `<li>`, which Bootstrap renders as an
  **empty menu entry**. Shipped briefly in v0.10.2, reverted on review.

Should TF-KDS insist on the literal summary-section target, the durable
route is upstream: `fhir2.base.template`'s XSLT emitting a build-time named
anchor per grouping (e.g. `<a name="structures-logical-models">`) — then the
validator knows it and the QA stays clean. This template must not override
`scripts/` (styleguide §1), so that fix belongs in the base template.

**The Conformance cluster → the Meta module (INTERIM meta-wiki links).** The
KDS-wide conformance rules are maintained centrally in
[`kerndatensatz-meta`](https://github.com/medizininformatik-initiative/kerndatensatz-meta);
per the agreed structure, modules link them instead of restating them. The Meta
module currently has **no published IG rendering** (only a CI build without
conformance pages), so the menu links point at the authoritative wiki page
sections:

| Menu entry | Interim target |
| --- | --- |
| Conformance | `…/kerndatensatz-meta/wiki/Conformance` |
| General Requirements | `…/wiki/Conformance#anforderungsdokumentation` |
| Must Support | `…/wiki/Conformance#must-support-ms` |
| Handling Missing Data | `…/wiki/Conformance#fehlende-daten` |

> **Gate item:** when the Meta module publishes a stable IG rendering with its
> own Conformance / General Requirements / Must Support / Handling Missing Data
> menu entries, switch the four links (both menu files, plus the Conformance
> mentions on `index.md` and `guidance.md`, both languages) to those pages. Do
> not invent the URLs before they exist.

## Retired pages (explicit retirement, no redirects)

The agreed structure replaced the earlier combined pages. The old pages are
**retired**, not redirected: GitHub Pages previews carry no server-side
redirects, the scaffold's rendered output is a preview (not a published
canonical), and stub pages would re-enter the menu QA, the `pages:` tree and
the `.po` catalogue that the split exists to clean up. Modules that already
**formally published** the old URLs keep those URLs alive through their own
publication history (the publisher's versioned archive); new publications use
the new page set.

| Old page (≤ template v0.6.x) | Where it went |
| --- | --- |
| `profiles-and-extensions.md` | split → `profiles.md` + `extensions.md` |
| `search-parameters-and-operations.md` | split → `search-parameters.md` + `operations.md` |
| `terminology.md` | split → `value-sets.md` + `code-systems.md` (SU-TermServ note → Code Systems, expansion note → Value Sets) |
| `datasets-and-descriptions.md` | page removed → menu **link** to the Artifacts Summary's Logical-Models section (describe the data elements in the Logical Models' own narrative/intros) |
| `conformance.md` | page removed → menu **link** to the Meta module |
| `general-requirements.md` | page removed → menu **link** to the Meta module |
| `must-support.md` | page removed → menu **link** to the Meta module |
| `missing-data.md` | page removed → menu **link** to the Meta module |
| — | `changes.md` moved from under Versioning to a **top-level** Changelog entry; `metadata.md` + `version-history.md` now form the **Metadata** dropdown |

**Where module-specific conformance statements go now:** the retired pages
carried the `§<id>:…§` conformance-statement markers and the `§§§` summary
table (an IG-Publisher feature, see
[HL7 ig-guidance](https://build.fhir.org/ig/FHIR/ig-guidance/conformance-statements.html)).
The scaffold no longer ships marked statements — the MII-wide rules they marked
live in the Meta module now. A module that states its *own* normative
requirements (typically on `security-and-privacy.md` or an artifact page) may
still mark them with `§<page>-<n>:…§` on the **English** page and render a
table with a `§§§` paragraph; the Expectation column derives from the English
SHALL/SHOULD/MAY keywords (see [maintenance.md](maintenance.md), "Verified by
observation").

## What this means in practice

- The `pages:` block in `sushi-config.yaml` and the menu files are owned and
  edited by the module — but the **mandatory (1..1) entries are the agreed
  MII structure**: keep them; decide the (0..1) entries per
  [optional-pages.md](optional-pages.md).
- The **menu** is maintained as `input/includes/menu.xml` (English, the default
  language) plus a German translation at
  `input/translations/de/includes/menu.xml` — not via the `menu:` property,
  which cannot be translated. Update both files, the `pages:` tree and the
  IG-level `.po` catalogue together (same commit).
- The IG template carries no `structure/` folder and no page set; there is no
  structure-sync step.
