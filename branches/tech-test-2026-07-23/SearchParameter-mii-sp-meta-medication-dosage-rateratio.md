# mii-sp-meta-medication-dosage-rateratio - MII IG Meta v2026.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-sp-meta-medication-dosage-rateratio**

## SearchParameter: mii-sp-meta-medication-dosage-rateratio 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-rateratio | *Version*:2026.0.0 |
| Active as of 2024-10-08 | *Computable Name*:MII_SP_Meta_Medication_Dosage_RateRatio |

 

| | | |
| :--- | :--- | :--- |
| MedicationStatement.dosage.doseAndRate.rate.ofType(Ratio) | MedicationAdministration.dosage.rate.ofType(Ratio) | MedicationRequest.dosageInstruction.doseAndRate.rate.ofType(Ratio) |

 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "mii-sp-meta-medication-dosage-rateratio",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-rateratio",
  "version" : "2026.0.0",
  "name" : "MII_SP_Meta_Medication_Dosage_RateRatio",
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
  "description" : "MedicationStatement.dosage.doseAndRate.rate.ofType(Ratio) | MedicationAdministration.dosage.rate.ofType(Ratio) | MedicationRequest.dosageInstruction.doseAndRate.rate.ofType(Ratio)",
  "code" : "rateratio",
  "base" : ["MedicationStatement",
  "MedicationAdministration",
  "MedicationRequest"],
  "type" : "composite",
  "expression" : "MedicationStatement.dosage.doseAndRate.rate.ofType(Ratio) | MedicationAdministration.dosage.rate.ofType(Ratio) | MedicationRequest.dosageInstruction.doseAndRate.rate.ofType(Ratio)",
  "component" : [{
    "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-rateratio-numerator",
    "expression" : "numerator"
  },
  {
    "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-rateratio-denominator",
    "expression" : "denominator"
  }]
}

```
