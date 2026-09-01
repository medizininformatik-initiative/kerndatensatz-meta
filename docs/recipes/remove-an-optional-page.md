# Recipe: decide an optional page — remove it or keep it

Seven pages of the approved MII module menu are **optional (0..1)**; every module
lead decides each one. In the scaffold they are recognisable twice over: the menu
entry carries an **`(optional)` suffix** in both languages, and the page itself
carries an `OPTIONAL-PAGE` marker banner. The convention check (M9) fails a
release while any decision is still open, so an undecided option cannot ship
silently.

The optional pages: `researcher-guidance`, `extensions`, `search-parameters`,
`operations`, `value-sets`, `code-systems`, `metadata`.

## Goal

Either the page is gone from everywhere it is referenced, or it is kept and no
longer marked optional — in **both** languages, in one pass.

## A. Remove the page

For page `<p>` (e.g. `extensions`):

1. **Menu, both languages** — delete the `<li><a href="<p>.html">… (optional)</a></li>`
   line from `input/includes/menu.xml` **and** `input/translations/de/includes/menu.xml`
   (including the `OPTIONAL (0..1)` comment line above it).
2. **Pages tree** — delete the `<p>.md:` block (with its `title:`) from
   `sushi-config.yaml` `pages:`.
3. **Page files** — delete `input/pagecontent/<p>.md` **and**
   `input/translations/de/pagecontent/<p>.md`.
4. **Page-title catalogue** — delete the page's unit (the
   `#: ImplementationGuide.definition.page.title` entry whose `msgid` is the
   page's English title) from `input/translations/de/ImplementationGuide-*.po`.
5. Rebuild (`sushi .` + the IG Publisher, or push and let CI build) — the menu
   must show no gap, no link may 404, and `node scripts/convention-check.mjs`
   must report M9 PASS without the page.

## B. Keep the page

1. Remove the ` (optional)` suffix from its menu label in **both** menu.xml files
   (and the `OPTIONAL (0..1)` comment line).
2. Remove the `OPTIONAL-PAGE` marker banner from **both** page files.
3. Replace the scaffold text with the module's real content — the banner-free
   page is now mandatory content like any other.

## Expected result

`node scripts/convention-check.mjs --release` passes M9: no page carries a
marker, no menu label carries `(optional)`. Every removal is reversible from git
history.
