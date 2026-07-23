# mii-sp-meta-condition-icd10gm-mehrfachcodierung - MII IG Meta v2026.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-sp-meta-condition-icd10gm-mehrfachcodierung**

## SearchParameter: mii-sp-meta-condition-icd10gm-mehrfachcodierung 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-condition-icd10gm-mehrfachcodierung | *Version*:2026.0.0 |
| Active as of 2024-10-08 | *Computable Name*:MII_SP_Meta_Condition_ICD10GM_Mehrfachcodierung |

 
Suchparameter für Condition.code.coding:icd10-gm.extension:Mehrfachcodierungs-Kennzeichen 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "mii-sp-meta-condition-icd10gm-mehrfachcodierung",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-condition-icd10gm-mehrfachcodierung",
  "version" : "2026.0.0",
  "name" : "MII_SP_Meta_Condition_ICD10GM_Mehrfachcodierung",
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
  "description" : "Suchparameter für Condition.code.coding:icd10-gm.extension:Mehrfachcodierungs-Kennzeichen",
  "code" : "icd10gm-mehrfachcodierung",
  "base" : ["Condition"],
  "type" : "token",
  "expression" : "Condition.code.coding.extension.where(url = 'http://fhir.de/StructureDefinition/icd-10-gm-mehrfachcodierungs-kennzeichen').value"
}

```
