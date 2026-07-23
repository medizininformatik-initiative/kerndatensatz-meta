# mii-sp-meta-procedure-ops-seitenlokalisation - MII IG Meta v2026.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-sp-meta-procedure-ops-seitenlokalisation**

## SearchParameter: mii-sp-meta-procedure-ops-seitenlokalisation 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-procedure-ops-seitenlokalisation | *Version*:2026.0.0 |
| Active as of 2025-10-21 | *Computable Name*:MII_SP_Meta_Procedure_OPS_Seitenlokalisation |

 
Suchparameter für Procedure.code.coding:ops.extension:Seitenlokalisation 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "mii-sp-meta-procedure-ops-seitenlokalisation",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-procedure-ops-seitenlokalisation",
  "version" : "2026.0.0",
  "name" : "MII_SP_Meta_Procedure_OPS_Seitenlokalisation",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-10-21",
  "publisher" : "Medizininformatik Initiative",
  "contact" : [{
    "name" : "Medizininformatik Initiative",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.medizininformatik-initiative.de/"
    }]
  }],
  "description" : "Suchparameter für Procedure.code.coding:ops.extension:Seitenlokalisation",
  "code" : "ops-seitenlokalisation",
  "base" : ["Procedure"],
  "type" : "token",
  "expression" : "Procedure.code.coding.extension.where(url = 'http://fhir.de/StructureDefinition/seitenlokalisation').value"
}

```
