# mii-sp-meta-observation-hasmember - MII IG Meta v2026.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-sp-meta-observation-hasmember**

## SearchParameter: mii-sp-meta-observation-hasmember 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-observation-hasmember | *Version*:2026.0.0 |
| Active as of 2024-10-24 | *Computable Name*:MII_SP_Meta_Observation_hasMember |

 
SearchParameter for Observation.hasMember 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "mii-sp-meta-observation-hasmember",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-observation-hasmember",
  "version" : "2026.0.0",
  "name" : "MII_SP_Meta_Observation_hasMember",
  "status" : "active",
  "experimental" : false,
  "date" : "2024-10-24",
  "publisher" : "Medizininformatik Initiative",
  "contact" : [{
    "name" : "Medizininformatik Initiative",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.medizininformatik-initiative.de/"
    }]
  }],
  "description" : "SearchParameter for Observation.hasMember",
  "code" : "has-member",
  "base" : ["Observation"],
  "type" : "reference",
  "expression" : "Observation.hasMember"
}

```
