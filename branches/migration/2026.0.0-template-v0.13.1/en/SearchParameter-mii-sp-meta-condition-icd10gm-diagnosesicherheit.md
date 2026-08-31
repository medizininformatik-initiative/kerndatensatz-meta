# mii-sp-meta-condition-icd10gm-diagnosesicherheit - MII IG Meta v2027.0.0-ballot.rc1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-sp-meta-condition-icd10gm-diagnosesicherheit**

## SearchParameter: mii-sp-meta-condition-icd10gm-diagnosesicherheit 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-condition-icd10gm-diagnosesicherheit | *Version*:2027.0.0-ballot.rc1 |
| Active as of 2024-10-08 | *Computable Name*:MII_SP_Meta_Condition_ICD10GM_Diagnosesicherheit |

 
Suchparameter für Condition.code.coding:icd10-gm.extension:Diagnosesicherheit 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "mii-sp-meta-condition-icd10gm-diagnosesicherheit",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-condition-icd10gm-diagnosesicherheit",
  "version" : "2027.0.0-ballot.rc1",
  "name" : "MII_SP_Meta_Condition_ICD10GM_Diagnosesicherheit",
  "status" : "active",
  "experimental" : false,
  "date" : "2024-10-08",
  "publisher" : "NUM-DIZ",
  "_publisher" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "de"
      },
      {
        "url" : "content",
        "valueString" : "NUM-DIZ"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    }]
  },
  "contact" : [{
    "name" : "NUM-DIZ",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.netzwerk-universitaetsmedizin.de"
    }]
  }],
  "description" : "Suchparameter für Condition.code.coding:icd10-gm.extension:Diagnosesicherheit",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "code" : "icd10gm-diagnosesicherheit",
  "base" : ["Condition"],
  "type" : "token",
  "expression" : "Condition.code.coding.extension.where(url = 'http://fhir.de/StructureDefinition/icd-10-gm-diagnosesicherheit').value"
}

```
