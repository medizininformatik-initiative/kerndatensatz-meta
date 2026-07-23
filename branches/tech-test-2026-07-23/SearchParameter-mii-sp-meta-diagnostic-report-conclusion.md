# mii-sp-meta-diagnostic-report-conclusion - MII IG Meta v2026.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-sp-meta-diagnostic-report-conclusion**

## SearchParameter: mii-sp-meta-diagnostic-report-conclusion 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-diagnostic-report-conclusion | *Version*:2026.0.0 |
| Active as of 2025-11-06 | *Computable Name*:MII_SP_Bildgebung_Diagnostic_Report_Conclusion |

 
Suchparameter für DiagnosticReport.conclusion 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "mii-sp-meta-diagnostic-report-conclusion",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-diagnostic-report-conclusion",
  "version" : "2026.0.0",
  "name" : "MII_SP_Bildgebung_Diagnostic_Report_Conclusion",
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
  "description" : "Suchparameter für DiagnosticReport.conclusion",
  "code" : "conclusion-text",
  "base" : ["DiagnosticReport"],
  "type" : "string",
  "expression" : "DiagnosticReport.conclusion",
  "modifier" : ["contains", "exact", "missing"]
}

```
