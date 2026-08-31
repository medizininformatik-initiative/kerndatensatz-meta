# mii-sp-meta-dokument-documentreference-attachment-creation - MII IG Meta v2027.0.0-ballot.rc1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-sp-meta-dokument-documentreference-attachment-creation**

## SearchParameter: mii-sp-meta-dokument-documentreference-attachment-creation 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-dokument-documentreference-attachment-creation | *Version*:2027.0.0-ballot.rc1 |
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
  "version" : "2027.0.0-ballot.rc1",
  "name" : "MII_SP_Meta_DocumentReference_Attachment_Creation",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-06-23",
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
  "description" : "Suchparameter für DocumentReference.content.attachment.creation",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "code" : "creation",
  "base" : ["DocumentReference"],
  "type" : "date",
  "expression" : "DocumentReference.content.attachment.creation"
}

```
