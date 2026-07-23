# mii-sp-meta-medication-dosage-doserange - MII IG Meta v2026.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-sp-meta-medication-dosage-doserange**

## SearchParameter: mii-sp-meta-medication-dosage-doserange 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-doserange | *Version*:2026.0.0 |
| Active as of 2024-10-08 | *Computable Name*:MII_SP_Meta_Medication_Dosage_DoseRange |

 

| | |
| :--- | :--- |
| Suchparameter für MedicationStatement.dosage.doseAndRate.doseRange | MedicationRequest.dosageInstruction.doseAndRate.doseRange |

 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "mii-sp-meta-medication-dosage-doserange",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-doserange",
  "version" : "2026.0.0",
  "name" : "MII_SP_Meta_Medication_Dosage_DoseRange",
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
  "description" : "Suchparameter für MedicationStatement.dosage.doseAndRate.doseRange | MedicationRequest.dosageInstruction.doseAndRate.doseRange",
  "code" : "doserange",
  "base" : ["MedicationStatement", "MedicationRequest"],
  "type" : "composite",
  "expression" : "MedicationStatement.dosage.doseAndRate.dose.ofType(Range) | MedicationRequest.dosageInstruction.doseAndRate.dose.ofType(Range)",
  "component" : [{
    "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-doserange-low",
    "expression" : "low"
  },
  {
    "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-doserange-high",
    "expression" : "high"
  }]
}

```
