<!-- markdownlint-disable MD041 -->

### Version scheme

The Meta module uses the KDS calendar-versioning scheme in a SemVer-compatible
form: `YYYY.MINOR.PATCH[-label]`. The current version is
`2027.0.0-ballot.rc1`.

* `YYYY` is the year in which the guide applies and is intended to be used.
* `MINOR` is incremented for non-breaking additions and refinements.
* `PATCH` is incremented for corrections.
* `label` marks a pre-release or build, such as `ballot` or `cibuild`.

Stable releases can be compared using the three numeric components. No ordering
is inferred among labels.

### Artifact versions

FHIR artifacts in a release carry the guide and package version. The computable
metadata declares the `semver` version algorithm, package source, and manifest
parameters; see [Metadata Overview](metadata.html). This release does not
declare `artifact-versionPolicy`.

### Release process

Releases follow the
[MII Module Release Workflow](https://github.com/medizininformatik-initiative/kerndatensatz-meta/wiki/Module-Release-Workflow).
The [Changelog](changes.html) records the changes of each version. The source
guide provides no module-specific support window or deprecation policy.

### Version comparison

From the second formal IG Publisher publication onward, a machine-generated
comparison can supplement the changelog. It requires a publication history at
the canonical URL and a loadable previous package. Until those prerequisites
exist, version comparison remains disabled.
