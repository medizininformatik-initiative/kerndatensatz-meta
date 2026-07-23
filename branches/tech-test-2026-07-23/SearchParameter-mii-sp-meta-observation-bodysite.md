# mii-sp-meta-observation-bodysite - MII IG Meta v2026.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-sp-meta-observation-bodysite**

## SearchParameter: mii-sp-meta-observation-bodysite 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-observation-bodysite | *Version*:2026.0.0 |
| Active as of 2024-10-08 | *Computable Name*:MII_SP_Meta_Observation_BodySite |

 
SearchParameter for Observation.bodySite 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "mii-sp-meta-observation-bodysite",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-observation-bodysite",
  "version" : "2026.0.0",
  "name" : "MII_SP_Meta_Observation_BodySite",
  "status" : "active",
  "experimental" : false,
  "date" : "2024-10-08",
  "publisher" : "Medizininformatik Initiative",
  "contact" : [{
    "name" : "Medizininformatik Initiative",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.medizininformatik-initiative.de/"
    }]
  }],
  "description" : "SearchParameter for Observation.bodySite",
  "code" : "body-site",
  "base" : ["Observation"],
  "type" : "token",
  "expression" : "Observation.bodySite"
}

```
