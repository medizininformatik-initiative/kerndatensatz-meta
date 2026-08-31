# mii-sp-meta-imaging-study-instance-burned-in-annotation - MII IG Meta v2027.0.0-ballot.rc1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-sp-meta-imaging-study-instance-burned-in-annotation**

## SearchParameter: mii-sp-meta-imaging-study-instance-burned-in-annotation 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-instance-burned-in-annotation | *Version*:2027.0.0-ballot.rc1 |
| Active as of 2025-11-06 | *Computable Name*:MII_SP_Bildgebung_Imaging_Study_Instance_Burned_In_Annotation |

 
Suchparameter für ImagingStudy.series.instance.extension.burnedInAnnotation 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "mii-sp-meta-imaging-study-instance-burned-in-annotation",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-instance-burned-in-annotation",
  "version" : "2027.0.0-ballot.rc1",
  "name" : "MII_SP_Bildgebung_Imaging_Study_Instance_Burned_In_Annotation",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-11-06",
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
  "description" : "Suchparameter für ImagingStudy.series.instance.extension.burnedInAnnotation",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "code" : "instance-burned-in-annotation",
  "base" : ["ImagingStudy"],
  "type" : "token",
  "expression" : "ImagingStudy.series.instance.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-instanz-details').extension('burnedInAnnotation').value",
  "modifier" : ["text",
  "not",
  "above",
  "below",
  "in",
  "not-in",
  "missing"]
}

```
