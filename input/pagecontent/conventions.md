<!-- markdownlint-disable MD041 -->

This page describes conventions that the KDS modules apply to their artifacts
and examples. The Meta module documents them because they apply across modules.
They are implemented as a shared library of FSH `RuleSet` definitions that
each module inserts into its artifacts; see
[input/fsh/rulesets](https://github.com/medizininformatik-initiative/kerndatensatz-meta/tree/main/input/fsh/rulesets).

### Test data labelling

KDS modules label their example instances as test data with the security label
`HTEST` ("test health data") from the HL7 code system
[v3-ActReason](https://terminology.hl7.org/CodeSystem-v3-ActReason.html):

```
* meta.security[+] = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST "test health data"
```

The `TestDataLabel` RuleSet sets this label. An example that reaches a
production system can then be told apart from real patient data.

The Meta module's own examples are the SearchParameter
[collection and transaction bundles](examples.html) for importing the search
parameters into a FHIR server. They contain no patient data and therefore carry
no test data label.

The requirements for KDS test data are described on the wiki page
[KDS test data](https://github.com/medizininformatik-initiative/kerndatensatz-meta/wiki/KDS%E2%80%90Testdaten); the test data itself is maintained
in [mii-testdata](https://github.com/medizininformatik-initiative/mii-testdata).

### Licensing

This guide is published under the
[Creative Commons Attribution 4.0 International licence](https://creativecommons.org/licenses/by/4.0/)
(`CC-BY-4.0`), © 2019+ Medical Informatics Initiative (MII). The publisher
named in the page footer is the organisation that publishes and maintains the
guide; it is not the copyright holder.

* **Conformance artifacts** declare their licence in machine-readable form with
  the CRMI extension
  [`crmi-license`](https://hl7.org/fhir/uv/crmi/STU2/StructureDefinition-crmi-license.html)
  in `meta.extension`, with the SPDX code `CC-BY-4.0` (RuleSets
  `LicenseCodeableCCBY40` and `LicenseCodeableCCBY40Instance`).
* **Artifacts that use SNOMED CT codes** carry SNOMED International's
  attribution notice in `copyright` (RuleSet `SnomedLicense`). The wording is
  SNOMED International's and is not changed.
* **External code systems** remain under the copyright of their publishers.
* The extension
  [MII EX Meta License Codeable](StructureDefinition-mii-ex-meta-license-codeable.html)
  is deprecated. Use `crmi-license` for new artifacts.

### Further KDS-wide rules

* Conformance verbs, Must Support and handling missing data:
  [Conformance](https://github.com/medizininformatik-initiative/kerndatensatz-meta/wiki/Conformance-English)
* Naming of FHIR resources:
  [Naming conventions](https://github.com/medizininformatik-initiative/kerndatensatz-meta/wiki/Namenskonventionen-f%C3%BCr-FHIR%E2%80%90Ressourcen-in-der-MII)
  (German)
* Code system versions:
  [Terminology Version Policy](https://github.com/medizininformatik-initiative/kerndatensatz-meta/wiki/Terminology-Version-Policy)
* Releases: [Module Release Workflow](https://github.com/medizininformatik-initiative/kerndatensatz-meta/wiki/Module-Release-Workflow) and
  [Versioning](version-history.html)
* Computable metadata of the artifacts: [Metadata Overview](metadata.html)
