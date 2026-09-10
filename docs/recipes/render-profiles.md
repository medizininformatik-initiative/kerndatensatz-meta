# Recipe: how profiles render, and how to improve what readers see

**Goal.** Understand what the IG Publisher generates from your FSH, and add the
parts it cannot invent — the prose that explains *why* a profile looks the way it
does.

**Prerequisites.** A module that builds (see
[create a new module](create-a-new-module.md)) and at least one profile
([add a profile](add-a-profile.md)).

## What you get for free

For every profile, the publisher generates a page with several tabs. You do not
write any of this — it comes from the StructureDefinition SUSHI produces:

| Tab | Shows |
| --- | --- |
| **Differential** | Only what *your* profile changes relative to its parent — the shortest view, best for review |
| **Key Elements** | The elements that matter: mandatory, Must Support, and anything you constrained |
| **Snapshot** | Every element of the resource, fully resolved — long, but complete |
| **Table / Text / XML / JSON / TTL** | The raw definitions in each serialisation |

Must Support elements are flagged with a red **S** badge; mandatory elements show
their cardinality in bold. Readers rely on those two signals, so do not restate
them in prose.

> **The same views are available individually.** Each tab above is also an
> includable fragment — *Differential* is `-diff`, *Snapshot* is `-snapshot`, the
> element table is `-dict` — so you can put one of them inside a narrative page
> rather than sending the reader to the artifact page. See
> [render existing artifacts in a page](render-existing-artifacts.md).

## What you must add yourself

The publisher cannot explain intent. Two files per profile, both optional but
strongly recommended:

```text
input/intro-notes/StructureDefinition-<id>-intro.md   # rendered ABOVE the tables
input/intro-notes/StructureDefinition-<id>-notes.md   # rendered BELOW the tables
```

`<id>` is the profile's `Id:` from the FSH, not the file name. These are wired in
already via the `path-pages` parameter in `sushi-config.yaml` — drop the
files in.

**Use the intro for:** what the profile is for, which use case it serves, how it
differs from a neighbouring profile, and any scenario a reader needs to picture.
**Use the notes for:** element-level explanations, deliberate omissions, and the
rationale behind a constraint that will otherwise look arbitrary in five years.

Translations go to `input/translations/de/intro-notes/` with the same file names.

## Steps

1. Write the profile and build; open `output/StructureDefinition-<id>.html` and
   read it as a newcomer would.
2. Anything you had to explain to yourself while reading — write it into the
   intro or notes file.
3. Rebuild and re-read. Repeat until the page stands on its own.

## Expected result

A profile page that answers "what is this for and how do I use it" without the
reader having to ask you.

## Common errors & fixes

| Symptom | Cause | Fix |
| --- | --- | --- |
| Intro/notes do not appear | File name uses the FSH `Profile:` name instead of the `Id:` | Rename to `StructureDefinition-<Id>-intro.md` |
| The page shows constraints you did not intend | The parent profile already imposed them | Check the **Differential** tab — it shows only *your* changes |
| Must Support is not visible | The element was constrained but not flagged `MS` | Add `MS` in the FSH; Must Support is not implied by cardinality (see the [MII Must-Support rules](https://github.com/medizininformatik-initiative/kerndatensatz-meta/wiki/Conformance#must-support-ms)) |
| Text renders raw in the built page | The file is a `.md` but contains HTML that Markdown swallowed | Keep intro/notes plain Markdown |

> **Why this is worth the effort:** the generated tables tell a reader *what* is
> constrained. Nothing but your prose tells them *why*, and HL7's
> [IG best-practice guidance](https://build.fhir.org/ig/FHIR/ig-guidance/best-practice.html)
> asks for an intro on every artifact for exactly that reason.

## Tabbed structure view on narrative pages

To render a profile or extension inside a narrative page the way the official
FHIR specification does — Structure / Differential / XML / JSON as tabs —
use the template's `structure-tabs` include instead of pasting fragments
below each other:

    {% raw %}{% include structure-tabs.html artifact="StructureDefinition-<id>" %}{% endraw %}

Pass `lang="de"` in the German mirror page so the tab labels localize. The
four publisher fragments (`-snapshot`, `-diff`, `-xml-html`, `-json-html`)
must exist for the artifact — check `temp/pages/_includes/` after a build;
one missing include fails the whole Jekyll run. When the narrative does not
need an inline rendering, a plain link to the artifact page (which carries
the same views as tabs) is the better choice.
