# mii-sp-meta-procedure-recorder - MII IG Meta v2026.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-sp-meta-procedure-recorder**

## SearchParameter: mii-sp-meta-procedure-recorder 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-procedure-recorder | *Version*:2026.0.0 |
| Active as of 2025-10-06 | *Computable Name*:MII_SP_Meta_Procedure_Recorder |

 
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
  "version" : "2026.0.0",
  "name" : "MII_SP_Meta_Procedure_Recorder",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-10-06",
  "publisher" : "Medizininformatik Initiative",
  "contact" : [{
    "name" : "Medizininformatik Initiative",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.medizininformatik-initiative.de/"
    }]
  }],
  "description" : "Suchparameter für Procedure.recorder",
  "code" : "recorder",
  "base" : ["Procedure"],
  "type" : "reference",
  "expression" : "Procedure.recorder",
  "target" : ["PractitionerRole", "Practitioner", "RelatedPerson", "Patient"]
}

```
