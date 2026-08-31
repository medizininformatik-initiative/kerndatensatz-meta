# MII PR Meta SearchParameter - MII IG Meta v2027.0.0-ballot.rc1

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **MII PR Meta SearchParameter**

## Ressourcenprofil: MII PR Meta SearchParameter ( Experimentell ) 

| | |
| :--- | :--- |
| *Offizielle URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/StructureDefinition/mii-pr-meta-searchparameter | *Version*:2027.0.0-ballot.rc1 |
| Active Stand: 2024-07-01 | *Maschinenlesbarer Name*:MII_PR_Meta_SearchParameter |

 
Das Profil legt die Mindestanforderungen fest, die SearchParameter-Ressourcen im Kerndatensatz erfüllen müssen. 

Das Profil legt die Mindestanforderungen fest, die SearchParameter-Ressourcen im Kerndatensatz erfüllen müssen.

Folgende Invariante MUSS bei der Erstellung von Custom SearchParameter-Ressourcen berücksichtigt werden.

**Usages:**

* Examples for this Profile: [MII_SP_Meta_AdverseEvent_Encounter](SearchParameter-mii-sp-meta-adverseevent-encounter.md), [MII_SP_Meta_AdverseEvent_SuspectEntity_Instance](SearchParameter-mii-sp-meta-adverseevent-suspectentity-instance.md), [MII_SP_Bildgebung_Koerperstruktur_Location_Qualifier](SearchParameter-mii-sp-meta-body-structure-location-qualifier.md), [MII_SP_Meta_CarePlan_Addresses](SearchParameter-mii-sp-meta-careplan-addresses.md)... Show 46 more, [MII_SP_Meta_CarePlan_Contributor](SearchParameter-mii-sp-meta-careplan-contributor.md), [MII_SP_Meta_CarePlan_Created](SearchParameter-mii-sp-meta-careplan-created.md), [MII_SP_Meta_Composition_Attester_Mode](SearchParameter-mii-sp-meta-composition-attester-mode.md), [MII_SP_Meta_Composition_Custodian](SearchParameter-mii-sp-meta-composition-custodian.md), [MII_SP_Meta_Composition_RelatesTo_Code](SearchParameter-mii-sp-meta-composition-relatesto-code.md), [MII_SP_Bildgebung_Composition_Section_Author](SearchParameter-mii-sp-meta-composition-section-author.md), [MII_SP_Bildgebung_Composition_Section_Title](SearchParameter-mii-sp-meta-composition-section-title.md), [MII_SP_Meta_Condition_Evidence_Detail](SearchParameter-mii-sp-meta-condition-evidence-detail.md), [MII_SP_Meta_Condition_ICD10GM_Diagnosesicherheit](SearchParameter-mii-sp-meta-condition-icd10gm-diagnosesicherheit.md), [MII_SP_Meta_Condition_ICD10GM_Mehrfachcodierung](SearchParameter-mii-sp-meta-condition-icd10gm-mehrfachcodierung.md), [MII_SP_Meta_Condition_ICD10GM_Seitenlokalisation](SearchParameter-mii-sp-meta-condition-icd10gm-seitenlokalisation.md), [MII_SP_Meta_Condition_Verification_Status](SearchParameter-mii-sp-meta-condition-verification-status.md), [MII_SP_Meta_Consent_PolicyUri](SearchParameter-mii-sp-meta-consent-policyuri.md), [MII_SP_Meta_Consent_ProvisionCode](SearchParameter-mii-sp-meta-consent-provisioncode.md), [MII_SP_Meta_Consent_ProvisionCodePeriod](SearchParameter-mii-sp-meta-consent-provisioncodeperiod.md), [MII_SP_Meta_Consent_ProvisionCodeType](SearchParameter-mii-sp-meta-consent-provisioncodetype.md), [MII_SP_Meta_Consent_ProvisionPeriod](SearchParameter-mii-sp-meta-consent-provisionperiod.md), [MII_SP_Meta_Consent_ProvisionType](SearchParameter-mii-sp-meta-consent-provisiontype.md), [MII_SP_Bildgebung_Description](SearchParameter-mii-sp-meta-description.md), [MII_SP_Meta_Device_Property_Type](SearchParameter-mii-sp-meta-device-property-type.md), [MII_SP_Meta_DeviceMetric_Source](SearchParameter-mii-sp-meta-devicemetric-source.md), [MII_SP_Bildgebung_Diagnostic_Report_Conclusion](SearchParameter-mii-sp-meta-diagnostic-report-conclusion.md), [MII_SP_Meta_DiagnosticReport_ImagingStudy](SearchParameter-mii-sp-meta-diagnosticreport-imagingstudy.md), [MII_SP_Meta_DocumentReference_Attachment_Size](SearchParameter-mii-sp-meta-documentreference-attachment-size.md), [MII_SP_Meta_DocumentReference_Attachment_Title](SearchParameter-mii-sp-meta-documentreference-attachment-title.md), [MII_SP_Meta_DocumentReference_Attachment_Creation](SearchParameter-mii-sp-meta-dokument-documentreference-attachment-creation.md), [MII_SP_Meta_DocumentReference_Document_Status](SearchParameter-mii-sp-meta-dokument-documentreference-doc-status.md), [MII_SP_Meta_DocumentReference_NLP_Processing_Status](SearchParameter-mii-sp-meta-dokument-documentreference-nlp-processing-status.md), [MII_SP_Meta_Encounter_Aufnahmegrund_DritteStelle](SearchParameter-mii-sp-meta-encounter-aufnahmegrund-drittestelle.md), [MII_SP_Meta_Encounter_Aufnahmegrund_ErsteUndZweiteStelle](SearchParameter-mii-sp-meta-encounter-aufnahmegrund-ersteundzweitestelle.md), [MII_SP_Meta_Encounter_Aufnahmegrund_VierteStelle](SearchParameter-mii-sp-meta-encounter-aufnahmegrund-viertestelle.md), [MII_SP_Meta_Encounter_DiagnosisUse](SearchParameter-mii-sp-meta-encounter-diagnosis-use.md), [MII_SP_Meta_Encounter_Entlassungsgrund_DritteStelle](SearchParameter-mii-sp-meta-encounter-entlassungsgrund-drittestelle.md), [MII_SP_Meta_Encounter_Entlassungsgrund_ErsteUndZweiteStelle](SearchParameter-mii-sp-meta-encounter-entlassungsgrund-ersteundzweitestelle.md), [MII_SP_Meta_Encounter_Hospitalization_AdmitSource](SearchParameter-mii-sp-meta-encounter-hospitalization-admitsource.md), [MII_SP_Meta_Encounter_Location_PhysicalType](SearchParameter-mii-sp-meta-encounter-location-physical-type.md), [MII_SP_Meta_Encounter_ServiceType](SearchParameter-mii-sp-meta-encounter-servicetype.md), [MII_SP_Meta_EvidenceVariable_Characteristic_Description](SearchParameter-mii-sp-meta-evidencevariable-characteristic-description.md), [MII_SP_Meta_FamilyMemberHistory_ReasonCode](SearchParameter-mii-sp-meta-familymemberhistory-reasoncode.md), [MII_SP_Meta_FamilyMemberHistory_ReasonReference](SearchParameter-mii-sp-meta-familymemberhistory-reasonreference.md), [MII_SP_Bildgebung_Imaging_Study_Bildgebungsgrund](SearchParameter-mii-sp-meta-imaging-study-bildgebungsgrund.md), [MII_SP_Bildgebung_Imaging_Study_Instance_Burned_In_Annotation](SearchParameter-mii-sp-meta-imaging-study-instance-burned-in-annotation.md), [MII_SP_Bildgebung_Imaging_Study_Instance_Image_Type](SearchParameter-mii-sp-meta-imaging-study-instance-image-type.md), [MII_SP_Bildgebung_Imaging_Study_Instance_Number](SearchParameter-mii-sp-meta-imaging-study-instance-number.md), [MII_SP_Bildgebung_Imaging_Study_Instance_Pixel_Spacing_X](SearchParameter-mii-sp-meta-imaging-study-instance-pixel-x.md) and [MII_SP_Bildgebung_Imaging_Study_Instance_Pixel_Spacing_Y](SearchParameter-mii-sp-meta-imaging-study-instance-pixel-y.md)
* CapabilityStatements using this Profile: [MII CapabilityStatement Meta Server Capabilities](CapabilityStatement-mii-cps-meta-server-capabilities.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.medizininformatikinitiative.kerndatensatz.meta|current/StructureDefinition/StructureDefinition-mii-pr-meta-searchparameter.json)

