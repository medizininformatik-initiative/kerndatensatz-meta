# mii-sp-meta-supporting-info - MII IG Meta v2026.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-sp-meta-supporting-info**

## SearchParameter: mii-sp-meta-supporting-info 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-supporting-info | *Version*:2026.0.0 |
| Active as of 2025-11-06 | *Computable Name*:MII_SP_Bildgebung_Supporting_Info |

 

| | |
| :--- | :--- |
| Suchparameter für CarePlan.supportingInfo | DiagnosticReport.extension.supportingInfo |

 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "mii-sp-meta-supporting-info",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-supporting-info",
  "version" : "2026.0.0",
  "name" : "MII_SP_Bildgebung_Supporting_Info",
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
  "description" : "Suchparameter für CarePlan.supportingInfo | DiagnosticReport.extension.supportingInfo",
  "code" : "supporting-info",
  "base" : ["CarePlan", "DiagnosticReport"],
  "type" : "reference",
  "expression" : "CarePlan.supportingInfo | DiagnosticReport.extension('http://hl7.org/fhir/5.0/StructureDefinition/extension-DiagnosticReport.supportingInfo').extension('reference').value",
  "target" : ["DiagnosticReport"]
}

```
