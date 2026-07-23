# mii-sp-meta-patient-hausnummer - MII IG Meta v2026.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-sp-meta-patient-hausnummer**

## SearchParameter: mii-sp-meta-patient-hausnummer 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-hausnummer | *Version*:2026.0.0 |
| Active as of 2024-10-07 | *Computable Name*:MII_SP_Meta_Patient_Hausnummer |

 
Suchparameter für Patient.address.line.extension:Hausnummer 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "mii-sp-meta-patient-hausnummer",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-hausnummer",
  "version" : "2026.0.0",
  "name" : "MII_SP_Meta_Patient_Hausnummer",
  "status" : "active",
  "experimental" : false,
  "date" : "2024-10-07",
  "publisher" : "Medizininformatik Initiative",
  "contact" : [{
    "name" : "Medizininformatik Initiative",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.medizininformatik-initiative.de/"
    }]
  }],
  "description" : "Suchparameter für Patient.address.line.extension:Hausnummer",
  "code" : "hausnummer",
  "base" : ["Patient"],
  "type" : "string",
  "expression" : "Patient.address.line.extension('http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber').value"
}

```
