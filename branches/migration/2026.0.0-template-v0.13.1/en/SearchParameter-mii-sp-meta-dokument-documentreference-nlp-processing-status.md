# mii-sp-meta-dokument-documentreference-nlp-processing-status - MII IG Meta v2027.0.0-ballot.rc1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-sp-meta-dokument-documentreference-nlp-processing-status**

## SearchParameter: mii-sp-meta-dokument-documentreference-nlp-processing-status 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-dokument-documentreference-nlp-processing-status | *Version*:2027.0.0-ballot.rc1 |
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
  "version" : "2027.0.0-ballot.rc1",
  "name" : "MII_SP_Meta_DocumentReference_NLP_Processing_Status",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-07-30",
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
  "description" : "Suchparameter für DocumentReference.extension[nlp-processing-status].valueCodeableConcept",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "code" : "nlp-processing-status",
  "base" : ["DocumentReference"],
  "type" : "token",
  "expression" : "DocumentReference.extension.where(url='https://www.medizininformatik-initiative.de/fhir/ext/modul-dokument/StructureDefinition/mii-ex-dokument-nlp-processing-status').value"
}

```
