# MII CapabilityStatement Meta Server Capabilities - MII IG Meta v2027.0.0-ballot.rc3

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **MII CapabilityStatement Meta Server Capabilities**

## CapabilityStatement: MII CapabilityStatement Meta Server Capabilities (Experimentell) 

| | |
| :--- | :--- |
| *Offizielle URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/CapabilityStatement/mii-cps-meta-server-capabilities | *Version*:2027.0.0-ballot.rc3 |
| Draft Stand: 2026-08-31 | *Maschinenlesbarer Name*:MII_CPS_Meta_Server_Capabilities |

 
Migration-generated proposal describing the resource types and search parameters published by the Meta module. Review before use as a normative capability statement. 

 [Rohdatei der OpenAPI-/Swagger-Definition](../mii-cps-meta-server-capabilities.openapi.json) | [Download](../mii-cps-meta-server-capabilities.openapi.json) 



## Resource Content

```json
{
  "resourceType" : "CapabilityStatement",
  "id" : "mii-cps-meta-server-capabilities",
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
    "profile" : ["http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablecapabilitystatement",
    "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablecapabilitystatement"]
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
    "url" : "http://hl7.org/fhir/StructureDefinition/cqf-knowledgeCapability",
    "valueCode" : "shareable"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/cqf-knowledgeCapability",
    "valueCode" : "publishable"
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
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-usage",
    "valueMarkdown" : "Use this draft CapabilityStatement to inspect the resource types and custom SearchParameters published by the MII Meta module. It is a migration-generated proposal and does not establish normative server support expectations until it has been reviewed and approved."
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/resource-approvalDate",
    "valueDate" : "2026-08-31"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/resource-effectivePeriod",
    "valuePeriod" : {
      "start" : "2027"
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-topic",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl",
        "code" : "C80260"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-author",
    "valueContactDetail" : {
      "telecom" : [{
        "system" : "email",
        "value" : "julian.sass@charite.de"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-editor",
    "valueContactDetail" : {
      "name" : "Taskforce Core Data Set"
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-reviewer",
    "valueContactDetail" : {
      "name" : "Interoperability Working Group",
      "telecom" : [{
        "system" : "url",
        "value" : "https://www.medizininformatik-initiative.de/en/collaboration/interoperability-working-group"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-reviewer",
    "valueContactDetail" : {
      "name" : "National Steering Committee",
      "telecom" : [{
        "system" : "url",
        "value" : "https://www.medizininformatik-initiative.de/en/collaboration/national-steering-committee"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-endorser",
    "valueContactDetail" : {
      "name" : "Interoperability Working Group",
      "telecom" : [{
        "system" : "url",
        "value" : "https://www.medizininformatik-initiative.de/en/collaboration/interoperability-working-group"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-endorser",
    "valueContactDetail" : {
      "name" : "National Steering Committee",
      "telecom" : [{
        "system" : "url",
        "value" : "https://www.medizininformatik-initiative.de/en/collaboration/national-steering-committee"
      }]
    }
  }],
  "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/CapabilityStatement/mii-cps-meta-server-capabilities",
  "version" : "2027.0.0-ballot.rc3",
  "name" : "MII_CPS_Meta_Server_Capabilities",
  "title" : "MII CapabilityStatement Meta Server Capabilities",
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-08-31",
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
  "description" : "Migration-generated proposal describing the resource types and search parameters published by the Meta module. Review before use as a normative capability statement.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "purpose" : "Define the SearchParameter support described by the MII Meta module for implementations of the MII Core Data Set.",
  "kind" : "requirements",
  "fhirVersion" : "4.0.1",
  "format" : ["json", "xml"],
  "implementationGuide" : ["https://www.medizininformatik-initiative.de/fhir/modul-meta/ImplementationGuide/mii-ig-meta|2027.0.0-ballot.rc3"],
  "rest" : [{
    "mode" : "server",
    "documentation" : "Proposal derived from the module's published SearchParameter definitions; support expectations require module-team review.",
    "resource" : [{
      "type" : "AdverseEvent",
      "searchParam" : [{
        "name" : "encounter",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-adverseevent-encounter",
        "type" : "reference"
      },
      {
        "name" : "instance",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-adverseevent-suspectentity-instance",
        "type" : "reference"
      }]
    },
    {
      "type" : "BodyStructure",
      "searchParam" : [{
        "name" : "location-qualifier",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-body-structure-location-qualifier",
        "type" : "token"
      }]
    },
    {
      "type" : "CarePlan",
      "searchParam" : [{
        "name" : "addresses",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-careplan-addresses",
        "type" : "reference"
      },
      {
        "name" : "contributor",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-careplan-contributor",
        "type" : "reference"
      },
      {
        "name" : "created",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-careplan-created",
        "type" : "date"
      },
      {
        "name" : "description",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-description",
        "type" : "string"
      },
      {
        "name" : "supporting-info",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-supporting-info",
        "type" : "reference"
      }]
    },
    {
      "type" : "Composition",
      "searchParam" : [{
        "name" : "attester-mode",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-composition-attester-mode",
        "type" : "token"
      },
      {
        "name" : "custodian",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-composition-custodian",
        "type" : "reference"
      },
      {
        "name" : "relates-to-code",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-composition-relatesto-code",
        "type" : "token"
      },
      {
        "name" : "section-author",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-composition-section-author",
        "type" : "reference"
      },
      {
        "name" : "section-title",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-composition-section-title",
        "type" : "string"
      }]
    },
    {
      "type" : "Condition",
      "searchParam" : [{
        "name" : "evidence-detail",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-condition-evidence-detail",
        "type" : "reference"
      },
      {
        "name" : "icd10gm-diagnosesicherheit",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-condition-icd10gm-diagnosesicherheit",
        "type" : "token"
      },
      {
        "name" : "icd10gm-mehrfachcodierung",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-condition-icd10gm-mehrfachcodierung",
        "type" : "token"
      },
      {
        "name" : "icd10gm-seitenlokalisation",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-condition-icd10gm-seitenlokalisation",
        "type" : "token"
      },
      {
        "name" : "verification-status",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-condition-verification-status",
        "type" : "token"
      }]
    },
    {
      "type" : "Consent",
      "searchParam" : [{
        "name" : "mii-policy-uri",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-consent-policyuri",
        "type" : "uri"
      },
      {
        "name" : "mii-provision-provision-code",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-consent-provisioncode",
        "type" : "token"
      },
      {
        "name" : "mii-provision-provision-code-period",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-consent-provisioncodeperiod",
        "type" : "composite"
      },
      {
        "name" : "mii-provision-provision-code-type",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-consent-provisioncodetype",
        "type" : "composite"
      },
      {
        "name" : "mii-provision-provision-period",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-consent-provisionperiod",
        "type" : "date"
      },
      {
        "name" : "mii-provision-provision-type",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-consent-provisiontype",
        "type" : "token"
      }]
    },
    {
      "type" : "Device",
      "searchParam" : [{
        "name" : "property-type",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-device-property-type",
        "type" : "token"
      }]
    },
    {
      "type" : "DeviceMetric",
      "searchParam" : [{
        "name" : "source",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-devicemetric-source",
        "type" : "reference"
      }]
    },
    {
      "type" : "DiagnosticReport",
      "searchParam" : [{
        "name" : "conclusion-text",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-diagnostic-report-conclusion",
        "type" : "string"
      },
      {
        "name" : "imaging-study",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-diagnosticreport-imagingstudy",
        "type" : "reference"
      },
      {
        "name" : "supporting-info",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-supporting-info",
        "type" : "reference"
      }]
    },
    {
      "type" : "DocumentReference",
      "searchParam" : [{
        "name" : "creation",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-dokument-documentreference-attachment-creation",
        "type" : "date"
      },
      {
        "name" : "doc-status",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-dokument-documentreference-doc-status",
        "type" : "token"
      },
      {
        "name" : "nlp-processing-status",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-dokument-documentreference-nlp-processing-status",
        "type" : "token"
      },
      {
        "name" : "size",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-documentreference-attachment-size",
        "type" : "number"
      },
      {
        "name" : "title",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-documentreference-attachment-title",
        "type" : "string"
      }]
    },
    {
      "type" : "Encounter",
      "searchParam" : [{
        "name" : "aufnahmegrund-drittestelle",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-encounter-aufnahmegrund-drittestelle",
        "type" : "token"
      },
      {
        "name" : "aufnahmegrund-ersteundzweitestelle",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-encounter-aufnahmegrund-ersteundzweitestelle",
        "type" : "token"
      },
      {
        "name" : "aufnahmegrund-viertestelle",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-encounter-aufnahmegrund-viertestelle",
        "type" : "token"
      },
      {
        "name" : "diagnosis-use",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-encounter-diagnosis-use",
        "type" : "token"
      },
      {
        "name" : "entlassungsgrund-drittestelle",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-encounter-entlassungsgrund-drittestelle",
        "type" : "token"
      },
      {
        "name" : "entlassungsgrund-ersteundzweitestelle",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-encounter-entlassungsgrund-ersteundzweitestelle",
        "type" : "token"
      },
      {
        "name" : "hospitalization-admitsource",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-encounter-hospitalization-admitsource",
        "type" : "token"
      },
      {
        "name" : "location-physical-type",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-encounter-location-physical-type",
        "type" : "token"
      },
      {
        "name" : "service-type",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-encounter-servicetype",
        "type" : "token"
      }]
    },
    {
      "type" : "EvidenceVariable",
      "searchParam" : [{
        "name" : "characteristicDescription",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-evidencevariable-characteristic-description",
        "type" : "string"
      }]
    },
    {
      "type" : "FamilyMemberHistory",
      "searchParam" : [{
        "name" : "reason-code",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-familymemberhistory-reasoncode",
        "type" : "token"
      },
      {
        "name" : "reason-reference",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-familymemberhistory-reasonreference",
        "type" : "reference"
      }]
    },
    {
      "type" : "ImagingStudy",
      "searchParam" : [{
        "name" : "bildgebungsgrund",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-bildgebungsgrund",
        "type" : "string"
      },
      {
        "name" : "contrast-bolus",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-contrast-bolus",
        "type" : "token"
      },
      {
        "name" : "contrast-bolus-details",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-contrast-bolus-details",
        "type" : "reference"
      },
      {
        "name" : "convolutional-kernel",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-convolutional-kernel",
        "type" : "string"
      },
      {
        "name" : "ctdi-volume",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-ctdi-volume",
        "type" : "quantity"
      },
      {
        "name" : "description",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-description",
        "type" : "string"
      },
      {
        "name" : "echo-time",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-echo-time",
        "type" : "quantity"
      },
      {
        "name" : "exposure",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-exposure",
        "type" : "quantity"
      },
      {
        "name" : "exposure-time",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-exposure-time",
        "type" : "quantity"
      },
      {
        "name" : "flip-angle",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-flip-angle",
        "type" : "quantity"
      },
      {
        "name" : "instance-burned-in-annotation",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-instance-burned-in-annotation",
        "type" : "token"
      },
      {
        "name" : "instance-image-type",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-instance-image-type",
        "type" : "token"
      },
      {
        "name" : "instance-number",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-instance-number",
        "type" : "number"
      },
      {
        "name" : "instance-pixel-spacing-x",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-instance-pixel-x",
        "type" : "quantity"
      },
      {
        "name" : "instance-pixel-spacing-y",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-instance-pixel-y",
        "type" : "quantity"
      },
      {
        "name" : "instance-slice-thickness",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-instance-slice-thickness",
        "type" : "quantity"
      },
      {
        "name" : "inversion-time",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-inversion-time",
        "type" : "quantity"
      },
      {
        "name" : "kvp",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-kvp",
        "type" : "quantity"
      },
      {
        "name" : "magnetic-field-strength",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-magnetic-field-strength",
        "type" : "quantity"
      },
      {
        "name" : "modality-body-site",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-modality-body-site",
        "type" : "composite"
      },
      {
        "name" : "number-instances",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-number-instances",
        "type" : "number"
      },
      {
        "name" : "number-series",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-number-series",
        "type" : "number"
      },
      {
        "name" : "procedure-reference",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-procedure-reference",
        "type" : "reference"
      },
      {
        "name" : "pulse-frequency",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-pulse-frequency",
        "type" : "quantity"
      },
      {
        "name" : "radionuclide",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-radionuclide",
        "type" : "token"
      },
      {
        "name" : "radionuclide-half-life",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-radionuclide-half-life",
        "type" : "quantity"
      },
      {
        "name" : "radionuclide-total-dose",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-radionuclide-total-dose",
        "type" : "quantity"
      },
      {
        "name" : "radiopharmaceutical",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-radiopharmaceutical",
        "type" : "token"
      },
      {
        "name" : "reason-reference",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-reason-reference",
        "type" : "reference"
      },
      {
        "name" : "repetition-time",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-repetition-time",
        "type" : "quantity"
      },
      {
        "name" : "scanning-sequence",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-scanning-sequence",
        "type" : "token"
      },
      {
        "name" : "scanning-sequence-variant",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-scanning-sequence-variant",
        "type" : "token"
      },
      {
        "name" : "series-laterality",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-laterality",
        "type" : "token"
      },
      {
        "name" : "series-number",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-number",
        "type" : "number"
      },
      {
        "name" : "series-started",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-started",
        "type" : "date"
      },
      {
        "name" : "series-type",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-series-type",
        "type" : "token"
      },
      {
        "name" : "slice-thickness",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-slice-thickness",
        "type" : "quantity"
      },
      {
        "name" : "study-modality",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-modality",
        "type" : "token"
      },
      {
        "name" : "tracer-exposure-time",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-tracer-exposure-time",
        "type" : "quantity"
      },
      {
        "name" : "transducer-frequency",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-transducer-frequency",
        "type" : "quantity"
      },
      {
        "name" : "transducer-type",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-transducer-type",
        "type" : "token"
      },
      {
        "name" : "ultrasound-color",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-ultrasound-color",
        "type" : "token"
      },
      {
        "name" : "units",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-units",
        "type" : "token"
      },
      {
        "name" : "view-position",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-view-position",
        "type" : "token"
      },
      {
        "name" : "xray-tube-current",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-xray-tube-current",
        "type" : "quantity"
      }]
    },
    {
      "type" : "Library",
      "searchParam" : [{
        "name" : "quellregister",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-library-quellregister",
        "type" : "token"
      },
      {
        "name" : "relatedArtifactUrl",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-library-relatedartifact-url",
        "type" : "uri"
      }]
    },
    {
      "type" : "List",
      "searchParam" : [{
        "name" : "mode",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-list-mode",
        "type" : "token"
      }]
    },
    {
      "type" : "Media",
      "searchParam" : [{
        "name" : "part-of",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-media-partof",
        "type" : "reference"
      }]
    },
    {
      "type" : "Medication",
      "searchParam" : [{
        "name" : "ingredient-strength",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-ingredient-strength",
        "type" : "composite"
      },
      {
        "name" : "ingredient-strength-denominator",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-ingredient-strength-denominator",
        "type" : "quantity"
      },
      {
        "name" : "ingredient-strength-numerator",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-ingredient-strength-numerator",
        "type" : "quantity"
      }]
    },
    {
      "type" : "MedicationAdministration",
      "searchParam" : [{
        "name" : "dosage-route",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-route",
        "type" : "token"
      },
      {
        "name" : "dosage-site",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-site",
        "type" : "token"
      },
      {
        "name" : "dose-quantity",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-dosequantity",
        "type" : "quantity"
      },
      {
        "name" : "part-of",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-partof",
        "type" : "reference"
      },
      {
        "name" : "ratequantity",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-ratequantity",
        "type" : "quantity"
      },
      {
        "name" : "rateratio",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-rateratio",
        "type" : "composite"
      },
      {
        "name" : "rateratio-denominator",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-rateratio-denominator",
        "type" : "quantity"
      },
      {
        "name" : "rateratio-numerator",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-rateratio-numerator",
        "type" : "quantity"
      },
      {
        "name" : "reason-reference",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-reasonreference",
        "type" : "reference"
      }]
    },
    {
      "type" : "MedicationRequest",
      "searchParam" : [{
        "name" : "dosage-route",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-route",
        "type" : "token"
      },
      {
        "name" : "dosage-site",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-site",
        "type" : "token"
      },
      {
        "name" : "dose-quantity",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-dosequantity",
        "type" : "quantity"
      },
      {
        "name" : "doserange",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-doserange",
        "type" : "composite"
      },
      {
        "name" : "doserange-high",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-doserange-high",
        "type" : "quantity"
      },
      {
        "name" : "doserange-low",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-doserange-low",
        "type" : "quantity"
      },
      {
        "name" : "ratequantity",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-ratequantity",
        "type" : "quantity"
      },
      {
        "name" : "raterange",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-raterange",
        "type" : "composite"
      },
      {
        "name" : "raterange-high",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-raterange-high",
        "type" : "quantity"
      },
      {
        "name" : "raterange-low",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-raterange-low",
        "type" : "quantity"
      },
      {
        "name" : "rateratio",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-rateratio",
        "type" : "composite"
      },
      {
        "name" : "rateratio-denominator",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-rateratio-denominator",
        "type" : "quantity"
      },
      {
        "name" : "rateratio-numerator",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-rateratio-numerator",
        "type" : "quantity"
      }]
    },
    {
      "type" : "MedicationStatement",
      "searchParam" : [{
        "name" : "dosage-route",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-route",
        "type" : "token"
      },
      {
        "name" : "dosage-site",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-site",
        "type" : "token"
      },
      {
        "name" : "dose-quantity",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-dosequantity",
        "type" : "quantity"
      },
      {
        "name" : "doserange",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-doserange",
        "type" : "composite"
      },
      {
        "name" : "doserange-high",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-doserange-high",
        "type" : "quantity"
      },
      {
        "name" : "doserange-low",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-doserange-low",
        "type" : "quantity"
      },
      {
        "name" : "part-of",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-partof",
        "type" : "reference"
      },
      {
        "name" : "ratequantity",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-ratequantity",
        "type" : "quantity"
      },
      {
        "name" : "raterange",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-raterange",
        "type" : "composite"
      },
      {
        "name" : "raterange-high",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-raterange-high",
        "type" : "quantity"
      },
      {
        "name" : "raterange-low",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-raterange-low",
        "type" : "quantity"
      },
      {
        "name" : "rateratio",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-rateratio",
        "type" : "composite"
      },
      {
        "name" : "rateratio-denominator",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-rateratio-denominator",
        "type" : "quantity"
      },
      {
        "name" : "rateratio-numerator",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-rateratio-numerator",
        "type" : "quantity"
      },
      {
        "name" : "reason-reference",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-reasonreference",
        "type" : "reference"
      }]
    },
    {
      "type" : "Observation",
      "searchParam" : [{
        "name" : "body-site",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-observation-bodysite",
        "type" : "token"
      },
      {
        "name" : "body-structure",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-observation-body-structure",
        "type" : "reference"
      },
      {
        "name" : "component-interpretation",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-observation-component-interpretation",
        "type" : "token"
      },
      {
        "name" : "encounter",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-observation-encounter",
        "type" : "reference"
      },
      {
        "name" : "focus",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-observation-focus",
        "type" : "reference"
      },
      {
        "name" : "has-member",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-observation-hasmember",
        "type" : "reference"
      },
      {
        "name" : "interpretation",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-observation-interpretation",
        "type" : "token"
      },
      {
        "name" : "issued",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-observation-issued",
        "type" : "date"
      },
      {
        "name" : "reference-range",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-observation-referencerange",
        "type" : "composite"
      },
      {
        "name" : "reference-range-high",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-observation-referencerange-high",
        "type" : "quantity"
      },
      {
        "name" : "reference-range-low",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-observation-referencerange-low",
        "type" : "quantity"
      },
      {
        "name" : "series-uid",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-observation-series-uid",
        "type" : "token"
      },
      {
        "name" : "sop-instance-uid",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-observation-sop-instance-uid",
        "type" : "token"
      },
      {
        "name" : "value-ratio",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-observation-value-ratio",
        "type" : "composite"
      },
      {
        "name" : "value-ratio-denominator",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-observation-value-ratio-denominator",
        "type" : "quantity"
      },
      {
        "name" : "value-ratio-numerator",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-observation-value-ratio-numerator",
        "type" : "quantity"
      }]
    },
    {
      "type" : "Patient",
      "searchParam" : [{
        "name" : "adresszusatz",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-adresszusatz",
        "type" : "string"
      },
      {
        "name" : "assigner-pid",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-assignerpid",
        "type" : "token"
      },
      {
        "name" : "gemeindeschluessel",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-gemeindeschluessel",
        "type" : "token"
      },
      {
        "name" : "hausnummer",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-hausnummer",
        "type" : "string"
      },
      {
        "name" : "other-amtlich",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-otheramtlich",
        "type" : "token"
      },
      {
        "name" : "postfach",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-postfach",
        "type" : "string"
      },
      {
        "name" : "prefix",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-prefix",
        "type" : "token"
      },
      {
        "name" : "prefix-qualifier",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-prefixqualifier",
        "type" : "token"
      },
      {
        "name" : "stadtteil",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-stadtteil",
        "type" : "string"
      },
      {
        "name" : "strasse",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-strasse",
        "type" : "string"
      }]
    },
    {
      "type" : "Procedure",
      "searchParam" : [{
        "name" : "bodySite",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-procedure-bodysite",
        "type" : "token"
      },
      {
        "name" : "complication",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-procedure-complication",
        "type" : "token"
      },
      {
        "name" : "dokumentationsdatum",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-procedure-dokumentationsdatum",
        "type" : "date"
      },
      {
        "name" : "durchfuehrungsabsicht",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-procedure-durchfuehrungsabsicht",
        "type" : "token"
      },
      {
        "name" : "ops-seitenlokalisation",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-procedure-ops-seitenlokalisation",
        "type" : "token"
      },
      {
        "name" : "outcome",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-procedure-outcome",
        "type" : "token"
      },
      {
        "name" : "recorder",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-procedure-recorder",
        "type" : "reference"
      },
      {
        "name" : "report",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-read-proc-report",
        "type" : "reference"
      }]
    },
    {
      "type" : "ResearchStudy",
      "searchParam" : [{
        "name" : "akronym",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-researchstudy-akronym",
        "type" : "string"
      },
      {
        "name" : "armName",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-researchstudy-arm-name",
        "type" : "string"
      },
      {
        "name" : "finanzierung",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-researchstudy-finanzierung",
        "type" : "string"
      },
      {
        "name" : "label",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-researchstudy-label",
        "type" : "string"
      },
      {
        "name" : "rekrutierungsstand",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-researchstudy-rekrutierungsstand",
        "type" : "number"
      },
      {
        "name" : "rekrutierungsstand-datum",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-researchstudy-rekrutierungsstand-datum",
        "type" : "date"
      },
      {
        "name" : "rekrutierungsstand-genauigkeit",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-researchstudy-rekrutierungsstand-genauigkeit",
        "type" : "string"
      },
      {
        "name" : "rekrutierungsstart",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-researchstudy-rekrutierungsstart",
        "type" : "date"
      },
      {
        "name" : "rekrutierungsziel",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-researchstudy-rekrutierungsziel",
        "type" : "number"
      },
      {
        "name" : "studienregister",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-researchstudy-studienregister",
        "type" : "reference"
      }]
    },
    {
      "type" : "ResearchSubject",
      "searchParam" : [{
        "name" : "consent",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-researchsubject-consent",
        "type" : "reference"
      }]
    },
    {
      "type" : "SearchParameter",
      "supportedProfile" : ["https://www.medizininformatik-initiative.de/fhir/modul-meta/StructureDefinition/mii-pr-meta-searchparameter|2027.0.0-ballot.rc3"]
    },
    {
      "type" : "ServiceRequest",
      "searchParam" : [{
        "name" : "reason-code",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-servicerequest-reasoncode",
        "type" : "token"
      },
      {
        "name" : "reason-reference",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-servicerequest-reasonreference",
        "type" : "reference"
      },
      {
        "name" : "supporting-info",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-servicerequest-supportinginfo",
        "type" : "reference"
      }]
    },
    {
      "type" : "Specimen",
      "searchParam" : [{
        "name" : "collection-body-site",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-specimen-collection-body-site",
        "type" : "token"
      },
      {
        "name" : "collection-method",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-specimen-collection-method",
        "type" : "token"
      },
      {
        "name" : "container-additive",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-specimen-container-additive",
        "type" : "reference"
      },
      {
        "name" : "diagnose",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-specimen-diagnose",
        "type" : "reference"
      },
      {
        "name" : "processing-additive",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-specimen-processing-additive",
        "type" : "reference"
      },
      {
        "name" : "processing-date",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-specimen-processing-date",
        "type" : "date"
      },
      {
        "name" : "processing-procedure",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-specimen-processing-procedure",
        "type" : "token"
      },
      {
        "name" : "request",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-specimen-request",
        "type" : "reference"
      }]
    },
    {
      "type" : "Task",
      "searchParam" : [{
        "name" : "for",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-task-for",
        "type" : "reference"
      },
      {
        "name" : "reason-code",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-task-reasoncode",
        "type" : "token"
      },
      {
        "name" : "reason-reference",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-task-reasonreference",
        "type" : "reference"
      }]
    }]
  }]
}

```
