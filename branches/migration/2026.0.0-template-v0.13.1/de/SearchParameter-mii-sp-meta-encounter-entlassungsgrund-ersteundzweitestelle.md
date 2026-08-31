# mii-sp-meta-encounter-entlassungsgrund-ersteundzweitestelle - MII IG Meta v2027.0.0-ballot.rc1

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **mii-sp-meta-encounter-entlassungsgrund-ersteundzweitestelle**

## SearchParameter: mii-sp-meta-encounter-entlassungsgrund-ersteundzweitestelle 

| | |
| :--- | :--- |
| *Offizielle URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-encounter-entlassungsgrund-ersteundzweitestelle | *Version*:2027.0.0-ballot.rc1 |
| Active Stand: 2025-07-21 | *Maschinenlesbarer Name*:MII_SP_Meta_Encounter_Entlassungsgrund_ErsteUndZweiteStelle |

 
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
  "version" : "2027.0.0-ballot.rc1",
  "name" : "MII_SP_Meta_Encounter_Entlassungsgrund_ErsteUndZweiteStelle",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-07-21",
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
  "description" : "Suchparameter für Encounter.hospitalization.dischargeDisposition.extension:Entlassungsgrund.extension:ErsteUndZweiteStelle",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "code" : "entlassungsgrund-ersteundzweitestelle",
  "base" : ["Encounter"],
  "type" : "token",
  "expression" : "Encounter.hospitalization.dischargeDisposition.extension.where(url = 'http://fhir.de/StructureDefinition/Entlassungsgrund').extension.where(url = 'ErsteUndZweiteStelle').value"
}

```
