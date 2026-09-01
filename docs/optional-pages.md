# Optional pages — the (0..1) menu entries and how to decide them

> **How-to:** the step-by-step removal/keep procedure lives in
> [docs/recipes/remove-an-optional-page.md](recipes/remove-an-optional-page.md).

The MII-agreed module menu structure (see [page-structure.md](page-structure.md))
gives every entry a cardinality: **(1..1)** entries are mandatory in every
module, **(0..1)** entries are per-module decisions. This document is the
decision checklist for the optional entries and the exact removal procedure per
entry.

## How optional entries are marked

Every optional page ships in **three visible forms**, chosen to fit the
scaffold's existing conventions (placeholder table, `[TODO]` banners, the
convention check):

1. **In the rendered preview** — a banner at the top of the page ("Optional
   page (0..1)…", `ig-highlight` style, in both languages), so a module lead
   reviewing the preview sees the open decision without reading source.
2. **In the source** — an `OPTIONAL-PAGE` HTML comment in the page file (both
   languages) and `OPTIONAL (0..1)` comments at the menu entries
   (`input/includes/menu.xml`, `input/translations/de/includes/menu.xml`) and
   in the `sushi-config.yaml` `pages:` tree.
3. **In CI** — the convention check's rule **M9**
   (`scripts/convention-check.mjs`): on development branches it *reports* the
   pages still carrying the marker (green, visible in the job summary); on a
   `release/**` branch an undecided marker **fails** the check, so an undecided
   option cannot ship silently. A marker present in only one language fails on
   every branch (a half-applied decision).

> **Why a marker string and not a file list:** the decision state lives in the
> page itself, so deleting the banner *is* recording the decision — there is no
> second registry to update, and the check can never disagree with the page.

## The decision checklist

| Menu entry (cluster) | Page | Keep it when … | Drop it when … |
| --- | --- | --- | --- |
| Guidance for Researchers (Guidance) | `researcher-guidance.md` | your module's data needs research-specific interpretation notes | the guidance page covers everything |
| Extensions (Artifacts) | `extensions.md` | the module defines its own extensions | it defines none |
| Search Parameters (Artifacts) | `search-parameters.md` | the module defines its own search parameters | it defines none (cross-module ones live in the Meta module) |
| Operations (Artifacts) | `operations.md` | the module defines FHIR operations | it defines none |
| Value Sets (Artifacts) | `value-sets.md` | the module defines ValueSets | it defines none |
| Code Systems (Artifacts) | `code-systems.md` | the module defines CodeSystems | it defines none |
| Metadata Overview (Metadata) | `metadata.md` | the module's profiles carry the CRMI metadata characteristics the page documents (e.g. the Base module) | the metadata story is fully told by [Versioning](../input/pagecontent/version-history.md) |

## Decision A — KEEP the page (one step)

Delete the optional-page **banner block and the `OPTIONAL-PAGE` marker
comment** from

- `input/pagecontent/<page>.md` **and**
- `input/translations/de/pagecontent/<page>.md`

then fill in the page's `[TODO]` blocks as usual. (The `OPTIONAL (0..1)`
comments in the menu files and `sushi-config.yaml` may stay or go — they are
not checked; removing them keeps the source tidy.)

## Decision B — REMOVE the page (one commit, five touches)

For any optional page `<page>.md` remove, in the same commit:

1. **both page files** —
   `git rm input/pagecontent/<page>.md input/translations/de/pagecontent/<page>.md`
2. **both menu entries** — the `<li>` (and its `OPTIONAL` comment line) in
   `input/includes/menu.xml` **and**
   `input/translations/de/includes/menu.xml`
3. **the `pages:` entry** — the two lines (`<page>.md:` + `title:`) in
   `sushi-config.yaml`
4. **the `.po` unit** — the page's `msgid`/`msgstr` block in
   `input/translations/de/ImplementationGuide-<your-ig-id>.po`
5. **inbound links** — grep the remaining pages for `<page>.html` and reroute
   (`git grep -n '<page>.html' input/`). The scaffold's known cross-links:
   `profiles.md` ↔ `extensions.md` and `value-sets.md` ↔ `code-systems.md`
   link each other in both languages — when you remove one of a pair, drop the
   sentence that links it from its partner.

Then build once (or push and let CI build): the publisher fails loudly on a
menu entry without a page, and its link QA reports any link you missed — the
five touches above are exactly the places a page is wired in.

### Per-entry notes

- **`metadata.md`**: the *Metadata* dropdown parent in both menu files already
  points at `version-history.html` (the mandatory child) precisely so this
  page can be removed without re-targeting the parent — no extra step.
- **`researcher-guidance.md`**: `index.md` (both languages) points researchers
  at this page from the *Target audience* box — reroute that link (e.g. to
  `guidance.html`), step 5 catches it.
- **`extensions.md` / `value-sets.md` / `code-systems.md` /
  `search-parameters.md` / `operations.md`**: partner links per step 5; no
  other wiring.

## Relationship to the demo page (M8)

`rendering-artifacts.md` is **not** an optional menu entry — it is the
scaffold's demonstration page with its own release gate (M8) and removal list
(see `docs/recipes/render-existing-artifacts.md`). The mechanisms are
deliberately parallel: both are visible in development and fail a release.
