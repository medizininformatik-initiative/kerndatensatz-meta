// Migration-generated CapabilityStatement proposal.
// Sources: the 170 SearchParameter resources and the SearchParameter profile
// in this module. Gate review approved generating this draft; it does not
// assert that the Simplifier source already declared server capabilities.
//
// The searchParam `documentation` lines are generated from the CI search tests
// (.github/workflows/search-param-test/test-search.sh) — do not edit them by
// hand; run `node scripts/gen-cps-search-examples.mjs` after changing a test.

Instance: mii-cps-meta-server-capabilities
InstanceOf: CapabilityStatement
Usage: #definition
Title: "MII CapabilityStatement Meta Server Capabilities"
Description: "Migration-generated proposal describing the resource types and search parameters published by the Meta module. Review before use as a normative capability statement."
* insert Version
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert CRMIShareableCapabilityStatement
* insert CRMIPublishableCapabilityStatement
* insert CRMIKnowledgeCapabilitiesCapabilityStatement
* insert CRMIVersionPolicyStrictInstance
* insert CRMIPackageSource
* insert CRMIArtifactUsageDraftMetaCapabilityStatement
* insert CRMIApprovalDateInstance(2026-09-10)
* insert CRMIResourceEffectivePeriodInstance
* insert CRMIArtifactTopicInstance(http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl, C80260)
* insert CRMIArtifactContributorsInstance
* name = "MII_CPS_Meta_Server_Capabilities"
* status = #draft
* experimental = true
* date = "2026-09-10"
* jurisdiction = urn:iso:std:iso:3166#DE "Germany"
* purpose = "Define the SearchParameter support described by the MII Meta module for implementations of the MII Core Data Set."
* kind = #requirements
* fhirVersion = #4.0.1
* format[+] = #json
* format[+] = #xml
* implementationGuide[+] = "https://www.medizininformatik-initiative.de/fhir/modul-meta/ImplementationGuide/mii-ig-meta|2027.0.0-ballot"
* rest[0].mode = #server
* rest[0].documentation = "Proposal derived from the module's published SearchParameter definitions; support expectations require module-team review."
* rest[0].resource[+].type = #AdverseEvent
* rest[0].resource[=].searchParam[+].name = "encounter"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-adverseevent-encounter"
* rest[0].resource[=].searchParam[=].type = #reference
* rest[0].resource[=].searchParam[+].name = "instance"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-adverseevent-suspectentity-instance"
* rest[0].resource[=].searchParam[=].type = #reference
* rest[0].resource[+].type = #BodyStructure
* rest[0].resource[=].searchParam[+].name = "location-qualifier"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-body-structure-location-qualifier"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[+].type = #CarePlan
* rest[0].resource[=].searchParam[+].name = "addresses"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-careplan-addresses"
* rest[0].resource[=].searchParam[=].type = #reference
* rest[0].resource[=].searchParam[+].name = "contributor"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-careplan-contributor"
* rest[0].resource[=].searchParam[=].type = #reference
* rest[0].resource[=].searchParam[+].name = "created"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-careplan-created"
* rest[0].resource[=].searchParam[=].type = #date
* rest[0].resource[=].searchParam[+].name = "description"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-description"
* rest[0].resource[=].searchParam[=].type = #string
* rest[0].resource[=].searchParam[+].name = "supporting-info"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-supporting-info"
* rest[0].resource[=].searchParam[=].type = #reference
* rest[0].resource[+].type = #Composition
* rest[0].resource[=].searchParam[+].name = "attester-mode"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-composition-attester-mode"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[+].name = "custodian"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-composition-custodian"
* rest[0].resource[=].searchParam[=].type = #reference
* rest[0].resource[=].searchParam[+].name = "relates-to-code"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-composition-relatesto-code"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[+].name = "section-author"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-composition-section-author"
* rest[0].resource[=].searchParam[=].type = #reference
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/Composition?_include=Composition:section-author`"
* rest[0].resource[=].searchParam[+].name = "section-title"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-composition-section-title"
* rest[0].resource[=].searchParam[=].type = #string
* rest[0].resource[+].type = #Condition
* rest[0].resource[=].searchParam[+].name = "asserted-date"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-condition-asserted-date"
* rest[0].resource[=].searchParam[=].type = #date
* rest[0].resource[=].searchParam[+].name = "evidence-detail"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-condition-evidence-detail"
* rest[0].resource[=].searchParam[=].type = #reference
* rest[0].resource[=].searchParam[+].name = "icd10gm-diagnosesicherheit"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-condition-icd10gm-diagnosesicherheit"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/Condition?code=http://fhir.de/CodeSystem/bfarm/icd-10-gm|B05.3&icd10gm-diagnosesicherheit=https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_ICD_DIAGNOSESICHERHEIT|G`"
* rest[0].resource[=].searchParam[+].name = "icd10gm-mehrfachcodierung"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-condition-icd10gm-mehrfachcodierung"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/Condition?code=http://fhir.de/CodeSystem/bfarm/icd-10-gm|B05.3&icd10gm-mehrfachcodierung=http://fhir.de/CodeSystem/icd-10-gm-mehrfachcodierungs-kennzeichen|†`"
* rest[0].resource[=].searchParam[+].name = "icd10gm-seitenlokalisation"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-condition-icd10gm-seitenlokalisation"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/Condition?code=http://fhir.de/CodeSystem/bfarm/icd-10-gm|B05.3&icd10gm-seitenlokalisation=https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_ICD_SEITENLOKALISATION|B`"
* rest[0].resource[=].searchParam[+].name = "verification-status"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-condition-verification-status"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/Condition?verification-status=confirmed`"
* rest[0].resource[+].type = #Consent
* rest[0].resource[=].searchParam[+].name = "mii-policy-uri"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-consent-policyuri"
* rest[0].resource[=].searchParam[=].type = #uri
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/Consent?mii-policy-uri=urn:oid:2.16.840.1.113883.3.1937.777.24.2.1791`"
* rest[0].resource[=].searchParam[+].name = "mii-provision-provision-code"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-consent-provisioncode"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/Consent?mii-provision-provision-code=urn:oid:2.16.840.1.113883.3.1937.777.24.5.3|2.16.840.1.113883.3.1937.777.24.5.3.9`"
* rest[0].resource[=].searchParam[+].name = "mii-provision-provision-code-period"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-consent-provisioncodeperiod"
* rest[0].resource[=].searchParam[=].type = #composite
* rest[0].resource[=].searchParam[+].name = "mii-provision-provision-code-type"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-consent-provisioncodetype"
* rest[0].resource[=].searchParam[=].type = #composite
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/Consent?mii-provision-provision-code-type=urn:oid:2.16.840.1.113883.3.1937.777.24.5.3|2.16.840.1.113883.3.1937.777.24.5.3.7$permit`"
* rest[0].resource[=].searchParam[+].name = "mii-provision-provision-period"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-consent-provisionperiod"
* rest[0].resource[=].searchParam[=].type = #date
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/Consent?mii-provision-provision-period=ge2024`"
* rest[0].resource[=].searchParam[+].name = "mii-provision-provision-type"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-consent-provisiontype"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/Consent?mii-provision-provision-type=permit`"
* rest[0].resource[+].type = #Device
* rest[0].resource[=].searchParam[+].name = "property-type"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-device-property-type"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/Device?property-type=urn:iso:std:iso:11073:10101|69684`"
* rest[0].resource[+].type = #DeviceMetric
* rest[0].resource[=].searchParam[+].name = "source"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-devicemetric-source"
* rest[0].resource[=].searchParam[=].type = #reference
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/DeviceMetric?_include=DeviceMetric:source`"
* rest[0].resource[+].type = #DiagnosticReport
* rest[0].resource[=].searchParam[+].name = "conclusion-text"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-diagnostic-report-conclusion"
* rest[0].resource[=].searchParam[=].type = #string
* rest[0].resource[=].searchParam[+].name = "imaging-study"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-diagnosticreport-imagingstudy"
* rest[0].resource[=].searchParam[=].type = #reference
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/DiagnosticReport?_include=DiagnosticReport:imaging-study`"
* rest[0].resource[=].searchParam[+].name = "supporting-info"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-supporting-info"
* rest[0].resource[=].searchParam[=].type = #reference
* rest[0].resource[+].type = #DocumentReference
* rest[0].resource[=].searchParam[+].name = "creation"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-dokument-documentreference-attachment-creation"
* rest[0].resource[=].searchParam[=].type = #date
* rest[0].resource[=].searchParam[+].name = "doc-status"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-dokument-documentreference-doc-status"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[+].name = "nlp-processing-status"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-dokument-documentreference-nlp-processing-status"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[+].name = "size"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-documentreference-attachment-size"
* rest[0].resource[=].searchParam[=].type = #number
* rest[0].resource[=].searchParam[+].name = "title"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-documentreference-attachment-title"
* rest[0].resource[=].searchParam[=].type = #string
* rest[0].resource[+].type = #Encounter
* rest[0].resource[=].searchParam[+].name = "aufnahmegrund-drittestelle"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-encounter-aufnahmegrund-drittestelle"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/Encounter?aufnahmegrund-ersteundzweitestelle=http://fhir.de/CodeSystem/dkgev/AufnahmegrundErsteUndZweiteStelle|01&aufnahmegrund-drittestelle=http://fhir.de/CodeSystem/dkgev/AufnahmegrundDritteStelle|0&aufnahmegrund-viertestelle=http://fhir.de/CodeSystem/dkgev/AufnahmegrundVierteStelle|1`"
* rest[0].resource[=].searchParam[+].name = "aufnahmegrund-ersteundzweitestelle"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-encounter-aufnahmegrund-ersteundzweitestelle"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/Encounter?aufnahmegrund-ersteundzweitestelle=http://fhir.de/CodeSystem/dkgev/AufnahmegrundErsteUndZweiteStelle|01&aufnahmegrund-drittestelle=http://fhir.de/CodeSystem/dkgev/AufnahmegrundDritteStelle|0&aufnahmegrund-viertestelle=http://fhir.de/CodeSystem/dkgev/AufnahmegrundVierteStelle|1`"
* rest[0].resource[=].searchParam[+].name = "aufnahmegrund-viertestelle"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-encounter-aufnahmegrund-viertestelle"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/Encounter?aufnahmegrund-ersteundzweitestelle=http://fhir.de/CodeSystem/dkgev/AufnahmegrundErsteUndZweiteStelle|01&aufnahmegrund-drittestelle=http://fhir.de/CodeSystem/dkgev/AufnahmegrundDritteStelle|0&aufnahmegrund-viertestelle=http://fhir.de/CodeSystem/dkgev/AufnahmegrundVierteStelle|1`"
* rest[0].resource[=].searchParam[+].name = "diagnosis-use"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-encounter-diagnosis-use"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/Encounter?diagnosis-use=http://terminology.hl7.org/CodeSystem/diagnosis-role|AD`"
* rest[0].resource[=].searchParam[+].name = "entlassungsgrund-drittestelle"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-encounter-entlassungsgrund-drittestelle"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/Encounter?entlassungsgrund-ersteundzweitestelle=http://fhir.de/CodeSystem/dkgev/EntlassungsgrundErsteUndZweiteStelle|07&entlassungsgrund-drittestelle=http://fhir.de/CodeSystem/dkgev/EntlassungsgrundDritteStelle|9`"
* rest[0].resource[=].searchParam[+].name = "entlassungsgrund-ersteundzweitestelle"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-encounter-entlassungsgrund-ersteundzweitestelle"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/Encounter?entlassungsgrund-ersteundzweitestelle=http://fhir.de/CodeSystem/dkgev/EntlassungsgrundErsteUndZweiteStelle|07&entlassungsgrund-drittestelle=http://fhir.de/CodeSystem/dkgev/EntlassungsgrundDritteStelle|9`"
* rest[0].resource[=].searchParam[+].name = "hospitalization-admitsource"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-encounter-hospitalization-admitsource"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/Encounter?hospitalization-admitsource=http://fhir.de/CodeSystem/dgkev/Aufnahmeanlass|E`"
* rest[0].resource[=].searchParam[+].name = "location-physical-type"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-encounter-location-physical-type"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/Encounter?location-physical-type=http://terminology.hl7.org/CodeSystem/location-physical-type|ro`"
* rest[0].resource[=].searchParam[+].name = "service-type"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-encounter-servicetype"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/Encounter?service-type=http://fhir.de/CodeSystem/dkgev/Fachabteilungsschluessel|0100`"
* rest[0].resource[+].type = #EvidenceVariable
* rest[0].resource[=].searchParam[+].name = "characteristicDescription"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-evidencevariable-characteristic-description"
* rest[0].resource[=].searchParam[=].type = #string
* rest[0].resource[+].type = #FamilyMemberHistory
* rest[0].resource[=].searchParam[+].name = "reason-code"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-familymemberhistory-reasoncode"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/FamilyMemberHistory?reason-code=http://snomed.info/sct|447886005`"
* rest[0].resource[=].searchParam[+].name = "reason-reference"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-familymemberhistory-reasonreference"
* rest[0].resource[=].searchParam[=].type = #reference
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/FamilyMemberHistory?_include=FamilyMemberHistory:reason-reference`"
* rest[0].resource[+].type = #ImagingStudy
* rest[0].resource[=].searchParam[+].name = "bildgebungsgrund"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-bildgebungsgrund"
* rest[0].resource[=].searchParam[=].type = #string
* rest[0].resource[=].searchParam[+].name = "contrast-bolus"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-contrast-bolus"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[+].name = "contrast-bolus-details"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-contrast-bolus-details"
* rest[0].resource[=].searchParam[=].type = #reference
* rest[0].resource[=].searchParam[+].name = "convolutional-kernel"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-convolutional-kernel"
* rest[0].resource[=].searchParam[=].type = #string
* rest[0].resource[=].searchParam[+].name = "ctdi-volume"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-ctdi-volume"
* rest[0].resource[=].searchParam[=].type = #quantity
* rest[0].resource[=].searchParam[+].name = "description"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-description"
* rest[0].resource[=].searchParam[=].type = #string
* rest[0].resource[=].searchParam[+].name = "echo-time"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-echo-time"
* rest[0].resource[=].searchParam[=].type = #quantity
* rest[0].resource[=].searchParam[+].name = "exposure"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-exposure"
* rest[0].resource[=].searchParam[=].type = #quantity
* rest[0].resource[=].searchParam[+].name = "exposure-time"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-exposure-time"
* rest[0].resource[=].searchParam[=].type = #quantity
* rest[0].resource[=].searchParam[+].name = "flip-angle"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-flip-angle"
* rest[0].resource[=].searchParam[=].type = #quantity
* rest[0].resource[=].searchParam[+].name = "instance-burned-in-annotation"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-instance-burned-in-annotation"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[+].name = "instance-image-type"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-instance-image-type"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[+].name = "instance-number"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-instance-number"
* rest[0].resource[=].searchParam[=].type = #number
* rest[0].resource[=].searchParam[+].name = "instance-pixel-spacing-x"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-instance-pixel-x"
* rest[0].resource[=].searchParam[=].type = #quantity
* rest[0].resource[=].searchParam[+].name = "instance-pixel-spacing-y"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-instance-pixel-y"
* rest[0].resource[=].searchParam[=].type = #quantity
* rest[0].resource[=].searchParam[+].name = "instance-slice-thickness"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-instance-slice-thickness"
* rest[0].resource[=].searchParam[=].type = #quantity
* rest[0].resource[=].searchParam[+].name = "inversion-time"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-inversion-time"
* rest[0].resource[=].searchParam[=].type = #quantity
* rest[0].resource[=].searchParam[+].name = "kvp"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-kvp"
* rest[0].resource[=].searchParam[=].type = #quantity
* rest[0].resource[=].searchParam[+].name = "magnetic-field-strength"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-magnetic-field-strength"
* rest[0].resource[=].searchParam[=].type = #quantity
* rest[0].resource[=].searchParam[+].name = "modality-body-site"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-modality-body-site"
* rest[0].resource[=].searchParam[=].type = #composite
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/ImagingStudy?modality-body-site=http://dicom.nema.org/resources/ontology/DCM|MR$http://snomed.info/sct|76752008`"
* rest[0].resource[=].searchParam[+].name = "number-instances"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-number-instances"
* rest[0].resource[=].searchParam[=].type = #number
* rest[0].resource[=].searchParam[+].name = "number-series"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-number-series"
* rest[0].resource[=].searchParam[=].type = #number
* rest[0].resource[=].searchParam[+].name = "procedure-reference"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-procedure-reference"
* rest[0].resource[=].searchParam[=].type = #reference
* rest[0].resource[=].searchParam[+].name = "pulse-frequency"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-pulse-frequency"
* rest[0].resource[=].searchParam[=].type = #quantity
* rest[0].resource[=].searchParam[+].name = "radionuclide"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-radionuclide"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[+].name = "radionuclide-half-life"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-radionuclide-half-life"
* rest[0].resource[=].searchParam[=].type = #quantity
* rest[0].resource[=].searchParam[+].name = "radionuclide-total-dose"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-radionuclide-total-dose"
* rest[0].resource[=].searchParam[=].type = #quantity
* rest[0].resource[=].searchParam[+].name = "radiopharmaceutical"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-radiopharmaceutical"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[+].name = "reason-reference"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-reason-reference"
* rest[0].resource[=].searchParam[=].type = #reference
* rest[0].resource[=].searchParam[+].name = "repetition-time"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-repetition-time"
* rest[0].resource[=].searchParam[=].type = #quantity
* rest[0].resource[=].searchParam[+].name = "scanning-sequence"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-scanning-sequence"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[+].name = "scanning-sequence-variant"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-scanning-sequence-variant"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[+].name = "series-laterality"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-laterality"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[+].name = "series-number"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-number"
* rest[0].resource[=].searchParam[=].type = #number
* rest[0].resource[=].searchParam[+].name = "series-started"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-started"
* rest[0].resource[=].searchParam[=].type = #date
* rest[0].resource[=].searchParam[+].name = "series-type"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-series-type"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[+].name = "slice-thickness"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-slice-thickness"
* rest[0].resource[=].searchParam[=].type = #quantity
* rest[0].resource[=].searchParam[+].name = "study-modality"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-modality"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[+].name = "tracer-exposure-time"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-tracer-exposure-time"
* rest[0].resource[=].searchParam[=].type = #quantity
* rest[0].resource[=].searchParam[+].name = "transducer-frequency"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-transducer-frequency"
* rest[0].resource[=].searchParam[=].type = #quantity
* rest[0].resource[=].searchParam[+].name = "transducer-type"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-transducer-type"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[+].name = "ultrasound-color"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-ultrasound-color"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[+].name = "units"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-units"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[+].name = "view-position"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-view-position"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[+].name = "xray-tube-current"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-imaging-study-series-xray-tube-current"
* rest[0].resource[=].searchParam[=].type = #quantity
* rest[0].resource[+].type = #Library
* rest[0].resource[=].searchParam[+].name = "quellregister"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-library-quellregister"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[+].name = "relatedArtifactUrl"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-library-relatedartifact-url"
* rest[0].resource[=].searchParam[=].type = #uri
* rest[0].resource[+].type = #List
* rest[0].resource[=].searchParam[+].name = "mode"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-list-mode"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/List?mode=snapshot`"
* rest[0].resource[+].type = #Media
* rest[0].resource[=].searchParam[+].name = "part-of"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-media-partof"
* rest[0].resource[=].searchParam[=].type = #reference
* rest[0].resource[+].type = #Medication
* rest[0].resource[=].searchParam[+].name = "ingredient-strength"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-ingredient-strength"
* rest[0].resource[=].searchParam[=].type = #composite
* rest[0].resource[=].searchParam[+].name = "ingredient-strength-denominator"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-ingredient-strength-denominator"
* rest[0].resource[=].searchParam[=].type = #quantity
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/Medication?ingredient-strength-denominator=1|http://standardterms.edqm.eu|10219000`"
* rest[0].resource[=].searchParam[+].name = "ingredient-strength-numerator"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-ingredient-strength-numerator"
* rest[0].resource[=].searchParam[=].type = #quantity
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/Medication?ingredient-strength-numerator=100|http://unitsofmeasure.org|mg`"
* rest[0].resource[+].type = #MedicationAdministration
* rest[0].resource[=].searchParam[+].name = "dosage-route"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-route"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/MedicationAdministration?dosage-route=http://standardterms.edqm.eu|20045000`"
* rest[0].resource[=].searchParam[+].name = "dosage-site"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-site"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[+].name = "dose-quantity"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-dosequantity"
* rest[0].resource[=].searchParam[=].type = #quantity
* rest[0].resource[=].searchParam[+].name = "part-of"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-partof"
* rest[0].resource[=].searchParam[=].type = #reference
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/MedicationAdministration?_include=MedicationAdministration:part-of`"
* rest[0].resource[=].searchParam[+].name = "ratequantity"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-ratequantity"
* rest[0].resource[=].searchParam[=].type = #quantity
* rest[0].resource[=].searchParam[+].name = "rateratio"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-rateratio"
* rest[0].resource[=].searchParam[=].type = #composite
* rest[0].resource[=].searchParam[+].name = "rateratio-denominator"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-rateratio-denominator"
* rest[0].resource[=].searchParam[=].type = #quantity
* rest[0].resource[=].searchParam[+].name = "rateratio-numerator"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-rateratio-numerator"
* rest[0].resource[=].searchParam[=].type = #quantity
* rest[0].resource[=].searchParam[+].name = "reason-reference"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-reasonreference"
* rest[0].resource[=].searchParam[=].type = #reference
* rest[0].resource[+].type = #MedicationRequest
* rest[0].resource[=].searchParam[+].name = "dosage-route"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-route"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[+].name = "dosage-site"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-site"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[+].name = "dose-quantity"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-dosequantity"
* rest[0].resource[=].searchParam[=].type = #quantity
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/MedicationRequest?dose-quantity=1500|http://unitsofmeasure.org|mg`"
* rest[0].resource[=].searchParam[+].name = "doserange"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-doserange"
* rest[0].resource[=].searchParam[=].type = #composite
* rest[0].resource[=].searchParam[+].name = "doserange-high"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-doserange-high"
* rest[0].resource[=].searchParam[=].type = #quantity
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/MedicationRequest?doserange-high=1000|http://unitsofmeasure.org|mg`"
* rest[0].resource[=].searchParam[+].name = "doserange-low"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-doserange-low"
* rest[0].resource[=].searchParam[=].type = #quantity
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/MedicationRequest?doserange-low=500|http://unitsofmeasure.org|mg`"
* rest[0].resource[=].searchParam[+].name = "ratequantity"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-ratequantity"
* rest[0].resource[=].searchParam[=].type = #quantity
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/MedicationRequest?ratequantity=5|http://unitsofmeasure.org|mg/min`"
* rest[0].resource[=].searchParam[+].name = "raterange"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-raterange"
* rest[0].resource[=].searchParam[=].type = #composite
* rest[0].resource[=].searchParam[+].name = "raterange-high"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-raterange-high"
* rest[0].resource[=].searchParam[=].type = #quantity
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/MedicationRequest?raterange-high=120|http://unitsofmeasure.org|mL/h`"
* rest[0].resource[=].searchParam[+].name = "raterange-low"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-raterange-low"
* rest[0].resource[=].searchParam[=].type = #quantity
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/MedicationRequest?raterange-low=60|http://unitsofmeasure.org|mL/h`"
* rest[0].resource[=].searchParam[+].name = "rateratio"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-rateratio"
* rest[0].resource[=].searchParam[=].type = #composite
* rest[0].resource[=].searchParam[+].name = "rateratio-denominator"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-rateratio-denominator"
* rest[0].resource[=].searchParam[=].type = #quantity
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/MedicationRequest?rateratio-denominator=1|http://unitsofmeasure.org|min`"
* rest[0].resource[=].searchParam[+].name = "rateratio-numerator"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-rateratio-numerator"
* rest[0].resource[=].searchParam[=].type = #quantity
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/MedicationRequest?rateratio-numerator=6.5|http://unitsofmeasure.org|mg`"
* rest[0].resource[+].type = #MedicationStatement
* rest[0].resource[=].searchParam[+].name = "dosage-route"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-route"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[+].name = "dosage-site"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-site"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/MedicationStatement?dosage-site=http://snomed.info/sct|789218009`"
* rest[0].resource[=].searchParam[+].name = "dose-quantity"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-dosequantity"
* rest[0].resource[=].searchParam[=].type = #quantity
* rest[0].resource[=].searchParam[+].name = "doserange"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-doserange"
* rest[0].resource[=].searchParam[=].type = #composite
* rest[0].resource[=].searchParam[+].name = "doserange-high"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-doserange-high"
* rest[0].resource[=].searchParam[=].type = #quantity
* rest[0].resource[=].searchParam[+].name = "doserange-low"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-doserange-low"
* rest[0].resource[=].searchParam[=].type = #quantity
* rest[0].resource[=].searchParam[+].name = "part-of"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-partof"
* rest[0].resource[=].searchParam[=].type = #reference
* rest[0].resource[=].searchParam[+].name = "ratequantity"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-ratequantity"
* rest[0].resource[=].searchParam[=].type = #quantity
* rest[0].resource[=].searchParam[+].name = "raterange"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-raterange"
* rest[0].resource[=].searchParam[=].type = #composite
* rest[0].resource[=].searchParam[+].name = "raterange-high"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-raterange-high"
* rest[0].resource[=].searchParam[=].type = #quantity
* rest[0].resource[=].searchParam[+].name = "raterange-low"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-raterange-low"
* rest[0].resource[=].searchParam[=].type = #quantity
* rest[0].resource[=].searchParam[+].name = "rateratio"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-rateratio"
* rest[0].resource[=].searchParam[=].type = #composite
* rest[0].resource[=].searchParam[+].name = "rateratio-denominator"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-rateratio-denominator"
* rest[0].resource[=].searchParam[=].type = #quantity
* rest[0].resource[=].searchParam[+].name = "rateratio-numerator"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-dosage-rateratio-numerator"
* rest[0].resource[=].searchParam[=].type = #quantity
* rest[0].resource[=].searchParam[+].name = "reason-reference"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-medication-reasonreference"
* rest[0].resource[=].searchParam[=].type = #reference
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/MedicationStatement?_include=MedicationStatement:reason-reference`"
* rest[0].resource[+].type = #Observation
* rest[0].resource[=].searchParam[+].name = "body-site"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-observation-bodysite"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[+].name = "body-structure"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-observation-body-structure"
* rest[0].resource[=].searchParam[=].type = #reference
* rest[0].resource[=].searchParam[+].name = "component-interpretation"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-observation-component-interpretation"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[+].name = "encounter"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-observation-encounter"
* rest[0].resource[=].searchParam[=].type = #reference
* rest[0].resource[=].searchParam[+].name = "focus"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-observation-focus"
* rest[0].resource[=].searchParam[=].type = #reference
* rest[0].resource[=].searchParam[+].name = "has-member"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-observation-hasmember"
* rest[0].resource[=].searchParam[=].type = #reference
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/Observation?_include=Observation:has-member`"
* rest[0].resource[=].searchParam[+].name = "interpretation"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-observation-interpretation"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/Observation?interpretation=http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation|H`"
* rest[0].resource[=].searchParam[+].name = "issued"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-observation-issued"
* rest[0].resource[=].searchParam[=].type = #date
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/Observation?issued=2024-02-15`"
* rest[0].resource[=].searchParam[+].name = "reference-range"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-observation-referencerange"
* rest[0].resource[=].searchParam[=].type = #composite
* rest[0].resource[=].searchParam[+].name = "reference-range-high"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-observation-referencerange-high"
* rest[0].resource[=].searchParam[=].type = #quantity
* rest[0].resource[=].searchParam[+].name = "reference-range-low"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-observation-referencerange-low"
* rest[0].resource[=].searchParam[=].type = #quantity
* rest[0].resource[=].searchParam[+].name = "series-uid"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-observation-series-uid"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[+].name = "sop-instance-uid"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-observation-sop-instance-uid"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[+].name = "value-ratio"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-observation-value-ratio"
* rest[0].resource[=].searchParam[=].type = #composite
* rest[0].resource[=].searchParam[+].name = "value-ratio-denominator"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-observation-value-ratio-denominator"
* rest[0].resource[=].searchParam[=].type = #quantity
* rest[0].resource[=].searchParam[+].name = "value-ratio-numerator"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-observation-value-ratio-numerator"
* rest[0].resource[=].searchParam[=].type = #quantity
* rest[0].resource[+].type = #Patient
* rest[0].resource[=].searchParam[+].name = "adresszusatz"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-adresszusatz"
* rest[0].resource[=].searchParam[=].type = #string
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/Patient?adresszusatz=Schloss`"
* rest[0].resource[=].searchParam[+].name = "assigner-pid"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-assignerpid"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/Patient?assigner-pid=http://fhir.de/sid/arge-ik/iknr|123456789`"
* rest[0].resource[=].searchParam[+].name = "gemeindeschluessel"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-gemeindeschluessel"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/Patient?gemeindeschluessel=http://fhir.de/sid/destatis/ags|11000000`"
* rest[0].resource[=].searchParam[+].name = "hausnummer"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-hausnummer"
* rest[0].resource[=].searchParam[=].type = #string
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/Patient?strasse=Dorfstraße&hausnummer=9&stadtteil=Malchow`"
* rest[0].resource[=].searchParam[+].name = "other-amtlich"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-otheramtlich"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/Patient?other-amtlich=http://fhir.de/CodeSystem/gender-amtlich-de|D`"
* rest[0].resource[=].searchParam[+].name = "postfach"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-postfach"
* rest[0].resource[=].searchParam[=].type = #string
* rest[0].resource[=].searchParam[+].name = "prefix"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-prefix"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/Patient?prefix=Prinz von Preußen`"
* rest[0].resource[=].searchParam[+].name = "prefix-qualifier"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-prefixqualifier"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/Patient?prefix-qualifier=NB`"
* rest[0].resource[=].searchParam[+].name = "stadtteil"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-stadtteil"
* rest[0].resource[=].searchParam[=].type = #string
* rest[0].resource[=].searchParam[=].documentation = "**Examples** (tested in CI):\n\n- `GET [base]/Patient?strasse=Dorfstraße&hausnummer=9&stadtteil=Malchow`\n- `GET [base]/Patient?stadtteil=Malchow`"
* rest[0].resource[=].searchParam[+].name = "strasse"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-patient-strasse"
* rest[0].resource[=].searchParam[=].type = #string
* rest[0].resource[=].searchParam[=].documentation = "**Examples** (tested in CI):\n\n- `GET [base]/Patient?strasse=Dorfstraße&hausnummer=9&stadtteil=Malchow`\n- `GET [base]/Patient?strasse=Dorfstraße`"
* rest[0].resource[+].type = #Procedure
* rest[0].resource[=].searchParam[+].name = "bodySite"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-procedure-bodysite"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/Procedure?bodySite=http://snomed.info/sct|44714003`"
* rest[0].resource[=].searchParam[+].name = "complication"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-procedure-complication"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[+].name = "dokumentationsdatum"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-procedure-dokumentationsdatum"
* rest[0].resource[=].searchParam[=].type = #date
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/Procedure?dokumentationsdatum=2024-02-20`"
* rest[0].resource[=].searchParam[+].name = "durchfuehrungsabsicht"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-procedure-durchfuehrungsabsicht"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/Procedure?durchfuehrungsabsicht=http://snomed.info/sct|262202000`"
* rest[0].resource[=].searchParam[+].name = "ops-seitenlokalisation"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-procedure-ops-seitenlokalisation"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/Procedure?code=http://fhir.de/CodeSystem/bfarm/ops|5-322.d1&ops-seitenlokalisation=https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_ICD_SEITENLOKALISATION|R`"
* rest[0].resource[=].searchParam[+].name = "outcome"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-procedure-outcome"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[+].name = "recorder"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-procedure-recorder"
* rest[0].resource[=].searchParam[=].type = #reference
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/Procedure?_include=Procedure:recorder`"
* rest[0].resource[=].searchParam[+].name = "report"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-read-proc-report"
* rest[0].resource[=].searchParam[=].type = #reference
* rest[0].resource[+].type = #ResearchStudy
* rest[0].resource[=].searchParam[+].name = "akronym"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-researchstudy-akronym"
* rest[0].resource[=].searchParam[=].type = #string
* rest[0].resource[=].searchParam[+].name = "armName"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-researchstudy-arm-name"
* rest[0].resource[=].searchParam[=].type = #string
* rest[0].resource[=].searchParam[+].name = "finanzierung"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-researchstudy-finanzierung"
* rest[0].resource[=].searchParam[=].type = #string
* rest[0].resource[=].searchParam[+].name = "label"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-researchstudy-label"
* rest[0].resource[=].searchParam[=].type = #string
* rest[0].resource[=].searchParam[+].name = "rekrutierungsstand"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-researchstudy-rekrutierungsstand"
* rest[0].resource[=].searchParam[=].type = #number
* rest[0].resource[=].searchParam[+].name = "rekrutierungsstand-datum"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-researchstudy-rekrutierungsstand-datum"
* rest[0].resource[=].searchParam[=].type = #date
* rest[0].resource[=].searchParam[+].name = "rekrutierungsstand-genauigkeit"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-researchstudy-rekrutierungsstand-genauigkeit"
* rest[0].resource[=].searchParam[=].type = #string
* rest[0].resource[=].searchParam[+].name = "rekrutierungsstart"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-researchstudy-rekrutierungsstart"
* rest[0].resource[=].searchParam[=].type = #date
* rest[0].resource[=].searchParam[+].name = "rekrutierungsziel"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-researchstudy-rekrutierungsziel"
* rest[0].resource[=].searchParam[=].type = #number
* rest[0].resource[=].searchParam[+].name = "studienregister"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-researchstudy-studienregister"
* rest[0].resource[=].searchParam[=].type = #reference
* rest[0].resource[+].type = #ResearchSubject
* rest[0].resource[=].searchParam[+].name = "consent"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-researchsubject-consent"
* rest[0].resource[=].searchParam[=].type = #reference
* rest[0].resource[+].type = #SearchParameter
* rest[0].resource[=].supportedProfile[+] = "https://www.medizininformatik-initiative.de/fhir/modul-meta/StructureDefinition/mii-pr-meta-searchparameter|2027.0.0-ballot"
* rest[0].resource[+].type = #ServiceRequest
* rest[0].resource[=].searchParam[+].name = "reason-code"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-servicerequest-reasoncode"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/ServiceRequest?reason-code=http://snomed.info/sct|447886005`"
* rest[0].resource[=].searchParam[+].name = "reason-reference"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-servicerequest-reasonreference"
* rest[0].resource[=].searchParam[=].type = #reference
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/ServiceRequest?_include=ServiceRequest:reason-reference`"
* rest[0].resource[=].searchParam[+].name = "supporting-info"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-servicerequest-supportinginfo"
* rest[0].resource[=].searchParam[=].type = #reference
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/ServiceRequest?_include=ServiceRequest:supporting-info`"
* rest[0].resource[+].type = #Specimen
* rest[0].resource[=].searchParam[+].name = "collection-body-site"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-specimen-collection-body-site"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[+].name = "collection-method"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-specimen-collection-method"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/Specimen?collection-method=http://snomed.info/sct|129300006`"
* rest[0].resource[=].searchParam[+].name = "container-additive"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-specimen-container-additive"
* rest[0].resource[=].searchParam[=].type = #reference
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/Specimen?_include=Specimen:container-additive`"
* rest[0].resource[=].searchParam[+].name = "diagnose"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-specimen-diagnose"
* rest[0].resource[=].searchParam[=].type = #reference
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/Specimen?_include=Specimen:diagnose`"
* rest[0].resource[=].searchParam[+].name = "processing-additive"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-specimen-processing-additive"
* rest[0].resource[=].searchParam[=].type = #reference
* rest[0].resource[=].searchParam[+].name = "processing-date"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-specimen-processing-date"
* rest[0].resource[=].searchParam[=].type = #date
* rest[0].resource[=].searchParam[+].name = "processing-procedure"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-specimen-processing-procedure"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[+].name = "request"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-specimen-request"
* rest[0].resource[=].searchParam[=].type = #reference
* rest[0].resource[+].type = #Task
* rest[0].resource[=].searchParam[+].name = "for"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-task-for"
* rest[0].resource[=].searchParam[=].type = #reference
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/Task?_include=Task:for`"
* rest[0].resource[=].searchParam[+].name = "reason-code"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-task-reasoncode"
* rest[0].resource[=].searchParam[=].type = #token
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/Task?reason-code=http://snomed.info/sct|447886005`"
* rest[0].resource[=].searchParam[+].name = "reason-reference"
* rest[0].resource[=].searchParam[=].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-task-reasonreference"
* rest[0].resource[=].searchParam[=].type = #reference
* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/Task?_include=Task:reason-reference`"
