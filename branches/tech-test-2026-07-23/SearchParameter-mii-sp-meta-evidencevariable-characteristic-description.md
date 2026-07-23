# mii-sp-meta-evidencevariable-characteristic-description - MII IG Meta v2026.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-sp-meta-evidencevariable-characteristic-description**

## SearchParameter: mii-sp-meta-evidencevariable-characteristic-description 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-evidencevariable-characteristic-description | *Version*:2026.0.0 |
| Active as of 2024-10-17 | *Computable Name*:MII_SP_Meta_EvidenceVariable_Characteristic_Description |

 
Suchparameter für EvidenceVariable.characteristic.description 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "mii-sp-meta-evidencevariable-characteristic-description",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-evidencevariable-characteristic-description",
  "version" : "2026.0.0",
  "name" : "MII_SP_Meta_EvidenceVariable_Characteristic_Description",
  "status" : "active",
  "experimental" : false,
  "date" : "2024-10-17",
  "publisher" : "Medizininformatik Initiative",
  "contact" : [{
    "name" : "Medizininformatik Initiative",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.medizininformatik-initiative.de/"
    }]
  }],
  "description" : "Suchparameter für EvidenceVariable.characteristic.description",
  "code" : "characteristicDescription",
  "base" : ["EvidenceVariable"],
  "type" : "string",
  "expression" : "EvidenceVariable.characteristic.description"
}

```
