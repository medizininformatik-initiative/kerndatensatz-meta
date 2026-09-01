<!-- markdownlint-disable MD041 -->

Use the [downloadable FHIR package](downloads.html) as the versioned source for
validation and implementation. The generated artifact pages provide the
normative JSON and XML representations.

When implementing SearchParameters:

* Use the
  [MII SearchParameter profile](StructureDefinition-mii-pr-meta-searchparameter.html)
  as the baseline. It defines the minimum requirements that SearchParameter
  resources published as part of the MII Core Data Set must meet.
* Review the [search parameter list](search-parameters.html) and the
  [Meta CapabilityStatement](capability-statements.html) to identify additional
  custom search parameters defined for the MII Core Data Set.
* For convenient bulk import into a FHIR server, use the SearchParameter
  collection and transaction bundles on the [Examples](examples.html) page.
  Each bundle contains all active SearchParameter resources published by this
  module.
