<!-- markdownlint-disable MD041 -->

Diese Seite beschreibt die maschinenlesbaren Metadaten des Meta-Moduls. Die
Metadaten unterstützen Auffindbarkeit, Validierung, Governance, Versionierung
und Nachnutzung der FHIR-Artefakte des Leitfadens.

### CRMI-Konformität

Der erzeugte ImplementationGuide beansprucht die CRMI-Profile für
verteilbare, veröffentlichbare und maschinenlesbare ImplementationGuides aus
[CRMI STU2](https://hl7.org/fhir/uv/crmi/STU2/en/). Er deklariert folgende
Metadaten:

| Metadatum | Wert oder Verwendung |
| --- | --- |
| Freigabedatum | `2026-08-31` |
| Geltungszeitraum | beginnt `2027` |
| Wissensfähigkeit | `shareable`, `publishable` |
| Paketquelle | `de.medizininformatikinitiative.kerndatensatz.meta` in `2027.0.0-ballot.rc1` |
| Versionsalgorithmus | `semver`, angewendet auf die SemVer-kompatible CalVer-Darstellung |
| Zweck und Verwendung | maschinenlesbare Publikation, Auffindbarkeit, Validierung, Versionierung und konsistente Anwendung des Meta-Moduls |
| Thema | NCI Thesaurus `C80260` |
| Beitragende | Autor, Redaktion, Reviewer und befürwortende Gremien als Kontaktdaten |

Die IG-seitige `artifact-versionPolicy` und die modulspezifische
maschinenlesbare Lizenz-Extension sind nicht deklariert. Die Lizenz des
Leitfadens bleibt `CC-BY-4.0`; die kanonischen Artefakte des Moduls behalten ihre
bisherigen maschinenlesbaren Lizenzmetadaten.

### Abdeckung auf Ressourcenebene

Das Meta-Modul wendet das CRMI-Publikationsmuster des Basismoduls auf die
Ressourcentypen an, die in beiden Modulen vorkommen:

| Meta-Artefakt | Angewendete CRMI-Metadaten |
| --- | --- |
| MII-SearchParameter-Profil | CRMI-Profile für verteilbare und veröffentlichbare StructureDefinitions; Wissensfähigkeiten; Versionsalgorithmus und Paket-Versionsrichtlinie; Paketquelle; Nutzungshinweis; Freigabe- und Geltungsdatum; Thema; Beitragende; CRMI-Lizenz |
| Veraltete MII-Lizenz-Extension | Dieselben StructureDefinition-Metadaten, mit einem Nutzungshinweis auf die CRMI License Extension |
| MII-Standorte-CodeSystem | CRMI-Profile für verteilbare und veröffentlichbare CodeSystems; Wissensfähigkeiten; Versionsalgorithmus und Paket-Versionsrichtlinie; Paketquelle; Freigabe- und Geltungsdatum; Thema; Beitragende; CRMI-Lizenz |
| Meta-CapabilityStatement | CRMI-Profile für verteilbare und veröffentlichbare CapabilityStatements; Wissensfähigkeiten; Versionsalgorithmus und Paket-Versionsrichtlinie; Paketquelle; entwurfsspezifischer Nutzungshinweis; Freigabe- und Geltungsdatum; Thema; Beitragende; CRMI-Lizenz |
| SearchParameter-Ressourcen | MII-SearchParameter-Profil; CRMI-Lizenz; Versionsalgorithmus |
| SearchParameter-Collection- und Transaction-Bundles | Paketquelle |
| Expansionsmanifest | CRMI Manifest Parameters-Profil |

Das Basismodul versieht außerdem logische Modelle und ValueSets mit
CRMI-Metadaten. Meta definiert keine Ressourcen dieser Typen; daher werden hier
keine klinischen oder terminologischen Artefakte des Basismoduls dupliziert.
SearchParameter-Ressourcen sind dagegen Meta-spezifisch; das Basismodul enthält
keine unmittelbar vergleichbare SearchParameter-Implementierung.

### Manifest und Reproduzierbarkeit

Kanonische Referenzen werden mit `pin-canonicals: pin-all` gepinnt. Die
Terminologie-Expansion verwendet das
[Meta-Expansionsmanifest](Parameters-mii-param-meta-manifest.html), das aus dem
ImplementationGuide über `cqf-expansionParameters` verlinkt und über
`path-expansion-params` sowie `pin-manifest` konfiguriert ist.

Das Manifest pinnt derzeit:

* SNOMED CT International Edition `20260701`;
* `artifact-version-policy-codes` Version `3.0.0`.

### Metadaten prüfen und nachnutzen

Die vollständigen maschinenlesbaren Metadaten stehen in den erzeugten JSON- und
XML-Darstellungen der Artefakte sowie im
[herunterladbaren FHIR-Paket](downloads.html). Die menschenlesbare Seite
[Versionierung](version-history.html) erläutert das Release-Versionsschema.
