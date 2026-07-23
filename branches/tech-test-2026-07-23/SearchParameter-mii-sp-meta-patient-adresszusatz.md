# mii-sp-meta-patient-adresszusatz - MII IG Meta v2026.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-sp-meta-patient-adresszusatz**

## SearchParameter: mii-sp-meta-patient-adresszusatz 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-adresszusatz | *Version*:2026.0.0 |
| Active as of 2024-10-07 | *Computable Name*:MII_SP_Meta_Person_Adresszusatz |

 
Suchparameter für Patient.address.line.extension:Adresszusatz 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "mii-sp-meta-patient-adresszusatz",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-adresszusatz",
  "version" : "2026.0.0",
  "name" : "MII_SP_Meta_Person_Adresszusatz",
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
  "description" : "Suchparameter für Patient.address.line.extension:Adresszusatz",
  "code" : "adresszusatz",
  "base" : ["Patient"],
  "type" : "string",
  "expression" : "Patient.address.line.extension('http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-additionalLocator').value"
}

```
