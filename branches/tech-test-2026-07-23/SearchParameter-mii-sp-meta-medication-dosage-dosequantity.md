# mii-sp-meta-medication-dosage-dosequantity - MII IG Meta v2026.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-sp-meta-medication-dosage-dosequantity**

## SearchParameter: mii-sp-meta-medication-dosage-dosequantity 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-dosequantity | *Version*:2026.0.0 |
| Active as of 2024-10-08 | *Computable Name*:MII_SP_Meta_Medication_Dosage_DoseQuantity |

 

| | | |
| :--- | :--- | :--- |
| Suchparameter für MedicationStatement.dosage.doseAndRate.doseQuantity | MedicationRequest.dosageInstruction.doseAndRate.doseQuantity | MedicationAdministration.dosage.dose |

 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "mii-sp-meta-medication-dosage-dosequantity",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-dosequantity",
  "version" : "2026.0.0",
  "name" : "MII_SP_Meta_Medication_Dosage_DoseQuantity",
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
  "description" : "Suchparameter für MedicationStatement.dosage.doseAndRate.doseQuantity | MedicationRequest.dosageInstruction.doseAndRate.doseQuantity | MedicationAdministration.dosage.dose",
  "code" : "dose-quantity",
  "base" : ["MedicationStatement",
  "MedicationRequest",
  "MedicationAdministration"],
  "type" : "quantity",
  "expression" : "MedicationStatement.dosage.doseAndRate.dose.ofType(Quantity) | MedicationRequest.dosageInstruction.doseAndRate.dose.ofType(Quantity) | MedicationAdministration.dosage.dose",
  "comparator" : ["eq", "gt", "lt", "ge", "le"]
}

```
