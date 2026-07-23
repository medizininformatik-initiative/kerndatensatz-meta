# mii-sp-meta-procedure-durchfuehrungsabsicht - MII IG Meta v2026.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-sp-meta-procedure-durchfuehrungsabsicht**

## SearchParameter: mii-sp-meta-procedure-durchfuehrungsabsicht 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-procedure-durchfuehrungsabsicht | *Version*:2026.0.0 |
| Active as of 2024-04-24 | *Computable Name*:MII_SP_Meta_Procedure_Durchfuehrungsabsicht |

 
Suchparameter für Procedure.extension:Durchfuehrungsabsicht 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "mii-sp-meta-procedure-durchfuehrungsabsicht",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-procedure-durchfuehrungsabsicht",
  "version" : "2026.0.0",
  "name" : "MII_SP_Meta_Procedure_Durchfuehrungsabsicht",
  "status" : "active",
  "experimental" : false,
  "date" : "2024-04-24",
  "publisher" : "Medizininformatik Initiative",
  "contact" : [{
    "name" : "Medizininformatik Initiative",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.medizininformatik-initiative.de/"
    }]
  }],
  "description" : "Suchparameter für Procedure.extension:Durchfuehrungsabsicht",
  "code" : "durchfuehrungsabsicht",
  "base" : ["Procedure"],
  "type" : "token",
  "expression" : "Procedure.extension('https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Durchfuehrungsabsicht').value"
}

```
