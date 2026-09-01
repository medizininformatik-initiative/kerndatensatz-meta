// ─────────────────────────────────────────────────────────────────────────────
// Aliases shared by every .fsh file in this module.
//
// Ported from kerndatensatz-basis (main): input/fsh/aliases.fsh — reduced to the
// entries that are MODULE-INDEPENDENT. basis's module-specific blocks (Diagnose,
// Fall, Person: $Vitalstatus, $Abteilungsfallklasse, $Aufnahmegrund, …) are
// deliberately NOT here; add the ones your module actually binds.
//
// An `Alias:` is plain text substitution — SUSHI replaces `$name` with the URL
// before parsing, so aliases work in any rule, in any file of the project. Keep
// them here rather than per file: a duplicate alias with a different value is a
// SUSHI error, and one list makes the module's terminology surface reviewable.
//
// NOT here on purpose (declared next to the RuleSet that uses them, exactly as
// in basis — do not re-declare them):
//   $exp                    → input/fsh/rulesets/cps-rules.fsh
//   $spdx-license           → input/fsh/rulesets/license-terms.fsh
//   $v3-ActReason           → input/fsh/rulesets/test-data-label.fsh
//   $artifact-versionAlgorithm, $version-algorithm → input/fsh/rulesets/version.fsh
// ─────────────────────────────────────────────────────────────────────────────

// ── SNOMED CT ────────────────────────────────────────────────────────────────
// $sct pins the SNOMED CT International release bound to this MII CalVer line;
// $sct-no-ver is the plain system URI for instance-level codings.
//
// The MII binds each CalVer release to ONE SNOMED CT International release so
// that ValueSet expansions are reproducible — MII meta wiki, "Terminology
// Version Policy" (https://github.com/medizininformatik-initiative/kerndatensatz-meta/wiki/Terminology-Version-Policy):
//
//   MII release (CalVer) | SNOMED CT International release | version string
//   v2025.*              | 2024-07-01 | http://snomed.info/sct/900000000000207008/version/20240701
//   v2026.*              | 2025-07-01 | http://snomed.info/sct/900000000000207008/version/20250701
//   v2027.*              | 2026-07-01 | http://snomed.info/sct/900000000000207008/version/20260701
//
// The value below is the approved v2027.* pin for this module. When the module
// moves to a later CalVer line, look
// the release up in that wiki table and update BOTH this alias and
// input/resources/Parameters-expansion-manifest.json — do not guess.
// Note the policy applies to ValueSet expansion; MII profiles do not currently
// require Coding.version for SNOMED CT in instance data.
Alias: $sct = http://snomed.info/sct|http://snomed.info/sct/900000000000207008/version/20260701
Alias: $sct-no-ver = http://snomed.info/sct

// ── Further code systems used across MII modules ─────────────────────────────
Alias: $loinc = http://loinc.org
Alias: $icd-10 = http://hl7.org/fhir/sid/icd-10
Alias: $icd-10-gm = http://fhir.de/CodeSystem/bfarm/icd-10-gm
Alias: $icd-o-3 = http://terminology.hl7.org/CodeSystem/icd-o-3
Alias: $alpha-id = http://fhir.de/CodeSystem/bfarm/alpha-id
Alias: $alpha-id-vs = http://fhir.de/ValueSet/bfarm/alpha-id
Alias: $ops = http://fhir.de/CodeSystem/bfarm/ops
Alias: $orpha = http://www.orpha.net

// ── HL7 terminology ──────────────────────────────────────────────────────────
Alias: $v2-0203 = http://terminology.hl7.org/CodeSystem/v2-0203
Alias: $v3-ObservationValue = http://terminology.hl7.org/CodeSystem/v3-ObservationValue
Alias: $v3-ActCode = http://terminology.hl7.org/CodeSystem/v3-ActCode
Alias: $v3-ActPriority = http://terminology.hl7.org/CodeSystem/v3-ActPriority
Alias: $observation-category = http://terminology.hl7.org/CodeSystem/observation-category

// ── German base profiles (de.basisprofil.r4, a pinned dependency) ────────────
Alias: $identifier-type-de-basis = http://fhir.de/CodeSystem/identifier-type-de-basis
Alias: $gender-amtlich-de = http://fhir.de/CodeSystem/gender-amtlich-de
Alias: $ags = http://fhir.de/sid/destatis/ags

// ── FHIR core extensions / MII cross-module ──────────────────────────────────
Alias: $data-absent-reason = http://hl7.org/fhir/StructureDefinition/data-absent-reason
Alias: $MII-Reference = https://www.medizininformatik-initiative.de/fhir/core/StructureDefinition/MII-Reference

// ── CRMI (hl7.fhir.uv.crmi, a pinned dependency) ─────────────────────────────
// The full basis block. The profiles are claimed via the RuleSets in
// input/fsh/rulesets/crmi.fsh; these aliases let you reference them directly.
Alias: $crmi-license = http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-license
Alias: $crmi-license-detail = http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-licenseDetail
Alias: $crmi-manifestlibrary = http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-manifestlibrary
Alias: $crmi-manifestparameters = http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-manifestparameters
Alias: $crmi-referenceSource = http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-referenceSource
Alias: $crmi-softwaresystem = http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-softwaresystem
//Alias: $crmi-artifact-signature = http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-artifact-signature
Alias: $crmi-shareableimplementationguide = http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareableimplementationguide
Alias: $crmi-publishableimplementationguide = http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishableimplementationguide
Alias: $crmi-shareablestructuredefinition = http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition
Alias: $crmi-publishablestructuredefinition = http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition
Alias: $crmi-shareablevalueset = http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablevalueset
Alias: $crmi-computablevalueset = http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-computablevalueset
Alias: $crmi-publishablevalueset = http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablevalueset
Alias: $crmi-expandedvalueset = http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-expandedvalueset
Alias: $crmi-shareablecodesystem = http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablecodesystem
Alias: $crmi-publishablecodesystem = http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablecodesystem
Alias: $crmi-shareablecapabilitystatement = http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablecapabilitystatement
Alias: $crmi-publishablecapabilitystatement = http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablecapabilitystatement
Alias: $crmi-shareablesearchparameter = http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablesearchparameter
Alias: $crmi-publishablesearchparameter = http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablesearchparameter
Alias: $crmi-publishable-bundle = http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishable-bundle
Alias: $crmi-release-version-behavior-codes = http://hl7.org/fhir/uv/crmi/CodeSystem/crmi-release-version-behavior-codes
Alias: $crmi-release-experimental-behavior-codes = http://hl7.org/fhir/uv/crmi/CodeSystem/crmi-release-experimental-behavior-codes
Alias: $crmi-release-version-behavior = http://hl7.org/fhir/uv/crmi/ValueSet/crmi-release-version-behavior
Alias: $crmi-release-experimental-behavior = http://hl7.org/fhir/uv/crmi/ValueSet/crmi-release-experimental-behavior
