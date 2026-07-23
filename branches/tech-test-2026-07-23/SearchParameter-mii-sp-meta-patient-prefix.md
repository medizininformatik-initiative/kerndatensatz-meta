# mii-sp-meta-patient-prefix - MII IG Meta v2026.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-sp-meta-patient-prefix**

## SearchParameter: mii-sp-meta-patient-prefix 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-prefix | *Version*:2026.0.0 |
| Active as of 2024-10-07 | *Computable Name*:MII_SP_Meta_Patient_Prefix |

 
Suchparameter für Patient.name.prefix 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "mii-sp-meta-patient-prefix",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-prefix",
  "version" : "2026.0.0",
  "name" : "MII_SP_Meta_Patient_Prefix",
  "status" : "active",
  "experimental" : false,
  "date" : "2024-10-07",
  "publisher" : "Medizininformatik Initiative",
  "contact" : [{
    "name" : "Medizininformatik Initiative",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.medizininformatik-initiative.de/"
    }]
  }],
  "description" : "Suchparameter für Patient.name.prefix",
  "code" : "prefix",
  "base" : ["Patient"],
  "type" : "token",
  "expression" : "Patient.name.prefix"
}

```
