# mii-sp-meta-consent-provisioncode - MII IG Meta v2026.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-sp-meta-consent-provisioncode**

## SearchParameter: mii-sp-meta-consent-provisioncode 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-consent-provisioncode | *Version*:2026.0.0 |
| Active as of 2024-10-17 | *Computable Name*:MII_SP_Meta_Consent_ProvisionCode |

 
Suche im Code der Provison 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "mii-sp-meta-consent-provisioncode",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-consent-provisioncode",
  "version" : "2026.0.0",
  "name" : "MII_SP_Meta_Consent_ProvisionCode",
  "status" : "active",
  "experimental" : false,
  "date" : "2024-10-17",
  "publisher" : "Medizininformatik Initiative",
  "contact" : [{
    "name" : "Medizininformatik Initiative",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.medizininformatik-initiative.de/"
    }]
  }],
  "description" : "Suche im Code der Provison",
  "code" : "mii-provision-provision-code",
  "base" : ["Consent"],
  "type" : "token",
  "expression" : "Consent.provision.provision.code",
  "multipleOr" : true,
  "multipleAnd" : true
}

```
