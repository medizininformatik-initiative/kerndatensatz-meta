# mii-sp-meta-body-structure-location-qualifier - MII IG Meta v2026.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-sp-meta-body-structure-location-qualifier**

## SearchParameter: mii-sp-meta-body-structure-location-qualifier 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-body-structure-location-qualifier | *Version*:2026.0.0 |
| Active as of 2025-11-06 | *Computable Name*:MII_SP_Bildgebung_Koerperstruktur_Location_Qualifier |

 
Suchparameter für BodyStructure.locationQualifier 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "mii-sp-meta-body-structure-location-qualifier",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-body-structure-location-qualifier",
  "version" : "2026.0.0",
  "name" : "MII_SP_Bildgebung_Koerperstruktur_Location_Qualifier",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-11-06",
  "publisher" : "Medizininformatik Initiative",
  "contact" : [{
    "name" : "Medizininformatik Initiative",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.medizininformatik-initiative.de/"
    }]
  }],
  "description" : "Suchparameter für BodyStructure.locationQualifier",
  "code" : "location-qualifier",
  "base" : ["BodyStructure"],
  "type" : "token",
  "expression" : "BodyStructure.locationQualifier",
  "modifier" : ["text",
  "not",
  "above",
  "below",
  "in",
  "not-in",
  "missing"]
}

```
