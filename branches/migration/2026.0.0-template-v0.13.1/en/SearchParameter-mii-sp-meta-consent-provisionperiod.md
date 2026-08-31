# mii-sp-meta-consent-provisionperiod - MII IG Meta v2027.0.0-ballot.rc1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-sp-meta-consent-provisionperiod**

## SearchParameter: mii-sp-meta-consent-provisionperiod 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-consent-provisionperiod | *Version*:2027.0.0-ballot.rc1 |
| Active as of 2024-10-17 | *Computable Name*:MII_SP_Meta_Consent_ProvisionPeriod |

 
Suche im Zeitraum der Provision. Dieser Suchparameter bezieht sich explizit auf die zweite Verschachtelungsebene von provison. 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "mii-sp-meta-consent-provisionperiod",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-consent-provisionperiod",
  "version" : "2027.0.0-ballot.rc1",
  "name" : "MII_SP_Meta_Consent_ProvisionPeriod",
  "status" : "active",
  "experimental" : false,
  "date" : "2024-10-17",
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
  "description" : "Suche im Zeitraum der Provision. Dieser Suchparameter bezieht sich explizit auf die zweite Verschachtelungsebene von provison.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "code" : "mii-provision-provision-period",
  "base" : ["Consent"],
  "type" : "date",
  "expression" : "Consent.provision.provision.period",
  "multipleOr" : true,
  "multipleAnd" : true
}

```
