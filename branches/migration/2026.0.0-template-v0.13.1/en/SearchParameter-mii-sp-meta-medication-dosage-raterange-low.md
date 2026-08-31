# mii-sp-meta-medication-dosage-raterange-low - MII IG Meta v2027.0.0-ballot.rc1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-sp-meta-medication-dosage-raterange-low**

## SearchParameter: mii-sp-meta-medication-dosage-raterange-low 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-raterange-low | *Version*:2027.0.0-ballot.rc1 |
| Active as of 2024-10-08 | *Computable Name*:MII_SP_Meta_Medication_Dosage_RateRangeLow |

 

| | |
| :--- | :--- |
| Suchparameter für MedicationStatement.dosage.doseAndRate.rateRange.low | MedicationRequest.dosageInstruction.doseAndRate.rateRange.low |

 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "mii-sp-meta-medication-dosage-raterange-low",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-raterange-low",
  "version" : "2027.0.0-ballot.rc1",
  "name" : "MII_SP_Meta_Medication_Dosage_RateRangeLow",
  "status" : "active",
  "experimental" : false,
  "date" : "2024-10-08",
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
  "description" : "Suchparameter für MedicationStatement.dosage.doseAndRate.rateRange.low | MedicationRequest.dosageInstruction.doseAndRate.rateRange.low",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "code" : "raterange-low",
  "base" : ["MedicationStatement", "MedicationRequest"],
  "type" : "quantity",
  "expression" : "MedicationStatement.dosage.doseAndRate.rate.ofType(Range).low | MedicationRequest.dosageInstruction.doseAndRate.rate.ofType(Range).low",
  "comparator" : ["eq", "gt", "lt", "ge", "le"]
}

```
