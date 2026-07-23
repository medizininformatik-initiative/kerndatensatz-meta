# mii-sp-meta-researchstudy-label - MII IG Meta v2026.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-sp-meta-researchstudy-label**

## SearchParameter: mii-sp-meta-researchstudy-label 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-researchstudy-label | *Version*:2026.0.0 |
| Active as of 2024-10-17 | *Computable Name*:MII_SP_Meta_ResearchStudy_Label |

 
Suchparameter für ResearchStudy.extension:label 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "mii-sp-meta-researchstudy-label",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-researchstudy-label",
  "version" : "2026.0.0",
  "name" : "MII_SP_Meta_ResearchStudy_Label",
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
  "description" : "Suchparameter für ResearchStudy.extension:label",
  "code" : "label",
  "base" : ["ResearchStudy"],
  "type" : "string",
  "expression" : "ResearchStudy.extension.where(url='http://hl7.org/fhir/5.0/StructureDefinition/extension-ResearchStudy.label').extension.where(url='value').value"
}

```
