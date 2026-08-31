# mii-sp-meta-patient-gemeindeschluessel - MII IG Meta v2027.0.0-ballot.rc1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-sp-meta-patient-gemeindeschluessel**

## SearchParameter: mii-sp-meta-patient-gemeindeschluessel 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-gemeindeschluessel | *Version*:2027.0.0-ballot.rc1 |
| Active as of 2024-10-07 | *Computable Name*:MII_SP_Meta_Patient_Gemeindeschluessel |

 
Suchparameter für Patient.address.city.extension:gemeindeschluessel 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "mii-sp-meta-patient-gemeindeschluessel",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-gemeindeschluessel",
  "version" : "2027.0.0-ballot.rc1",
  "name" : "MII_SP_Meta_Patient_Gemeindeschluessel",
  "status" : "active",
  "experimental" : false,
  "date" : "2024-10-07",
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
  "description" : "Suchparameter für Patient.address.city.extension:gemeindeschluessel",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "code" : "gemeindeschluessel",
  "base" : ["Patient"],
  "type" : "token",
  "expression" : "Patient.address.city.extension('http://fhir.de/StructureDefinition/destatis/ags').value"
}

```
