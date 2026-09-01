// ─────────────────────────────────────────────────────────────────────────────
// Ported from kerndatensatz-basis (main): input/fsh/rulesets/crmi.fsh
//
// CRMI (Canonical Resource Management Infrastructure) metadata rulesets. The IG
// itself claims the CRMI shareable/publishable/computable ImplementationGuide
// profiles in sushi-config.yaml (`meta.profile`); these rulesets make the
// individual artifacts claim the matching CRMI profiles and carry the same
// metadata. The hl7.fhir.uv.crmi dependency in sushi-config.yaml is what makes
// them resolvable.
//
// Use CARET paths (`^…`) for resources declared with a FSH keyword — Profile,
// Extension, Logical, ValueSet, CodeSystem. Use INSTANCE paths for `InstanceOf:`
// resources such as CapabilityStatement or Parameters; those RuleSets carry the
// `…Instance` suffix.
//
// basis literals replaced by this repository's placeholders:
//   "2019+ Medical Informatics Initiative (MII)" → "2019+ …"
//   the basis artifact-author contact email      → julian.sass@charite.de
// The approval date and the artifact topic stay RuleSet PARAMETERS (as in
// basis); pass 2026-08-31 / C80260 at the call site.
// ─────────────────────────────────────────────────────────────────────────────

// ── Resource-independent version policy ──────────────────────────────────────

RuleSet: CRMIVersionPolicyStrict
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/artifact-versionPolicy"
* ^extension[=].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/artifact-version-policy-codes|3.0.0#package "Package"

RuleSet: CRMIVersionPolicyStrictInstance
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/artifact-versionPolicy"
* extension[=].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/artifact-version-policy-codes|3.0.0#package "Package"

// ── Copyright label ──────────────────────────────────────────────────────────
// basis notes that there is currently no resource type in the module where
// artifact-copyrightLabel is useful (and that the R5 cross-version extension is
// preferable where applicable) — the RuleSets are kept so a module that needs
// them does not re-invent the wording.

RuleSet: CRMICopyrightLabel
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/artifact-copyrightLabel"
* ^extension[=].valueString = "2019+ Medical Informatics Initiative (MII)"

RuleSet: CRMICopyrightLabelInstance
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/artifact-copyrightLabel"
* extension[=].valueString = "2019+ Medical Informatics Initiative (MII)"

// ── Approval date (StructureDefinition, CapabilityStatement, IG) ─────────────
// Call with the module's approval date, e.g. `insert CRMIApprovalDate(2026-08-31)`.

RuleSet: CRMIApprovalDate(approvalDate)
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/resource-approvalDate"
* ^extension[=].valueDate = "{approvalDate}"

RuleSet: CRMIApprovalDateInstance(approvalDate)
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/resource-approvalDate"
* extension[=].valueDate = "{approvalDate}"

// ── Artifact topic (StructureDefinition, CapabilityStatement, IG, CS, VS) ────
// MII codes module topics with the NCI Thesaurus. Call with the system and the
// module's topic code, e.g.
//   insert CRMIArtifactTopic(http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl, C80260)
// Repeat the insert for each topic of the module.

RuleSet: CRMIArtifactTopic(system, code)
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/artifact-topic"
* ^extension[=].valueCodeableConcept.coding[+] = {system}#{code}

RuleSet: CRMIArtifactTopicInstance(system, code)
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/artifact-topic"
* extension[=].valueCodeableConcept.coding[+] = {system}#{code}

// ── Artifact contributors ────────────────────────────────────────────────────
// Author = the module author (julian.sass@charite.de). Editor / reviewer /
// endorser are the MII-wide governance bodies and apply to every KDS module —
// the same values sushi-config.yaml sets on the IG resource. Adjust only if your
// module's governance differs.

