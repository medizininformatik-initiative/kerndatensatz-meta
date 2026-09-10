# Further reading

A curated reading list of the specifications, wiki pages and tools this template
and its modules build on. If a link moves, search its title.

## MII — the rules this template and its modules follow

The [MII meta wiki](https://github.com/medizininformatik-initiative/kerndatensatz-meta/wiki)
is authoritative; when it and this repo disagree, the wiki wins.

- [Namenskonventionen für FHIR-Ressourcen in der MII](https://github.com/medizininformatik-initiative/kerndatensatz-meta/wiki/Namenskonventionen-für-FHIR‐Ressourcen-in-der-MII)
  — the naming rules for packageId, id, name, title and canonicals. Read before you
  name anything; the convention check enforces these.
- [Conformance](https://github.com/medizininformatik-initiative/kerndatensatz-meta/wiki/Conformance)
  — what "conformant" means for MII modules (Must-Support, cardinalities).
- [Terminology Version Policy](https://github.com/medizininformatik-initiative/kerndatensatz-meta/wiki/Terminology-Version-Policy)
  — how code system versions are pinned; relevant to terminology-server choice.
- [Module Release Workflow](https://github.com/medizininformatik-initiative/kerndatensatz-meta/wiki/Module-Release-Workflow)
  — the **CalVer** release process for modules (contrast with this template's SemVer).
- [GitHub Reusable Validation Workflows](https://github.com/medizininformatik-initiative/kerndatensatz-meta/wiki/GitHub-Reusable-Validation-Workflows)
  — the shared CI validation the module scaffold consumes.
- [Dev Container ‐ IG Publisher](https://github.com/medizininformatik-initiative/kerndatensatz-meta/wiki/Dev-Container-‐-IG-Publisher)
  — the dev-container approach this repo aligns with.
- [Release 2027](https://github.com/medizininformatik-initiative/kerndatensatz-meta/wiki/Release-2027)
  — the planned scope and schedule of the next KDS release.

## FHIR, IG Publisher and authoring

- [FHIR R4 specification](https://hl7.org/fhir/R4/) — the standard itself (this
  project is R4 / 4.0.1). Start with "Resource" and "Profiling".
- [IG Publisher documentation](https://confluence.hl7.org/display/FHIR/IG+Publisher+Documentation)
  — the build tool, its parameters, templates and `-go-publish`.
- [SUSHI documentation](https://fshschool.org/docs/sushi/) and
  [FSH School](https://fshschool.org/) — learn FHIR Shorthand and how SUSHI turns
  it into resources.
- [`HL7/ig-template-base2`](https://github.com/HL7/ig-template-base2) — the base
  template this one derives from; read its `package/package.json`, `includes/` and
  `package-list.json` to understand what we override vs inherit.
- [`FHIR/ig-registry`](https://github.com/FHIR/ig-registry) — the public IG/template
  registry; `templates.json` is where the MII IG template would get listed. That
  listing belongs to the IG template repository, not to a module — it is still
  an open decision ([issue #135](../../../issues/135)).
- [FHIR sample IG](https://build.fhir.org/ig/FHIR/sample-ig/) — a minimal reference
  IG, useful when you want to see a complete small example.

## Tooling conventions

- [Conventional Commits 1.0.0](https://www.conventionalcommits.org/en/v1.0.0/) — the
  commit-message format that drives releases here (see [CONTRIBUTING.md](../CONTRIBUTING.md)).
- [Semantic Versioning 2.0.0](https://semver.org/) — the version scheme for the
  **template repos** (modules use CalVer).
- [Release Please](https://github.com/googleapis/release-please) — the release
  automation on the **template repos only**. A module never carries it; the
  first-run bootstrap removes it. See [release.md](release.md).
- [Development Containers](https://containers.dev/) — the dev-container standard our
  `.devcontainer/` follows.

## Getting help

- HL7 FHIR community Zulip — <https://chat.fhir.org>, stream `german/mi-initiative`.
- MII Zulip — <https://mii.zulipchat.com/>, stream `MII-Kerndatensatz`.

See also [Getting help in the README](../README.md#getting-help).
