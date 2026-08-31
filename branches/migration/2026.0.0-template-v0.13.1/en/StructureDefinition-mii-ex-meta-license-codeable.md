# MII EX Meta License Codeable - MII IG Meta v2027.0.0-ballot.rc1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **MII EX Meta License Codeable**

## Extension: MII EX Meta License Codeable 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/StructureDefinition/mii-ex-meta-license-codeable | *Version*:2027.0.0-ballot.rc1 |
| Active as of 2024-10-17 | *Computable Name*:MII_EX_Meta_License_Codeable |

This extension may be used to provide machine-processable license information about the set of data described by this resource. The extension is a R4-compatible version of the FHIR for FAIR R4B IG Licence Terms as CodeableConcept extension.

**Context of Use**

This extension can be used to provide machine-processable licence information about the artifact described by a resource. It is an R4-compatible version of the FHIR for FAIR R4B IG [Licence Terms as CodeableConcept extension](https://hl7.org/fhir/uv/fhir-for-fair/STU1/StructureDefinition-licenceCodeable.html).

**Usage info**

**Usages:**

* Examples for this Extension: [Bundle/mii-exa-meta-searchparam-collection-bundle](Bundle-mii-exa-meta-searchparam-collection-bundle.md), [Bundle/mii-exa-meta-searchparam-transaction-bundle](Bundle-mii-exa-meta-searchparam-transaction-bundle.md), [MII_CS_Meta_DIZ_Standorte](CodeSystem-mii-cs-meta-diz-standorte.md), [MII_SP_Meta_AdverseEvent_Encounter](SearchParameter-mii-sp-meta-adverseevent-encounter.md)... Show 46 more, [MII_SP_Meta_AdverseEvent_SuspectEntity_Instance](SearchParameter-mii-sp-meta-adverseevent-suspectentity-instance.md), [MII_SP_Bildgebung_Koerperstruktur_Location_Qualifier](SearchParameter-mii-sp-meta-body-structure-location-qualifier.md), [MII_SP_Meta_CarePlan_Addresses](SearchParameter-mii-sp-meta-careplan-addresses.md), [MII_SP_Meta_CarePlan_Contributor](SearchParameter-mii-sp-meta-careplan-contributor.md), [MII_SP_Meta_CarePlan_Created](SearchParameter-mii-sp-meta-careplan-created.md), [MII_SP_Meta_Composition_Attester_Mode](SearchParameter-mii-sp-meta-composition-attester-mode.md), [MII_SP_Meta_Composition_Custodian](SearchParameter-mii-sp-meta-composition-custodian.md), [MII_SP_Meta_Composition_RelatesTo_Code](SearchParameter-mii-sp-meta-composition-relatesto-code.md), [MII_SP_Bildgebung_Composition_Section_Author](SearchParameter-mii-sp-meta-composition-section-author.md), [MII_SP_Bildgebung_Composition_Section_Title](SearchParameter-mii-sp-meta-composition-section-title.md), [MII_SP_Meta_Condition_Evidence_Detail](SearchParameter-mii-sp-meta-condition-evidence-detail.md), [MII_SP_Meta_Condition_ICD10GM_Diagnosesicherheit](SearchParameter-mii-sp-meta-condition-icd10gm-diagnosesicherheit.md), [MII_SP_Meta_Condition_ICD10GM_Mehrfachcodierung](SearchParameter-mii-sp-meta-condition-icd10gm-mehrfachcodierung.md), [MII_SP_Meta_Condition_ICD10GM_Seitenlokalisation](SearchParameter-mii-sp-meta-condition-icd10gm-seitenlokalisation.md), [MII_SP_Meta_Condition_Verification_Status](SearchParameter-mii-sp-meta-condition-verification-status.md), [MII_SP_Meta_Consent_PolicyUri](SearchParameter-mii-sp-meta-consent-policyuri.md), [MII_SP_Meta_Consent_ProvisionCode](SearchParameter-mii-sp-meta-consent-provisioncode.md), [MII_SP_Meta_Consent_ProvisionCodePeriod](SearchParameter-mii-sp-meta-consent-provisioncodeperiod.md), [MII_SP_Meta_Consent_ProvisionCodeType](SearchParameter-mii-sp-meta-consent-provisioncodetype.md), [MII_SP_Meta_Consent_ProvisionPeriod](SearchParameter-mii-sp-meta-consent-provisionperiod.md), [MII_SP_Meta_Consent_ProvisionType](SearchParameter-mii-sp-meta-consent-provisiontype.md), [MII_SP_Bildgebung_Description](SearchParameter-mii-sp-meta-description.md), [MII_SP_Meta_Device_Property_Type](SearchParameter-mii-sp-meta-device-property-type.md), [MII_SP_Meta_DeviceMetric_Source](SearchParameter-mii-sp-meta-devicemetric-source.md), [MII_SP_Bildgebung_Diagnostic_Report_Conclusion](SearchParameter-mii-sp-meta-diagnostic-report-conclusion.md), [MII_SP_Meta_DiagnosticReport_ImagingStudy](SearchParameter-mii-sp-meta-diagnosticreport-imagingstudy.md), [MII_SP_Meta_DocumentReference_Attachment_Size](SearchParameter-mii-sp-meta-documentreference-attachment-size.md), [MII_SP_Meta_DocumentReference_Attachment_Title](SearchParameter-mii-sp-meta-documentreference-attachment-title.md), [MII_SP_Meta_DocumentReference_Attachment_Creation](SearchParameter-mii-sp-meta-dokument-documentreference-attachment-creation.md), [MII_SP_Meta_DocumentReference_Document_Status](SearchParameter-mii-sp-meta-dokument-documentreference-doc-status.md), [MII_SP_Meta_DocumentReference_NLP_Processing_Status](SearchParameter-mii-sp-meta-dokument-documentreference-nlp-processing-status.md), [MII_SP_Meta_Encounter_Aufnahmegrund_DritteStelle](SearchParameter-mii-sp-meta-encounter-aufnahmegrund-drittestelle.md), [MII_SP_Meta_Encounter_Aufnahmegrund_ErsteUndZweiteStelle](SearchParameter-mii-sp-meta-encounter-aufnahmegrund-ersteundzweitestelle.md), [MII_SP_Meta_Encounter_Aufnahmegrund_VierteStelle](SearchParameter-mii-sp-meta-encounter-aufnahmegrund-viertestelle.md), [MII_SP_Meta_Encounter_DiagnosisUse](SearchParameter-mii-sp-meta-encounter-diagnosis-use.md), [MII_SP_Meta_Encounter_Entlassungsgrund_DritteStelle](SearchParameter-mii-sp-meta-encounter-entlassungsgrund-drittestelle.md), [MII_SP_Meta_Encounter_Entlassungsgrund_ErsteUndZweiteStelle](SearchParameter-mii-sp-meta-encounter-entlassungsgrund-ersteundzweitestelle.md), [MII_SP_Meta_Encounter_Hospitalization_AdmitSource](SearchParameter-mii-sp-meta-encounter-hospitalization-admitsource.md), [MII_SP_Meta_Encounter_Location_PhysicalType](SearchParameter-mii-sp-meta-encounter-location-physical-type.md), [MII_SP_Meta_Encounter_ServiceType](SearchParameter-mii-sp-meta-encounter-servicetype.md), [MII_SP_Meta_EvidenceVariable_Characteristic_Description](SearchParameter-mii-sp-meta-evidencevariable-characteristic-description.md), [MII_SP_Meta_FamilyMemberHistory_ReasonCode](SearchParameter-mii-sp-meta-familymemberhistory-reasoncode.md), [MII_SP_Meta_FamilyMemberHistory_ReasonReference](SearchParameter-mii-sp-meta-familymemberhistory-reasonreference.md), [MII_SP_Bildgebung_Imaging_Study_Bildgebungsgrund](SearchParameter-mii-sp-meta-imaging-study-bildgebungsgrund.md), [MII_SP_Bildgebung_Imaging_Study_Instance_Burned_In_Annotation](SearchParameter-mii-sp-meta-imaging-study-instance-burned-in-annotation.md) and [MII_SP_Bildgebung_Imaging_Study_Instance_Image_Type](SearchParameter-mii-sp-meta-imaging-study-instance-image-type.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.medizininformatikinitiative.kerndatensatz.meta|current/StructureDefinition/StructureDefinition-mii-ex-meta-license-codeable.json)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and their representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-mii-ex-meta-license-codeable.csv), [Excel](../StructureDefinition-mii-ex-meta-license-codeable.xlsx), [Schematron](../StructureDefinition-mii-ex-meta-license-codeable.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "mii-ex-meta-license-codeable",
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
  "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/StructureDefinition/mii-ex-meta-license-codeable",
  "version" : "2027.0.0-ballot.rc1",
  "name" : "MII_EX_Meta_License_Codeable",
  "title" : "MII EX Meta License Codeable",
  "status" : "active",
  "date" : "2024-10-17",
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
  "description" : "This extension may be used to provide machine-processable license information about the set of data described by this resource.\nThe extension is a R4-compatible version of the FHIR for FAIR R4B IG Licence Terms as CodeableConcept extension.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "kind" : "complex-type",
  "abstract" : false,
  "context" : [{
    "type" : "element",
    "expression" : "Element"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "MII EX Meta License Codeable",
      "definition" : "This extension may be used to provide machine-processable license information about the set of data described by this resource.\nThe extension is a R4-compatible version of the FHIR for FAIR R4B IG Licence Terms as CodeableConcept extension."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/StructureDefinition/mii-ex-meta-license-codeable"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "preferred",
        "valueSet" : "http://hl7.org/fhir/ValueSet/spdx-license"
      }
    }]
  }
}

```
