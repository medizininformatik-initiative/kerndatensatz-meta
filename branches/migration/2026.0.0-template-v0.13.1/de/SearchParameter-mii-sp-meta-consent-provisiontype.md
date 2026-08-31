# mii-sp-meta-consent-provisiontype - MII IG Meta v2027.0.0-ballot.rc1

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **mii-sp-meta-consent-provisiontype**

## SearchParameter: mii-sp-meta-consent-provisiontype 

| | |
| :--- | :--- |
| *Offizielle URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-consent-provisiontype | *Version*:2027.0.0-ballot.rc1 |
| Active Stand: 2024-10-17 | *Maschinenlesbarer Name*:MII_SP_Meta_Consent_ProvisionType |

 
Suche im Typ der Provison (permit, deny). 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "mii-sp-meta-consent-provisiontype",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-consent-provisiontype",
  "version" : "2027.0.0-ballot.rc1",
  "name" : "MII_SP_Meta_Consent_ProvisionType",
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
  "description" : "Suche im Typ der Provison (permit, deny).",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "code" : "mii-provision-provision-type",
  "base" : ["Consent"],
  "type" : "token",
  "expression" : "Consent.provision.provision.type",
  "multipleOr" : true,
  "multipleAnd" : true
}

```
