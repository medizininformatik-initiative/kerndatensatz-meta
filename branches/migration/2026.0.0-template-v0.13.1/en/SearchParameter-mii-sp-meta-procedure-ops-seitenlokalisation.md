# mii-sp-meta-procedure-ops-seitenlokalisation - MII IG Meta v2027.0.0-ballot.rc1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-sp-meta-procedure-ops-seitenlokalisation**

## SearchParameter: mii-sp-meta-procedure-ops-seitenlokalisation 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-procedure-ops-seitenlokalisation | *Version*:2027.0.0-ballot.rc1 |
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
  "version" : "2027.0.0-ballot.rc1",
  "name" : "MII_SP_Meta_Procedure_OPS_Seitenlokalisation",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-10-21",
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
  "description" : "Suchparameter für Procedure.code.coding:ops.extension:Seitenlokalisation",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "code" : "ops-seitenlokalisation",
  "base" : ["Procedure"],
  "type" : "token",
  "expression" : "Procedure.code.coding.extension.where(url = 'http://fhir.de/StructureDefinition/seitenlokalisation').value"
}

```
