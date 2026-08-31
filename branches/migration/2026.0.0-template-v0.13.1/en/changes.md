# Changelog - MII IG Meta v2027.0.0-ballot.rc1

* [**Table of Contents**](toc.md)
* **Changelog**

## Changelog

#### Version 2027.0.0-ballot.rc1

**Date:** 2026-08-31

* **Changed:** Migrated the publication workflow and narrative from Simplifier to the HL7 IG Publisher while retaining the published FHIR artifact identities.
* **Added:** A migration-generated draft CapabilityStatement for review.

#### Version 2026.0.0

**Date:** 2025-11-24

* **Added:** Further `SearchParameter` resources for `ImagingStudy`.

#### Version 2025.0.3

**Date:** 2025-11-04

* **Removed:** The `SearchParameter` resource for `Specimen.collection.bodySite` was retired because the search parameter is already part of FHIR Core.

#### Version 2025.0.2

**Date:** 2025-10-21

* **Added:** A `SearchParameter` resource for the Procedure OPS laterality; see [Core Data Set search parameters](search-parameters.md).

#### Version 2025.0.1

**Date:** 2025-10-07

* **Changed:** Updated the `MII_CS_Meta_DIZ_Standorte` CodeSystem resource; see [Medical Informatics Initiative sites](CodeSystem-mii-cs-meta-diz-standorte.md).
* **Added:** `SearchParameter` resources from the Imaging and Document extension modules; see [Core Data Set search parameters](search-parameters.md).

#### Version 2025.0.0

**Date:** 2024-12-03

* **Removed:** The `MII-Reference` profile was set to `retired` and should no longer be used.
* **Changed:** SearchParameter resources from base and extension modules are now published centrally through the Meta module; see the [search parameter list](search-parameters.md).
* **Added:** The `MII_PR_Meta_SearchParameter` profile with the minimum requirements for MII search parameters.
* **Added:** The `MII_EX_Meta_License_Codeable` extension for providing machine-processable licence information for published artifacts.

