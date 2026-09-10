# Recipe: extend the translations of your module IG (menu, footer, content, resources, page titles)

**Goal.** Add or extend a translation for any part of your module IG — the
navigation **menu**, the **footer / base UI chrome**, the **narrative content**,
the **conformance resources**, and the **page titles, breadcrumbs and table of
contents**.

**Prerequisites.**

- A module that builds ([create a new module](create-a-new-module.md)).
- The language must be declared in `sushi-config.yaml`: listed under
  `i18n-lang`, **and** its source folder listed under the
  `translation-sources` parameter. `de` ships pre-declared:

  ```yaml
  parameters:
    i18n-default-lang: en
    i18n-lang:
      - de
    translation-sources:
      - input/translations/de
  ```

  A folder that is not in `translation-sources` is never read — no warning, no
  error, the translation simply does not appear.

The five layers are independent — translate only the ones you need.

**Language policy.** This module is **English-default with a German translation**,
the same model as kerndatensatz-basis: English is the default rendering
language (`i18n-default-lang: en`), German
the recommended second rendering (`i18n-lang: [de]`, sources under
`input/translations/de`). Everything below works the same for a further language
— replace `de` with that language code and add it to `i18n-lang` **and**
`translation-sources`.

> **Why translation is *additive*:** you never edit the English source to
> translate it. Each language gets its own file beside the source, and a part
> with no translation falls back to the English source. Nothing added here can
> break a build — at worst it is ignored.

---

## The five layers at a glance

Your IG's visible text comes from five places, each with its **own** mechanism:

| # | Layer | Example text | Where the translation goes | You maintain it? |
|---|---|---|---|---|
| 1 | **Narrative content** | your page prose | `input/translations/<lang>/pagecontent/<same-filename>.md` | **yes** |
| 2 | **Menu** | `Startseite`, `Anleitung` | `input/translations/<lang>/includes/menu.xml` | **yes** |
| 3 | **Base UI chrome** (footer, buttons, boilerplate) | `Erstellt <date>`, `Inhaltsverzeichnis` | the **IG template**'s `translations/` | **no — inherited** |
| 4 | **Conformance resources** | a profile's `description` | `input/translations/<lang>/<ResourceType>-<id>.po` | **yes** |
| 5 | **Page titles, breadcrumbs, table of contents** | the page heading `Anleitung`, the breadcrumb trail, the ToC entries | `input/translations/<lang>/ImplementationGuide-<ig-id>.po` | **yes — and the file must be renamed** |

> Layer 5 is the one that is easy to miss: without it a page whose *content* is
> fully German still shows an English title, an English breadcrumb trail and an
> English entry in the table of contents.

---

## Steps

### 1. Narrative content (pages)

Put the translated page under `pagecontent/` in the translation-source folder,
with the **same file name** as the English source page:

```text
input/pagecontent/index.md                     # English — the source
input/translations/de/pagecontent/index.md     # German — renders on /de/
```

- Keep structure, headings and links 1:1 with the English source page.
- Translate prose, not identifiers: leave artifact links
  (`StructureDefinition-<id>.html`, …) and FHIR ids unchanged.
- A page with no German translation falls back to the English source on `/de/`,
  with a "no translation available" note. Translate the pages that matter most
  first.

