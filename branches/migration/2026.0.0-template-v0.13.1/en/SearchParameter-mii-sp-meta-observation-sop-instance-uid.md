# mii-sp-meta-observation-sop-instance-uid - MII IG Meta v2027.0.0-ballot.rc1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-sp-meta-observation-sop-instance-uid**

## SearchParameter: mii-sp-meta-observation-sop-instance-uid 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-observation-sop-instance-uid | *Version*:2027.0.0-ballot.rc1 |
| Active as of 2025-11-06 | *Computable Name*:MII_SP_Bildgebung_Observation_SOP_Instance_UID |

 
Suchparameter für Observation.sopInstanceUID 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "mii-sp-meta-observation-sop-instance-uid",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-observation-sop-instance-uid",
  "version" : "2027.0.0-ballot.rc1",
  "name" : "MII_SP_Bildgebung_Observation_SOP_Instance_UID",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-11-06",
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
  "description" : "Suchparameter für Observation.sopInstanceUID",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "code" : "sop-instance-uid",
  "base" : ["Observation"],
  "type" : "token",
  "expression" : "Observation.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-sop-instanz-uid').value",
  "modifier" : ["text",
  "not",
  "above",
  "below",
  "in",
  "not-in",
  "missing"]
}

```