RuleSet: CRMIArtifactContributors
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/artifact-author"
* ^extension[=].valueContactDetail.telecom[+].system = #email
* ^extension[=].valueContactDetail.telecom[=].value = "julian.sass@charite.de"
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/artifact-editor"
* ^extension[=].valueContactDetail.name = "Taskforce Core Data Set"
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/artifact-reviewer"
* ^extension[=].valueContactDetail.name = "Interoperability Working Group"
* ^extension[=].valueContactDetail.telecom[+].system = #url
* ^extension[=].valueContactDetail.telecom[=].value = "https://www.medizininformatik-initiative.de/en/collaboration/interoperability-working-group"
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/artifact-reviewer"
* ^extension[=].valueContactDetail.name = "National Steering Committee"
* ^extension[=].valueContactDetail.telecom[+].system = #url
* ^extension[=].valueContactDetail.telecom[=].value = "https://www.medizininformatik-initiative.de/en/collaboration/national-steering-committee"
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/artifact-endorser"
* ^extension[=].valueContactDetail.name = "Interoperability Working Group"
* ^extension[=].valueContactDetail.telecom[+].system = #url
* ^extension[=].valueContactDetail.telecom[=].value = "https://www.medizininformatik-initiative.de/en/collaboration/interoperability-working-group"
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/artifact-endorser"
* ^extension[=].valueContactDetail.name = "National Steering Committee"
* ^extension[=].valueContactDetail.telecom[+].system = #url
* ^extension[=].valueContactDetail.telecom[=].value = "https://www.medizininformatik-initiative.de/en/collaboration/national-steering-committee"

RuleSet: CRMIArtifactContributorsInstance
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/artifact-author"
* extension[=].valueContactDetail.telecom[+].system = #email
* extension[=].valueContactDetail.telecom[=].value = "julian.sass@charite.de"
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/artifact-editor"
* extension[=].valueContactDetail.name = "Taskforce Core Data Set"
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/artifact-reviewer"
* extension[=].valueContactDetail.name = "Interoperability Working Group"
* extension[=].valueContactDetail.telecom[+].system = #url
* extension[=].valueContactDetail.telecom[=].value = "https://www.medizininformatik-initiative.de/en/collaboration/interoperability-working-group"
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/artifact-reviewer"
* extension[=].valueContactDetail.name = "National Steering Committee"
* extension[=].valueContactDetail.telecom[+].system = #url
* extension[=].valueContactDetail.telecom[=].value = "https://www.medizininformatik-initiative.de/en/collaboration/national-steering-committee"
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/artifact-endorser"
* extension[=].valueContactDetail.name = "Interoperability Working Group"
* extension[=].valueContactDetail.telecom[+].system = #url
* extension[=].valueContactDetail.telecom[=].value = "https://www.medizininformatik-initiative.de/en/collaboration/interoperability-working-group"
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/artifact-endorser"
* extension[=].valueContactDetail.name = "National Steering Committee"
* extension[=].valueContactDetail.telecom[+].system = #url
* extension[=].valueContactDetail.telecom[=].value = "https://www.medizininformatik-initiative.de/en/collaboration/national-steering-committee"

// ── StructureDefinition ──────────────────────────────────────────────────────

RuleSet: CRMIShareableStructureDefinition
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition"

RuleSet: CRMIPublishableStructureDefinition
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition"

RuleSet: CRMIKnowledgeCapabilitiesStructureDefinition
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/cqf-knowledgeCapability"
* ^extension[=].valueCode = #shareable
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/cqf-knowledgeCapability"
* ^extension[=].valueCode = #publishable

RuleSet: CRMIArtifactUsageLogicalModel
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/artifact-usage"
* ^extension[=].valueMarkdown = "Use this logical model as the module-specific information model for the Medical Informatics Initiative core dataset. The model describes clinically or administratively relevant information in a domain-oriented form and provides a bridge between the conceptual content specification and the corresponding technical FHIR profiles. It is a pattern for describing the intended content model and is not intended to be exchanged as a concrete FHIR resource instance. Implementers should use it to understand the scope, semantics, and structure of the module before applying the related FHIR profiles and mappings."

