# mii-sp-meta-encounter-aufnahmegrund-ersteundzweitestelle - MII IG Meta v2026.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-sp-meta-encounter-aufnahmegrund-ersteundzweitestelle**

## SearchParameter: mii-sp-meta-encounter-aufnahmegrund-ersteundzweitestelle 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-encounter-aufnahmegrund-ersteundzweitestelle | *Version*:2026.0.0 |
| Active as of 2025-07-14 | *Computable Name*:MII_SP_Meta_Encounter_Aufnahmegrund_ErsteUndZweiteStelle |

 
Suchparameter für Encounter.extension:Aufnahmegrund.extension:ErsteUndZweiteStelle 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "mii-sp-meta-encounter-aufnahmegrund-ersteundzweitestelle",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-encounter-aufnahmegrund-ersteundzweitestelle",
  "version" : "2026.0.0",
  "name" : "MII_SP_Meta_Encounter_Aufnahmegrund_ErsteUndZweiteStelle",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-07-14",
  "publisher" : "Medizininformatik Initiative",
  "contact" : [{
    "name" : "Medizininformatik Initiative",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.medizininformatik-initiative.de/"
    }]
  }],
  "description" : "Suchparameter für Encounter.extension:Aufnahmegrund.extension:ErsteUndZweiteStelle",
  "code" : "aufnahmegrund-ersteundzweitestelle",
  "base" : ["Encounter"],
  "type" : "token",
  "expression" : "Encounter.extension.where(url = 'http://fhir.de/StructureDefinition/Aufnahmegrund').extension.where(url = 'ErsteUndZweiteStelle').value"
}

```
