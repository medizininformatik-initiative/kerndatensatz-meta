# mii-sp-meta-observation-body-structure - MII IG Meta v2026.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-sp-meta-observation-body-structure**

## SearchParameter: mii-sp-meta-observation-body-structure 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-observation-body-structure | *Version*:2026.0.0 |
| Active as of 2025-11-06 | *Computable Name*:MII_SP_Bildgebung_Observation_Body_Structure |

 
Suchparameter für Observation.bodyStructure 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "mii-sp-meta-observation-body-structure",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-observation-body-structure",
  "version" : "2026.0.0",
  "name" : "MII_SP_Bildgebung_Observation_Body_Structure",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-11-06",
  "publisher" : "Medizininformatik Initiative",
  "contact" : [{
    "name" : "Medizininformatik Initiative",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.medizininformatik-initiative.de/"
    }]
  }],
  "description" : "Suchparameter für Observation.bodyStructure",
  "code" : "body-structure",
  "base" : ["Observation"],
  "type" : "reference",
  "expression" : "Observation.extension('http://hl7.org/fhir/5.0/StructureDefinition/extension-Observation.bodyStructure').value",
  "target" : ["BodyStructure"]
}

```
