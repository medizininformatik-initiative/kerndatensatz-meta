# mii-sp-meta-medication-dosage-rateratio-denominator - MII IG Meta v2027.0.0-ballot.rc1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-sp-meta-medication-dosage-rateratio-denominator**

## SearchParameter: mii-sp-meta-medication-dosage-rateratio-denominator 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-rateratio-denominator | *Version*:2027.0.0-ballot.rc1 |
| Active as of 2024-10-08 | *Computable Name*:MII_SP_Meta_Medication_Dosage_RateRatioDenominator |

 

| | | |
| :--- | :--- | :--- |
| Suchparameter für MedicationStatement.dosage.doseAndRate.rateRatio.denominator | MedicationAdministration.dosage.rate.ofType(Ratio).denominator | MedicationRequest.dosageInstruction.doseAndRate.rate.ofType(Ratio).denominator |

 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "mii-sp-meta-medication-dosage-rateratio-denominator",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-rateratio-denominator",
  "version" : "2027.0.0-ballot.rc1",
  "name" : "MII_SP_Meta_Medication_Dosage_RateRatioDenominator",
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
  "description" : "Suchparameter für MedicationStatement.dosage.doseAndRate.rateRatio.denominator | MedicationAdministration.dosage.rate.ofType(Ratio).denominator | MedicationRequest.dosageInstruction.doseAndRate.rate.ofType(Ratio).denominator",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "code" : "rateratio-denominator",
  "base" : ["MedicationStatement",
  "MedicationAdministration",
  "MedicationRequest"],
  "type" : "quantity",
  "expression" : "MedicationStatement.dosage.doseAndRate.rate.ofType(Ratio).denominator | MedicationAdministration.dosage.rate.ofType(Ratio).denominator | MedicationRequest.dosageInstruction.doseAndRate.rate.ofType(Ratio).denominator",
  "comparator" : ["eq", "gt", "lt", "ge", "le"]
}

```