> **The mistake to avoid:** a `<name>-de.md` sibling inside `input/pagecontent/`
> is **not** a translation — the toolchain renders it as a *separate page* and
> `/de/` keeps showing English. It must live under
> `input/translations/<lang>/pagecontent/`, mirroring the HL7 reference IG
> [`FHIR/multi-lang-test-ig`](https://github.com/FHIR/multi-lang-test-ig).

---

### 2. Menu

This module maintains its menu as **files**, one per language:

```text
input/includes/menu.xml                      # English — the source menu
input/translations/de/includes/menu.xml      # German translation
```

When you add, rename or remove a page, update **both** files (and the `pages:`
tree in `sushi-config.yaml`).

Rules:

- **Never add a `menu:` property to `sushi-config.yaml`.** SUSHI would generate a
  single `menu.xml` that cannot be translated and competes with these files —
  the navigation would then stay in one language on every rendering.
- Keep the `href` targets **identical** across languages; translate only labels.
- A dropdown parent must link to a **real page** (`href="#"` fails the
  template's menu QA check).
- Only **one** sub-menu level is supported.

---

### 3. Base UI chrome (footer, buttons, boilerplate) — inherited

The footer's `Links` / table-of-contents / QA-report labels, the copyright line,
`Package … based on FHIR …`, `Generated <date>` and the page-navigation buttons
come from the **IG template**, not from your module. You get German and English
for free.

**Nothing to do in a module.** If a base label is blank in some language, the
fix belongs in the template repository
([`ig-template-mii-kds`](https://github.com/medizininformatik-initiative/ig-template-mii-kds)),
which vendors the base UI-string catalogs — see its
`docs/recipes/add-translation.md` §3. Open an issue there rather than patching
around it here.

> **Keep the template current** so you receive such fixes: with the default
> repository-URL reference in `ig.ini` every build fetches the template's
> released `main` automatically; if you build from the vendored offline
> fallback, the copy in `ig-template/` is refreshed by
> `scripts/sync-ig-template.sh` and the `sync-ig-template` workflow.

---

### 4. Conformance resources (profiles, code systems, questionnaires)

For each resource whose text you want in German, add one supplement named
exactly `<ResourceType>-<id>.po`:

```text
input/translations/de/StructureDefinition-example-patient.po
```

Format (`msgid` = the English source, `msgstr` = the German translation):

```po
#: StructureDefinition.description
msgid "Minimal example profile …"
msgstr "Minimales Beispielprofil …"
```

- The `msgid` must match the generated English text **byte for byte** — copy it
  from `fsh-generated/resources/<Type>-<id>.json` after `sushi .` (quote style,
  umlauts and trailing punctuation included).
- The file name must match the **generated** `resourceType` + `id`, not the FSH
  name.

### What actually renders (verified on IG Publisher 2.3.0)

| Field | Translated by a `.po` supplement? |
|---|---|
| Resource-level `description` (StructureDefinition, CodeSystem, Questionnaire), and a StructureDefinition's element `definition` / `comment` / `requirements` | **Yes** |
| `CodeSystem.concept.display` / `concept.definition` | **No** — localize with a language-tagged `designation` in the resource |
| Resource `title` | **No** — it stays in the source language (English) in every rendering |
| ValueSet texts | **No** — a supplement is silently ignored |
| `ImplementationGuide.title`, `.publisher` and every `definition.page.title` | **Yes** — but through the IG-level catalogue, which is its own layer (§5) |

> **Do not "simulate" the unsupported cases.** A `ValueSet-*.po` is ignored —
> worse than an error, because it gives a false sense of coverage.

---

### 5. Page titles, breadcrumbs and the table of contents (the IG-level catalogue)

Page titles do **not** come from the page files. They come from
`ImplementationGuide.definition.page.title`, which SUSHI generates from the
`pages:` tree in `sushi-config.yaml`. Translating them therefore needs one
catalogue for the ImplementationGuide resource itself:

```text
input/translations/de/ImplementationGuide-<your-ig-id>.po
```

This one file drives the page heading, the breadcrumb trail and the table of
contents on `/de/`. Without it, a page whose prose is fully German still renders
`Guidance` as its title, `Home > Guidance` as its breadcrumb and `Guidance` in
the ToC.

#### ⚠️ Rename the shipped catalogue — a file name that carries a placeholder

The scaffold ships the catalogue as:

```text
input/translations/de/ImplementationGuide-mii-ig-{{MODULE_SLUG}}.po
```

**The publisher matches the catalogue to its IG resource BY FILE NAME**
(`<resourceType>-<id>`), so when you replace `{{MODULE_SLUG}}` in the file
*contents* you must **also rename the file** to match your IG's `id` in
`sushi-config.yaml`:

```sh
# your sushi-config.yaml has:  id: mii-ig-person
git mv 'input/translations/de/ImplementationGuide-mii-ig-{{MODULE_SLUG}}.po' \
       'input/translations/de/ImplementationGuide-mii-ig-person.po'
```

> **Why this bites:** a catalogue whose name does not match an IG resource id is
> **silently ignored** — no warning, no QA error, a green build. The only symptom
> is that page titles, breadcrumbs and the ToC stay in the default language, which
> is easy to mistake for "the publisher cannot do this". Besides this catalogue, only the two
> ImplementationGuide intro pages (`ImplementationGuide-mii-ig-{{MODULE_SLUG}}.md`
> in `input/pagecontent/` and its German mirror) carry a placeholder in their
> file *name* — those fail the build loudly when unrenamed
> ([create-a-new-module.md](create-a-new-module.md) step 4 renames all three);
> every other placeholder in this repository lives in file *contents* only.

#### The `msgid` rule

Each `msgid` must be **the exact title string from the `pages:` tree** in
`sushi-config.yaml`, character for character:

```yaml
# sushi-config.yaml
pages:
  guidance.md:
    title: Guidance
```

```po
#: ImplementationGuide.definition.page.title
msgid "Guidance"
msgstr "Anleitung"
```

- **Include the root "Table of Contents" page.** The publisher generates it and
  it is *not* in your `pages:` tree, but its title goes through the same
  catalogue — without `msgid "Table of Contents"` the breadcrumb root stays
  English on every German page.
- `ImplementationGuide.title` and `ImplementationGuide.publisher` are translated
  by the same file (the `publisher` entry is what makes the footer's
  `IG © <year> <publisher>` line German).
- A `msgid` with no matching title is ignored; a title with no `msgid` falls
  back to English. Neither fails the build, so check the rendering.
- **When you add, rename or remove a page**, update the `pages:` tree, both
  `menu.xml` files **and** this catalogue in the same commit.

---

### 6. Build and check

```sh
sushi .
# then the IG Publisher (see first-build-in-devcontainer.md), or push the branch
# and let CI build the /de/ and /en/ preview.
```

1. `/de/` — menu in German; footer shows the copyright, `Package … basiert auf
   FHIR …` and `Erstellt <date>`.
2. `/en/` — menu in English; footer shows `Package … based on FHIR …` and
   `Generated <date>`.
3. A translated page renders in German on `/de/`; an untranslated one falls back
   to the English source.
4. A translated resource's `description` is German on that resource's own `/de/`
   page, English on `/en/`. The artifacts index keeps the default-language
   (English) title and description in **both** trees.
5. On `/de/`, page **titles**, the **breadcrumb** trail (including its
   "Inhaltsverzeichnis" root) and the **table of contents** are German. If they
   are English, the IG-level catalogue is not being read — nine times out of ten
   because it was never renamed (§5).

The build must stay green (QA errors = 0).

---

## Expected result

Both renderings are complete: `/en/` and `/de/` each show their own menu, pages
and resource text, the footer labels are filled in, and the language switcher
moves between them.

## Common errors & fixes

| Symptom | Cause | Fix |
|---|---|---|
| Menu stays in one language everywhere | A `menu:` property crept into `sushi-config.yaml`, or the per-language menu file is missing | Remove the property; add `input/translations/<lang>/includes/menu.xml` (§2) |
| Menu QA error about `href="#"` | A dropdown parent has no real target | Point it at a real page (§2) |
| Navigation differs between languages | An entry was added to one menu file only | Keep both menu files in step (§2) |
| Base/footer labels blank in some language | The template lacks that language's UI-string catalog | Fix in the template repo (§3); rebuild once released (the URL default fetches it), or — if you build from the vendored fallback — make sure your `ig-template/` mirror is current |
| A translated page does not appear on `/de/` | It is a `<name>-de.md` sibling, or the file name differs from the English source page | Move it to `input/translations/de/pagecontent/<same-filename>` (§1) |
| A resource supplement does nothing | `msgid` mismatch, wrong file name, or an untranslatable field | Copy the `msgid` from `fsh-generated/resources/…`; check §4 |
| **Page content is German but the title, breadcrumb and ToC entry stay English** | The IG-level catalogue was never renamed from `ImplementationGuide-mii-ig-{{MODULE_SLUG}}.po` to your IG id, so the publisher never matched it to the resource | Rename it to `ImplementationGuide-<your-ig-id>.po` (§5) |
| One page title is German, another is not | That page's title is missing from the catalogue, or its `msgid` does not match the `pages:` title character for character | Add/correct the `msgid` (§5) |
| The breadcrumb root reads "Table of Contents" on `/de/` | The catalogue has no `msgid "Table of Contents"` | Add that entry (§5) |
| A whole language folder is ignored | The folder is not listed under the `translation-sources` parameter | Add it (Prerequisites) |

---

## Adding a third language

1. Add the code to `i18n-lang` **and** a matching entry to `translation-sources`
   in `sushi-config.yaml`.
2. Create `input/translations/<lang>/` with `pagecontent/`, `includes/menu.xml`
   and any resource `.po` files.
3. Copy the IG-level catalogue to
   `input/translations/<lang>/ImplementationGuide-<your-ig-id>.po` and translate
   its `msgstr` lines (§5) — otherwise that language's page titles, breadcrumbs
   and table of contents stay English.
4. Ask the template repo to vendor that language's base UI-string catalogs (§3),
   otherwise the footer/base labels render blank in the new language.

## Toolchain note

The behaviour described in §5 was checked against IG Publisher 2.3.0: the
publisher renders a `pages:`-tree page with its `ImplementationGuide.definition.
page.title`, and the IG-level `.po` catalogue is what localizes that field. This
is publisher behaviour rather than a documented FHIR rule, so re-check the German
rendering after a publisher bump. Do not work around a missing translation with
sibling `<name>-de.md` pages or menu tricks — both break the language model.
