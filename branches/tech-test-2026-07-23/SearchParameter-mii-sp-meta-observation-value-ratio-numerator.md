# mii-sp-meta-observation-value-ratio-numerator - MII IG Meta v2026.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-sp-meta-observation-value-ratio-numerator**

## SearchParameter: mii-sp-meta-observation-value-ratio-numerator 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-observation-value-ratio-numerator | *Version*:2026.0.0 |
| Active as of 2024-11-07 | *Computable Name*:MII_SP_Meta_Observation_Value_Ratio_Numerator |

 
SearchParameter for Observation.valueRatio.numerator 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "mii-sp-meta-observation-value-ratio-numerator",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-observation-value-ratio-numerator",
  "version" : "2026.0.0",
  "name" : "MII_SP_Meta_Observation_Value_Ratio_Numerator",
  "status" : "active",
  "experimental" : false,
  "date" : "2024-11-07",
  "publisher" : "Medizininformatik Initiative",
  "contact" : [{
    "name" : "Medizininformatik Initiative",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.medizininformatik-initiative.de/"
    }]
  }],
  "description" : "SearchParameter for Observation.valueRatio.numerator",
  "code" : "value-ratio-numerator",
  "base" : ["Observation"],
  "type" : "quantity",
  "expression" : "Observation.value.ofType(Ratio).numerator"
}

```
