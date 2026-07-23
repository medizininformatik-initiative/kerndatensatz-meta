# mii-sp-meta-medication-dosage-doserange-low - MII IG Meta v2026.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-sp-meta-medication-dosage-doserange-low**

## SearchParameter: mii-sp-meta-medication-dosage-doserange-low 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-doserange-low | *Version*:2026.0.0 |
| Active as of 2024-10-08 | *Computable Name*:MII_SP_Meta_Medication_Dosage_DoseRangeLow |

 

| | |
| :--- | :--- |
| Suchparameter für MedicationStatement.dosage.doseAndRate.doseRange.low | MedicationRequest.dosageInstruction.doseAndRate.doseRange.low |

 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "mii-sp-meta-medication-dosage-doserange-low",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-doserange-low",
  "version" : "2026.0.0",
  "name" : "MII_SP_Meta_Medication_Dosage_DoseRangeLow",
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
  "description" : "Suchparameter für MedicationStatement.dosage.doseAndRate.doseRange.low | MedicationRequest.dosageInstruction.doseAndRate.doseRange.low",
  "code" : "doserange-low",
  "base" : ["MedicationStatement", "MedicationRequest"],
  "type" : "quantity",
  "expression" : "MedicationStatement.dosage.doseAndRate.dose.ofType(Range).low | MedicationRequest.dosageInstruction.doseAndRate.dose.ofType(Range).low",
  "comparator" : ["eq", "gt", "lt", "ge", "le"]
}

```
