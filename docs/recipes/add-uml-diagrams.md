# Recipe: add UML diagrams and other images

**Goal.** Add a diagram that explains your module's structure, in a way that is
still maintainable in five years.

**Prerequisites.** A module that builds ([create a new module](create-a-new-module.md)),
and Graphviz for PlantUML rendering — the dev container has it.

## Where files go

```text
input/images-source/<name>.plantuml   # the EDITABLE source — commit this
input/images/<name>.svg               # the rendered image the pages reference
```

The IG Publisher renders PlantUML sources automatically when Graphviz is
available (the dev container has it). Keep the source in the repository: HL7's
[IG best-practice guidance](https://build.fhir.org/ig/FHIR/ig-guidance/best-practice.html)
asks that a diagram's source be checked in and its tool be free or widely used,
so that the picture can still be changed after its author has moved on. This
scaffold treats that as the default and gives you `input/images-source/` for it.

## Steps

1. Write the source, e.g. `input/images-source/module-overview.plantuml`.
2. Reference the rendered image from a page:

   ```markdown
   <img src="module-overview.svg" alt="Overview of the {{MODULE_TITLE}} module" style="max-width:100%">
   ```

3. Always write a meaningful `alt` text — it is what screen readers and search
   engines get, and the checklist expects it.
4. Reference the same image from the German mirror page; images are shared, only
   the surrounding prose is translated.
5. Build and check the page.

## Choosing what to draw

- **UML class diagram** — the module's information model and how its parts relate.
  Best on `uml-diagrams.md`.
- **Sequence diagram** — an interaction over time (a query, a submission flow).
  Best on the guidance page describing that flow.
- Prefer **one diagram that answers a question** over several decorative ones.

## Expected result

The diagram renders in both language versions, its source sits beside it in the
repository, and the alt text describes it.

## Common errors & fixes

| Symptom | Cause | Fix |
| --- | --- | --- |
| Image missing in the built IG | Referenced from `images-source/` instead of `images/`, or the file name differs | Reference the rendered file in `input/images/` |
| PlantUML not rendered | Graphviz missing in the build environment | Use the dev container; CI already installs Graphviz |
| Image looks fine locally, broken on `/de/` | An absolute or `../`-relative path | Use the plain file name — the publisher resolves it per language folder |
| Licence concern | The image embeds third-party material | Only add images you may redistribute under the IG's CC-BY-4.0 |
