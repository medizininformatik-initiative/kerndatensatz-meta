// ─────────────────────────────────────────────────────────────────────────────
// Ported from kerndatensatz-basis (main): input/fsh/rulesets/cps-rules.fsh
// basis literal 2026.0.1 (the pinned supportedProfile version) → 2027.0.0-ballot.rc1.
//
// Building blocks for a module CapabilityStatement (input/fsh/capabilitystatements/,
// naming MII_CPS_<Module>). They are ORDER-DEPENDENT: `SupportResource` opens a
// resource entry, every `Support…` RuleSet after it applies to that entry via the
// `[=]` (current index) soft-index. Example:
//
//   * insert SupportResource(Patient, #SHALL)
//   * insert SupportProfile(https://…/StructureDefinition/example-patient, #SHALL)
//   * insert SupportInteraction(#read, #SHALL)
//   * insert SupportSearchParam(identifier, http://hl7.org/fhir/SearchParameter/Patient-identifier, #token, #SHALL)
//
// The expectation codes are the FHIR conformance-expectation codes
// (#SHALL | #SHOULD | #MAY | #SHOULD-NOT).
// ─────────────────────────────────────────────────────────────────────────────

Alias: $exp = http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation

RuleSet: SupportResource (resource, expectation)
* rest.resource[+].type = #{resource}
* rest.resource[=].extension[0].url = $exp
* rest.resource[=].extension[0].valueCode = {expectation}

/*
The expectation extension is NOT allowed on rest.resource.profile — the IG
Publisher rejects it with:

  Error @ CapabilityStatement.rest[0].resource[0].profile: The extension
  http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation is not
  allowed to be used at this point (this element is
  [CapabilityStatement.rest.resource.profile, canonical])

so the expectation lines stay commented out here (kept from basis as the
explanation for why `Profile` takes no expectation). Use `SupportProfile` —
rest.resource.supportedProfile DOES allow the extension.
*/
RuleSet: Profile (profile)
* rest.resource[=].profile[+] = "{profile}"
//* rest.resource[=].profile[=].extension[0].url = $exp
//* rest.resource[=].profile[=].extension[0].valueCode = {expectation}

RuleSet: SupportProfile (profile, expectation)
// This rule set must follow a SupportResource rule set, and applies to that resource.
* rest.resource[=].supportedProfile[+] = "{profile}|2027.0.0-ballot.rc1"
* rest.resource[=].supportedProfile[=].extension[0].url = $exp
* rest.resource[=].supportedProfile[=].extension[0].valueCode = {expectation}

RuleSet: SupportInteraction (interaction, expectation)
// This rule set must follow a SupportResource rule set, and applies to that resource.
* rest.resource[=].interaction[+].code = {interaction}
* rest.resource[=].interaction[=].extension[0].url = $exp
* rest.resource[=].interaction[=].extension[0].valueCode = {expectation}

RuleSet: SupportSearchParam (name, canonical, type, expectation)
// This rule set must follow a SupportResource rule set, and applies to that resource.
* rest.resource[=].searchParam[+].name = "{name}"
* rest.resource[=].searchParam[=].definition = "{canonical}"
* rest.resource[=].searchParam[=].type = {type}
* rest.resource[=].searchParam[=].extension[0].url = $exp
* rest.resource[=].searchParam[=].extension[0].valueCode = {expectation}

RuleSet: SupportSpecialSearchParam (name, type, expectation)
// This rule set must follow a SupportResource rule set, and applies to that resource.
* rest.resource[=].searchParam[+].name = "{name}"
* rest.resource[=].searchParam[=].type = {type}
* rest.resource[=].searchParam[=].extension[0].url = $exp
* rest.resource[=].searchParam[=].extension[0].valueCode = {expectation}
