# mii-sp-meta-procedure-outcome - MII IG Meta v2026.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-sp-meta-procedure-outcome**

## SearchParameter: mii-sp-meta-procedure-outcome 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-procedure-outcome | *Version*:2026.0.0 |
| Active as of 2024-11-07 | *Computable Name*:MII_SP_Meta_Procedure_Outcome |

 
SearchParameter for Procedure.outcome 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "mii-sp-meta-procedure-outcome",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-procedure-outcome",
  "version" : "2026.0.0",
  "name" : "MII_SP_Meta_Procedure_Outcome",
  "status" : "active",
  "experimental" : false,
  "date" : "2024-11-07",
  "publisher" : "Medizininformatik Initiative",
  "contact" : [{
    "name" : "Medizininformatik Initiative",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.medizininformatik-initiative.de/"
    }]
  }],
  "description" : "SearchParameter for Procedure.outcome",
  "code" : "outcome",
  "base" : ["Procedure"],
  "type" : "token",
  "expression" : "Procedure.outcome"
}

```
