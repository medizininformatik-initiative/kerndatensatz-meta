# mii-sp-meta-encounter-diagnosis-use - MII IG Meta v2027.0.0-ballot.rc1

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **mii-sp-meta-encounter-diagnosis-use**

## SearchParameter: mii-sp-meta-encounter-diagnosis-use 

| | |
| :--- | :--- |
| *Offizielle URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-encounter-diagnosis-use | *Version*:2027.0.0-ballot.rc1 |
| Active Stand: 2024-10-08 | *Maschinenlesbarer Name*:MII_SP_Meta_Encounter_DiagnosisUse |

 
Suchparameter für Encounter.diagnosis.use 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "mii-sp-meta-encounter-diagnosis-use",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-encounter-diagnosis-use",
  "version" : "2027.0.0-ballot.rc1",
  "name" : "MII_SP_Meta_Encounter_DiagnosisUse",
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
  "description" : "Suchparameter für Encounter.diagnosis.use",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "code" : "diagnosis-use",
  "base" : ["Encounter"],
  "type" : "token",
  "expression" : "Encounter.diagnosis.use"
}

```
