# Narrative routing review

Status: **approved 2026-08-31; recommended routes applied to `page-map.tsv`**

Approved decisions:

- Routes: recommended corrected routes.
- M9: keep Extensions, Search Parameters, Code Systems, and Metadata Overview;
  remove Operations, Value Sets, and Researcher Guidance.
- M11: adopt the bilingual default text.
- CapabilityStatement: generate the artifact-derived proposal.

The generator covered the complete source universe: seven authoritative guide
pages, one older `input/pagecontent/index.md` stub, and two legacy guide-tree
retirement rows. Four generated routes need correction based on the page
contents.

## Recommended binding routes

| Source | Target | Reason |
| --- | --- | --- |
| `MII-IG-Meta/Index.page.md` | `input/pagecontent/index.md` | Authoritative module landing-page content. |
| `MII-IG-Meta/Release-notes.page.md` | `input/pagecontent/changes.md` | Release history belongs in Changelog. |
| `MII-IG-Meta/Technische-Implementierung/Index.page.md` | `RETIRED` | Contains only a Simplifier folder-index directive and no narrative. |
| `MII-IG-Meta/Technische-Implementierung/CodeSystem-MII-Standorte.page.md` | `input/intro-notes/CodeSystem-mii-cs-meta-diz-standorte-intro.md` | Narrative for one CodeSystem. |
| `MII-IG-Meta/Technische-Implementierung/Extension-Lizenzbedingungen.page.md` | `input/intro-notes/StructureDefinition-mii-ex-meta-license-codeable-intro.md` | Narrative for one Extension; the generated `code-systems.md` route is semantically wrong. |
| `MII-IG-Meta/Technische-Implementierung/Profil-SearchParameter.page.md` | `input/intro-notes/StructureDefinition-mii-pr-meta-searchparameter-intro.md` | Narrative for one profile. |
| `MII-IG-Meta/Technische-Implementierung/Liste-Kerndatensatz-Suchparameter/Index.page.md` | `input/pagecontent/search-parameters.md` | Catalogue-level SearchParameter guidance. |
| `input/pagecontent/index.md` (`index.md` in the map) | `RETIRED` | Obsolete one-line starter stub, superseded by the authoritative guide index. |
| `ImplementationGuide-Common/**` | `RETIRED` | Shared Simplifier styles, superseded by the Publisher template; retain files until Gate D. |
| `MedizininformatikInitiative-ImplementationGuide-Template/**` | `RETIRED` | Obsolete generic Simplifier guide tree; retain files until Gate D. |

## Recommended optional-page decisions (M9)

| Page | Evidence | Recommendation |
| --- | --- | --- |
| Extensions | 1 generated Extension | Keep |
| Search Parameters | 170 generated SearchParameters | Keep |
| Code Systems | 1 generated CodeSystem | Keep |
| Operations | 0 generated Operations | Remove |
| Value Sets | 0 generated ValueSets | Remove |
| Researcher Guidance | No source research-specific narrative | Remove |
| Metadata Overview | No source metadata narrative; Gate A also approved omitting two metadata extensions | Remove |

## Recommended Security and Privacy decision (M11)

The source has no module-specific privacy narrative. Adopt the scaffold's
documented default text in both languages and remove the illustrative Person
example and TODO block.

## Late Gate A addendum: CapabilityStatement

The source contains no CapabilityStatement. The migration procedure requires a
proposal rather than leaving the mandatory page as an unexplained stub.

Recommended: generate a clearly marked draft CapabilityStatement from the
existing artifacts only:

- 29 distinct FHIR resource types named by the 170 SearchParameters;
- all 170 SearchParameter definitions under their declared base resource;
- the `mii-pr-meta-searchparameter` supported profile on resource type
  `SearchParameter`;
- `status = draft`, with provenance text saying it is migration-generated.

This would be an additive proposal, not a claim that the source supported a
server capability. It remains a review item and may be amended or removed.

## Approval response

The reviewed map is now the binding narrative contract.
