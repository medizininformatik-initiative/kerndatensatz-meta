# mii-sp-meta-medication-dosage-rateratio - MII IG Meta v2027.0.0-ballot.rc1

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **mii-sp-meta-medication-dosage-rateratio**

## SearchParameter: mii-sp-meta-medication-dosage-rateratio 

| | |
| :--- | :--- |
| *Offizielle URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-rateratio | *Version*:2027.0.0-ballot.rc1 |
| Active Stand: 2024-10-08 | *Maschinenlesbarer Name*:MII_SP_Meta_Medication_Dosage_RateRatio |

 

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
  "version" : "2027.0.0-ballot.rc1",
  "name" : "MII_SP_Meta_Medication_Dosage_RateRatio",
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
  "description" : "MedicationStatement.dosage.doseAndRate.rate.ofType(Ratio) | MedicationAdministration.dosage.rate.ofType(Ratio) | MedicationRequest.dosageInstruction.doseAndRate.rate.ofType(Ratio)",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
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
