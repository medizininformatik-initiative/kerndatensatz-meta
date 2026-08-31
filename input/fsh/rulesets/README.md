# `input/fsh/rulesets/` — shared `RuleSet:` library

<!-- Ported from kerndatensatz-basis (main), input/fsh/rulesets/ — file names and
     RuleSet names kept 1:1 so an MII module reads the same way everywhere. -->

Every MII KDS module repeats the same metadata on every conformance resource:
the CalVer version, the publisher, the licence, the CRMI profile claims and
knowledge capabilities, the package-source provenance, the approval date, the
effective period, the artifact topic and the contributor list. Writing that out
per artifact is how modules drift apart.

[kerndatensatz-basis](https://github.com/medizininformatik-initiative/kerndatensatz-basis)
solves it with a small library of `RuleSet:` definitions that every profile,
extension, value set, code system and example `insert`s. This template ships the
same library, with basis's module-specific literals replaced by the repository's
`{{...}}` placeholders.

## What is here

| File | RuleSets | Insert it on |
|---|---|---|
| `version.fsh` | `Version`, `PR_CS_VS_Version`, `CRMIPackageSource`, `CRMIPackageSourceDefinitionalResource`, `CRMIResourceEffectivePeriod`, `CRMIResourceEffectivePeriodInstance` | every conformance resource + every example |
| `crmi.fsh` | `CRMIShareable…`/`CRMIPublishable…`/`CRMIComputable…`, `CRMIKnowledgeCapabilities…`, `CRMIVersionPolicyStrict…`, `CRMIApprovalDate…`, `CRMIArtifactTopic…`, `CRMIArtifactContributors…`, `CRMIArtifactUsage…`, `CRMICopyrightLabel…` | every conformance resource |
| `publisher.fsh` | `Publisher`, `SP_Publisher` | every conformance resource (`SP_…` for SearchParameter/instance paths) |
| `license.fsh` | `SnomedLicense` | any artifact that uses SNOMED CT codes |
| `license-terms.fsh` | `LicenseCodeableCCBY40`, `LicenseCodeableCCBY40Instance`, `LicenseCodeableCC0` | every conformance resource |
| `meta-profile.fsh` | `MetaProfile(canonical)` | examples — pins `meta.profile` to `<canonical>|<version>` |
| `test-data-label.fsh` | `TestDataLabel` | **every** example instance |
| `translation.fsh` | `Translation(path, language, translation)` + the coding-specific helpers | any element whose `^short`/`^definition` needs a second language |
| `cps-rules.fsh` | `SupportResource`, `Profile`, `SupportProfile`, `SupportInteraction`, `SupportSearchParam`, `SupportSpecialSearchParam` | CapabilityStatement instances |
| `extension-context.fsh` | `ExtensionContext(path)` | Extension definitions |

## The two flavours: `^` vs. no `^`

FSH addresses a resource's own metadata differently depending on how the
resource is declared:

- **Caret paths (`^extension`, `^meta`)** — for resources declared with a FSH
  keyword: `Profile:`, `Extension:`, `Logical:`, `ValueSet:`, `CodeSystem:`.
- **Instance paths (`extension`, `meta`)** — for resources declared as
  `Instance:` … `InstanceOf:`, e.g. CapabilityStatements, Parameters, examples.

That is why most RuleSets come in pairs — `CRMIApprovalDate` (caret) and
`CRMIApprovalDateInstance` (instance). Pick the one matching the declaration
form, otherwise SUSHI reports an unknown-path error.

## Placeholders in this directory

These files carry the repository's `{{...}}` placeholders (see the table at the
top of `sushi-config.yaml`). Replace them together with every other placeholder
when you create a module — `version.fsh` and `crmi.fsh` will not produce a valid
IG until you do:

| Placeholder | Where |
|---|---|
| `2026.0.0` | `version.fsh`, `meta-profile.fsh`, `cps-rules.fsh` |
| `meta` | `version.fsh` (package id + canonical of the package source) |
| `2026` | `version.fsh` (`resource-effectivePeriod.start`) |
| `2019` | `crmi.fsh` (`artifact-copyrightLabel`) |
| `julian.sass@charite.de` | `crmi.fsh` (`artifact-author`) |
| `2026-08-31` | passed in at the call site: `insert CRMIApprovalDate(2026-08-31)` |
| `C80260` | passed in at the call site: `insert CRMIArtifactTopic(…, C80260)` |

`input/fsh/profiles/example-patient.fsh` and
`input/fsh/instances/example-patient-instance.fsh` show the full insert block for
a profile and for an example — copy it when you add your own artifacts.
