# mii-sp-meta-researchstudy-rekrutierungsstand-datum - MII IG Meta v2026.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-sp-meta-researchstudy-rekrutierungsstand-datum**

## SearchParameter: mii-sp-meta-researchstudy-rekrutierungsstand-datum 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-researchstudy-rekrutierungsstand-datum | *Version*:2026.0.0 |
| Active as of 2024-10-17 | *Computable Name*:MII_SP_Meta_ResearchStudy_RekrutierungsstandDatum |

 
Suchparameter für ResearchStudy.extension:Rekrutierung.extension:rekrutierungsstand-datum 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "mii-sp-meta-researchstudy-rekrutierungsstand-datum",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-researchstudy-rekrutierungsstand-datum",
  "version" : "2026.0.0",
  "name" : "MII_SP_Meta_ResearchStudy_RekrutierungsstandDatum",
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
  "description" : "Suchparameter für ResearchStudy.extension:Rekrutierung.extension:rekrutierungsstand-datum",
  "code" : "rekrutierungsstand-datum",
  "base" : ["ResearchStudy"],
  "type" : "date",
  "expression" : "ResearchStudy.extension.where(url='https://www.medizininformatik-initiative.de/fhir/modul-studie/StructureDefinition/mii-ex-studie-rekrutierung').extension.where(url='rekrutierungsstand-datum').value"
}

```
