# mii-sp-meta-dokument-documentreference-nlp-processing-status - MII IG Meta v2026.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-sp-meta-dokument-documentreference-nlp-processing-status**

## SearchParameter: mii-sp-meta-dokument-documentreference-nlp-processing-status 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-dokument-documentreference-nlp-processing-status | *Version*:2026.0.0 |
| Active as of 2025-07-30 | *Computable Name*:MII_SP_Meta_DocumentReference_NLP_Processing_Status |

 
Suchparameter für DocumentReference.extension[nlp-processing-status].valueCodeableConcept 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "mii-sp-meta-dokument-documentreference-nlp-processing-status",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-dokument-documentreference-nlp-processing-status",
  "version" : "2026.0.0",
  "name" : "MII_SP_Meta_DocumentReference_NLP_Processing_Status",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-07-30",
  "publisher" : "Medizininformatik Initiative",
  "contact" : [{
    "name" : "Medizininformatik Initiative",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.medizininformatik-initiative.de/"
    }]
  }],
  "description" : "Suchparameter für DocumentReference.extension[nlp-processing-status].valueCodeableConcept",
  "code" : "nlp-processing-status",
  "base" : ["DocumentReference"],
  "type" : "token",
  "expression" : "DocumentReference.extension.where(url='https://www.medizininformatik-initiative.de/fhir/ext/modul-dokument/StructureDefinition/mii-ex-dokument-nlp-processing-status').value"
}

```
