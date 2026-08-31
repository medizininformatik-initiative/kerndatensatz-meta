# mii-sp-meta-patient-otheramtlich - MII IG Meta v2027.0.0-ballot.rc1

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **mii-sp-meta-patient-otheramtlich**

## SearchParameter: mii-sp-meta-patient-otheramtlich 

| | |
| :--- | :--- |
| *Offizielle URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-otheramtlich | *Version*:2027.0.0-ballot.rc1 |
| Active Stand: 2024-10-07 | *Maschinenlesbarer Name*:MII_SP_Meta_Patient_OtherAmtlich |

 
Suchparameter für Patient.gender.extension:other-amtlich 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "mii-sp-meta-patient-otheramtlich",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-otheramtlich",
  "version" : "2027.0.0-ballot.rc1",
  "name" : "MII_SP_Meta_Patient_OtherAmtlich",
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
  "description" : "Suchparameter für Patient.gender.extension:other-amtlich",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "code" : "other-amtlich",
  "base" : ["Patient"],
  "type" : "token",
  "expression" : "Patient.gender.extension('http://fhir.de/StructureDefinition/gender-amtlich-de').value"
}

```
