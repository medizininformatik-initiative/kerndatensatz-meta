# Changelog - MII IG Meta v2027.0.0-ballot

* [**Table of Contents**](toc.md)
* **Changelog**

## Changelog

### Version 2027.0.0-draft

**Date:** unreleased

* **Changed:** The home page lists the author and, new, the contributors by name and GitHub handle. The contributor metadata of the conformance artifacts names Julian Saß as author and editor (`artifact-author`, `artifact-editor`). See: [#275](https://github.com/medizininformatik-initiative/kerndatensatz-meta/issues/275)
* **Added:** The [Guidance for Implementers](implementer-guidance.md) explains how module CapabilityStatements list the result parameters `_count`, `_summary` and `_elements`. See: [#91](https://github.com/medizininformatik-initiative/kerndatensatz-meta/issues/91)
* **Changed:** The [Metadata Overview](metadata.md) states the current approval date and the metadata the CapabilityStatement and the SearchParameter resources carry.
* **Added:** A [Module Conventions](conventions.md) page describing how the KDS modules label example instances as test data (`HTEST`) and declare licences.
* **Changed:** The copyright notice on the home page names the Medical Informatics Initiative (MII) instead of TMF e. V. The [Extensions](extensions.md) page marks MII EX Meta License Codeable as deprecated in favour of the CRMI extension `crmi-license`.
* **Changed:** The CapabilityStatement [MII CapabilityStatement Meta Server Capabilities](CapabilityStatement-mii-cps-meta-server-capabilities.md) has a proper description, `purpose`, `rest.documentation` and usage note (`artifact-usage`) instead of the placeholder texts from the migration ("Review before use as a normative capability statement"). It remains an informative requirements statement (`draft`, `experimental`). See: [HDB-1014](https://hl7germany.atlassian.net/browse/HDB-1014)
* **Added:** A [search parameter overview](search-parameters.md) listing every active search parameter with its resource type, type and FHIRPath expression, and the retired search parameters.
* **Added:** The CapabilityStatement documents an example query for every search parameter covered by the CI search tests; see [MII CapabilityStatement Meta Server Capabilities](CapabilityStatement-mii-cps-meta-server-capabilities.md).
* **Removed:** The `SearchParameter` resources `verification-status` and `evidence-detail` for `Condition`, `has-member`, `focus` and `encounter` for `Observation`, and `source` for `DeviceMetric` were retired because they are identical to the FHIR Core search parameters. They are no longer part of the collection and transaction bundles.
* **Changed:** The `SearchParameter` resource `part-of` (`mii-sp-meta-medication-partof`) now covers `MedicationAdministration` only; for `MedicationStatement`, the FHIR Core search parameter `part-of` applies.
* **Changed:** The CapabilityStatement now references the FHIR Core definitions instead of the MII ones for `verification-status` and `evidence-detail` on `Condition`, `has-member`, `focus` and `encounter` on `Observation`, `source` on `DeviceMetric` and `part-of` on `MedicationStatement`; see [MII CapabilityStatement Meta Server Capabilities](CapabilityStatement-mii-cps-meta-server-capabilities.md).

### Version 2027.0.0-ballot

**Date:** 2026-09-10

* **Added:** A `SearchParameter` resource `asserted-date` for `Condition.extension:assertedDate` (standard extension `condition-assertedDate`), used by the base Diagnose profile and the Oncology and MTB modules; see [Core Data Set search parameters](artifacts.md#2).
* **Added:** Dependency `hl7.terminology.r4`: `7.1.0`
* **Added:** Dependency `hl7.fhir.uv.extensions.r4`: `5.2.0`
* **Added:** Dependency `hl7.fhir.uv.crmi`: `2.0.0`
* **Added:** Resources contain CRMI-based artifact metadata
* **Added:** the module now contains a CapabilityStatement resource

### Version 2026.0.0

**Date:** 2025-11-24

* **Added:** Further `SearchParameter` resources for `ImagingStudy`.

### Version 2025.0.3

**Date:** 2025-11-04

* **Removed:** The `SearchParameter` resource for `Specimen.collection.bodySite` was retired because the search parameter is already part of FHIR Core.

### Version 2025.0.2

**Date:** 2025-10-21

* **Added:** A `SearchParameter` resource for the Procedure OPS laterality; see [Core Data Set search parameters](artifacts.md#2).

### Version 2025.0.1

**Date:** 2025-10-07

* **Changed:** Updated the `MII_CS_Meta_DIZ_Standorte` CodeSystem resource; see [Medical Informatics Initiative sites](CodeSystem-mii-cs-meta-diz-standorte.md).
* **Added:** `SearchParameter` resources from the Imaging and Document extension modules; see [Core Data Set search parameters](artifacts.md#2).

### Version 2025.0.0

**Date:** 2024-12-03

* **Removed:** The `MII-Reference` profile was set to `retired` and should no longer be used.
* **Changed:** SearchParameter resources from base and extension modules are now published centrally through the Meta module; see the [search parameter list](artifacts.md#2).
* **Added:** The `MII_PR_Meta_SearchParameter` profile with the minimum requirements for MII search parameters.
* **Added:** The `MII_EX_Meta_License_Codeable` extension for providing machine-processable licence information for published artifacts.

