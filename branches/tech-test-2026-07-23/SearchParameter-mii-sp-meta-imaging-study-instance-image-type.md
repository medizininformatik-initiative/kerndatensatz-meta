# mii-sp-meta-imaging-study-instance-image-type - MII IG Meta v2026.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-sp-meta-imaging-study-instance-image-type**

## SearchParameter: mii-sp-meta-imaging-study-instance-image-type 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-instance-image-type | *Version*:2026.0.0 |
| Active as of 2025-11-06 | *Computable Name*:MII_SP_Bildgebung_Imaging_Study_Instance_Image_Type |

 
Suchparameter für ImagingStudy.series.instance.extension.imageType 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "mii-sp-meta-imaging-study-instance-image-type",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-instance-image-type",
  "version" : "2026.0.0",
  "name" : "MII_SP_Bildgebung_Imaging_Study_Instance_Image_Type",
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
  "description" : "Suchparameter für ImagingStudy.series.instance.extension.imageType",
  "code" : "instance-image-type",
  "base" : ["ImagingStudy"],
  "type" : "token",
  "expression" : "ImagingStudy.series.instance.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-instanz-details').extension('imageType').value",
  "modifier" : ["text",
  "not",
  "above",
  "below",
  "in",
  "not-in",
  "missing"]
}

```
