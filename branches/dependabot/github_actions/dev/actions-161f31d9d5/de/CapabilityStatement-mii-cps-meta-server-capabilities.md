# MII CapabilityStatement Meta Server Capabilities - MII IG Meta v2027.0.0-ballot

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **MII CapabilityStatement Meta Server Capabilities**

## CapabilityStatement: MII CapabilityStatement Meta Server Capabilities (Experimentell) 

| | |
| :--- | :--- |
| *Offizielle URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/CapabilityStatement/mii-cps-meta-server-capabilities | *Version*:2027.0.0-ballot |
| Draft Stand: 2026-09-10 | *Maschinenlesbarer Name*:MII_CPS_Meta_Server_Capabilities |

 
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
        "valueString" : "2027.0.0-ballot"
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
    "valueDate" : "2026-09-10"
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
  "version" : "2027.0.0-ballot",
  "name" : "MII_CPS_Meta_Server_Capabilities",
  "title" : "MII CapabilityStatement Meta Server Capabilities",
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-09-10",
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
  "implementationGuide" : ["https://www.medizininformatik-initiative.de/fhir/modul-meta/ImplementationGuide/mii-ig-meta|2027.0.0-ballot"],
  "rest" : [{
    "mode" : "server",
    "documentation" : "Proposal derived from the module's published SearchParameter definitions; support expectations require module-team review.",
    "resource" : [{
      "type" : "AdverseEvent",
      "searchParam" : [{
        "name" : "encounter",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-adverseevent-encounter",
        "type" : "reference",
        "documentation" : "**Example** (tested in CI): `GET [base]/AdverseEvent?_include=AdverseEvent:encounter`"
      },
      {
        "name" : "instance",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-adverseevent-suspectentity-instance",
        "type" : "reference",
        "documentation" : "**Example** (tested in CI): `GET [base]/AdverseEvent?_include=AdverseEvent:instance`"
      }]
    },
    {
      "type" : "BodyStructure",
      "searchParam" : [{
        "name" : "location-qualifier",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-body-structure-location-qualifier",
        "type" : "token",
        "documentation" : "**Example** (tested in CI): `GET [base]/BodyStructure?location-qualifier=http://snomed.info/sct|7771000`"
      }]
    },
    {
      "type" : "CarePlan",
      "searchParam" : [{
        "name" : "addresses",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-careplan-addresses",
        "type" : "reference",
        "documentation" : "**Example** (tested in CI): `GET [base]/CarePlan?_include=CarePlan:addresses`"
      },
      {
        "name" : "contributor",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-careplan-contributor",
        "type" : "reference"
      },
      {
        "name" : "created",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-careplan-created",
        "type" : "date",
        "documentation" : "**Example** (tested in CI): `GET [base]/CarePlan?created=2024-03-28`"
      },
      {
        "name" : "description",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-description",
        "type" : "string",
        "documentation" : "**Example** (tested in CI): `GET [base]/CarePlan?description=The patient`"
      },
      {
        "name" : "supporting-info",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-supporting-info",
        "type" : "reference",
        "documentation" : "**Example** (tested in CI): `GET [base]/CarePlan?_include=CarePlan:supporting-info`"
      }]
    },
    {
      "type" : "Composition",
      "searchParam" : [{
        "name" : "attester-mode",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-composition-attester-mode",
        "type" : "token",
        "documentation" : "**Example** (tested in CI): `GET [base]/Composition?attester-mode=legal`"
      },
      {
        "name" : "custodian",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-composition-custodian",
        "type" : "reference",
        "documentation" : "**Example** (tested in CI): `GET [base]/Composition?_include=Composition:custodian`"
      },
      {
        "name" : "relates-to-code",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-composition-relatesto-code",
        "type" : "token",
        "documentation" : "**Example** (tested in CI): `GET [base]/Composition?relates-to-code=replaces`"
      },
      {
        "name" : "section-author",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-composition-section-author",
        "type" : "reference",
        "documentation" : "**Example** (tested in CI): `GET [base]/Composition?_include=Composition:section-author`"
      },
      {
        "name" : "section-title",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-composition-section-title",
        "type" : "string",
        "documentation" : "**Example** (tested in CI): `GET [base]/Composition?section-title=Diagnostic Report`"
      }]
    },
    {
      "type" : "Condition",
      "searchParam" : [{
        "name" : "asserted-date",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-condition-asserted-date",
        "type" : "date",
        "documentation" : "**Example** (tested in CI): `GET [base]/Condition?asserted-date=2020-03-15`"
      },
      {
        "name" : "evidence-detail",
        "definition" : "http://hl7.org/fhir/SearchParameter/Condition-evidence-detail",
        "type" : "reference"
      },
      {
        "name" : "icd10gm-diagnosesicherheit",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-condition-icd10gm-diagnosesicherheit",
        "type" : "token",
        "documentation" : "**Example** (tested in CI): `GET [base]/Condition?code=http://fhir.de/CodeSystem/bfarm/icd-10-gm|B05.3&icd10gm-diagnosesicherheit=https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_ICD_DIAGNOSESICHERHEIT|G`"
      },
      {
        "name" : "icd10gm-mehrfachcodierung",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-condition-icd10gm-mehrfachcodierung",
        "type" : "token",
        "documentation" : "**Example** (tested in CI): `GET [base]/Condition?code=http://fhir.de/CodeSystem/bfarm/icd-10-gm|B05.3&icd10gm-mehrfachcodierung=http://fhir.de/CodeSystem/icd-10-gm-mehrfachcodierungs-kennzeichen|†`"
      },
      {
        "name" : "icd10gm-seitenlokalisation",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-condition-icd10gm-seitenlokalisation",
        "type" : "token",
        "documentation" : "**Example** (tested in CI): `GET [base]/Condition?code=http://fhir.de/CodeSystem/bfarm/icd-10-gm|B05.3&icd10gm-seitenlokalisation=https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_ICD_SEITENLOKALISATION|B`"
      },
      {
        "name" : "verification-status",
        "definition" : "http://hl7.org/fhir/SearchParameter/Condition-verification-status",
        "type" : "token",
        "documentation" : "**Example** (tested in CI): `GET [base]/Condition?verification-status=confirmed`"
      }]
    },
    {
      "type" : "Consent",
      "searchParam" : [{
        "name" : "mii-policy-uri",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-consent-policyuri",
        "type" : "uri",
        "documentation" : "**Example** (tested in CI): `GET [base]/Consent?mii-policy-uri=urn:oid:2.16.840.1.113883.3.1937.777.24.2.1791`"
      },
      {
        "name" : "mii-provision-provision-code",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-consent-provisioncode",
        "type" : "token",
        "documentation" : "**Example** (tested in CI): `GET [base]/Consent?mii-provision-provision-code=urn:oid:2.16.840.1.113883.3.1937.777.24.5.3|2.16.840.1.113883.3.1937.777.24.5.3.9`"
      },
      {
        "name" : "mii-provision-provision-code-period",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-consent-provisioncodeperiod",
        "type" : "composite"
      },
      {
        "name" : "mii-provision-provision-code-type",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-consent-provisioncodetype",
        "type" : "composite",
        "documentation" : "**Example** (tested in CI): `GET [base]/Consent?mii-provision-provision-code-type=urn:oid:2.16.840.1.113883.3.1937.777.24.5.3|2.16.840.1.113883.3.1937.777.24.5.3.7$permit`"
      },
      {
        "name" : "mii-provision-provision-period",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-consent-provisionperiod",
        "type" : "date",
        "documentation" : "**Example** (tested in CI): `GET [base]/Consent?mii-provision-provision-period=ge2024`"
      },
      {
        "name" : "mii-provision-provision-type",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-consent-provisiontype",
        "type" : "token",
        "documentation" : "**Example** (tested in CI): `GET [base]/Consent?mii-provision-provision-type=permit`"
      }]
    },
    {
      "type" : "Device",
      "searchParam" : [{
        "name" : "property-type",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-device-property-type",
        "type" : "token",
        "documentation" : "**Example** (tested in CI): `GET [base]/Device?property-type=urn:iso:std:iso:11073:10101|69684`"
      }]
    },
    {
      "type" : "DeviceMetric",
      "searchParam" : [{
        "name" : "source",
        "definition" : "http://hl7.org/fhir/SearchParameter/DeviceMetric-source",
        "type" : "reference",
        "documentation" : "**Example** (tested in CI): `GET [base]/DeviceMetric?_include=DeviceMetric:source`"
      }]
    },
    {
      "type" : "DiagnosticReport",
      "searchParam" : [{
        "name" : "conclusion-text",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-diagnostic-report-conclusion",
        "type" : "string",
        "documentation" : "**Example** (tested in CI): `GET [base]/DiagnosticReport?conclusion-text=There are`"
      },
      {
        "name" : "imaging-study",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-diagnosticreport-imagingstudy",
        "type" : "reference",
        "documentation" : "**Example** (tested in CI): `GET [base]/DiagnosticReport?_include=DiagnosticReport:imaging-study`"
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
        "type" : "date",
        "documentation" : "**Example** (tested in CI): `GET [base]/DocumentReference?creation=2024-02-20`"
      },
      {
        "name" : "doc-status",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-dokument-documentreference-doc-status",
        "type" : "token",
        "documentation" : "**Example** (tested in CI): `GET [base]/DocumentReference?doc-status=final`"
      },
      {
        "name" : "nlp-processing-status",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-dokument-documentreference-nlp-processing-status",
        "type" : "token",
        "documentation" : "**Example** (tested in CI): `GET [base]/DocumentReference?nlp-processing-status=https://www.medizininformatik-initiative.de/fhir/ext/modul-dokument/CodeSystem/mii-cs-dokument-nlp-processing-status|unprocessed`"
      },
      {
        "name" : "size",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-documentreference-attachment-size",
        "type" : "number",
        "documentation" : "**Example** (tested in CI): `GET [base]/DocumentReference?size=986112`"
      },
      {
        "name" : "title",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-documentreference-attachment-title",
        "type" : "string",
        "documentation" : "**Example** (tested in CI): `GET [base]/DocumentReference?title=Kolon-Organoid Kulturprotokoll`"
      }]
    },
    {
      "type" : "Encounter",
      "searchParam" : [{
        "name" : "aufnahmegrund-drittestelle",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-encounter-aufnahmegrund-drittestelle",
        "type" : "token",
        "documentation" : "**Example** (tested in CI): `GET [base]/Encounter?aufnahmegrund-ersteundzweitestelle=http://fhir.de/CodeSystem/dkgev/AufnahmegrundErsteUndZweiteStelle|01&aufnahmegrund-drittestelle=http://fhir.de/CodeSystem/dkgev/AufnahmegrundDritteStelle|0&aufnahmegrund-viertestelle=http://fhir.de/CodeSystem/dkgev/AufnahmegrundVierteStelle|1`"
      },
      {
        "name" : "aufnahmegrund-ersteundzweitestelle",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-encounter-aufnahmegrund-ersteundzweitestelle",
        "type" : "token",
        "documentation" : "**Example** (tested in CI): `GET [base]/Encounter?aufnahmegrund-ersteundzweitestelle=http://fhir.de/CodeSystem/dkgev/AufnahmegrundErsteUndZweiteStelle|01&aufnahmegrund-drittestelle=http://fhir.de/CodeSystem/dkgev/AufnahmegrundDritteStelle|0&aufnahmegrund-viertestelle=http://fhir.de/CodeSystem/dkgev/AufnahmegrundVierteStelle|1`"
      },
      {
        "name" : "aufnahmegrund-viertestelle",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-encounter-aufnahmegrund-viertestelle",
        "type" : "token",
        "documentation" : "**Example** (tested in CI): `GET [base]/Encounter?aufnahmegrund-ersteundzweitestelle=http://fhir.de/CodeSystem/dkgev/AufnahmegrundErsteUndZweiteStelle|01&aufnahmegrund-drittestelle=http://fhir.de/CodeSystem/dkgev/AufnahmegrundDritteStelle|0&aufnahmegrund-viertestelle=http://fhir.de/CodeSystem/dkgev/AufnahmegrundVierteStelle|1`"
      },
      {
        "name" : "diagnosis-use",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-encounter-diagnosis-use",
        "type" : "token",
        "documentation" : "**Example** (tested in CI): `GET [base]/Encounter?diagnosis-use=http://terminology.hl7.org/CodeSystem/diagnosis-role|AD`"
      },
      {
        "name" : "entlassungsgrund-drittestelle",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-encounter-entlassungsgrund-drittestelle",
        "type" : "token",
        "documentation" : "**Example** (tested in CI): `GET [base]/Encounter?entlassungsgrund-ersteundzweitestelle=http://fhir.de/CodeSystem/dkgev/EntlassungsgrundErsteUndZweiteStelle|07&entlassungsgrund-drittestelle=http://fhir.de/CodeSystem/dkgev/EntlassungsgrundDritteStelle|9`"
      },
      {
        "name" : "entlassungsgrund-ersteundzweitestelle",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-encounter-entlassungsgrund-ersteundzweitestelle",
        "type" : "token",
        "documentation" : "**Example** (tested in CI): `GET [base]/Encounter?entlassungsgrund-ersteundzweitestelle=http://fhir.de/CodeSystem/dkgev/EntlassungsgrundErsteUndZweiteStelle|07&entlassungsgrund-drittestelle=http://fhir.de/CodeSystem/dkgev/EntlassungsgrundDritteStelle|9`"
      },
      {
        "name" : "hospitalization-admitsource",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-encounter-hospitalization-admitsource",
        "type" : "token",
        "documentation" : "**Example** (tested in CI): `GET [base]/Encounter?hospitalization-admitsource=http://fhir.de/CodeSystem/dgkev/Aufnahmeanlass|E`"
      },
      {
        "name" : "location-physical-type",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-encounter-location-physical-type",
        "type" : "token",
        "documentation" : "**Example** (tested in CI): `GET [base]/Encounter?location-physical-type=http://terminology.hl7.org/CodeSystem/location-physical-type|ro`"
      },
      {
        "name" : "service-type",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-encounter-servicetype",
        "type" : "token",
        "documentation" : "**Example** (tested in CI): `GET [base]/Encounter?service-type=http://fhir.de/CodeSystem/dkgev/Fachabteilungsschluessel|0100`"
      }]
    },
    {
      "type" : "EvidenceVariable",
      "searchParam" : [{
        "name" : "characteristicDescription",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-evidencevariable-characteristic-description",
        "type" : "string",
        "documentation" : "**Example** (tested in CI): `GET [base]/EvidenceVariable?characteristicDescription=Alter mindestens`"
      }]
    },
    {
      "type" : "FamilyMemberHistory",
      "searchParam" : [{
        "name" : "reason-code",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-familymemberhistory-reasoncode",
        "type" : "token",
        "documentation" : "**Example** (tested in CI): `GET [base]/FamilyMemberHistory?reason-code=http://snomed.info/sct|447886005`"
      },
      {
        "name" : "reason-reference",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-familymemberhistory-reasonreference",
        "type" : "reference",
        "documentation" : "**Example** (tested in CI): `GET [base]/FamilyMemberHistory?_include=FamilyMemberHistory:reason-reference`"
      }]
    },
    {
      "type" : "ImagingStudy",
      "searchParam" : [{
        "name" : "bildgebungsgrund",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-bildgebungsgrund",
        "type" : "string",
        "documentation" : "**Example** (tested in CI): `GET [base]/ImagingStudy?bildgebungsgrund=Verdacht auf`"
      },
      {
        "name" : "contrast-bolus",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-contrast-bolus",
        "type" : "token",
        "documentation" : "**Example** (tested in CI): `GET [base]/ImagingStudy?contrast-bolus=true`"
      },
      {
        "name" : "contrast-bolus-details",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-contrast-bolus-details",
        "type" : "reference",
        "documentation" : "**Example** (tested in CI): `GET [base]/ImagingStudy?_include=ImagingStudy:contrast-bolus-details`"
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
        "type" : "string",
        "documentation" : "**Example** (tested in CI): `GET [base]/ImagingStudy?description=Mamma`"
      },
      {
        "name" : "echo-time",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-echo-time",
        "type" : "quantity",
        "documentation" : "**Example** (tested in CI): `GET [base]/ImagingStudy?echo-time=388`"
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
        "type" : "quantity",
        "documentation" : "**Example** (tested in CI): `GET [base]/ImagingStudy?flip-angle=130`"
      },
      {
        "name" : "instance-burned-in-annotation",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-instance-burned-in-annotation",
        "type" : "token"
      },
      {
        "name" : "instance-image-type",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-instance-image-type",
        "type" : "token",
        "documentation" : "**Example** (tested in CI): `GET [base]/ImagingStudy?instance-image-type=https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/CodeSystem/mii-cs-bildgebung-instance-image-type|ORIGINAL`"
      },
      {
        "name" : "instance-number",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-instance-number",
        "type" : "number",
        "documentation" : "**Example** (tested in CI): `GET [base]/ImagingStudy?instance-number=28`"
      },
      {
        "name" : "instance-pixel-spacing-x",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-instance-pixel-x",
        "type" : "quantity",
        "documentation" : "**Example** (tested in CI): `GET [base]/ImagingStudy?instance-pixel-spacing-x=0.260417`"
      },
      {
        "name" : "instance-pixel-spacing-y",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-instance-pixel-y",
        "type" : "quantity",
        "documentation" : "**Example** (tested in CI): `GET [base]/ImagingStudy?instance-pixel-spacing-y=0.260417`"
      },
      {
        "name" : "instance-slice-thickness",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-instance-slice-thickness",
        "type" : "quantity",
        "documentation" : "**Example** (tested in CI): `GET [base]/ImagingStudy?instance-slice-thickness=3`"
      },
      {
        "name" : "inversion-time",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-inversion-time",
        "type" : "quantity",
        "documentation" : "**Example** (tested in CI): `GET [base]/ImagingStudy?inversion-time=900`"
      },
      {
        "name" : "kvp",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-kvp",
        "type" : "quantity"
      },
      {
        "name" : "magnetic-field-strength",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-magnetic-field-strength",
        "type" : "quantity",
        "documentation" : "**Example** (tested in CI): `GET [base]/ImagingStudy?magnetic-field-strength=3`"
      },
      {
        "name" : "modality-body-site",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-modality-body-site",
        "type" : "composite",
        "documentation" : "**Example** (tested in CI): `GET [base]/ImagingStudy?modality-body-site=http://dicom.nema.org/resources/ontology/DCM|MR$http://snomed.info/sct|76752008`"
      },
      {
        "name" : "number-instances",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-number-instances",
        "type" : "number",
        "documentation" : "**Example** (tested in CI): `GET [base]/ImagingStudy?number-instances=294`"
      },
      {
        "name" : "number-series",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-number-series",
        "type" : "number",
        "documentation" : "**Example** (tested in CI): `GET [base]/ImagingStudy?number-series=11`"
      },
      {
        "name" : "procedure-reference",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-procedure-reference",
        "type" : "reference",
        "documentation" : "**Example** (tested in CI): `GET [base]/ImagingStudy?_include=ImagingStudy:procedure-reference`"
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
        "type" : "reference",
        "documentation" : "**Example** (tested in CI): `GET [base]/ImagingStudy?_include=ImagingStudy:reason-reference`"
      },
      {
        "name" : "repetition-time",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-repetition-time",
        "type" : "quantity",
        "documentation" : "**Example** (tested in CI): `GET [base]/ImagingStudy?repetition-time=5000`"
      },
      {
        "name" : "scanning-sequence",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-scanning-sequence",
        "type" : "token",
        "documentation" : "**Example** (tested in CI): `GET [base]/ImagingStudy?scanning-sequence=https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/CodeSystem/mii-cs-bildgebung-scanning-sequence|SE`"
      },
      {
        "name" : "scanning-sequence-variant",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-scanning-sequence-variant",
        "type" : "token",
        "documentation" : "**Example** (tested in CI): `GET [base]/ImagingStudy?scanning-sequence-variant=https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/CodeSystem/mii-cs-bildgebung-scanning-sequence-variant|SP`"
      },
      {
        "name" : "series-laterality",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-laterality",
        "type" : "token",
        "documentation" : "**Example** (tested in CI): `GET [base]/ImagingStudy?series-laterality=http://snomed.info/sct|419161000`"
      },
      {
        "name" : "series-number",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-number",
        "type" : "number",
        "documentation" : "**Example** (tested in CI): `GET [base]/ImagingStudy?series-number=9`"
      },
      {
        "name" : "series-started",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-started",
        "type" : "date",
        "documentation" : "**Example** (tested in CI): `GET [base]/ImagingStudy?series-started=2024-07-19`"
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
        "type" : "token",
        "documentation" : "**Example** (tested in CI): `GET [base]/ImagingStudy?study-modality=http://dicom.nema.org/resources/ontology/DCM|MR`"
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
        "type" : "token",
        "documentation" : "**Example** (tested in CI): `GET [base]/Library?quellregister=true`"
      },
      {
        "name" : "relatedArtifactUrl",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-library-relatedartifact-url",
        "type" : "uri",
        "documentation" : "**Example** (tested in CI): `GET [base]/Library?relatedArtifactUrl=https://drks.de/`"
      }]
    },
    {
      "type" : "List",
      "searchParam" : [{
        "name" : "mode",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-list-mode",
        "type" : "token",
        "documentation" : "**Example** (tested in CI): `GET [base]/List?mode=snapshot`"
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
        "type" : "quantity",
        "documentation" : "**Example** (tested in CI): `GET [base]/Medication?ingredient-strength-denominator=1|http://standardterms.edqm.eu|10219000`"
      },
      {
        "name" : "ingredient-strength-numerator",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-ingredient-strength-numerator",
        "type" : "quantity",
        "documentation" : "**Example** (tested in CI): `GET [base]/Medication?ingredient-strength-numerator=100|http://unitsofmeasure.org|mg`"
      }]
    },
    {
      "type" : "MedicationAdministration",
      "searchParam" : [{
        "name" : "dosage-route",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-route",
        "type" : "token",
        "documentation" : "**Example** (tested in CI): `GET [base]/MedicationAdministration?dosage-route=http://standardterms.edqm.eu|20045000`"
      },
      {
        "name" : "dosage-site",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-site",
        "type" : "token",
        "documentation" : "**Example** (tested in CI): `GET [base]/MedicationAdministration?dosage-site=http://snomed.info/sct|368208006`"
      },
      {
        "name" : "dose-quantity",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-dosequantity",
        "type" : "quantity",
        "documentation" : "**Example** (tested in CI): `GET [base]/MedicationAdministration?dose-quantity=111|http://unitsofmeasure.org|mL`"
      },
      {
        "name" : "part-of",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-partof",
        "type" : "reference",
        "documentation" : "**Example** (tested in CI): `GET [base]/MedicationAdministration?_include=MedicationAdministration:part-of`"
      },
      {
        "name" : "ratequantity",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-ratequantity",
        "type" : "quantity",
        "documentation" : "**Example** (tested in CI): `GET [base]/MedicationAdministration?ratequantity=111|http://unitsofmeasure.org|mL/min`"
      },
      {
        "name" : "rateratio",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-rateratio",
        "type" : "composite"
      },
      {
        "name" : "rateratio-denominator",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-rateratio-denominator",
        "type" : "quantity",
        "documentation" : "**Example** (tested in CI): `GET [base]/MedicationAdministration?rateratio-denominator=1|http://unitsofmeasure.org|min`"
      },
      {
        "name" : "rateratio-numerator",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-rateratio-numerator",
        "type" : "quantity",
        "documentation" : "**Example** (tested in CI): `GET [base]/MedicationAdministration?rateratio-numerator=30|http://unitsofmeasure.org|mL`"
      },
      {
        "name" : "reason-reference",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-reasonreference",
        "type" : "reference",
        "documentation" : "**Example** (tested in CI): `GET [base]/MedicationAdministration?_include=MedicationAdministration:reason-reference`"
      }]
    },
    {
      "type" : "MedicationRequest",
      "searchParam" : [{
        "name" : "dosage-route",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-route",
        "type" : "token",
        "documentation" : "**Example** (tested in CI): `GET [base]/MedicationRequest?dosage-route=http://snomed.info/sct|26643006`"
      },
      {
        "name" : "dosage-site",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-site",
        "type" : "token",
        "documentation" : "**Example** (tested in CI): `GET [base]/MedicationRequest?dosage-site=http://snomed.info/sct|123851003`"
      },
      {
        "name" : "dose-quantity",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-dosequantity",
        "type" : "quantity",
        "documentation" : "**Example** (tested in CI): `GET [base]/MedicationRequest?dose-quantity=1500|http://unitsofmeasure.org|mg`"
      },
      {
        "name" : "doserange",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-doserange",
        "type" : "composite"
      },
      {
        "name" : "doserange-high",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-doserange-high",
        "type" : "quantity",
        "documentation" : "**Example** (tested in CI): `GET [base]/MedicationRequest?doserange-high=1000|http://unitsofmeasure.org|mg`"
      },
      {
        "name" : "doserange-low",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-doserange-low",
        "type" : "quantity",
        "documentation" : "**Example** (tested in CI): `GET [base]/MedicationRequest?doserange-low=500|http://unitsofmeasure.org|mg`"
      },
      {
        "name" : "ratequantity",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-ratequantity",
        "type" : "quantity",
        "documentation" : "**Example** (tested in CI): `GET [base]/MedicationRequest?ratequantity=5|http://unitsofmeasure.org|mg/min`"
      },
      {
        "name" : "raterange",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-raterange",
        "type" : "composite"
      },
      {
        "name" : "raterange-high",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-raterange-high",
        "type" : "quantity",
        "documentation" : "**Example** (tested in CI): `GET [base]/MedicationRequest?raterange-high=120|http://unitsofmeasure.org|mL/h`"
      },
      {
        "name" : "raterange-low",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-raterange-low",
        "type" : "quantity",
        "documentation" : "**Example** (tested in CI): `GET [base]/MedicationRequest?raterange-low=60|http://unitsofmeasure.org|mL/h`"
      },
      {
        "name" : "rateratio",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-rateratio",
        "type" : "composite"
      },
      {
        "name" : "rateratio-denominator",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-rateratio-denominator",
        "type" : "quantity",
        "documentation" : "**Example** (tested in CI): `GET [base]/MedicationRequest?rateratio-denominator=1|http://unitsofmeasure.org|min`"
      },
      {
        "name" : "rateratio-numerator",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-rateratio-numerator",
        "type" : "quantity",
        "documentation" : "**Example** (tested in CI): `GET [base]/MedicationRequest?rateratio-numerator=6.5|http://unitsofmeasure.org|mg`"
      }]
    },
    {
      "type" : "MedicationStatement",
      "searchParam" : [{
        "name" : "dosage-route",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-route",
        "type" : "token",
        "documentation" : "**Example** (tested in CI): `GET [base]/MedicationStatement?dosage-route=http://snomed.info/sct|26643006`"
      },
      {
        "name" : "dosage-site",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-site",
        "type" : "token",
        "documentation" : "**Example** (tested in CI): `GET [base]/MedicationStatement?dosage-site=http://snomed.info/sct|789218009`"
      },
      {
        "name" : "dose-quantity",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-dosequantity",
        "type" : "quantity",
        "documentation" : "**Example** (tested in CI): `GET [base]/MedicationStatement?dose-quantity=80|http://unitsofmeasure.org|mg`"
      },
      {
        "name" : "doserange",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-doserange",
        "type" : "composite"
      },
      {
        "name" : "doserange-high",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-doserange-high",
        "type" : "quantity",
        "documentation" : "**Example** (tested in CI): `GET [base]/MedicationStatement?doserange-high=80|http://unitsofmeasure.org|mg`"
      },
      {
        "name" : "doserange-low",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-doserange-low",
        "type" : "quantity",
        "documentation" : "**Example** (tested in CI): `GET [base]/MedicationStatement?doserange-low=40|http://unitsofmeasure.org|mg`"
      },
      {
        "name" : "part-of",
        "definition" : "http://hl7.org/fhir/SearchParameter/MedicationStatement-part-of",
        "type" : "reference"
      },
      {
        "name" : "ratequantity",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-ratequantity",
        "type" : "quantity",
        "documentation" : "**Example** (tested in CI): `GET [base]/MedicationStatement?ratequantity=3.3|http://unitsofmeasure.org|mg/h`"
      },
      {
        "name" : "raterange",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-raterange",
        "type" : "composite"
      },
      {
        "name" : "raterange-high",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-raterange-high",
        "type" : "quantity",
        "documentation" : "**Example** (tested in CI): `GET [base]/MedicationStatement?raterange-high=4|http://unitsofmeasure.org|mg/h`"
      },
      {
        "name" : "raterange-low",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-raterange-low",
        "type" : "quantity",
        "documentation" : "**Example** (tested in CI): `GET [base]/MedicationStatement?raterange-low=2|http://unitsofmeasure.org|mg/h`"
      },
      {
        "name" : "rateratio",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-rateratio",
        "type" : "composite"
      },
      {
        "name" : "rateratio-denominator",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-rateratio-denominator",
        "type" : "quantity",
        "documentation" : "**Example** (tested in CI): `GET [base]/MedicationStatement?rateratio-denominator=1|http://unitsofmeasure.org|d`"
      },
      {
        "name" : "rateratio-numerator",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-rateratio-numerator",
        "type" : "quantity",
        "documentation" : "**Example** (tested in CI): `GET [base]/MedicationStatement?rateratio-numerator=80|http://unitsofmeasure.org|mg`"
      },
      {
        "name" : "reason-reference",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-reasonreference",
        "type" : "reference",
        "documentation" : "**Example** (tested in CI): `GET [base]/MedicationStatement?_include=MedicationStatement:reason-reference`"
      }]
    },
    {
      "type" : "Observation",
      "searchParam" : [{
        "name" : "body-site",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-observation-bodysite",
        "type" : "token",
        "documentation" : "**Example** (tested in CI): `GET [base]/Observation?body-site=http://snomed.info/sct|76752008`"
      },
      {
        "name" : "body-structure",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-observation-body-structure",
        "type" : "reference"
      },
      {
        "name" : "component-interpretation",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-observation-component-interpretation",
        "type" : "token",
        "documentation" : "**Example** (tested in CI): `GET [base]/Observation?component-interpretation=http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation|N`"
      },
      {
        "name" : "encounter",
        "definition" : "http://hl7.org/fhir/SearchParameter/clinical-encounter",
        "type" : "reference"
      },
      {
        "name" : "focus",
        "definition" : "http://hl7.org/fhir/SearchParameter/Observation-focus",
        "type" : "reference"
      },
      {
        "name" : "has-member",
        "definition" : "http://hl7.org/fhir/SearchParameter/Observation-has-member",
        "type" : "reference",
        "documentation" : "**Example** (tested in CI): `GET [base]/Observation?_include=Observation:has-member`"
      },
      {
        "name" : "interpretation",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-observation-interpretation",
        "type" : "token",
        "documentation" : "**Example** (tested in CI): `GET [base]/Observation?interpretation=http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation|H`"
      },
      {
        "name" : "issued",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-observation-issued",
        "type" : "date",
        "documentation" : "**Example** (tested in CI): `GET [base]/Observation?issued=2024-02-15`"
      },
      {
        "name" : "reference-range",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-observation-referencerange",
        "type" : "composite"
      },
      {
        "name" : "reference-range-high",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-observation-referencerange-high",
        "type" : "quantity",
        "documentation" : "**Example** (tested in CI): `GET [base]/Observation?reference-range-high=3000|http://unitsofmeasure.org|mL`"
      },
      {
        "name" : "reference-range-low",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-observation-referencerange-low",
        "type" : "quantity",
        "documentation" : "**Example** (tested in CI): `GET [base]/Observation?reference-range-low=1000|http://unitsofmeasure.org|mL`"
      },
      {
        "name" : "series-uid",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-observation-series-uid",
        "type" : "token",
        "documentation" : "**Example** (tested in CI): `GET [base]/Observation?series-uid=1.2.34.5.6789.1.2.34.5678912.34567891234567891234`"
      },
      {
        "name" : "sop-instance-uid",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-observation-sop-instance-uid",
        "type" : "token",
        "documentation" : "**Example** (tested in CI): `GET [base]/Observation?sop-instance-uid=1.2.34.5.6789.1.2.3.45678.9123456789123456789123456789`"
      },
      {
        "name" : "value-ratio",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-observation-value-ratio",
        "type" : "composite"
      },
      {
        "name" : "value-ratio-denominator",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-observation-value-ratio-denominator",
        "type" : "quantity",
        "documentation" : "**Example** (tested in CI): `GET [base]/Observation?value-ratio-denominator=128|http://unitsofmeasure.org|{titer}`"
      },
      {
        "name" : "value-ratio-numerator",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-observation-value-ratio-numerator",
        "type" : "quantity",
        "documentation" : "**Example** (tested in CI): `GET [base]/Observation?value-ratio-numerator=1|http://unitsofmeasure.org|{titer}`"
      }]
    },
    {
      "type" : "Patient",
      "searchParam" : [{
        "name" : "adresszusatz",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-adresszusatz",
        "type" : "string",
        "documentation" : "**Example** (tested in CI): `GET [base]/Patient?adresszusatz=Schloss`"
      },
      {
        "name" : "assigner-pid",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-assignerpid",
        "type" : "token",
        "documentation" : "**Example** (tested in CI): `GET [base]/Patient?assigner-pid=http://fhir.de/sid/arge-ik/iknr|123456789`"
      },
      {
        "name" : "gemeindeschluessel",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-gemeindeschluessel",
        "type" : "token",
        "documentation" : "**Example** (tested in CI): `GET [base]/Patient?gemeindeschluessel=http://fhir.de/sid/destatis/ags|11000000`"
      },
      {
        "name" : "hausnummer",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-hausnummer",
        "type" : "string",
        "documentation" : "**Example** (tested in CI): `GET [base]/Patient?strasse=Dorfstraße&hausnummer=9&stadtteil=Malchow`"
      },
      {
        "name" : "other-amtlich",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-otheramtlich",
        "type" : "token",
        "documentation" : "**Example** (tested in CI): `GET [base]/Patient?other-amtlich=http://fhir.de/CodeSystem/gender-amtlich-de|D`"
      },
      {
        "name" : "postfach",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-postfach",
        "type" : "string",
        "documentation" : "**Example** (tested in CI): `GET [base]/Patient?postfach=Postfach-252618`"
      },
      {
        "name" : "prefix",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-prefix",
        "type" : "token",
        "documentation" : "**Example** (tested in CI): `GET [base]/Patient?prefix=Prinz von Preußen`"
      },
      {
        "name" : "prefix-qualifier",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-prefixqualifier",
        "type" : "token",
        "documentation" : "**Example** (tested in CI): `GET [base]/Patient?prefix-qualifier=NB`"
      },
      {
        "name" : "stadtteil",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-stadtteil",
        "type" : "string",
        "documentation" : "**Examples** (tested in CI):\n\n- `GET [base]/Patient?strasse=Dorfstraße&hausnummer=9&stadtteil=Malchow`\n- `GET [base]/Patient?stadtteil=Malchow`"
      },
      {
        "name" : "strasse",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-strasse",
        "type" : "string",
        "documentation" : "**Examples** (tested in CI):\n\n- `GET [base]/Patient?strasse=Dorfstraße&hausnummer=9&stadtteil=Malchow`\n- `GET [base]/Patient?strasse=Dorfstraße`"
      }]
    },
    {
      "type" : "Procedure",
      "searchParam" : [{
        "name" : "bodySite",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-procedure-bodysite",
        "type" : "token",
        "documentation" : "**Example** (tested in CI): `GET [base]/Procedure?bodySite=http://snomed.info/sct|44714003`"
      },
      {
        "name" : "complication",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-procedure-complication",
        "type" : "token",
        "documentation" : "**Example** (tested in CI): `GET [base]/Procedure?complication=https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-operation-komplikation|N`"
      },
      {
        "name" : "dokumentationsdatum",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-procedure-dokumentationsdatum",
        "type" : "date",
        "documentation" : "**Example** (tested in CI): `GET [base]/Procedure?dokumentationsdatum=2024-02-20`"
      },
      {
        "name" : "durchfuehrungsabsicht",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-procedure-durchfuehrungsabsicht",
        "type" : "token",
        "documentation" : "**Example** (tested in CI): `GET [base]/Procedure?durchfuehrungsabsicht=http://snomed.info/sct|262202000`"
      },
      {
        "name" : "ops-seitenlokalisation",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-procedure-ops-seitenlokalisation",
        "type" : "token",
        "documentation" : "**Example** (tested in CI): `GET [base]/Procedure?code=http://fhir.de/CodeSystem/bfarm/ops|5-322.d1&ops-seitenlokalisation=https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_ICD_SEITENLOKALISATION|R`"
      },
      {
        "name" : "outcome",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-procedure-outcome",
        "type" : "token",
        "documentation" : "**Example** (tested in CI): `GET [base]/Procedure?outcome=http://snomed.info/sct|385669000`"
      },
      {
        "name" : "recorder",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-procedure-recorder",
        "type" : "reference",
        "documentation" : "**Example** (tested in CI): `GET [base]/Procedure?_include=Procedure:recorder`"
      },
      {
        "name" : "report",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-read-proc-report",
        "type" : "reference",
        "documentation" : "**Example** (tested in CI): `GET [base]/Procedure?_include=Procedure:report`"
      }]
    },
    {
      "type" : "ResearchStudy",
      "searchParam" : [{
        "name" : "akronym",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-researchstudy-akronym",
        "type" : "string",
        "documentation" : "**Example** (tested in CI): `GET [base]/ResearchStudy?akronym=NSCLC-EGFR-III`"
      },
      {
        "name" : "armName",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-researchstudy-arm-name",
        "type" : "string",
        "documentation" : "**Example** (tested in CI): `GET [base]/ResearchStudy?armName=Arm A: Osimertinib`"
      },
      {
        "name" : "finanzierung",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-researchstudy-finanzierung",
        "type" : "string",
        "documentation" : "**Example** (tested in CI): `GET [base]/ResearchStudy?finanzierung=Industriefinanzierte Studie`"
      },
      {
        "name" : "label",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-researchstudy-label",
        "type" : "string",
        "documentation" : "**Example** (tested in CI): `GET [base]/ResearchStudy?label=Phase-III-Studie zu`"
      },
      {
        "name" : "rekrutierungsstand",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-researchstudy-rekrutierungsstand",
        "type" : "number",
        "documentation" : "**Example** (tested in CI): `GET [base]/ResearchStudy?rekrutierungsstand=120`"
      },
      {
        "name" : "rekrutierungsstand-datum",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-researchstudy-rekrutierungsstand-datum",
        "type" : "date",
        "documentation" : "**Example** (tested in CI): `GET [base]/ResearchStudy?rekrutierungsstand-datum=2024-06-01`"
      },
      {
        "name" : "rekrutierungsstand-genauigkeit",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-researchstudy-rekrutierungsstand-genauigkeit",
        "type" : "string",
        "documentation" : "**Example** (tested in CI): `GET [base]/ResearchStudy?rekrutierungsstand-genauigkeit=exakt`"
      },
      {
        "name" : "rekrutierungsstart",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-researchstudy-rekrutierungsstart",
        "type" : "date",
        "documentation" : "**Example** (tested in CI): `GET [base]/ResearchStudy?rekrutierungsstart=2024-01-01`"
      },
      {
        "name" : "rekrutierungsziel",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-researchstudy-rekrutierungsziel",
        "type" : "number",
        "documentation" : "**Example** (tested in CI): `GET [base]/ResearchStudy?rekrutierungsziel=300`"
      },
      {
        "name" : "studienregister",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-researchstudy-studienregister",
        "type" : "reference",
        "documentation" : "**Example** (tested in CI): `GET [base]/ResearchStudy?_include=ResearchStudy:studienregister`"
      }]
    },
    {
      "type" : "ResearchSubject",
      "searchParam" : [{
        "name" : "consent",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-researchsubject-consent",
        "type" : "reference",
        "documentation" : "**Example** (tested in CI): `GET [base]/ResearchSubject?_include=ResearchSubject:consent`"
      }]
    },
    {
      "type" : "SearchParameter",
      "supportedProfile" : ["https://www.medizininformatik-initiative.de/fhir/modul-meta/StructureDefinition/mii-pr-meta-searchparameter|2027.0.0-ballot"]
    },
    {
      "type" : "ServiceRequest",
      "searchParam" : [{
        "name" : "reason-code",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-servicerequest-reasoncode",
        "type" : "token",
        "documentation" : "**Example** (tested in CI): `GET [base]/ServiceRequest?reason-code=http://snomed.info/sct|447886005`"
      },
      {
        "name" : "reason-reference",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-servicerequest-reasonreference",
        "type" : "reference",
        "documentation" : "**Example** (tested in CI): `GET [base]/ServiceRequest?_include=ServiceRequest:reason-reference`"
      },
      {
        "name" : "supporting-info",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-servicerequest-supportinginfo",
        "type" : "reference",
        "documentation" : "**Example** (tested in CI): `GET [base]/ServiceRequest?_include=ServiceRequest:supporting-info`"
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
        "type" : "token",
        "documentation" : "**Example** (tested in CI): `GET [base]/Specimen?collection-method=http://snomed.info/sct|129300006`"
      },
      {
        "name" : "container-additive",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-specimen-container-additive",
        "type" : "reference",
        "documentation" : "**Example** (tested in CI): `GET [base]/Specimen?_include=Specimen:container-additive`"
      },
      {
        "name" : "diagnose",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-specimen-diagnose",
        "type" : "reference",
        "documentation" : "**Example** (tested in CI): `GET [base]/Specimen?_include=Specimen:diagnose`"
      },
      {
        "name" : "processing-additive",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-specimen-processing-additive",
        "type" : "reference",
        "documentation" : "**Example** (tested in CI): `GET [base]/Specimen?_include=Specimen:processing-additive`"
      },
      {
        "name" : "processing-date",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-specimen-processing-date",
        "type" : "date",
        "documentation" : "**Example** (tested in CI): `GET [base]/Specimen?processing-date=2024-02-15`"
      },
      {
        "name" : "processing-procedure",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-specimen-processing-procedure",
        "type" : "token",
        "documentation" : "**Example** (tested in CI): `GET [base]/Specimen?processing-procedure=http://snomed.info/sct|1186936003`"
      },
      {
        "name" : "request",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-specimen-request",
        "type" : "reference",
        "documentation" : "**Example** (tested in CI): `GET [base]/Specimen?_include=Specimen:request`"
      }]
    },
    {
      "type" : "Task",
      "searchParam" : [{
        "name" : "for",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-task-for",
        "type" : "reference",
        "documentation" : "**Example** (tested in CI): `GET [base]/Task?_include=Task:for`"
      },
      {
        "name" : "reason-code",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-task-reasoncode",
        "type" : "token",
        "documentation" : "**Example** (tested in CI): `GET [base]/Task?reason-code=http://snomed.info/sct|447886005`"
      },
      {
        "name" : "reason-reference",
        "definition" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-task-reasonreference",
        "type" : "reference",
        "documentation" : "**Example** (tested in CI): `GET [base]/Task?_include=Task:reason-reference`"
      }]
    }]
  }]
}

```
