# `input/resources/` — hand-authored resources

<!-- Ported from kerndatensatz-basis (main): input/resources/ (the module's
     expansion-parameters manifest) and the MII meta wiki page
     "Terminology Version Policy". -->

Conformance resources that are **not** generated from FSH live here as JSON. The
IG Publisher loads every `.json`/`.xml` file in this directory into the IG (SUSHI
ignores it — SUSHI only reads `input/fsh/`).

## What is here

### `Parameters-expansion-manifest.json` — the terminology manifest

This is the module's **expansion-parameters manifest**: it pins the exact code
system versions that every ValueSet in this IG is expanded against, so that an
expansion produces the same codes today, at release time, and three years later
when a downstream project re-validates data against the published package.

MII policy — meta wiki, [*Terminology Version
Policy*](https://github.com/medizininformatik-initiative/kerndatensatz-meta/wiki/Terminology-Version-Policy):
each MII CalVer release is bound to one SNOMED CT International release.

| MII release (CalVer) | SNOMED CT International release | Version string |
|---|---|---|
| `v2025.*` | 2024-07-01 | `http://snomed.info/sct/900000000000207008/version/20240701` |
| `v2026.*` | 2025-07-01 | `http://snomed.info/sct/900000000000207008/version/20250701` |
| `v2027.*` | 2026-07-01 | `http://snomed.info/sct/900000000000207008/version/20260701` |

The shipped file carries the **approved `v2027.*` pin**, matching this module's
2027 ballot line. When your module moves to a later CalVer line, look the release
up in that wiki table and update this
file **and** the `$sct` alias in `input/fsh/aliases.fsh`. Do not guess a version —
if the wiki has no row for your CalVer line yet, ask the MII Taskforce Core Data
Set / the Interoperability Working Group before releasing.

The second pin, `artifact-version-policy-codes|3.0.0`, is the code system behind
the CRMI version-policy extension that `input/fsh/rulesets/crmi.fsh` puts on every
artifact (basis pins it the same way). Add a `system-version` entry for every
further code system your module's value sets expand against — e.g. basis also
pins `http://hl7.org/fhir/encounter-status|4.0.1` because its Encounter profile
binds to it.

The policy governs **ValueSet expansion**. MII profiles do not currently require
`Coding.version` for SNOMED CT in instance data (they do for ICD-10-GM, OPS and
ATC).

### How it is wired

Three places in `sushi-config.yaml` reference this file — all three are active:

| Where | What it does |
|---|---|
| `extension:` → `cqf-expansionParameters` | the IG resource points at the manifest (`Parameters/mii-param-<slug>-manifest`) |
| `parameters:` → `path-expansion-params` | tells the IG Publisher which file to read the pins from |
| `parameters:` → `pin-manifest` | names the manifest whose pins are written into the built package |

### When you create a module

1. **Replace `meta` inside the file** — it appears in the resource
   `id` (`mii-param-meta-manifest`). A `{{…}}` left in a FHIR `id` is
   not a valid id and the IG Publisher will reject it. **Do not rename the
   file.** Its name is deliberately slug-free, so nothing has to be renamed per
   module: `path-expansion-params` in `sushi-config.yaml` hard-codes the path.
   (The one file in this repository whose *name* does carry a placeholder is the
   IG-level translation catalogue
   `input/translations/de/ImplementationGuide-mii-ig-meta.po`, which
   **must** be renamed — see `docs/recipes/add-translation.md` §5.)
2. Check the SNOMED CT pin against the wiki table for your CalVer line.
3. Add a `system-version` entry per further code system you bind.

### Generating it from FSH instead

`input/fsh/parameters/manifest.fsh` contains the same resource as a commented-out
FSH `Instance:`. Use **either** the hand-authored JSON here **or** the FSH — never
both, or the IG Publisher sees two resources with the same id. basis keeps the
JSON authoritative and the FSH commented out; this template does the same.
