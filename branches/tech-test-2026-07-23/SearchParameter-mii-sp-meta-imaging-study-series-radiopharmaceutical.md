# mii-sp-meta-imaging-study-series-radiopharmaceutical - MII IG Meta v2026.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-sp-meta-imaging-study-series-radiopharmaceutical**

## SearchParameter: mii-sp-meta-imaging-study-series-radiopharmaceutical 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-radiopharmaceutical | *Version*:2026.0.0 |
| Active as of 2025-11-06 | *Computable Name*:MII_SP_Bildgebung_Imaging_Study_Radiopharmaceutical |

 
Suchparameter für ImagingStudy.series.extension.radiopharmaceutical 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "mii-sp-meta-imaging-study-series-radiopharmaceutical",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-radiopharmaceutical",
  "version" : "2026.0.0",
  "name" : "MII_SP_Bildgebung_Imaging_Study_Radiopharmaceutical",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-11-06",
  "publisher" : "Medizininformatik Initiative",
  "contact" : [{
    "name" : "Medizininformatik Initiative",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.medizininformatik-initiative.de/"
    }]
  }],
  "description" : "Suchparameter für ImagingStudy.series.extension.radiopharmaceutical",
  "code" : "radiopharmaceutical",
  "base" : ["ImagingStudy"],
  "type" : "token",
  "expression" : "ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-pt').extension('radiopharmaceutical').value | ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-nm').extension('radiopharmaceutical').value",
  "modifier" : ["text",
  "not",
  "above",
  "below",
  "in",
  "not-in",
  "missing"]
}

```