### Formale Ansichten des Profilinhalts

 [Beschreibung von Profilen, Differentials, Snapshots und deren Repräsentationen](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

*  [Schlüsselelemente-Tabelle](#tabs-key) 
*  [Differential-Tabelle](#tabs-diff) 
*  [Snapshot-Tabelle](#tabs-snap) 
*  [Statistiken/Referenzen](#tabs-summ) 
*  [Alle](#tabs-all) 

#### Terminology Bindings

#### Constraints

Diese Struktur ist abgeleitet von [SearchParameter](http://hl7.org/fhir/R4/searchparameter.html) 

#### Constraints

#### Terminology Bindings

#### Constraints

Diese Struktur ist abgeleitet von [SearchParameter](http://hl7.org/fhir/R4/searchparameter.html) 

** Summary **

Mandatory: 5 elements

 **Schlüsselelemente-Ansicht** 

#### Terminology Bindings

#### Constraints

 **Differential-Ansicht** 

Diese Struktur ist abgeleitet von [SearchParameter](http://hl7.org/fhir/R4/searchparameter.html) 

#### Constraints

 **Snapshot-AnsichtView** 

#### Terminology Bindings

#### Constraints

Diese Struktur ist abgeleitet von [SearchParameter](http://hl7.org/fhir/R4/searchparameter.html) 

** Summary **

Mandatory: 5 elements

 

Weitere Repräsentationen des Profils: [CSV](../StructureDefinition-mii-pr-meta-searchparameter.csv), [Excel](../StructureDefinition-mii-pr-meta-searchparameter.xlsx), [Schematron](../StructureDefinition-mii-pr-meta-searchparameter.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "mii-pr-meta-searchparameter",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/StructureDefinition/mii-pr-meta-searchparameter",
  "version" : "2027.0.0-ballot.rc1",
  "name" : "MII_PR_Meta_SearchParameter",
  "title" : "MII PR Meta SearchParameter",
  "status" : "active",
  "experimental" : true,
  "date" : "2024-07-01",
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
  "description" : "Das Profil legt die Mindestanforderungen fest, die SearchParameter-Ressourcen im Kerndatensatz erfüllen müssen.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  },
  {
    "identity" : "workflow",
    "uri" : "http://hl7.org/fhir/workflow",
    "name" : "Workflow Pattern"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  },
  {
    "identity" : "objimpl",
    "uri" : "http://hl7.org/fhir/object-implementation",
    "name" : "Object Implementation Information"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "SearchParameter",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/SearchParameter",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "SearchParameter",
      "path" : "SearchParameter"
    },
    {
      "id" : "SearchParameter.version",
      "path" : "SearchParameter.version",
      "min" : 1
    },
    {
      "id" : "SearchParameter.experimental",
      "path" : "SearchParameter.experimental",
      "min" : 1
    },
    {
      "id" : "SearchParameter.date",
      "path" : "SearchParameter.date",
      "min" : 1
    },
    {
      "id" : "SearchParameter.publisher",
      "path" : "SearchParameter.publisher",
      "min" : 1
    },
    {
      "id" : "SearchParameter.contact",
      "path" : "SearchParameter.contact",
      "min" : 1
    },
    {
      "id" : "SearchParameter.code",
      "path" : "SearchParameter.code",
      "constraint" : [{
        "key" : "search-param-code-regex",
        "severity" : "error",
        "human" : "In SearchParameter.code DÜRFEN NICHT folgende Zeichen enthalten sein: Leerzeichen, `.`, `$`, `|`.",
        "expression" : "matches('[^\\\\s.$|]+')",
        "source" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/StructureDefinition/mii-pr-meta-searchparameter"
      }]
    }]
  }
}

```
