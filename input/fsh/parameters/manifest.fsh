// ─────────────────────────────────────────────────────────────────────────────
// Ported from kerndatensatz-basis (main): input/fsh/parameters/manifest.fsh
//
// The module's expansion-parameters manifest — the pinned code system versions
// every ValueSet in this IG is expanded against (MII meta wiki, "Terminology
// Version Policy").
//
// It ships as HAND-AUTHORED JSON at
//   input/resources/Parameters-expansion-manifest.json
// which is what sushi-config.yaml's `path-expansion-params` and `pin-manifest`
// point at. This FSH is the same resource, kept COMMENTED OUT exactly as basis
// keeps it: enabling it would make SUSHI emit a second Parameters resource with
// the same id, and the IG Publisher rejects duplicate ids.
//
// Use ONE of the two. If you prefer generating it from FSH, uncomment below,
// DELETE the JSON file, and keep the id identical so the sushi-config references
// still resolve. See input/resources/README.md for the version table.
// ─────────────────────────────────────────────────────────────────────────────

// Instance: mii-param-meta-manifest
// InstanceOf: Parameters
// Title: "Parameters for terminology selection of SNOMED CT"
// Description: "This parameter resource is used to specify the system version of SNOMED CT to be used in the terminology service."
// Usage: #definition
// * ^meta.profile = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-manifestparameters"
// * parameter[0].name = "system-version"
// * parameter[0].valueCanonical = $sct
// * parameter[1].name = "system-version"
// * parameter[1].valueCanonical = "http://terminology.hl7.org/CodeSystem/artifact-version-policy-codes|3.0.0"
