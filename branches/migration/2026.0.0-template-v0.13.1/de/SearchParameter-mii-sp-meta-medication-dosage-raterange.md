# mii-sp-meta-medication-dosage-raterange - MII IG Meta v2027.0.0-ballot.rc1

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **mii-sp-meta-medication-dosage-raterange**

## SearchParameter: mii-sp-meta-medication-dosage-raterange 

| | |
| :--- | :--- |
| *Offizielle URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-raterange | *Version*:2027.0.0-ballot.rc1 |
| Active Stand: 2024-06-28 | *Maschinenlesbarer Name*:MII_SP_Meta_Medication_Dosage_RateRange |

 

| | |
| :--- | :--- |
| Suchparameter für MedicationStatement.dosage.doseAndRate.rateRange | MedicationRequest.dosageInstruction.doseAndRate.rateRange |

 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "mii-sp-meta-medication-dosage-raterange",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-raterange",
  "version" : "2027.0.0-ballot.rc1",
  "name" : "MII_SP_Meta_Medication_Dosage_RateRange",
  "status" : "active",
  "experimental" : false,
  "date" : "2024-06-28",
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
  "description" : "Suchparameter für MedicationStatement.dosage.doseAndRate.rateRange | MedicationRequest.dosageInstruction.doseAndRate.rateRange",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "code" : "raterange",
  "base" : ["MedicationStatement", "MedicationRequest"],
  "type" : "composite",
  "expression" : "MedicationStatement.dosage.doseAndRate.rate.ofType(Range) | MedicationRequest.dosageInstruction.doseAndRate.rate.ofType(Range)",
  "component" : [{
    "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-raterange-low",
    "expression" : "low"
  },
  {
    "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-raterange-high",
    "expression" : "high"
  }]
}

```
