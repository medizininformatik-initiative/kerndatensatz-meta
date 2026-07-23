# mii-sp-meta-encounter-entlassungsgrund-ersteundzweitestelle - MII IG Meta v2026.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-sp-meta-encounter-entlassungsgrund-ersteundzweitestelle**

## SearchParameter: mii-sp-meta-encounter-entlassungsgrund-ersteundzweitestelle 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-encounter-entlassungsgrund-ersteundzweitestelle | *Version*:2026.0.0 |
| Active as of 2025-07-21 | *Computable Name*:MII_SP_Meta_Encounter_Entlassungsgrund_ErsteUndZweiteStelle |

 
Suchparameter für Encounter.hospitalization.dischargeDisposition.extension:Entlassungsgrund.extension:ErsteUndZweiteStelle 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "mii-sp-meta-encounter-entlassungsgrund-ersteundzweitestelle",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-encounter-entlassungsgrund-ersteundzweitestelle",
  "version" : "2026.0.0",
  "name" : "MII_SP_Meta_Encounter_Entlassungsgrund_ErsteUndZweiteStelle",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-07-21",
  "publisher" : "Medizininformatik Initiative",
  "contact" : [{
    "name" : "Medizininformatik Initiative",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.medizininformatik-initiative.de/"
    }]
  }],
  "description" : "Suchparameter für Encounter.hospitalization.dischargeDisposition.extension:Entlassungsgrund.extension:ErsteUndZweiteStelle",
  "code" : "entlassungsgrund-ersteundzweitestelle",
  "base" : ["Encounter"],
  "type" : "token",
  "expression" : "Encounter.hospitalization.dischargeDisposition.extension.where(url = 'http://fhir.de/StructureDefinition/Entlassungsgrund').extension.where(url = 'ErsteUndZweiteStelle').value"
}

```
