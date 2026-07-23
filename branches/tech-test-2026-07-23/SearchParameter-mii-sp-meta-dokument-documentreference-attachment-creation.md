# mii-sp-meta-dokument-documentreference-attachment-creation - MII IG Meta v2026.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-sp-meta-dokument-documentreference-attachment-creation**

## SearchParameter: mii-sp-meta-dokument-documentreference-attachment-creation 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-dokument-documentreference-attachment-creation | *Version*:2026.0.0 |
| Active as of 2025-06-23 | *Computable Name*:MII_SP_Meta_DocumentReference_Attachment_Creation |

 
Suchparameter für DocumentReference.content.attachment.creation 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "mii-sp-meta-dokument-documentreference-attachment-creation",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-dokument-documentreference-attachment-creation",
  "version" : "2026.0.0",
  "name" : "MII_SP_Meta_DocumentReference_Attachment_Creation",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-06-23",
  "publisher" : "Medizininformatik Initiative",
  "contact" : [{
    "name" : "Medizininformatik Initiative",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.medizininformatik-initiative.de/"
    }]
  }],
  "description" : "Suchparameter für DocumentReference.content.attachment.creation",
  "code" : "creation",
  "base" : ["DocumentReference"],
  "type" : "date",
  "expression" : "DocumentReference.content.attachment.creation"
}

```
