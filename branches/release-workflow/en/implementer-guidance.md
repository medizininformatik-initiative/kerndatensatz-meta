# Guidance for Implementers - MII IG Meta v2027.0.0-ballot.rc3

* [**Table of Contents**](toc.md)
* [**Guidance**](guidance.md)
* **Guidance for Implementers**

## Guidance for Implementers

Use the [downloadable FHIR package](downloads.md) as the versioned source for validation and implementation. The generated artifact pages provide the normative JSON and XML representations.

When implementing SearchParameters:

* Use the [MII SearchParameter profile](StructureDefinition-mii-pr-meta-searchparameter.md) as the baseline. It defines the minimum requirements that SearchParameter resources published as part of the MII Core Data Set must meet.
* Review the [search parameter list](artifacts.md#2) and the [Meta CapabilityStatement](capability-statements.md) to identify additional custom search parameters defined for the MII Core Data Set.
* For convenient bulk import into a FHIR server, use the SearchParameter collection and transaction bundles on the [Examples](examples.md) page. Each bundle contains all active SearchParameter resources published by this module.

