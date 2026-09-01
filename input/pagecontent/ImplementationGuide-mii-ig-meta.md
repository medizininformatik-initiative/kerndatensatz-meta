<!-- markdownlint-disable MD041 -->

<!-- Default-language (English) intro for the ImplementationGuide RESOURCE page —
     the artifact page the IG Publisher generates for the IG resource itself
     (ImplementationGuide-<id>.html). Without this file the page renders bare:
     no dependency table, no cross-version analysis, no copyright statements.
     Ported from kerndatensatz-basis input/pagecontent/ImplementationGuide-mii-ig-base.md
     and adapted to the scaffold.
     German mirror: input/translations/de/pagecontent/ (same file name) — both
     files must say the same thing.
     FILE NAME CARRIES THE IG ID: like the IG-level .po catalogue, this file and
     its German mirror must be RENAMED to your concrete IG id when you create a
     module (docs/recipes/create-a-new-module.md step 4) — the pages: entry in
     sushi-config.yaml references it by that name. The template repo's CI
     self-check renames all three automatically for the preview. -->
This ImplementationGuide resource defines the technical details of this
publication, including dependencies and publishing parameters.

- [XML](../ImplementationGuide-mii-ig-meta.xml)
- [JSON](../ImplementationGuide-mii-ig-meta.json)

### Cross Version Analysis

{% lang-fragment cross-version-analysis.xhtml %}

### IG Dependencies

This IG contains the following dependencies on other IGs.

{% lang-fragment dependency-table.xhtml %}

> **Where the versions come from.** Every package in the table is pinned
> directly in
> [`sushi-config.yaml`](https://github.com/medizininformatik-initiative/kerndatensatz-meta/blob/main/sushi-config.yaml)
> (`dependencies:`) — including `hl7.terminology.r4` (THO) and
> `hl7.fhir.uv.extensions.r4`, and those two deliberately so: the IG
> Publisher's
> [automatic-packages rule](https://build.fhir.org/ig/FHIR/ig-guidance/versions.html#automatic-packages)
> consults only this guide's **own** dependency list, so without a direct pin
> every build would silently inject the latest THO/extensions release — a
> version pinned by the MII meta package alone cannot control the build
> (verified in the publisher source at the pinned release). A weekly check
> warns when these two pins drift from what the pinned meta package ships,
> and the exact versions a concrete build used are recorded in its
> `qa-versions.json` output.
{: .ig-highlight .ig-highlight-grey}

### Global Profiles

This IG declares the following global profiles — profiles that apply to every
instance of their resource type exchanged under this guide. An empty table
means this module declares none.

{% lang-fragment globals-table.xhtml %}

### Copyrights

{% lang-fragment ip-statements.xhtml %}

### IG Parameter Settings and Expansion Parameters

Expansion parameters are query parameters that can be passed to a `ValueSet`
`$expand` operation to control how the ValueSet is expanded — that is, how the
full list of codes is generated from the ValueSet definition. The
[IG Parameters](https://hl7.org/fhir/tools/en/CodeSystem-ig-parameters.html)
used for this IG are declared in
[`sushi-config.yaml`](https://github.com/medizininformatik-initiative/kerndatensatz-meta/blob/main/sushi-config.yaml)
(`parameters:`). This module pins its expansion parameters through the
[Meta expansion manifest](Parameters-mii-param-meta-manifest.html); see the
[Metadata Overview](metadata.html).