RuleSet: CRMIArtifactUsageProfile
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/artifact-usage"
* ^extension[=].valueMarkdown = "Use this profile as the technical FHIR representation of the corresponding Medical Informatics Initiative logical model. The profile constrains a base FHIR resource for the MII module context by specifying how elements are used, which elements are required or not used, which extensions and terminology bindings apply, and how the resource maps to the module-specific content model. Implementers should produce and consume resource instances that conform to this profile when exchanging data for the corresponding MII module."

RuleSet: CRMIArtifactUsageExtension
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/artifact-usage"
* ^extension[=].valueMarkdown = "Use this extension to exchange data for content of the corresponding Medical Informatics Initiative logical model that is not represented in the FHIR core resource structure."

RuleSet: CRMIArtifactUsageSearchParameterProfile
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/artifact-usage"
* ^extension[=].valueMarkdown = "Use this profile as the baseline for SearchParameter resources published as part of the Medical Informatics Initiative Core Data Set. It defines the minimum metadata and identifier requirements that those SearchParameter resources must meet."

RuleSet: CRMIArtifactUsageDeprecatedLicenseExtension
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/artifact-usage"
* ^extension[=].valueMarkdown = "Do not use this deprecated extension for new artifacts. Use the CRMI License extension (http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-license) instead."

// ── CapabilityStatement ──────────────────────────────────────────────────────

RuleSet: CRMIShareableCapabilityStatement
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablecapabilitystatement"

RuleSet: CRMIPublishableCapabilityStatement
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablecapabilitystatement"

RuleSet: CRMIKnowledgeCapabilitiesCapabilityStatement
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/cqf-knowledgeCapability"
* extension[=].valueCode = #shareable
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/cqf-knowledgeCapability"
* extension[=].valueCode = #publishable

RuleSet: CRMIArtifactUsageCapabilityStatement
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/artifact-usage"
* extension[=].valueMarkdown = "Use this CapabilityStatement to determine the minimum RESTful server capabilities required for a system that implements the corresponding module of the Medical Informatics Initiative core dataset. It lists the FHIR resource types and MII profiles that SHALL be supported, together with required interactions, supported formats, and search parameters for read and search access. Systems claiming conformance to the module are expected to implement the listed capabilities according to the stated conformance expectations."

RuleSet: CRMIArtifactUsageDraftMetaCapabilityStatement
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/artifact-usage"
* extension[=].valueMarkdown = "Use this draft CapabilityStatement to inspect the resource types and custom SearchParameters published by the MII Meta module. It is a migration-generated proposal and does not establish normative server support expectations until it has been reviewed and approved."

// ── CodeSystem ───────────────────────────────────────────────────────────────

RuleSet: CRMIShareableCodeSystem
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablecodesystem"

RuleSet: CRMIPublishableCodeSystem
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablecodesystem"

RuleSet: CRMIKnowledgeCapabilitiesCodeSystem
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/cqf-knowledgeCapability"
* ^extension[=].valueCode = #shareable
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/cqf-knowledgeCapability"
* ^extension[=].valueCode = #publishable

RuleSet: CRMIKnowledgeCapabilitiesCodeSystemPublishable
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/cqf-knowledgeCapability"
* ^extension[=].valueCode = #publishable

// ── ValueSet ─────────────────────────────────────────────────────────────────

RuleSet: CRMIShareableValueSet
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablevalueset"

RuleSet: CRMIPublishableValueSet
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablevalueset"

RuleSet: CRMIComputableValueSet
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-computablevalueset"

RuleSet: CRMIKnowledgeCapabilitiesValueSet
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/cqf-knowledgeCapability"
* ^extension[=].valueCode = #shareable
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/cqf-knowledgeCapability"
* ^extension[=].valueCode = #publishable
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/cqf-knowledgeCapability"
* ^extension[=].valueCode = #computable
