# mii-sp-meta-adverseevent-suspectentity-instance - MII IG Meta v2026.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-sp-meta-adverseevent-suspectentity-instance**

## SearchParameter: mii-sp-meta-adverseevent-suspectentity-instance 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-adverseevent-suspectentity-instance | *Version*:2026.0.0 |
| Active as of 2024-10-24 | *Computable Name*:MII_SP_Meta_AdverseEvent_SuspectEntity_Instance |

 
SearchParameter for AdverseEvent.suspectEntity.instance 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "mii-sp-meta-adverseevent-suspectentity-instance",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-adverseevent-suspectentity-instance",
  "version" : "2026.0.0",
  "name" : "MII_SP_Meta_AdverseEvent_SuspectEntity_Instance",
  "status" : "active",
  "experimental" : false,
  "date" : "2024-10-24",
  "publisher" : "Medizininformatik Initiative",
  "contact" : [{
    "name" : "Medizininformatik Initiative",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.medizininformatik-initiative.de/"
    }]
  }],
  "description" : "SearchParameter for AdverseEvent.suspectEntity.instance",
  "code" : "instance",
  "base" : ["AdverseEvent"],
  "type" : "reference",
  "expression" : "AdverseEvent.suspectEntity.instance"
}

```
