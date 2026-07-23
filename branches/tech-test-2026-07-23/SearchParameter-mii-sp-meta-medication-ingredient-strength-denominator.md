# mii-sp-meta-medication-ingredient-strength-denominator - MII IG Meta v2026.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-sp-meta-medication-ingredient-strength-denominator**

## SearchParameter: mii-sp-meta-medication-ingredient-strength-denominator 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-ingredient-strength-denominator | *Version*:2026.0.0 |
| Active as of 2024-10-08 | *Computable Name*:MII_SP_Meta_Medication_Ingredient_Strength_Denominator |

 
Suchparameter für Medication.ingredient.strength.denominator 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "mii-sp-meta-medication-ingredient-strength-denominator",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-ingredient-strength-denominator",
  "version" : "2026.0.0",
  "name" : "MII_SP_Meta_Medication_Ingredient_Strength_Denominator",
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
  "description" : "Suchparameter für Medication.ingredient.strength.denominator",
  "code" : "ingredient-strength-denominator",
  "base" : ["Medication"],
  "type" : "quantity",
  "expression" : "Medication.ingredient.strength.denominator",
  "comparator" : ["eq", "gt", "lt", "ge", "le"]
}

```
