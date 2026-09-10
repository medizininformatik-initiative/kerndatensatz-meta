# `input/` — the IG source tree

This directory layout is imported from
[kerndatensatz-basis](https://github.com/medizininformatik-initiative/kerndatensatz-basis)
(`main`). The IG Publisher and SUSHI read from these fixed paths — do not
rename them. Starter content (a first profile, example pages) is added by the
module scaffolding; the `.gitkeep` files only keep the empty directories in
git and are ignored by the build tools.

> **Why README stubs instead of content:** this repo is a template. Everything
> module-specific is either a `{{...}}` placeholder or an empty, documented
> directory.

| Directory | What belongs there | Consumed by |
|---|---|---|
| `fsh/` | FHIR Shorthand sources (profiles, extensions, value sets, …) — see `fsh/README.md` for the per-subdirectory convention | SUSHI |
| `pagecontent/` | The IG's narrative pages as Markdown (`index.md`, `guidance.md`, …). Every page listed under `pages:` in `sushi-config.yaml` needs a file here. **English is the default content language**; the German mirror lives in `translations/de/pagecontent/` (same model as basis). | IG Publisher |
| `images/` | Images referenced by pages and intro notes (logos, diagrams as PNG/JPG). Basis keeps language-specific logo variants here. | IG Publisher |
| `images-source/` | Editable sources for generated images (e.g. PlantUML `.plantuml` files for the UML diagrams). Not published directly. | maintainers / diagram tooling |
| `includes/` | Reusable HTML/Markdown fragments and `menu.xml` (basis idiom: the menu is maintained here, not via the `menu:` property in `sushi-config.yaml`, so the language switcher works). | IG Publisher |
| `intro-notes/` | Per-artifact intro/notes Markdown files (`StructureDefinition-<id>-intro.md` / `...-notes.md`), wired via the `path-pages` parameter. | IG Publisher |
| `resources/` | Hand-authored resource JSON that is not generated from FSH — this template keeps the expansion-parameters manifest (`Parameters-expansion-manifest.json`) here, referenced by `path-expansion-params` in `sushi-config.yaml`. | IG Publisher |
| `translations/` | Translation supplements. This template is **English-default with German mirrors** under `translations/de/` — see `translations/README.md`. | IG Publisher (i18n) |
| `ignoreWarnings.txt` | Reviewed-and-accepted QA messages, each with a justifying comment. | IG Publisher QA |

Notes:

- `input/predefined-resources/` (the `path-resource` parameter) is referenced
  in `sushi-config.yaml` but, exactly as in basis, not created until a module
  actually has predefined resources.
- FHIR validation test cases (`profile-test-cases` parameter) live in
  `tests/profiles/` at the repo root when a module adds them (basis idiom).
