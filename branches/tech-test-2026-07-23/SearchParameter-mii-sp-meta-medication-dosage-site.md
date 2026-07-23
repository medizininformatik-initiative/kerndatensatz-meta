# mii-sp-meta-medication-dosage-site - MII IG Meta v2026.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-sp-meta-medication-dosage-site**

## SearchParameter: mii-sp-meta-medication-dosage-site 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-site | *Version*:2026.0.0 |
| Active as of 2024-10-08 | *Computable Name*:MII_SP_Meta_Medication_Dosage_Site |

 

| | | |
| :--- | :--- | :--- |
| Suchparameter für (MedicationAdministration | MedicationStatement).dosage.site | MedicationRequest.dosageInstruction.site |

 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "mii-sp-meta-medication-dosage-site",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-site",
  "version" : "2026.0.0",
  "name" : "MII_SP_Meta_Medication_Dosage_Site",
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
  "description" : "Suchparameter für (MedicationAdministration|MedicationStatement).dosage.site | MedicationRequest.dosageInstruction.site",
  "code" : "dosage-site",
  "base" : ["MedicationStatement",
  "MedicationAdministration",
  "MedicationRequest"],
  "type" : "token",
  "expression" : "MedicationAdministration.dosage.site | MedicationStatement.dosage.site | MedicationRequest.dosageInstruction.site",
  "modifier" : ["text", "in", "not-in", "below", "above"]
}

```
