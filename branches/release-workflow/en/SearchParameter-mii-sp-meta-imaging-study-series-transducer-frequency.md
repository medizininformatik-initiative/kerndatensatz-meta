# mii-sp-meta-imaging-study-series-transducer-frequency - MII IG Meta v2027.0.0-ballot.rc3

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-sp-meta-imaging-study-series-transducer-frequency**

## SearchParameter: mii-sp-meta-imaging-study-series-transducer-frequency 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-transducer-frequency | *Version*:2027.0.0-ballot.rc3 |
| Active as of 2025-11-06 | *Computable Name*:MII_SP_Bildgebung_Imaging_Study_Series_Transducer_Frequency |

 
Suchparameter für ImagingStudy.series.extension.transducerFrequency 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "mii-sp-meta-imaging-study-series-transducer-frequency",
  "meta" : {
    "extension" : [{
      "url" : "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-license",
      "valueCode" : "CC-BY-4.0"
    },
    {
      "extension" : [{
        "url" : "packageId",
        "valueId" : "de.medizininformatikinitiative.kerndatensatz.meta"
      },
      {
        "url" : "version",
        "valueString" : "2027.0.0-ballot.rc3"
      },
      {
        "url" : "uri",
        "valueUri" : "https://www.medizininformatik-initiative.de/fhir/modul-meta"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/package-source"
    }],
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/modul-meta/StructureDefinition/mii-pr-meta-searchparameter"]
  },
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-versionAlgorithm",
    "valueCoding" : {
      "system" : "http://hl7.org/fhir/version-algorithm",
      "code" : "semver",
      "display" : "SemVer"
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-versionPolicy",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/artifact-version-policy-codes",
        "version" : "3.0.0",
        "code" : "package",
        "display" : "Package"
      }]
    }
  }],
  "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-transducer-frequency",
  "version" : "2027.0.0-ballot.rc3",
  "name" : "MII_SP_Bildgebung_Imaging_Study_Series_Transducer_Frequency",
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
  "description" : "Suchparameter für ImagingStudy.series.extension.transducerFrequency",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "code" : "transducer-frequency",
  "base" : ["ImagingStudy"],
  "type" : "quantity",
  "expression" : "ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-us').extension('transducerFrequency').value",
  "comparator" : ["eq", "gt", "lt", "ge", "le"]
}

```
