# mii-sp-meta-servicerequest-reasonreference - MII IG Meta v2026.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-sp-meta-servicerequest-reasonreference**

## SearchParameter: mii-sp-meta-servicerequest-reasonreference 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-servicerequest-reasonreference | *Version*:2026.0.0 |
| Active as of 2024-10-08 | *Computable Name*:MII_SP_Meta_ServiceRequest_ReasonReference |

 
Suchparameter für ServiceRequest.reasonReference 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "mii-sp-meta-servicerequest-reasonreference",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-servicerequest-reasonreference",
  "version" : "2026.0.0",
  "name" : "MII_SP_Meta_ServiceRequest_ReasonReference",
  "status" : "active",
  "experimental" : false,
  "date" : "2024-10-08",
  "publisher" : "Medizininformatik Initiative",
  "contact" : [{
    "name" : "Medizininformatik Initiative",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.medizininformatik-initiative.de/"
    }]
  }],
  "description" : "Suchparameter für ServiceRequest.reasonReference",
  "code" : "reason-reference",
  "base" : ["ServiceRequest"],
  "type" : "reference",
  "expression" : "ServiceRequest.reasonReference",
  "target" : ["Condition",
  "Observation",
  "DiagnosticReport",
  "DocumentReference"]
}

```
