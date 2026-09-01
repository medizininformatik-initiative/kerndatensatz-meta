# Metadata Overview - MII IG Meta v2027.0.0-ballot.rc1

* [**Table of Contents**](toc.md)
* **Metadata Overview**

## Metadata Overview

This page describes the computable metadata of the Meta module. The metadata supports discovery, validation, governance, versioning, and reuse of the guide's FHIR artifacts.

### CRMI conformance

The generated ImplementationGuide claims the CRMI shareable, publishable, and computable ImplementationGuide profiles from [CRMI STU2](https://hl7.org/fhir/uv/crmi/STU2/en/). It declares the following metadata:

| | |
| :--- | :--- |
| Approval date | `2026-08-31` |
| Effective period | starts in`2027` |
| Knowledge capability | `shareable`,`publishable` |
| Package source | `de.medizininformatikinitiative.kerndatensatz.meta`at`2027.0.0-ballot.rc1` |
| Version algorithm | `semver`, applied to the SemVer-compatible CalVer representation |
| Purpose and usage | computable publication, discovery, validation, versioning, and consistent application of the Meta module |
| Topic | NCI Thesaurus`C80260` |
| Contributors | author, editor, reviewers, and endorsers recorded as contact details |

The IG-level `artifact-versionPolicy` and the module-specific codeable licence extension are not declared. The guide-level licence remains `CC-BY-4.0`, and the module's canonical artifacts retain their existing codeable licence metadata.

### Resource-level coverage

The Meta module applies the Basis module's CRMI publication pattern to the resource types that both modules contain:

| | |
| :--- | :--- |
| MII SearchParameter profile | CRMI shareable and publishable StructureDefinition profiles; knowledge capabilities; version algorithm and package policy; package source; usage; approval and effective dates; topic; contributors; CRMI licence |
| Deprecated MII licence extension | The same StructureDefinition metadata, with usage directing implementers to the CRMI License extension |
| MII site CodeSystem | CRMI shareable and publishable CodeSystem profiles; knowledge capabilities; version algorithm and package policy; package source; approval and effective dates; topic; contributors; CRMI licence |
| Meta CapabilityStatement | CRMI shareable and publishable CapabilityStatement profiles; knowledge capabilities; version algorithm and package policy; package source; draft-specific usage; approval and effective dates; topic; contributors; CRMI licence |
| SearchParameter resources | MII SearchParameter profile; CRMI licence; version algorithm |
| SearchParameter collection and transaction bundles | Package source |
| Expansion manifest | CRMI Manifest Parameters profile |

The Basis module also applies CRMI metadata to logical models and ValueSets. Meta defines neither resource type, so no Basis clinical or terminology artifacts are duplicated here. SearchParameter resources are specific to Meta; Basis provides no directly comparable SearchParameter implementation.

### Manifest and reproducibility

Canonical references are pinned with `pin-canonicals: pin-all`. Terminology expansion uses the [Meta expansion manifest](Parameters-mii-param-meta-manifest.md), linked from the ImplementationGuide through `cqf-expansionParameters` and configured by `path-expansion-params` and `pin-manifest`.

The manifest currently pins:

* SNOMED CT International Edition `20260701`;
* `artifact-version-policy-codes` version `3.0.0`.

### Inspecting and reusing metadata

The complete machine-readable metadata is available in the generated JSON and XML representations of each artifact and in the [downloadable FHIR package](downloads.md). The human-readable [Versioning](version-history.md) page explains the release version scheme.

