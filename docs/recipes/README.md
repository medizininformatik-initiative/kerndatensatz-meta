# Recipes

Short, task-shaped guides for authoring an MII KDS module IG. Each one takes a
single job from start to a checkable result.

**New here?** Start with the [first build in the dev container](first-build-in-devcontainer.md),
then pick the recipe for your task.

## Getting started

| Recipe | Use it when |
| --- | --- |
| [first build in the dev container](first-build-in-devcontainer.md) | You need a working toolchain without installing anything |
| [decide an optional page](remove-an-optional-page.md) | You are keeping or removing one of the seven optional (0..1) menu entries |

## Authoring content

| Recipe | Use it when |
| --- | --- |
| [add a profile](add-a-profile.md) | You are writing FSH for a new profile |
| [how profiles render](render-profiles.md) | A profile page needs prose a reader can follow |
| [add and describe examples](describe-examples.md) | You are adding example instances |
| [information models — Logical Models vs profiles](model-information-models.md) | You are unsure which artifact expresses your data model |
| [render existing artifacts in a page](render-existing-artifacts.md) | You want a profile, example or artifact table inline in your prose |
| [add UML diagrams and other images](add-uml-diagrams.md) | A picture would explain it better |
| [extend the translations](add-translation.md) | Menu, pages, footer or resource text needs a second language |
| [add a DIZ site to the Standorte CodeSystem](add-a-diz-standort.md) | A data integration centre (DIZ) needs a new or updated entry in `mii-cs-meta-diz-standorte` |


## Build, release and upkeep

| Recipe | Use it when |
| --- | --- |
| [regenerate the `special-url` list](regenerate-special-url.md) | The build warns about canonicals outside the module |
| [switch to the published template](switch-template-to-published.md) | The MII IG template has a release you can pin |
| [cut a release (CalVer)](cut-a-release.md) | The module is ready to publish |
| [review a dependency update](review-a-dependency-update.md) | A bump was proposed and someone has to decide |
| [triage a vulnerability alert](triage-a-vulnerability-alert.md) | A security finding needs a decision |

## The pattern every recipe follows

Recipes are written to the same shape so you always know where to look. If you
add one, follow it:

```markdown
# Recipe: <imperative task>

**Goal.** One sentence: what you will have achieved.

**Prerequisites.** What must already be true.

## Steps
1. …

## Expected result
What you should see when it worked.

## Common errors & fixes
| Symptom | Cause | Fix |
```

Sections in between are fine — background, a comparison table, a "why" note —
but the five anchors above stay, in that order, so a reader can skip to the
part they need. File names are kebab-case and start with the verb.
