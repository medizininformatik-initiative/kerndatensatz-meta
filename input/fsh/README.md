# `input/fsh/` — FHIR Shorthand sources

SUSHI compiles every `.fsh` file in this tree (the subdirectory names are a
convention, not a technical requirement — kerndatensatz-basis uses exactly
this split, and keeping it makes MII modules navigable the same way):

| Subdirectory | Contains (one artifact per file) |
|---|---|
| `profiles/` | `Profile:` definitions — basis naming: `MII_PR_<Module>_<Name>.fsh` |
| `extensions/` | `Extension:` definitions — `MII_EX_<Module>_<Name>.fsh` |
| `valuesets/` | `ValueSet:` definitions — `MII_VS_<Module>_<Name>.fsh` |
| `codesystems/` | `CodeSystem:` definitions (incl. supplements) — `MII_CS_<Module>_<Name>.fsh` |
| `logicals/` | `Logical:` models of the module dataset — `MII_LM_<Module>.fsh` |
| `instances/` | `Instance:` examples (`MII_EXA_...`) and other concrete instances |
| `invariants/` | `Invariant:` definitions, one per file, named after the invariant key |
| `capabilitystatements/` | `Instance:` CapabilityStatements (`MII_CPS_...`) |
| `parameters/` | `Instance:` Parameters resources, e.g. the expansion-parameters manifest |
| `rulesets/` | `RuleSet:` definitions shared across artifacts (versioning, license, translation, CRMI metadata — basis keeps `version.fsh`, `license.fsh`, `crmi.fsh`, `translation.fsh`, … here) |

## What ships in this tree

| File | What it is |
|---|---|
| `aliases.fsh` | the root-level `Alias:` list (basis idiom) — every `$name` shortcut shared by all files. Add the code systems a new artifact binds. |
| `searchparameters/` | the cross-module `SearchParameter` instances (`mii-sp-meta-*.fsh`) and the collection/transaction Bundles that package them (`mii-sp-meta-bundle.fsh`). Every change needs a test in `.github/workflows/search-param-test/test-search.sh`. |
| `profiles/MII_PR_Meta_SearchParameter.fsh` | the profile every MII SearchParameter conforms to |
| `extensions/mii-ex-meta-license-codeable.fsh` | the licence extension |
| `codesystems/mii-cs-meta-diz-standorte.fsh` | the DIZ-Standorte CodeSystem — see [`docs/recipes/add-a-diz-standort.md`](../../docs/recipes/add-a-diz-standort.md) |
| `capabilitystatements/mii-cps-meta-server-capabilities.fsh` | the server CapabilityStatement |
| `rulesets/` | the shared `RuleSet:` library ported from basis — version, publisher, licence, CRMI metadata, package source, translations, test-data label, CapabilityStatement helpers. See `rulesets/README.md`. |
| `parameters/manifest.fsh` | the expansion-parameters manifest as FSH — commented out, because the authoritative copy is the JSON in `input/resources/` (see `input/resources/README.md`). |

`instances/` and `logicals/` are currently empty.

An `Alias:` is plain text substitution applied across the whole project, so a
duplicate alias with a different value is a SUSHI error. A few aliases live next
to the RuleSet that needs them (`$exp`, `$spdx-license`, `$v3-ActReason`,
`$artifact-versionAlgorithm`, `$version-algorithm`) — exactly as in basis; the
header of `aliases.fsh` lists them so you do not re-declare them.

Naming: follow the MII meta wiki page *Namenskonventionen für FHIR-Ressourcen
in der MII*. Do not commit generated `fsh-generated/` output.
