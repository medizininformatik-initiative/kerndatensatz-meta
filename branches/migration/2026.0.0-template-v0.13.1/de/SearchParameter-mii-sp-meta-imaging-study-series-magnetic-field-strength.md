# mii-sp-meta-imaging-study-series-magnetic-field-strength - MII IG Meta v2027.0.0-ballot.rc1

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **mii-sp-meta-imaging-study-series-magnetic-field-strength**

## SearchParameter: mii-sp-meta-imaging-study-series-magnetic-field-strength 

| | |
| :--- | :--- |
| *Offizielle URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-magnetic-field-strength | *Version*:2027.0.0-ballot.rc1 |
| Active Stand: 2025-11-06 | *Maschinenlesbarer Name*:MII_SP_Bildgebung_Imaging_Study_Series_Magnetic_Field_Strength |

 
Suchparameter für ImagingStudy.series.extension.magneticFieldStrength 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "mii-sp-meta-imaging-study-series-magnetic-field-strength",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-magnetic-field-strength",
  "version" : "2027.0.0-ballot.rc1",
  "name" : "MII_SP_Bildgebung_Imaging_Study_Series_Magnetic_Field_Strength",
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
  "description" : "Suchparameter für ImagingStudy.series.extension.magneticFieldStrength",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "code" : "magnetic-field-strength",
  "base" : ["ImagingStudy"],
  "type" : "quantity",
  "expression" : "ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-mr').extension('magneticFieldStrength').value",
  "comparator" : ["eq", "gt", "lt", "ge", "le"]
}

```
