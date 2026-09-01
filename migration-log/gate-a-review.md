# Gate A review — identity and artifact preservation

Status: **approved 2026-08-31**

Approved decisions:

- A1: retain target version `2027.0.0-ballot.rc1`, accepting the documented
  strict-CalVer convention-check deviation.
- A2: retain `hl7.terminology.r4#7.1.0` and
  `hl7.fhir.uv.extensions.r4#5.2.0`.
- A3: do not re-enable the source licence extension or the template
  `artifact-versionPolicy` extension.
- A4: approve NUM-DIZ as the rendered site publisher.
- A5: approve `Parameters/mii-param-meta-manifest`.

## Provenance

- Source: `v2027-ballot` at `1db2e534704d92e5ee0cde663ce3e7ccd8825fa7`
- Authoritative narrative: `implementation-guides/ImplementationGuide-2025`
- Module template: `v0.13.1` at `61b02b504c9a48d12493b91ffb5e14fe4256429d`
- IG template reference: `https://github.com/medizininformatik-initiative/ig-template-mii-kds`, release `v1.3.4`

## Mechanically verified

| Check | Result |
| --- | --- |
| Source FSH paths | 56 of 56 retained; no source FSH content changed |
| Scaffold FSH | 8 additions; 4 colliding module ruleset files skipped |
| Source artifact set | 175 of 175 retained |
| Artifact identity | 0 differences in resource type, id, or canonical URL |
| SUSHI 3.20.0 | 0 errors, 2 environment warnings, 175 source artifacts exported |
| Canonical | `https://www.medizininformatik-initiative.de/fhir/modul-meta` retained |
| ImplementationGuide id | `mii-ig-meta` retained |
| Package id | `de.medizininformatikinitiative.kerndatensatz.meta` retained |
| Licence | `CC-BY-4.0`; target LICENSE is byte-identical to source |
| Cross-canonical resource | Exact `special-url` added for `https://www.medizininformatik-initiative.de/fhir/core/CodeSystem/core-location-identifier` |
| Active placeholders | 0; optional citation examples remain commented |

The scaffold also adds one template-maintenance resource,
`Parameters/mii-param-meta-manifest`. It is not counted among the 175 source
artifacts and requires explicit approval below.

## Decisions

### A1 — Target version

The source declares `2026.0.0`. After the scaffold checkpoint, the working tree
was locally changed to `2027.0.0-ballot.rc1`. SUSHI accepts it, but the module
template convention check rejects the prerelease suffix because module versions
must be strict MII CalVer `YYYY.n.n`.

Choose one:

- `2026.0.0` preserves the supplied source identity and matches the existing
  publication request and v2026 terminology manifest.
- `2027.0.0` records a human-approved target-version change, but requires the
  publication request and the v2027 terminology-policy pin to be aligned.

`2027.0.0-ballot.rc1` cannot pass the current template convention.

### A2 — Template dependency pins

The template requires the additive CRMI/Publisher dependencies. The working
tree was locally changed after scaffolding:

| Package | Template v0.13.1 | Current working tree |
| --- | ---: | ---: |
| `hl7.fhir.uv.crmi` | `2.0.0` | `2.0.0` |
| `hl7.terminology.r4` | `7.3.0` | `7.1.0` |
| `hl7.fhir.uv.extensions.r4` | `5.3.0` | `5.2.0` |

Recommended decision: use the template pins `2.0.0`, `7.3.0`, and `5.3.0`
unless the older pins have a documented compatibility reason.

### A3 — Commented metadata extensions

Two entries were locally commented after scaffolding:

- The module-specific licence extension from the source guide. Re-enable it to
  preserve source ImplementationGuide metadata.
- The template's `artifact-versionPolicy` extension. Re-enable it to satisfy
  the intended CRMI metadata contract.

Recommended decision: re-enable both.

### A4 — Site publisher exception

The source publisher is the Medical Informatics Initiative. Under the selected
module-template convention, the rendered IG site publisher becomes `NUM-DIZ`;
artifact-level publisher/copyright provenance remains MII.

Recommended decision: approve this documented template exception.

### A5 — Expansion manifest

Approve the additive template-maintenance resource
`Parameters/mii-param-meta-manifest`. It pins terminology expansion inputs and
does not replace or rename any source artifact.

## Gate response

Decisions A1–A5 were recorded in `migration-log/run.log`. Narrative migration
may proceed; the approved convention and metadata deviations remain visible in
the final report.
