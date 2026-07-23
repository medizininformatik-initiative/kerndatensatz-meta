# mii-sp-meta-procedure-dokumentationsdatum - MII IG Meta v2026.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-sp-meta-procedure-dokumentationsdatum**

## SearchParameter: mii-sp-meta-procedure-dokumentationsdatum 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-procedure-dokumentationsdatum | *Version*:2026.0.0 |
| Active as of 2024-10-08 | *Computable Name*:MII_SP_Meta_Procedure_Dokumentationsdatum |

 
Suchparameter für Procedure.extension:Dokumentationsdatum 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "mii-sp-meta-procedure-dokumentationsdatum",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-procedure-dokumentationsdatum",
  "version" : "2026.0.0",
  "name" : "MII_SP_Meta_Procedure_Dokumentationsdatum",
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
  "description" : "Suchparameter für Procedure.extension:Dokumentationsdatum",
  "code" : "dokumentationsdatum",
  "base" : ["Procedure"],
  "type" : "date",
  "expression" : "Procedure.extension('http://fhir.de/StructureDefinition/ProzedurDokumentationsdatum').value"
}

```
