# mii-sp-meta-dokument-documentreference-doc-status - MII IG Meta v2026.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-sp-meta-dokument-documentreference-doc-status**

## SearchParameter: mii-sp-meta-dokument-documentreference-doc-status 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-dokument-documentreference-doc-status | *Version*:2026.0.0 |
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
  "version" : "2026.0.0",
  "name" : "MII_SP_Meta_DocumentReference_Document_Status",
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
  "description" : "Suchparameter für DocumentReference.docStatus",
  "code" : "doc-status",
  "base" : ["DocumentReference"],
  "type" : "token",
  "expression" : "DocumentReference.docStatus"
}

```
