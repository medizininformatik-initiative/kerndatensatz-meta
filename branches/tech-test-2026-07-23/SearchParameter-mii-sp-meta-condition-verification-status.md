# mii-sp-meta-condition-verification-status - MII IG Meta v2026.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-sp-meta-condition-verification-status**

## SearchParameter: mii-sp-meta-condition-verification-status 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-condition-verification-status | *Version*:2026.0.0 |
| Active as of 2024-10-24 | *Computable Name*:MII_SP_Meta_Condition_Verification_Status |

 
SearchParameter for Condition.verificationStatus 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "mii-sp-meta-condition-verification-status",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-condition-verification-status",
  "version" : "2026.0.0",
  "name" : "MII_SP_Meta_Condition_Verification_Status",
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
  "description" : "SearchParameter for Condition.verificationStatus",
  "code" : "verification-status",
  "base" : ["Condition"],
  "type" : "token",
  "expression" : "Condition.verificationStatus"
}

```
