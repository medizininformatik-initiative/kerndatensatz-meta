// ─────────────────────────────────────────────────────────────────────────────
// Ported from kerndatensatz-basis (main): input/fsh/rulesets/meta-profile.fsh
// basis literal 2026.0.1 → 2027.0.0-ballot.
//
// Pins an example's `meta.profile` to the VERSIONED canonical of the profile it
// claims, e.g.
//   * insert MetaProfile(https://www.medizininformatik-initiative.de/fhir/modul-<slug>/StructureDefinition/<id>)
// Setting meta.profile explicitly also stops SUSHI from adding its own unversioned
// entry (instanceOptions.setMetaProfile), so the example validates against exactly
// the release it ships with.
// ─────────────────────────────────────────────────────────────────────────────

RuleSet: MetaProfile(canonical)
* meta.profile[+] = "{canonical}|2027.0.0-ballot"
