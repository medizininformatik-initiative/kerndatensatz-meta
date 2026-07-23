# mii-sp-meta-specimen-collection-body-site - MII IG Meta v2026.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-sp-meta-specimen-collection-body-site**

## SearchParameter: mii-sp-meta-specimen-collection-body-site 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-specimen-collection-body-site | *Version*:2026.0.0 |
| Retired as of 2025-11-04 | *Computable Name*:MII_SP_Meta_Specimen_Collection_Body_Site |

 
SearchParameter for Specimen.collection.bodySite 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "mii-sp-meta-specimen-collection-body-site",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/modul-meta/StructureDefinition/mii-pr-meta-searchparameter"]
  },
  "extension" : [{
    "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/StructureDefinition/mii-ex-meta-license-codeable",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://hl7.org/fhir/spdx-license",
        "code" : "CC-BY-4.0",
        "display" : "Creative Commons Attribution 4.0 International"
      }]
    }
  }],
  "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-specimen-collection-body-site",
  "version" : "2026.0.0",
  "name" : "MII_SP_Meta_Specimen_Collection_Body_Site",
  "status" : "retired",
  "experimental" : false,
  "date" : "2025-11-04",
  "publisher" : "Medizininformatik Initiative",
  "contact" : [{
    "name" : "Medizininformatik Initiative",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.medizininformatik-initiative.de/"
    }]
  }],
  "description" : "SearchParameter for Specimen.collection.bodySite",
  "code" : "collection-body-site",
  "base" : ["Specimen"],
  "type" : "token",
  "expression" : "Specimen.collection.bodySite"
}

```
