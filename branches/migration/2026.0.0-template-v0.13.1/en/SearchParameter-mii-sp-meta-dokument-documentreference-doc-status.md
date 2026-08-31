# mii-sp-meta-dokument-documentreference-doc-status - MII IG Meta v2027.0.0-ballot.rc1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-sp-meta-dokument-documentreference-doc-status**

## SearchParameter: mii-sp-meta-dokument-documentreference-doc-status 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-dokument-documentreference-doc-status | *Version*:2027.0.0-ballot.rc1 |
| Active as of 2025-06-23 | *Computable Name*:MII_SP_Meta_DocumentReference_Document_Status |

 
Suchparameter für DocumentReference.docStatus 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "mii-sp-meta-dokument-documentreference-doc-status",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-dokument-documentreference-doc-status",
  "version" : "2027.0.0-ballot.rc1",
  "name" : "MII_SP_Meta_DocumentReference_Document_Status",
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
  "description" : "Suchparameter für DocumentReference.docStatus",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "code" : "doc-status",
  "base" : ["DocumentReference"],
  "type" : "token",
  "expression" : "DocumentReference.docStatus"
}

```
