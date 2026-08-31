# mii-sp-meta-medication-partof - MII IG Meta v2027.0.0-ballot.rc1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-sp-meta-medication-partof**

## SearchParameter: mii-sp-meta-medication-partof 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-partof | *Version*:2027.0.0-ballot.rc1 |
| Active as of 2024-11-14 | *Computable Name*:MII_SP_Meta_Medication_PartOf |

 

| | |
| :--- | :--- |
| Suchparameter für (MedicationAdministration | MedicationStatement).partOf |

 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "mii-sp-meta-medication-partof",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-partof",
  "version" : "2027.0.0-ballot.rc1",
  "name" : "MII_SP_Meta_Medication_PartOf",
  "status" : "active",
  "experimental" : false,
  "date" : "2024-11-14",
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
  "description" : "Suchparameter für (MedicationAdministration|MedicationStatement).partOf",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "code" : "part-of",
  "base" : ["MedicationStatement", "MedicationAdministration"],
  "type" : "reference",
  "expression" : "MedicationAdministration.partOf | MedicationStatement.partOf",
  "target" : ["MedicationAdministration",
  "Procedure",
  "MedicationDispense",
  "MedicationStatement",
  "Observation"]
}

```
