# mii-sp-meta-procedure-recorder - MII IG Meta v2027.0.0-ballot.rc1

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **mii-sp-meta-procedure-recorder**

## SearchParameter: mii-sp-meta-procedure-recorder 

| | |
| :--- | :--- |
| *Offizielle URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-procedure-recorder | *Version*:2027.0.0-ballot.rc1 |
| Active Stand: 2025-10-06 | *Maschinenlesbarer Name*:MII_SP_Meta_Procedure_Recorder |

 
Suchparameter für Procedure.recorder 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "mii-sp-meta-procedure-recorder",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-procedure-recorder",
  "version" : "2027.0.0-ballot.rc1",
  "name" : "MII_SP_Meta_Procedure_Recorder",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-10-06",
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
  "description" : "Suchparameter für Procedure.recorder",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "code" : "recorder",
  "base" : ["Procedure"],
  "type" : "reference",
  "expression" : "Procedure.recorder",
  "target" : ["PractitionerRole", "Practitioner", "RelatedPerson", "Patient"]
}

```
