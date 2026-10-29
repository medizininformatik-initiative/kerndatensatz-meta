# Glossary

Plain-language definitions of the terms you meet in this repository and in MII
KDS IG work. English technical terms are kept as-is (they are what you will
search for). If you are new to FHIR, read this top to bottom once — later terms
build on earlier ones.

| Term | In one sentence |
| --- | --- |
| **FHIR** | *Fast Healthcare Interoperability Resources* — the HL7 standard for exchanging health data as structured "resources" (Patient, Observation, Condition, …). This project uses FHIR **R4** (version 4.0.1). |
| **Resource** | One unit of FHIR data of a defined type, e.g. a single `Patient` or `Observation`. |
| **Profile** | A set of extra rules that constrains a base FHIR resource for a specific use (e.g. "an MII Patient must have a name and a birth date"). A profile does not invent a new resource type; it narrows an existing one. |
| **Extension** | A standardized way to add a data element FHIR does not have out of the box, without breaking interoperability. |
| **Must-Support** | A flag on a profile element meaning "a conforming system must be able to handle this element" (populate it if the data exists, and not choke on it when reading). It is a conformance obligation, not "the element is mandatory". |
| **Conformance** | The rules an implementation must follow to be considered compatible with a profile/IG. |
| **Implementation Guide (IG)** | A published package + website that bundles profiles, extensions, value sets, terminology, examples and narrative guidance for one coherent use case (e.g. one MII KDS module). |
| **IG Publisher** | The official HL7 tool (a Java `.jar`) that turns IG sources into the published website and the downloadable package. It applies exactly **one template** per build. |
| **SUSHI** | The tool that compiles **FSH** into FHIR JSON resources. Runs before the IG Publisher. |
| **FSH (FHIR Shorthand)** | A concise text language for authoring profiles/extensions/value sets, compiled by SUSHI. Files end in `.fsh`. |
| **Template** | A bundle of layout, HTML/Liquid fragments, CSS and scripts that decides how an IG *looks*. Applied by the IG Publisher. |
| **Template package** | A template shipped as an installable FHIR package (id ending in `.template`). The MII one is `de.medizininformatikinitiative.template`; this module consumes it — today by repository URL, later as a pinned published package. |
| **IG vs template** | The IG is *what* is documented (the profiles + narrative); the template is *how* it is presented (branding + layout). One template serves many IGs. |
| **Package vs template package** | A normal FHIR *package* ships conformance resources (profiles, value sets). A *template package* ships presentation (layout, CSS) and has an id ending in `.template`. |
| **Base template** | The template the MII template is derived from: [`fhir2.base.template`](https://github.com/HL7/ig-template-base2). A module never references it directly — a newer base arrives with a newer MII template pin. |
| **Canonical URL** | The stable, globally-unique identifier URL of an IG or artifact (e.g. `https://www.medizininformatik-initiative.de/fhir/modul-person`). It is an identifier, **not** necessarily where the site is hosted. |
| **Package registry** | A server that hosts installable FHIR packages so tools can download them by id + version (e.g. `packages.fhir.org`). |
| **`FHIR/ig-registry`** | HL7's public list of published IGs and IG **templates** (`templates.json`); being listed there lets the IG Publisher resolve a template by id. |
| **Simplifier** | A commercial FHIR registry/editor platform; an alternative place IGs and packages are published. |
| **`sushi-config.yaml`** | SUSHI's configuration file: the IG's id, name, version, canonical, dependencies, page list and parameters. |
| **`ig.ini`** | The IG Publisher's entry-point config: which IG resource to build and which **template** to apply (`template = …`). |
| **CapabilityStatement** | A FHIR resource describing what a server/API can do (which resources, which interactions). |
| **ValueSet / CodeSystem** | A *CodeSystem* defines codes and their meanings; a *ValueSet* selects a set of codes (often from one or more CodeSystems) for use in a profile. |
| **Terminology server** | A server that validates and expands codes/value sets (e.g. SNOMED CT, ICD-10-GM). This project prefers **SU-TermServ** and falls back to HL7's `tx.fhir.org`. |
| **Snapshot** | The fully-resolved form of a profile (base + all constraints flattened), as opposed to the "differential" (only what this profile changes). |
| **CalVer** | Date-sequenced versions (`YYYY.n.n`, e.g. `2027.0.0`), the scheme MII **modules** release with. Pre-releases add a suffix (`2027.0.0-ballot`). See [release.md](release.md). |
| **Conventional Commits** | A commit-message convention (`feat:`, `fix:`, `docs:` …) that lets tooling derive version bumps and changelogs. See [CONTRIBUTING.md](../CONTRIBUTING.md). |
| **Dev container** | A pre-built development environment (Docker) that ships the whole toolchain (Java, Node, SUSHI, Jekyll…) so you do not install it by hand. See [recipes/first-build-in-devcontainer.md](recipes/first-build-in-devcontainer.md). |
| **Module (KDS module)** | One part of the MII Kerndatensatz (Person, Diagnose, Prozedur, …), published as its own IG. This repository is the **Meta** module. |
| **CRMI** | *Canonical Resource Management Infrastructure* — an HL7 IG whose profiles this module claims on its ImplementationGuide resource (shareable/publishable/computable), so the module is a well-described, versioned publication unit. |
| **Metadata contract** | The set of `sushi-config.yaml` fields (packageId, id, name, title, canonical, version, CRMI profiles, `artifact-*` extensions) a module must fill correctly; the `convention-check` enforces the patterns. |
| **`publication-request.json`** | The file the IG Publisher's `-go-publish` reads to publish an IG (version, path, dates). |
| **`special-url`** | A `sushi-config.yaml` list of canonical URLs a module defines that do **not** start with its own canonical; usually empty for a new module. See [recipes/regenerate-special-url.md](recipes/regenerate-special-url.md). |
| **`-go-publish`** | The IG Publisher's production-publication mode. Here it is a **gated**, manual, dry-run-by-default workflow — never run automatically. |
