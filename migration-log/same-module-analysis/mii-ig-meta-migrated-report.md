# IG-Statistik — migrated

_Modus: `static` · Stand: 2026-08-31T14:10:14Z · Commit: `1db2e53`_

## Kennzahlen-Überblick

### Artefakte (Σ 176 publiziert)

_Hier wird gezählt, wie viele FHIR-Bausteine (Profile, Extensions, ValueSets usw.) der IG je Typ definiert._

<div align="center">

```mermaid
%%{init: {'theme':'base','themeVariables':{"pie1": "#4E79A7", "pie2": "#F28E2B", "pie3": "#59A14F", "pie4": "#E15759", "pie5": "#76B7B2", "pie6": "#EDC948", "pieOpacity": "1", "pieSectionTextColor": "#1A1A1A", "pieTitleTextSize": "18px"}}}%%
pie showData title Artefakte
    "searchparameters" : 167
    "examples" : 5
    "profiles" : 1
    "extensions" : 1
    "codesystems" : 1
    "capabilitystatements" : 1
```

</div>

<div align="center">

| Typ | Anzahl |
|---|---|
| searchparameters | 167 |
| examples | 5 |
| profiles | 1 |
| extensions | 1 |
| codesystems | 1 |
| capabilitystatements | 1 |

</div>

**⚠ Gegenprobe generiert-vs-deklariert** (`fsh-generated/resources`): `examples` deklariert 5 / generiert 2; `searchparameters` deklariert 167 / generiert 170 — für Seiten-/Menü-Entscheidungen ist die generierte resourceType-Zählung maßgeblich; die FSH-Deklarationstypisierung kennt nur InstanceOf-Namen.

_Interne FSH-Konstrukte (nicht in Σ): 64 rulesets, 1 invariants._

### Plattform-Direktiven — Σ 48 (unbekannt: 1)

_Dieser Abschnitt listet die plattformspezifischen Platzhalter in den Erklärseiten, die ein generischer IG Publisher nicht versteht und die daher umgesetzt werden müssen._

<div align="center">

```mermaid
%%{init: {'theme':'base','themeVariables':{"pie1": "#4E79A7", "pie2": "#F28E2B", "pie3": "#59A14F", "pie4": "#E15759", "pie5": "#76B7B2", "pie6": "#EDC948", "pie7": "#B07AA1", "pie8": "#FF9DA7", "pie9": "#9C755F", "pie10": "#BAB0AC", "pie11": "#86BCB6", "pieOpacity": "1", "pieSectionTextColor": "#1A1A1A", "pieTitleTextSize": "18px"}}}%%
pie showData title Direktiven
    "tabs" : 16
    "fql-at" : 8
    "page-title" : 7
    "pagelink" : 4
    "index-root" : 2
    "render-resource" : 2
    "tree" : 2
    "xml" : 2
    "json" : 2
    "link" : 2
    "fql-tag" : 1
```

</div>

<div align="center">

| Direktive | Anzahl |
|---|---|
| tabs | 16 |
| fql-at | 8 |
| page-title | 7 |
| pagelink | 4 |
| index-root | 2 |
| render-resource | 2 |
| tree | 2 |
| xml | 2 |
| json | 2 |
| link | 2 |
| fql-tag | 1 |

</div>

## Inhaltsumfang & Repo-Hygiene

_Linguistische Kennzahlen zum Textumfang (Wörter je Seite, Durchschnitt) sowie Hinweise auf inhaltliche Dopplungen und nicht referenzierte Dateien (Dead-Code-Analogie) - hilft, Umfang und Aufräumpotenzial einzuschätzen._

<div align="center">

| Kennzahl | Wert |
|---|---|
| Inhalts-Seiten | 29 |
| Wörter gesamt | 8142 |
| Ø Wörter / Seite | 280,8 |
| Median Wörter / Seite | 119 |
| kürzeste / längste Seite | 28 / 2867 Wörter |
| doppelte Inhaltsblöcke | 3 |
| identische Seiten (Gruppen) | 0 |
| Bilder nicht referenziert | 0 von 0 |
| Beispiele nicht in Narrativen | 0 von 5 |

</div>

_Heuristik: 'nicht referenziert' = Dateiname/Artefaktname kommt in keiner Erklärseite vor. Kein Beweis für Ungenutztheit (Referenz kann über Konfiguration/Build erfolgen)._

## Reife-Komponenten (gezählt)

_Gezählte Reife-Komponenten nebeneinander: Status, Vollständigkeit der Dokumentation, Beispiel-Abdeckung der Profile und Governance-Merkmale. Bewusst kein verdichteter Score und kein Freigabe-Urteil — die Einordnung bleibt menschlich._

<div align="center">

| Komponente | Wert |
|---|---|
| Status | active |
| Doku-Vollständigkeit (Inhalt vs. Stubs) | 71 % |
| Beispiel-Abdeckung Profile | 100 % (1/1) |
| Governance (CI · ig.ini · publication · devcontainer) | 100/100 |

</div>

## Strategie: Wiederverwendung, Lock-in & Zukunftssicherheit

_Strategische Kennzahlen: Bindung an die Quellplattform (Lock-in), Anteil standardisierter Terminologie, Wiederverwendung externer Bausteine und Zukunftssicherheit (FHIR-Version, Pflege-Aktivität)._

<div align="center">

| Kennzahl | Wert |
|---|---|
| Hersteller-Lock-in | 20/100 (gering) · 1,7 Direktiven/Seite |
| Standard-Terminologie-Anteil | 99 % (SNOMED CT, LOINC, ICD-10) |
| Wiederverwendung externer Profile (Parents) | 100 % (1 von 1 Profil-Parents extern; abstrakte LM-Basistypen ausgeschlossen) |
| FHIR-Version | R4 — aktuell verbreitet |
| Dependency-Veraltung | 0 veraltet (Heuristik) |
| Pflege-Kadenz | 60.6 Commits/Jahr · letzter Commit vor 47 Tagen |

</div>

_Lock-in und Standard-Terminologie-Anteil sind grobe Heuristiken aus Textvorkommen. Heuristik aus CalVer-Jahr; exakt nur via Package-Registry (extern)._

## Risiko & Compliance

_Entscheidungsrelevante Risiken für die Freigabe: Terminologie-Lizenzen, unterdrückte Warnungen, Datenschutz-Substanz, Wissenskonzentration (Bus-Faktor) und Kompatibilitätsbruch zur Vorversion._

<div align="center">

| Risiko | Bewertung |
|---|---|
| Terminologie-Lizenz | Lizenzbedarf möglich — SNOMED CT: lizenzpflichtig (Affiliate/Land), LOINC: frei (Registrierung), ICD-10: frei |
| Unterdrückte QA-Warnungen | 8 (davon 0 breit) → gering |
| Datenschutz-Seite (Substanz) | fehlt/nur Stub (0 Wörter) |
| PII-artige Beispieldaten | keine erkannt |
| Bus-Faktor (Wissenskonzentration) | 31 % Top-Autor → gering |
| Breaking-Change-Risiko ggü. Vorversion | — (nur per Build/Vorversions-Diff) |

</div>

## Befunde & Einordnung

_Je Themenbereich der gemessene Befund und eine neutrale Einordnung, was er über den Guide aussagt — keine Handlungs- oder Migrationsanweisungen._

<div align="center">

| Bereich | Befund | Einordnung |
|---|---|---|
| Artefakte (FSH) | 176 publiziert, FSH vorhanden | Zählt die publizierten Konformitätsressourcen und ob FSH-Quelltext vorliegt. FSH-Quellen machen den Bestand direkt les-, diff- und weiterverarbeitbar; ohne sie ist nur das generierte JSON/XML die Quelle. |
| Narrative | 29 Inhalts-Seiten, Format target | Anzahl und Format der Erklärseiten (source = Plattformformat, target = IG-Publisher-Format). Das Format bestimmt, welche Werkzeuge die Seiten unverändert verarbeiten können. |
| Direktiven | 48 (1 unbekannt) | Vorkommen plattformspezifischer Platzhalter/Tags, die nur die Quellplattform interpretiert. Je mehr davon, desto stärker ist die Darstellung an die Plattform gebunden (vgl. Lock-in-Kennzahl). |
| Dependencies | 3 (0 floating) | Deklarierte Paket-Abhängigkeiten und ihr Pinning. Floating-Einträge folgen automatisch neuen Versionen und machen Builds weniger reproduzierbar — der Wert zeigt, wie reproduzierbar der aktuelle Stand ist. |
| Mehrsprachigkeit | FSH-Übersetzung ja, Supplements 0 | Ob Übersetzungen in den FSH-Quellen (translation-Extensions) und/oder als Publisher-Supplements vorliegen. Die beiden Mechanismen decken unterschiedliche Textarten ab; der Wert zeigt den vorhandenen Stand, nicht den Bedarf. |
| Pflichtseiten | 13/13 im Zielformat | Wie viele Seiten des hinterlegten Pflicht-Rasters (mandatory_pages in dieser Datei) im Zielformat existieren. Die Aussagekraft hängt vom Raster ab: Nutzt ein Guide legitim ein anderes Seitenraster, wird das Raster korrigiert — nicht die Seiten als fehlend gewertet. |
| QC-Regeln | 14 definiert | Anzahl der im Projekt definierten Qualitätsregeln (qc/custom.rules.yaml). Statisch wird nur die Definition gezählt; Verletzungen zeigt erst der Qualitätslauf eines Builds. |
| Metadaten/Config | id mii-ig-meta, v2027.0.0-ballot.rc3 | Kern-Identität (id, Version) wie in sushi-config.yaml/package.json deklariert; die vollständigen Identitätsfelder stehen im Anhang. |

</div>

## Direktiven-Mapping (Detail)

_Dieser Abschnitt ordnet jedem Direktiven-Typ sein dokumentiertes Standard-Gegenstück im IG-Publisher-Format zu — eine Faktenreferenz, kein Arbeitsauftrag; sortiert nach Häufigkeit._

<div align="center">

| Direktive | Anzahl | Was es tut | Standard-Gegenstück (IG Publisher) |
|---|---|---|---|
| tabs | 16 | Gruppiert mehrere Inhalte (z.B. Darstellung, XML, JSON) in umschaltbare Reiter. | Die einzelnen Reiterinhalte durch die jeweils passenden generierten Anzeige-Fragmente (Struktur, XML, JSON) ersetzen; eine eigene Reiter-Mechanik ist meist nicht nötig. |
| fql-at | 8 | Markiert einen Abfrage-Codeblock in besonderer Schreibweise (mit @-Präfix). | Wie einen normalen Abfrageblock behandeln und durch ein generiertes Tabellen-Fragment oder eine statische Tabelle ersetzen. |
| page-title | 7 | Setzt an dieser Stelle den Titel der Seite, der aus den Seiteneinstellungen gezogen wird. | Entfällt ersatzlos - Seitentitel und Überschrift steuert man zentral über die Seiten- und Menükonfiguration. |
| pagelink | 4 | Erzeugt einen Verweis auf eine andere Seite oder ein Artefakt anhand eines Namens-Hinweises. | Durch einen normalen Markdown-Link auf die generierte Artefaktseite ersetzen (Form Typ-id.html); der Artefaktname wird in die kleingeschriebene id umgesetzt. |
| index-root | 2 | Erzeugt an dieser Stelle ein automatisches Inhaltsverzeichnis bzw. die Wurzel der Navigationsstruktur. | Entfällt - Navigation und Inhaltsverzeichnis erzeugt der IG Publisher selbst aus der konfigurierten Seitenstruktur. |
| render-resource | 2 | Rendert eine vollständige FHIR-Ressource (z.B. ein CapabilityStatement) in die Seite hinein. | Meist entfernen, da der IG Publisher für jedes Artefakt automatisch eine eigene Seite erzeugt; alternativ das passende vorgefertigte Anzeige-Fragment einbinden. |
| tree | 2 | Zeigt die Struktur eines Profils/einer Extension als aufklappbaren Strukturbaum an. | Durch das vom IG Publisher erzeugte Struktur-Fragment ersetzen (Snapshot- oder Differential-Ansicht bzw. Element-Wörterbuch). |
| xml | 2 | Zeigt eine Ressource oder ein Beispiel in XML-Darstellung an. | Durch das vom IG Publisher erzeugte XML-Anzeige-Fragment ersetzen. |
| json | 2 | Zeigt eine Ressource oder ein Beispiel in JSON-Darstellung an. | Durch das vom IG Publisher erzeugte JSON-Anzeige-Fragment ersetzen. |
| link | 2 | Erzeugt einen Verweis auf ein einzelnes Artefakt (z.B. dessen Übersichtsseite). | Durch einen normalen Markdown-Link auf die generierte Artefaktseite ersetzen (Form Typ-id.html). |
| fql-tag | 1 | Öffnet einen Abfrageblock, der eine Tabelle aus FHIR-Inhalten erzeugt. | Bei Elementtabellen eines Profils durch das vorgefertigte Element-Wörterbuch-Fragment ersetzen; reine Metadaten (URL, Status, Version) entfallen (im generierten Kopfbereich vorhanden); sonst statische oder vorlagenbasierte Tabelle. |

</div>

> **1 unbekannte Treffer** ohne bekanntes Standard-Gegenstück – einzeln manuell prüfen (Fundorte im Anhang).

# Anhang: Detailaufschlüsselung

_Im Anhang steht jeder Einzelwert mit seiner Quelle, damit man die Kennzahlen nachvollziehen kann, ohne im Projekt suchen zu müssen._

## Identität & Herkunft

<div align="center">

| Feld | Wert | Quelle |
|---|---|---|
| id | mii-ig-meta | sushi-config.yaml / package.json |
| canonical | https://www.medizininformatik-initiative.de/fhir/modul-meta | sushi-config.yaml / package.json |
| packageId | de.medizininformatikinitiative.kerndatensatz.meta | sushi-config.yaml / package.json |
| name | MII_IG_Meta | sushi-config.yaml / package.json |
| title | MII IG Meta | sushi-config.yaml / package.json |
| version | 2027.0.0-ballot.rc3 | sushi-config.yaml / package.json |
| status | active | sushi-config.yaml / package.json |
| fhirVersion | 4.0.1 | sushi-config.yaml / package.json |
| license | CC-BY-4.0 | sushi-config.yaml / package.json |
| publisher | NUM-DIZ | sushi-config.yaml / package.json |
| calver | True | version-Regex |

</div>

## Dependencies

_Die FHIR-Pakete, auf denen der IG aufbaut, samt Version und ob diese fest oder offen angegeben ist._

<div align="center">

| Package | Version | Pin |
|---|---|---|
| hl7.fhir.uv.crmi | 2.0.0 | gepinnt |
| hl7.terminology.r4 | 7.1.0 | gepinnt |
| hl7.fhir.uv.extensions.r4 | 5.2.0 | gepinnt |

</div>

## Pre-flight (Migration Gate 0)

- Lizenz-Evidenz: sushi-config.yaml/package.json → CC-BY-4.0; LICENSE → Attribution 4.0 International; input/pagecontent/metadata.md → CC-BY-4.0; input/pagecontent/index.md → Creative Commons — **WIDERSPRÜCHLICH**

- Canonical-Raum: 1 außerhalb + 0 id/url-abweichend → special-url-Prognose: 1

- Dependency-Gesundheit: old-style=keine; THO direkt gepinnt=True, Extensions-Pack=True; externe Parents: 0

- Narrative-Quellen: **DUAL** — implementation-guides/ (letzter Commit 2026-04-14T12:24:09+02:00) UND pagecontent+intro-notes (letzter Commit 2025-01-22T15:33:02+01:00); vor der Migration entscheiden, welche Kopie maßgeblich ist (Frische, nicht Rang)

- QA-Baseline: output/qa.json → err=0 warn=269 (Mon, 31 Aug, 2026 16:03:58 +0200)

## Artefakte (Quelle: input/fsh (FSH-Deklarationen))

_Jedes definierte Artefakt mit Typ, Name und Fundort in den Quelldateien._

<div align="center">

| Typ | Name | InstanceOf | Quelle |
|---|---|---|---|
| Instance | mii-cps-meta-server-capabilities | CapabilityStatement | input/fsh/capabilitystatements/mii-cps-meta-server-capabilities.fsh:6 |
| RuleSet | AddAbbreviation |  | input/fsh/codesystems/mii-cs-meta-diz-standorte.fsh:1 |
| RuleSet | AddKonsortium |  | input/fsh/codesystems/mii-cs-meta-diz-standorte.fsh:5 |
| RuleSet | AddUri |  | input/fsh/codesystems/mii-cs-meta-diz-standorte.fsh:9 |
| RuleSet | AddStatus |  | input/fsh/codesystems/mii-cs-meta-diz-standorte.fsh:13 |
| RuleSet | AddDeprecationDate |  | input/fsh/codesystems/mii-cs-meta-diz-standorte.fsh:17 |
| RuleSet | AddRetirementDate |  | input/fsh/codesystems/mii-cs-meta-diz-standorte.fsh:21 |
| RuleSet | AddDatenmanagementstelle |  | input/fsh/codesystems/mii-cs-meta-diz-standorte.fsh:25 |
| RuleSet | AddDiz |  | input/fsh/codesystems/mii-cs-meta-diz-standorte.fsh:29 |
| RuleSet | AddReplaces |  | input/fsh/codesystems/mii-cs-meta-diz-standorte.fsh:33 |
| RuleSet | AddReplacedBy |  | input/fsh/codesystems/mii-cs-meta-diz-standorte.fsh:37 |
| RuleSet | AddTRV |  | input/fsh/codesystems/mii-cs-meta-diz-standorte.fsh:41 |
| CodeSystem | MII_CS_Meta_DIZ_Standorte |  | input/fsh/codesystems/mii-cs-meta-diz-standorte.fsh:45 |
| Extension | MII_EX_Meta_License_Codeable |  | input/fsh/extensions/mii-ex-meta-license-codeable.fsh:1 |
| Invariant | search-param-code-regex |  | input/fsh/invariants/search-param-code.fsh:1 |
| Profile | MII_PR_Meta_SearchParameter |  | input/fsh/profiles/MII_PR_Meta_SearchParameter.fsh:1 |
| RuleSet | SupportResource |  | input/fsh/rulesets/cps-rules.fsh:21 |
| RuleSet | Profile |  | input/fsh/rulesets/cps-rules.fsh:39 |
| RuleSet | SupportProfile |  | input/fsh/rulesets/cps-rules.fsh:44 |
| RuleSet | SupportInteraction |  | input/fsh/rulesets/cps-rules.fsh:50 |
| RuleSet | SupportSearchParam |  | input/fsh/rulesets/cps-rules.fsh:56 |
| RuleSet | SupportSpecialSearchParam |  | input/fsh/rulesets/cps-rules.fsh:64 |
| RuleSet | CRMIVersionPolicyStrict |  | input/fsh/rulesets/crmi.fsh:25 |
| RuleSet | CRMIVersionPolicyStrictInstance |  | input/fsh/rulesets/crmi.fsh:29 |
| RuleSet | CRMICopyrightLabel |  | input/fsh/rulesets/crmi.fsh:39 |
| RuleSet | CRMICopyrightLabelInstance |  | input/fsh/rulesets/crmi.fsh:43 |
| RuleSet | CRMIApprovalDate |  | input/fsh/rulesets/crmi.fsh:50 |
| RuleSet | CRMIApprovalDateInstance |  | input/fsh/rulesets/crmi.fsh:54 |
| RuleSet | CRMIArtifactTopic |  | input/fsh/rulesets/crmi.fsh:64 |
| RuleSet | CRMIArtifactTopicInstance |  | input/fsh/rulesets/crmi.fsh:68 |
| RuleSet | CRMIArtifactContributors |  | input/fsh/rulesets/crmi.fsh:78 |
| RuleSet | CRMIArtifactContributorsInstance |  | input/fsh/rulesets/crmi.fsh:101 |
| RuleSet | CRMIShareableStructureDefinition |  | input/fsh/rulesets/crmi.fsh:126 |
| RuleSet | CRMIPublishableStructureDefinition |  | input/fsh/rulesets/crmi.fsh:129 |
| RuleSet | CRMIKnowledgeCapabilitiesStructureDefinition |  | input/fsh/rulesets/crmi.fsh:132 |
| RuleSet | CRMIArtifactUsageLogicalModel |  | input/fsh/rulesets/crmi.fsh:138 |
| RuleSet | CRMIArtifactUsageProfile |  | input/fsh/rulesets/crmi.fsh:142 |
| RuleSet | CRMIArtifactUsageExtension |  | input/fsh/rulesets/crmi.fsh:146 |
| RuleSet | CRMIShareableCapabilityStatement |  | input/fsh/rulesets/crmi.fsh:152 |
| RuleSet | CRMIPublishableCapabilityStatement |  | input/fsh/rulesets/crmi.fsh:155 |
| RuleSet | CRMIKnowledgeCapabilitiesCapabilityStatement |  | input/fsh/rulesets/crmi.fsh:158 |
| RuleSet | CRMIArtifactUsageCapabilityStatement |  | input/fsh/rulesets/crmi.fsh:164 |
| RuleSet | CRMIShareableCodeSystem |  | input/fsh/rulesets/crmi.fsh:170 |
| RuleSet | CRMIPublishableCodeSystem |  | input/fsh/rulesets/crmi.fsh:173 |
| RuleSet | CRMIKnowledgeCapabilitiesCodeSystem |  | input/fsh/rulesets/crmi.fsh:176 |
| RuleSet | CRMIKnowledgeCapabilitiesCodeSystemPublishable |  | input/fsh/rulesets/crmi.fsh:182 |
| RuleSet | CRMIShareableValueSet |  | input/fsh/rulesets/crmi.fsh:188 |
| RuleSet | CRMIPublishableValueSet |  | input/fsh/rulesets/crmi.fsh:191 |
| RuleSet | CRMIComputableValueSet |  | input/fsh/rulesets/crmi.fsh:194 |
| RuleSet | CRMIKnowledgeCapabilitiesValueSet |  | input/fsh/rulesets/crmi.fsh:197 |
| RuleSet | ExtensionContext |  | input/fsh/rulesets/extension-context.fsh:1 |
| RuleSet | LicenseCodeableCCBY40 |  | input/fsh/rulesets/license-terms.fsh:1 |
| RuleSet | LicenseCodeableCCBY40Instance |  | input/fsh/rulesets/license-terms.fsh:5 |
| RuleSet | SnomedLicense |  | input/fsh/rulesets/license.fsh:12 |
| RuleSet | MetaProfile |  | input/fsh/rulesets/meta-profile.fsh:13 |
| RuleSet | Publisher |  | input/fsh/rulesets/publisher.fsh:1 |
| RuleSet | SP_Publisher |  | input/fsh/rulesets/publisher.fsh:6 |
| RuleSet | SP_Profile |  | input/fsh/rulesets/searchparam-profile.fsh:1 |
| RuleSet | TestDataLabel |  | input/fsh/rulesets/test-data-label.fsh:14 |
| RuleSet | Translation |  | input/fsh/rulesets/translation.fsh:27 |
| RuleSet | AddSnomedCodingTranslation |  | input/fsh/rulesets/translation.fsh:38 |
| RuleSet | AddIcd10CodingTranslation |  | input/fsh/rulesets/translation.fsh:46 |
| RuleSet | AddAlphaIdCodingTranslation |  | input/fsh/rulesets/translation.fsh:54 |
| RuleSet | AddOrphaCodingTranslation |  | input/fsh/rulesets/translation.fsh:62 |
| RuleSet | AddOpsCodingTranslation |  | input/fsh/rulesets/translation.fsh:70 |
| RuleSet | Version |  | input/fsh/rulesets/version.fsh:2 |
| RuleSet | PR_CS_VS_Version |  | input/fsh/rulesets/version.fsh:5 |
| Instance | mii-sp-meta-supporting-info | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:1 |
| Instance | mii-sp-meta-description | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:21 |
| Instance | mii-sp-meta-body-structure-location-qualifier | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:44 |
| Instance | mii-sp-meta-composition-section-title | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:70 |
| Instance | mii-sp-meta-composition-section-author | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:91 |
| Instance | mii-sp-meta-diagnostic-report-conclusion | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:111 |
| Instance | mii-sp-meta-imaging-study-modality-body-site | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:133 |
| Instance | mii-sp-meta-imaging-study-bildgebungsgrund | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:155 |
| Instance | mii-sp-meta-imaging-study-modality | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:176 |
| Instance | mii-sp-meta-reason-reference | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:201 |
| Instance | mii-sp-meta-imaging-study-number-series | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:223 |
| Instance | mii-sp-meta-imaging-study-number-instances | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:246 |
| Instance | mii-sp-meta-imaging-study-procedure-reference | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:269 |
| Instance | mii-sp-meta-imaging-study-series-convolutional-kernel | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:288 |
| Instance | mii-sp-meta-imaging-study-series-ctdi-volume | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:309 |
| Instance | mii-sp-meta-imaging-study-series-exposure-time | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:332 |
| Instance | mii-sp-meta-imaging-study-series-exposure | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:355 |
| Instance | mii-sp-meta-imaging-study-series-xray-tube-current | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:378 |
| Instance | mii-sp-meta-imaging-study-series-kvp | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:401 |
| Instance | mii-sp-meta-imaging-study-series-view-position | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:424 |
| Instance | mii-sp-meta-imaging-study-series-magnetic-field-strength | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:449 |
| Instance | mii-sp-meta-imaging-study-series-scanning-sequence | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:472 |
| Instance | mii-sp-meta-imaging-study-series-scanning-sequence-variant | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:497 |
| Instance | mii-sp-meta-imaging-study-series-echo-time | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:522 |
| Instance | mii-sp-meta-imaging-study-series-repetition-time | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:545 |
| Instance | mii-sp-meta-imaging-study-series-inversion-time | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:568 |
| Instance | mii-sp-meta-imaging-study-series-flip-angle | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:591 |
| Instance | mii-sp-meta-imaging-study-series-radiopharmaceutical | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:614 |
| Instance | mii-sp-meta-imaging-study-series-radionuclide | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:639 |
| Instance | mii-sp-meta-imaging-study-series-tracer-exposure-time | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:664 |
| Instance | mii-sp-meta-imaging-study-series-units | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:687 |
| Instance | mii-sp-meta-imaging-study-series-radionuclide-total-dose | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:712 |
| Instance | mii-sp-meta-imaging-study-series-radionuclide-half-life | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:735 |
| Instance | mii-sp-meta-imaging-study-series-series-type | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:758 |
| Instance | mii-sp-meta-imaging-study-series-transducer-type | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:783 |
| Instance | mii-sp-meta-imaging-study-series-transducer-frequency | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:808 |
| Instance | mii-sp-meta-imaging-study-series-pulse-frequency | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:831 |
| Instance | mii-sp-meta-imaging-study-series-ultrasound-color | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:854 |
| Instance | mii-sp-meta-imaging-study-series-contrast-bolus | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:879 |
| Instance | mii-sp-meta-imaging-study-series-contrast-bolus-details | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:904 |
| Instance | mii-sp-meta-imaging-study-series-slice-thickness | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:924 |
| Instance | mii-sp-meta-imaging-study-series-number | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:947 |
| Instance | mii-sp-meta-imaging-study-series-laterality | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:970 |
| Instance | mii-sp-meta-imaging-study-series-started | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:995 |
| Instance | mii-sp-meta-imaging-study-instance-pixel-x | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:1013 |
| Instance | mii-sp-meta-imaging-study-instance-pixel-y | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:1036 |
| Instance | mii-sp-meta-imaging-study-instance-slice-thickness | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:1059 |
| Instance | mii-sp-meta-imaging-study-instance-image-type | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:1082 |
| Instance | mii-sp-meta-imaging-study-instance-burned-in-annotation | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:1107 |
| Instance | mii-sp-meta-imaging-study-instance-number | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:1132 |
| Instance | mii-sp-meta-observation-series-uid | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:1156 |
| Instance | mii-sp-meta-observation-sop-instance-uid | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:1181 |
| Instance | mii-sp-meta-observation-body-structure | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:1206 |
| Instance | mii-sp-meta-read-proc-report | SearchParameter | input/fsh/searchparameters/mii-sp-meta-bildgebung.fsh:1226 |
| RuleSet | AddTransactionEntry |  | input/fsh/searchparameters/mii-sp-meta-bundle.fsh:1 |
| RuleSet | AddCollectionEntry |  | input/fsh/searchparameters/mii-sp-meta-bundle.fsh:7 |
| Instance | mii-exa-meta-searchparam-transaction-bundle | Bundle | input/fsh/searchparameters/mii-sp-meta-bundle.fsh:11 |
| Instance | mii-exa-meta-searchparam-collection-bundle | Bundle | input/fsh/searchparameters/mii-sp-meta-bundle.fsh:201 |
| Instance | mii-sp-meta-condition-icd10gm-diagnosesicherheit | SearchParameter | input/fsh/searchparameters/mii-sp-meta-condition-icd10gm-diagnosesicherheit.fsh:1 |
| Instance | mii-sp-meta-condition-icd10gm-mehrfachcodierung | SearchParameter | input/fsh/searchparameters/mii-sp-meta-condition-icd10gm-mehrfachcodierung.fsh:1 |
| Instance | mii-sp-meta-condition-icd10gm-seitenlokalisation | SearchParameter | input/fsh/searchparameters/mii-sp-meta-condition-icd10gm-seitenlokalisation.fsh:1 |
| Instance | mii-sp-meta-consent-policyuri | SearchParameter | input/fsh/searchparameters/mii-sp-meta-consent-policyuri.fsh:1 |
| Instance | mii-sp-meta-consent-provisioncode | SearchParameter | input/fsh/searchparameters/mii-sp-meta-consent-provisioncode.fsh:1 |
| Instance | mii-sp-meta-consent-provisioncodeperiod | SearchParameter | input/fsh/searchparameters/mii-sp-meta-consent-provisioncodeperiod.fsh:1 |
| Instance | mii-sp-meta-consent-provisioncodetype | SearchParameter | input/fsh/searchparameters/mii-sp-meta-consent-provisioncodetype.fsh:1 |
| Instance | mii-sp-meta-consent-provisionperiod | SearchParameter | input/fsh/searchparameters/mii-sp-meta-consent-provisionperiod.fsh:1 |
| Instance | mii-sp-meta-consent-provisiontype | SearchParameter | input/fsh/searchparameters/mii-sp-meta-consent-provisiontype.fsh:1 |
| Instance | mii-sp-meta-device-property-type | SearchParameter | input/fsh/searchparameters/mii-sp-meta-device-property-type.fsh:1 |
| Instance | mii-sp-meta-devicemetric-source | SearchParameter | input/fsh/searchparameters/mii-sp-meta-devicemetric-source.fsh:1 |
| Instance | mii-sp-meta-dokument-documentreference-attachment-creation | MII_PR_Meta_SearchParameter | input/fsh/searchparameters/mii-sp-meta-dokument.fsh:1 |
| Instance | mii-sp-meta-dokument-documentreference-doc-status | MII_PR_Meta_SearchParameter | input/fsh/searchparameters/mii-sp-meta-dokument.fsh:19 |
| Instance | mii-sp-meta-dokument-documentreference-nlp-processing-status | MII_PR_Meta_SearchParameter | input/fsh/searchparameters/mii-sp-meta-dokument.fsh:37 |
| Instance | mii-sp-meta-encounter-aufnahmegrund-ersteundzweitestelle | SearchParameter | input/fsh/searchparameters/mii-sp-meta-encounter-aufnahmegrund.fsh:1 |
| Instance | mii-sp-meta-encounter-aufnahmegrund-drittestelle | SearchParameter | input/fsh/searchparameters/mii-sp-meta-encounter-aufnahmegrund.fsh:18 |
| Instance | mii-sp-meta-encounter-aufnahmegrund-viertestelle | SearchParameter | input/fsh/searchparameters/mii-sp-meta-encounter-aufnahmegrund.fsh:35 |
| Instance | mii-sp-meta-encounter-diagnosis-use | SearchParameter | input/fsh/searchparameters/mii-sp-meta-encounter-diagnosis-use.fsh:1 |
| Instance | mii-sp-meta-encounter-entlassungsgrund-ersteundzweitestelle | SearchParameter | input/fsh/searchparameters/mii-sp-meta-encounter-entlassungsgrund.fsh:1 |
| Instance | mii-sp-meta-encounter-entlassungsgrund-drittestelle | SearchParameter | input/fsh/searchparameters/mii-sp-meta-encounter-entlassungsgrund.fsh:18 |
| Instance | mii-sp-meta-encounter-hospitalization-admitsource | SearchParameter | input/fsh/searchparameters/mii-sp-meta-encounter-hospitalization-admitsource.fsh:1 |
| Instance | mii-sp-meta-encounter-location-physical-type | SearchParameter | input/fsh/searchparameters/mii-sp-meta-encounter-location-physical-type.fsh:1 |
| Instance | mii-sp-meta-encounter-servicetype | SearchParameter | input/fsh/searchparameters/mii-sp-meta-encounter-servicetype.fsh:1 |
| Instance | mii-sp-meta-medication-ingredient-strength-numerator | SearchParameter | input/fsh/searchparameters/mii-sp-meta-medication.fsh:1 |
| Instance | mii-sp-meta-medication-ingredient-strength-denominator | SearchParameter | input/fsh/searchparameters/mii-sp-meta-medication.fsh:24 |
| Instance | mii-sp-meta-medication-ingredient-strength | SearchParameter | input/fsh/searchparameters/mii-sp-meta-medication.fsh:47 |
| Instance | mii-sp-meta-medication-reasonreference | SearchParameter | input/fsh/searchparameters/mii-sp-meta-medication.fsh:69 |
| Instance | mii-sp-meta-medication-dosage-site | SearchParameter | input/fsh/searchparameters/mii-sp-meta-medication.fsh:91 |
| Instance | mii-sp-meta-medication-dosage-route | SearchParameter | input/fsh/searchparameters/mii-sp-meta-medication.fsh:116 |
| Instance | mii-sp-meta-medication-dosage-doserange-low | SearchParameter | input/fsh/searchparameters/mii-sp-meta-medication.fsh:141 |
| Instance | mii-sp-meta-medication-dosage-doserange-high | SearchParameter | input/fsh/searchparameters/mii-sp-meta-medication.fsh:165 |
| Instance | mii-sp-meta-medication-dosage-doserange | SearchParameter | input/fsh/searchparameters/mii-sp-meta-medication.fsh:189 |
| Instance | mii-sp-meta-medication-dosage-dosequantity | SearchParameter | input/fsh/searchparameters/mii-sp-meta-medication.fsh:212 |
| Instance | mii-sp-meta-medication-dosage-raterange-low | SearchParameter | input/fsh/searchparameters/mii-sp-meta-medication.fsh:237 |
| Instance | mii-sp-meta-medication-dosage-raterange-high | SearchParameter | input/fsh/searchparameters/mii-sp-meta-medication.fsh:261 |
| Instance | mii-sp-meta-medication-dosage-raterange | SearchParameter | input/fsh/searchparameters/mii-sp-meta-medication.fsh:285 |
| Instance | mii-sp-meta-medication-dosage-ratequantity | SearchParameter | input/fsh/searchparameters/mii-sp-meta-medication.fsh:308 |
| Instance | mii-sp-meta-medication-list-mode | SearchParameter | input/fsh/searchparameters/mii-sp-meta-medication.fsh:333 |
| Instance | mii-sp-meta-medication-dosage-rateratio-numerator | SearchParameter | input/fsh/searchparameters/mii-sp-meta-medication.fsh:351 |
| Instance | mii-sp-meta-medication-dosage-rateratio-denominator | SearchParameter | input/fsh/searchparameters/mii-sp-meta-medication.fsh:376 |
| Instance | mii-sp-meta-medication-dosage-rateratio | SearchParameter | input/fsh/searchparameters/mii-sp-meta-medication.fsh:401 |
| Instance | mii-sp-meta-medication-partof | SearchParameter | input/fsh/searchparameters/mii-sp-meta-medication.fsh:425 |
| Instance | mii-sp-meta-servicerequest-reasoncode | SearchParameter | input/fsh/searchparameters/mii-sp-meta-molgen.fsh:1 |
| Instance | mii-sp-meta-servicerequest-reasonreference | SearchParameter | input/fsh/searchparameters/mii-sp-meta-molgen.fsh:19 |
| Instance | mii-sp-meta-task-reasoncode | SearchParameter | input/fsh/searchparameters/mii-sp-meta-molgen.fsh:41 |
| Instance | mii-sp-meta-task-reasonreference | SearchParameter | input/fsh/searchparameters/mii-sp-meta-molgen.fsh:59 |
| Instance | mii-sp-meta-task-for | SearchParameter | input/fsh/searchparameters/mii-sp-meta-molgen.fsh:78 |
| Instance | mii-sp-meta-familymemberhistory-reasoncode | SearchParameter | input/fsh/searchparameters/mii-sp-meta-molgen.fsh:97 |
| Instance | mii-sp-meta-familymemberhistory-reasonreference | SearchParameter | input/fsh/searchparameters/mii-sp-meta-molgen.fsh:115 |
| Instance | mii-sp-meta-observation-component-interpretation | SearchParameter | input/fsh/searchparameters/mii-sp-meta-observation-component-interpretation.fsh:1 |
| Instance | mii-sp-meta-observation-interpretation | SearchParameter | input/fsh/searchparameters/mii-sp-meta-observation-interpretation.fsh:1 |
| Instance | mii-sp-meta-observation-issued | SearchParameter | input/fsh/searchparameters/mii-sp-meta-observation-issued.fsh:1 |
| Instance | mii-sp-meta-observation-referencerange | SearchParameter | input/fsh/searchparameters/mii-sp-meta-observation-referencerange.fsh:1 |
| Instance | mii-sp-meta-observation-referencerange-low | SearchParameter | input/fsh/searchparameters/mii-sp-meta-observation-referencerange.fsh:23 |
| Instance | mii-sp-meta-observation-referencerange-high | SearchParameter | input/fsh/searchparameters/mii-sp-meta-observation-referencerange.fsh:41 |
| Instance | mii-sp-meta-condition-verification-status | SearchParameter | input/fsh/searchparameters/mii-sp-meta-onko.fsh:4 |
| Instance | mii-sp-meta-condition-evidence-detail | SearchParameter | input/fsh/searchparameters/mii-sp-meta-onko.fsh:21 |
| Instance | mii-sp-meta-observation-hasmember | SearchParameter | input/fsh/searchparameters/mii-sp-meta-onko.fsh:63 |
| Instance | mii-sp-meta-procedure-complication | SearchParameter | input/fsh/searchparameters/mii-sp-meta-onko.fsh:123 |
| Instance | mii-sp-meta-procedure-outcome | SearchParameter | input/fsh/searchparameters/mii-sp-meta-onko.fsh:263 |
| Instance | mii-sp-meta-adverseevent-suspectentity-instance | SearchParameter | input/fsh/searchparameters/mii-sp-meta-onko.fsh:283 |
| Instance | mii-sp-meta-adverseevent-encounter | SearchParameter | input/fsh/searchparameters/mii-sp-meta-onko.fsh:300 |
| Instance | mii-sp-meta-careplan-created | SearchParameter | input/fsh/searchparameters/mii-sp-meta-onko.fsh:347 |
| Instance | mii-sp-meta-careplan-contributor | SearchParameter | input/fsh/searchparameters/mii-sp-meta-onko.fsh:364 |
| Instance | mii-sp-meta-careplan-addresses | SearchParameter | input/fsh/searchparameters/mii-sp-meta-onko.fsh:381 |
| Instance | mii-sp-meta-observation-focus | SearchParameter | input/fsh/searchparameters/mii-sp-meta-onko.fsh:416 |
| Instance | mii-sp-meta-observation-encounter | SearchParameter | input/fsh/searchparameters/mii-sp-meta-onko.fsh:433 |
| Instance | mii-sp-meta-specimen-request | SearchParameter | input/fsh/searchparameters/mii-sp-meta-patho.fsh:4 |
| Instance | mii-sp-meta-specimen-collection-method | SearchParameter | input/fsh/searchparameters/mii-sp-meta-patho.fsh:21 |
| Instance | mii-sp-meta-specimen-collection-body-site | SearchParameter | input/fsh/searchparameters/mii-sp-meta-patho.fsh:38 |
| Instance | mii-sp-meta-specimen-processing-procedure | SearchParameter | input/fsh/searchparameters/mii-sp-meta-patho.fsh:55 |
| Instance | mii-sp-meta-specimen-processing-additive | SearchParameter | input/fsh/searchparameters/mii-sp-meta-patho.fsh:72 |
| Instance | mii-sp-meta-specimen-processing-date | SearchParameter | input/fsh/searchparameters/mii-sp-meta-patho.fsh:89 |
| Instance | mii-sp-meta-specimen-container-additive | SearchParameter | input/fsh/searchparameters/mii-sp-meta-patho.fsh:106 |
| Instance | mii-sp-meta-observation-bodysite | SearchParameter | input/fsh/searchparameters/mii-sp-meta-patho.fsh:126 |
| Instance | mii-sp-meta-observation-value-ratio | SearchParameter | input/fsh/searchparameters/mii-sp-meta-patho.fsh:143 |
| Instance | mii-sp-meta-observation-value-ratio-numerator | SearchParameter | input/fsh/searchparameters/mii-sp-meta-patho.fsh:164 |
| Instance | mii-sp-meta-observation-value-ratio-denominator | SearchParameter | input/fsh/searchparameters/mii-sp-meta-patho.fsh:182 |
| Instance | mii-sp-meta-servicerequest-supportinginfo | SearchParameter | input/fsh/searchparameters/mii-sp-meta-patho.fsh:218 |
| Instance | mii-sp-meta-diagnosticreport-imagingstudy | SearchParameter | input/fsh/searchparameters/mii-sp-meta-patho.fsh:238 |
| Instance | mii-sp-meta-composition-attester-mode | SearchParameter | input/fsh/searchparameters/mii-sp-meta-patho.fsh:259 |
| Instance | mii-sp-meta-composition-custodian | SearchParameter | input/fsh/searchparameters/mii-sp-meta-patho.fsh:276 |
| Instance | mii-sp-meta-composition-relatesto-code | SearchParameter | input/fsh/searchparameters/mii-sp-meta-patho.fsh:293 |
| Instance | mii-sp-meta-media-partof | SearchParameter | input/fsh/searchparameters/mii-sp-meta-patho.fsh:313 |
| Instance | mii-sp-meta-patient-adresszusatz | SearchParameter | input/fsh/searchparameters/mii-sp-meta-patient-adresszusatz.fsh:1 |
| Instance | mii-sp-meta-patient-assignerpid | SearchParameter | input/fsh/searchparameters/mii-sp-meta-patient-assignerpid.fsh:1 |
| Instance | mii-sp-meta-patient-gemeindeschluessel | SearchParameter | input/fsh/searchparameters/mii-sp-meta-patient-gemeindeschluessel.fsh:1 |
| Instance | mii-sp-meta-patient-hausnummer | SearchParameter | input/fsh/searchparameters/mii-sp-meta-patient-hausnummer.fsh:1 |
| Instance | mii-sp-meta-patient-otheramtlich | SearchParameter | input/fsh/searchparameters/mii-sp-meta-patient-otheramtlich.fsh:1 |
| Instance | mii-sp-meta-patient-postfach | SearchParameter | input/fsh/searchparameters/mii-sp-meta-patient-postfach.fsh:1 |
| Instance | mii-sp-meta-patient-prefix | SearchParameter | input/fsh/searchparameters/mii-sp-meta-patient-prefix.fsh:1 |
| Instance | mii-sp-meta-patient-prefixqualifier | SearchParameter | input/fsh/searchparameters/mii-sp-meta-patient-prefixqualifier.fsh:1 |
| Instance | mii-sp-meta-patient-stadtteil | SearchParameter | input/fsh/searchparameters/mii-sp-meta-patient-stadtteil.fsh:1 |
| Instance | mii-sp-meta-patient-strasse | SearchParameter | input/fsh/searchparameters/mii-sp-meta-patient-strasse.fsh:1 |
| Instance | mii-sp-meta-procedure-bodysite | SearchParameter | input/fsh/searchparameters/mii-sp-meta-procedure-bodysite.fsh:1 |
| Instance | mii-sp-meta-procedure-dokumentationsdatum | SearchParameter | input/fsh/searchparameters/mii-sp-meta-procedure-dokumentationsdatum.fsh:1 |
| Instance | mii-sp-meta-procedure-durchfuehrungsabsicht | SearchParameter | input/fsh/searchparameters/mii-sp-meta-procedure-durchfuehrungsabsicht.fsh:1 |
| Instance | mii-sp-meta-procedure-recorder | SearchParameter | input/fsh/searchparameters/mii-sp-meta-procedure-recorder.fsh:1 |
| Instance | mii-sp-meta-procedure-ops-seitenlokalisation | SearchParameter | input/fsh/searchparameters/mii-sp-meta-procedure-seitenlokalisation.fsh:1 |
| Instance | mii-sp-meta-researchsubject-consent | SearchParameter | input/fsh/searchparameters/mii-sp-meta-researchsubject-consent.fsh:1 |
| Instance | mii-sp-meta-specimen-diagnose | SearchParameter | input/fsh/searchparameters/mii-sp-meta-specimen-diagnose.fsh:1 |
| Instance | mii-sp-meta-documentreference-attachment-title | SearchParameter | input/fsh/searchparameters/mii-sp-meta-studie.fsh:1 |
| Instance | mii-sp-meta-documentreference-attachment-size | SearchParameter | input/fsh/searchparameters/mii-sp-meta-studie.fsh:19 |
| Instance | mii-sp-meta-evidencevariable-characteristic-description | SearchParameter | input/fsh/searchparameters/mii-sp-meta-studie.fsh:37 |
| Instance | mii-sp-meta-library-quellregister | SearchParameter | input/fsh/searchparameters/mii-sp-meta-studie.fsh:55 |
| Instance | mii-sp-meta-library-relatedartifact-url | SearchParameter | input/fsh/searchparameters/mii-sp-meta-studie.fsh:73 |
| Instance | mii-sp-meta-researchstudy-arm-name | SearchParameter | input/fsh/searchparameters/mii-sp-meta-studie.fsh:91 |
| Instance | mii-sp-meta-researchstudy-label | SearchParameter | input/fsh/searchparameters/mii-sp-meta-studie.fsh:109 |
| Instance | mii-sp-meta-researchstudy-akronym | SearchParameter | input/fsh/searchparameters/mii-sp-meta-studie.fsh:127 |
| Instance | mii-sp-meta-researchstudy-finanzierung | SearchParameter | input/fsh/searchparameters/mii-sp-meta-studie.fsh:145 |
| Instance | mii-sp-meta-researchstudy-studienregister | SearchParameter | input/fsh/searchparameters/mii-sp-meta-studie.fsh:163 |
| Instance | mii-sp-meta-researchstudy-rekrutierungsstand-datum | SearchParameter | input/fsh/searchparameters/mii-sp-meta-studie.fsh:181 |
| Instance | mii-sp-meta-researchstudy-rekrutierungsstand-genauigkeit | SearchParameter | input/fsh/searchparameters/mii-sp-meta-studie.fsh:199 |
| Instance | mii-sp-meta-researchstudy-rekrutierungsstand | SearchParameter | input/fsh/searchparameters/mii-sp-meta-studie.fsh:217 |
| Instance | mii-sp-meta-researchstudy-rekrutierungsziel | SearchParameter | input/fsh/searchparameters/mii-sp-meta-studie.fsh:235 |
| Instance | mii-sp-meta-researchstudy-rekrutierungsstart | SearchParameter | input/fsh/searchparameters/mii-sp-meta-studie.fsh:253 |

</div>

## Narrative-Seiten (29 Inhalt / 41 gesamt)

_Die Erklärseiten des IG mit Umfang und der Angabe, ob es sich um Inhalts- oder reine Platzhalterseiten handelt._

<div align="center">

| Datei | Wörter | Format | Stub? |
|---|---|---|---|
| input/pagecontent/search-parameters.md | 2867 | target |  |
| input/translations/de/pagecontent/search-parameters.md | 2855 | translation |  |
| implementation-guides/MedizininformatikInitiative-ImplementationGuide-Template/MII-IG-Modul--Modul/TechnischeImplementierung/FHIRProfile/Index.page.md | 657 | source |  |
| implementation-guides/MedizininformatikInitiative-ImplementationGuide-Template/MII-IG-Modul--Modul/TechnischeImplementierung/Conformance.page.md | 494 | source |  |
| input/pagecontent/ImplementationGuide-mii-ig-meta.md | 452 | target |  |
| input/translations/de/pagecontent/ImplementationGuide-mii-ig-meta.md | 373 | translation |  |
| input/pagecontent/downloads.md | 369 | target |  |
| input/pagecontent/index.md | 363 | target |  |
| input/translations/de/pagecontent/index.md | 360 | translation |  |
| input/translations/de/pagecontent/downloads.md | 336 | translation |  |
| input/pagecontent/security-and-privacy.md | 331 | target |  |
| input/pagecontent/metadata.md | 297 | target |  |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Index.page.md | 280 | source |  |
| input/translations/de/pagecontent/security-and-privacy.md | 279 | translation |  |
| input/pagecontent/changes.md | 275 | target |  |
| input/translations/de/pagecontent/metadata.md | 274 | translation |  |
| implementation-guides/MedizininformatikInitiative-ImplementationGuide-Template/MII-IG-Modul--Modul/Index.page.md | 268 | source |  |
| input/translations/de/pagecontent/changes.md | 259 | translation |  |
| input/pagecontent/version-history.md | 234 | target |  |
| input/translations/de/pagecontent/version-history.md | 216 | translation |  |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Release-notes.page.md | 163 | source |  |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Profil-SearchParameter.page.md | 125 | source |  |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Extension-Lizenzbedingungen.page.md | 119 | source |  |
| input/intro-notes/StructureDefinition-mii-pr-meta-searchparameter-intro.md | 113 | intro |  |
| input/pagecontent/guidance.md | 109 | target |  |
| input/translations/de/pagecontent/guidance.md | 104 | translation |  |
| input/translations/de/pagecontent/translationinfo.md | 87 | translation |  |
| input/pagecontent/translationinfo.md | 85 | target |  |
| input/intro-notes/CodeSystem-mii-cs-meta-diz-standorte-intro.md | 80 | intro |  |
| input/pagecontent/capability-statements.md | 79 | target |  |
| input/pagecontent/implementer-guidance.md | 78 | target |  |
| input/translations/de/pagecontent/implementer-guidance.md | 76 | translation |  |
| input/intro-notes/StructureDefinition-mii-ex-meta-license-codeable-intro.md | 75 | intro |  |
| input/pagecontent/profiles.md | 71 | target |  |
| input/translations/de/pagecontent/capability-statements.md | 69 | translation |  |
| input/pagecontent/extensions.md | 66 | target |  |
| input/pagecontent/code-systems.md | 65 | target |  |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Liste-Kerndatensatz-Suchparameter/Index.page.md | 64 | source |  |
| input/translations/de/pagecontent/profiles.md | 63 | translation |  |
| input/translations/de/pagecontent/extensions.md | 62 | translation |  |
| input/translations/de/pagecontent/code-systems.md | 60 | translation |  |
| input/pagecontent/examples.md | 57 | target |  |
| input/translations/de/pagecontent/examples.md | 53 | translation |  |
| input/translations/de/pagecontent/logical-models.md | 42 | translation |  |
| input/pagecontent/logical-models.md | 41 | target |  |
| input/pagecontent/uml-diagrams.md | 41 | target |  |
| input/translations/de/pagecontent/uml-diagrams.md | 41 | translation |  |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/CodeSystem-MII-Standorte.page.md | 35 | source |  |
| implementation-guides/MedizininformatikInitiative-ImplementationGuide-Template/MII-IG-Modul--Modul/Release-notes.page.md | 29 | source |  |
| implementation-guides/MedizininformatikInitiative-ImplementationGuide-Template/MII-IG-Modul--Modul/TechnischeImplementierung/FHIRProfile/FHIR-Profil--Ressourcentyp.page.md | 28 | source |  |
| implementation-guides/MedizininformatikInitiative-ImplementationGuide-Template/MII-IG-Modul--Modul/AnwendungsflleInformationsmodell/BeschreibungvonSzenarienfrdieAnwendungderModule.page.md | 17 | source | ja |
| implementation-guides/MedizininformatikInitiative-ImplementationGuide-Template/MII-IG-Modul--Modul/AnwendungsflleInformationsmodell/Datenstzeinkl.Beschreibungen.page.md | 15 | source | ja |
| implementation-guides/MedizininformatikInitiative-ImplementationGuide-Template/MII-IG-Modul--Modul/BeschreibungModulModul.page.md | 15 | source | ja |
| implementation-guides/MedizininformatikInitiative-ImplementationGuide-Template/MII-IG-Modul--Modul/AnwendungsflleInformationsmodell/Index.page.md | 13 | source | ja |
| implementation-guides/MedizininformatikInitiative-ImplementationGuide-Template/MII-IG-Modul--Modul/TechnischeImplementierung/Terminologien.page.md | 13 | source | ja |
| implementation-guides/MedizininformatikInitiative-ImplementationGuide-Template/MII-IG-Modul--Modul/KontextimGesamtprojektBezgezuanderenModulen.page.md | 12 | source | ja |
| implementation-guides/MedizininformatikInitiative-ImplementationGuide-Template/MII-IG-Modul--Modul/Referenzen.page.md | 12 | source | ja |
| implementation-guides/MedizininformatikInitiative-ImplementationGuide-Template/MII-IG-Modul--Modul/TechnischeImplementierung/Index.page.md | 12 | source | ja |
| implementation-guides/MedizininformatikInitiative-ImplementationGuide-Template/MII-IG-Modul--Modul/AnwendungsflleInformationsmodell/UML.page.md | 7 | source | ja |
| implementation-guides/MedizininformatikInitiative-ImplementationGuide-Template/MII-IG-Modul--Modul/TechnischeImplementierung/CapabilityStatement.page.md | 7 | source | ja |
| implementation-guides/MedizininformatikInitiative-ImplementationGuide-Template/MII-IG-Modul--Modul/HinweisTemplate.page.md | 4 | source | ja |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Index.page.md | 3 | source | ja |

</div>

## Direktiven-Fundstellen

_Jede gefundene Direktive mit genauer Fundstelle und Originaltext zur weiteren Bearbeitung._

<div align="center">

| Fundstelle | Direktive | Text (gekürzt) |
|---|---|---|
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Index.page.md:1 | page-title | # {{page-title}} |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Index.page.md:15 | index-root | {{index:root}} |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Release-notes.page.md:1 | page-title | ## {{page-title}} |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Release-notes.page.md:19 | pagelink | * `Added`: `SearchParameter`-Ressource für Procedure OPS-Seitenlokalisation. Sie |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Release-notes.page.md:25 | pagelink | * `Changed`: `CodeSystem`-Ressource `MII_CS_Meta_DIZ_Standorte` der Medizininfor |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Release-notes.page.md:26 | pagelink | * `Added`: `SearchParameter`-Ressourcen der Erweiterungsmodule Bildgebung und Do |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Release-notes.page.md:33 | pagelink | * SearchParameter-Ressourcen aus Basis- und Erweiterungsmodulen werden nun zentr |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/CodeSystem-MII-Standorte.page.md:9 | fql-tag | <fql> |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/CodeSystem-MII-Standorte.page.md:20 | render-resource | {{render:https://www.medizininformatik-initiative.de/fhir/core/CodeSystem/core-l |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Extension-Lizenzbedingungen.page.md:11 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Extension-Lizenzbedingungen.page.md:24 | tabs | <tabs> |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Extension-Lizenzbedingungen.page.md:25 | tree | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Extension-Lizenzbedingungen.page.md:25 | tabs | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Extension-Lizenzbedingungen.page.md:26 | tabs | <tab title="Beschreibung"> |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Extension-Lizenzbedingungen.page.md:27 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Extension-Lizenzbedingungen.page.md:37 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Extension-Lizenzbedingungen.page.md:48 | tabs | </tab> |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Extension-Lizenzbedingungen.page.md:49 | xml | <tab title="XML">{{xml}}</tab> |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Extension-Lizenzbedingungen.page.md:49 | tabs | <tab title="XML">{{xml}}</tab> |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Extension-Lizenzbedingungen.page.md:50 | json | <tab title="JSON">{{json}}</tab> |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Extension-Lizenzbedingungen.page.md:50 | tabs | <tab title="JSON">{{json}}</tab> |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Extension-Lizenzbedingungen.page.md:51 | link | <tab title="Link">{{link}}</tab> |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Extension-Lizenzbedingungen.page.md:51 | tabs | <tab title="Link">{{link}}</tab> |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Extension-Lizenzbedingungen.page.md:52 | tabs | </tabs> |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Index.page.md:1 | page-title | ## {{page-title}} |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Liste-Kerndatensatz-Suchparameter/Index.page.md:5 | page-title | ## {{page-title}} |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Liste-Kerndatensatz-Suchparameter/Index.page.md:9 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Profil-SearchParameter.page.md:11 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Profil-SearchParameter.page.md:24 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Profil-SearchParameter.page.md:38 | tabs | <tabs> |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Profil-SearchParameter.page.md:39 | tree | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Profil-SearchParameter.page.md:39 | tabs | <tab title="Darstellung">{{tree, buttons}}</tab> |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Profil-SearchParameter.page.md:40 | tabs | <tab title="Beschreibung"> |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Profil-SearchParameter.page.md:41 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Profil-SearchParameter.page.md:51 | fql-at | @``` |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Profil-SearchParameter.page.md:62 | tabs | </tab> |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Profil-SearchParameter.page.md:63 | xml | <tab title="XML">{{xml}}</tab> |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Profil-SearchParameter.page.md:63 | tabs | <tab title="XML">{{xml}}</tab> |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Profil-SearchParameter.page.md:64 | json | <tab title="JSON">{{json}}</tab> |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Profil-SearchParameter.page.md:64 | tabs | <tab title="JSON">{{json}}</tab> |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Profil-SearchParameter.page.md:65 | link | <tab title="Link">{{link}}</tab> |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Profil-SearchParameter.page.md:65 | tabs | <tab title="Link">{{link}}</tab> |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Profil-SearchParameter.page.md:66 | tabs | </tabs> |
| implementation-guides/MedizininformatikInitiative-ImplementationGuide-Template/MII-IG-Modul--Modul/AnwendungsflleInformationsmodell/UML.page.md:1 | page-title | ## {{page-title}} |
| implementation-guides/MedizininformatikInitiative-ImplementationGuide-Template/MII-IG-Modul--Modul/HinweisTemplate.page.md:4 | render-resource | {{render:HereBeDragons}} |
| implementation-guides/MedizininformatikInitiative-ImplementationGuide-Template/MII-IG-Modul--Modul/Index.page.md:19 | index-root | {{index:root}} |
| implementation-guides/MedizininformatikInitiative-ImplementationGuide-Template/MII-IG-Modul--Modul/Release-notes.page.md:1 | page-title | ## {{page-title}} |
| implementation-guides/MedizininformatikInitiative-ImplementationGuide-Template/MII-IG-Modul--Modul/TechnischeImplementierung/CapabilityStatement.page.md:1 | page-title | ## {{page-title}} |
| implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Technische-Implementierung/Index.page.md:3 | UNBEKANNT | {{index:current}} |

</div>

## QC-Regeln (definiert; Quelle: qc/custom.rules.yaml)

_Die im Projekt hinterlegten Qualitätsregeln; ihre Einhaltung wird erst beim Qualitätslauf des Builds geprüft._

<div align="center">

| Name | Aktion | Prüfzweck (status) |
|---|---|---|
| parse-fhir-resources | parse | Checking if all FHIR Resource files can be parsed |
| resource-validation | validate | Validating resources against the FHIR standard and their profiles |
| unique-canonicals | unique | Checking if all StructureDefinitions have a unique canonical |
| — |  |  |
| no-snapshot |  | Checking that structure definitions do not have a pre-generated snapshot |
| valid-ids |  | Check for valid ids |
| valid-names |  |  |
| unique-names |  |  |
| version-filled |  | Checking if all resources have version filled |
| — | Check for valid ids |  |
| naming-convention-id |  | Checking if all resource ids follow the naming convention |
| naming-convention-name |  | Checking if all resource names follow the naming convention |
| naming-convention-title |  | Checking if all resource titles follow the naming convention |
| naming-convention-url |  | Checking if all resource urls follow the naming convention |

</div>

> QC-Verletzungen werden erst beim Qualitätslauf des Builds erhoben (statisch nicht erfasst).

## Mehrsprachigkeit

_Sprachkonfiguration und welche Übersetzungsmittel bereits vorhanden sind._

- Default-Sprache: `None` (Quelle: None) · konfigurierte Sprachen: ['init', 'progress', 'context', 'html', 'tx']
- Übersetzungs-Supplements: 0
- FSH-Translation-Extensions: ja
- Unterdrückte QA-Meldungen (`ignoreWarnings.txt`): 8

## Dopplungen & ungenutzte Dateien

_Konkrete Fundstellen doppelter Inhaltsblöcke sowie Listen nicht referenzierter Bilder und nicht eingebundener Beispiele._

<div align="center">

| Doppelter Inhaltsblock (gekürzt) | Vorkommen |
|---|---|
| copyright hinweis, nutzungshinweise © 2019+ tmf e. v., charlottenstraße 42, 10117 berlin.  | implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Index.page.md · implementation-guides/MedizininformatikInitiative-ImplementationGuide-Template/MII-IG-Modul--Modul/Index.page.md |
| zu den nutzungsrechten der zugrunde liegenden fhir technologie siehe die fhir basis spezif | implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Index.page.md · implementation-guides/MedizininformatikInitiative-ImplementationGuide-Template/MII-IG-Modul--Modul/Index.page.md |
| einige verwendete codesysteme werden von anderen organisationen herausgegeben und gepflegt | implementation-guides/ImplementationGuide-2025/MII-IG-Meta/Index.page.md · implementation-guides/MedizininformatikInitiative-ImplementationGuide-Template/MII-IG-Modul--Modul/Index.page.md |

</div>

# Anhang: Methodik & Metrik-Erklärung

_Beschreibung jeder im Report verwendeten Kennzahl - was sie misst und wie sie ermittelt wird - zur Nachvollziehbarkeit._

<div align="center">

| Kennzahl | Was es misst | Herkunft / Berechnung |
|---|---|---|
| Artefakte (publiziert) | Anzahl der vom IG bereitgestellten FHIR-Konformitätsressourcen je Typ (Profile, Extensions, ValueSets, CodeSystems, Logical Models, CapabilityStatements, Beispiele). | Zählung der Deklarationen in input/fsh (bzw. generierten Ressourcen); interne FSH-Konstrukte (RuleSets/Invarianten/Mappings) separat, nicht im Total. |
| Plattform-/Simplifier-Direktiven | Vorkommen plattformspezifischer Platzhalter in den Erklärseiten, die ein generischer IG Publisher nicht versteht. | Mustererkennung je Direktiven-Typ in den Narrative-Seiten; nicht abgedeckte -> UNBEKANNT. |
| Linguistik (Wörter/Seite) | Textumfang der Inhalts-Seiten als Durchschnitt, Median und Extremwerte - Indikator für Dokumentations- und Übersetzungsumfang. | Wortzählung je Inhalts-Seite (ohne Stubs). |
| Inhaltliche Dopplungen | Identische Textabsätze (>= 12 Wörter) bzw. identische Seiten - Hinweis auf Redundanz/Aufräumpotenzial. | Hash-Vergleich normalisierter Absätze/Dateien. |
| Repo-Hygiene (ungenutzte Dateien) | Bilder/Beispiele, die in keiner Erklärseite referenziert sind (Dead-Code-Analogie). | Heuristik: Datei-/Artefaktname kommt im Seitentext nicht vor (kein Beweis für Ungenutztheit). |
| Reife-Komponenten | Status, Doku-Vollständigkeit (Inhalt vs. Stubs), Beispiel-Abdeckung der Profile und Governance-Merkmale — nebeneinander, bewusst nicht zu einem Score verdichtet. | Gezählt/abgeleitet aus sushi-config, Narrative, artifacts_detail und Repo-Dateien; die Freigabe-Einordnung bleibt menschlich. |
| Hersteller-Lock-in | Bindung an die Quellplattform durch proprietäre Direktiven (0-100, Band). | Grobe Heuristik aus Direktiven je Seite. |
| Standard-Terminologie-Anteil | Anteil standardisierter Terminologie (SNOMED/LOINC/ICD/UCUM) gegenüber Eigen-Terminologie. | Grobe Heuristik aus Textvorkommen der Standardsysteme vs. Anzahl lokaler CodeSystems. |
| Wiederverwendung externer Profile | Anteil der Profil-Parents, die auf externen Basisbausteinen statt eigenem Material beruhen. | FSH Parent:-Referenzen; abstrakte LM-Basistypen (Element/Base/...) ausgeschlossen. |
| FHIR-Versions-Aktualität | Wie aktuell die FHIR-Basis ist (R4/R4B/R5) - Zukunftssicherheit. | fhirVersion aus sushi-config, gegen bekannte Versionslinie eingeordnet. |
| Pflege-Kadenz | Lebendigkeit der Pflege (Commits/Jahr, Tage seit letztem Commit). | Git-Historie des analysierten Repos. Erfordert vollständige Git-Historie: bei einem shallow clone (jeder URL-Input wird shallow geklont) nicht ermittelbar und daher null. |
| Bus-Faktor (Wissenskonzentration) | Schlüsselpersonen-Risiko: Anteil des Top-Autors an allen Commits. | Git-Historie, Autoren nach E-Mail gruppiert (Alias-robust). Erfordert vollständige Git-Historie: bei einem shallow clone (jeder URL-Input wird shallow geklont) nicht ermittelbar und daher null. |
| Terminologie-Lizenz | Lizenz-/IP-Risiko gebundener Terminologien (z.B. SNOMED CT lizenzpflichtig). | Erkennung der Standardsysteme im FSH + hinterlegte Lizenzeinstufung. |
| Unterdrückte Warnungen | Risiko, dass ausgeblendete QA-Meldungen echte Fehler verbergen (breit/Wildcard vs. eng). | Klassifikation der Einträge in input/ignoreWarnings.txt. |
| Datenschutz-Substanz | Ob die Datenschutz-Seite substanziell ist und ob Beispiele PII-artige Daten enthalten. | Wortzahl der security-privacy-Seite + Heuristik (birthDate/name) in Beispielen. |
| Breaking-Change-Risiko | Kompatibilitätsbruch gegenüber der publizierten Vorversion. | Nur per Build/Vorversions-Diff ermittelbar - im statischen Modus nicht erhoben (null). |
| Statisch vs. Build | Erhebungsmodus jeder Kennzahl. | static = nur Quelldateien/Git; build = erfordert IG-Publisher-Lauf (qa.json); extern = Registry/Netz. Nicht statisch erhebbare Größen bleiben null und sind so markiert. |

</div>

# Anhang: Glossar

_Kurzerklärung der im Report verwendeten Fachbegriffe für Leser mit grundlegendem FHIR-Verständnis._

<div align="center">

| Begriff | Erklärung |
|---|---|
| Artefakt | Ein einzelnes definiertes Element im IG, z.B. ein Profil, eine Extension, ein ValueSet oder ein Beispiel - die Bausteine, die der IG bereitstellt. |
| Beispiel (Example/Instance) | Eine konkrete, ausgefüllte FHIR-Ressource, die zeigt, wie ein Profil in der Praxis aussieht. |
| CalVer (Kalender-Versionierung) | Ein Versionsschema, das die Version aus dem Datum ableitet (z.B. Jahr.Nummer), statt fortlaufender Zählung. |
| Canonical-URL | Die weltweit eindeutige, dauerhafte Web-Adresse, mit der ein Artefakt offiziell identifiziert und referenziert wird. |
| CapabilityStatement | Eine Beschreibung, welche FHIR-Funktionen ein Server oder System unterstützt (welche Ressourcen, Operationen, Suchparameter). |
| CodeSystem | Eine Sammlung von Codes mit ihrer Bedeutung - die Quelle, aus der ein ValueSet seine Codes bezieht. |
| Default-Sprache | Die Hauptsprache des IG, in der die Inhalte primär verfasst und ausgeliefert werden (z.B. de-DE). |
| Dependency (Abhängigkeit) | Ein anderes FHIR-Paket, auf dessen Inhalte der IG aufbaut und das beim Bauen mitgeladen wird. |
| Direktive | Ein spezieller Platzhalter oder Tag in einer Seite, der zur Anzeige-Zeit durch generierten Inhalt ersetzt wird (z.B. ein eingebettetes Diagramm oder eine Tabelle). |
| Element-Wörterbuch (Dictionary) | Eine Tabelle, die alle Elemente eines Profils mit Beschreibung, Kardinalität und Datentyp auflistet. |
| Extension | Eine standardisierte Erweiterung, mit der man einer FHIR-Ressource zusätzliche Informationen hinzufügt, die der Basisstandard nicht vorsieht. |
| FHIR-Version | Die Version des FHIR-Standards, auf der der IG aufbaut (z.B. 4.0.1 = FHIR R4). |
| FQL (FHIR Query Language) | Eine Abfragesprache aus der Quellplattform, mit der Tabellen aus FHIR-Inhalten erzeugt werden - im generischen IG Publisher nicht verfügbar. |
| FSH (FHIR Shorthand) | Eine kompakte Textsprache, in der Profile, Extensions und andere FHIR-Artefakte geschrieben werden; ein Werkzeug übersetzt sie in die eigentlichen FHIR-Dateien. |
| FSH-Translation-Extension | Eine im FSH gesetzte Erweiterung, die übersetzte Textfassungen direkt in die Ressource einbettet; der Build kann daraus mehrsprachige Anzeigen erzeugen. |
| GoFSH | Das umgekehrte Werkzeug zu SUSHI: Es erzeugt aus vorhandenen FHIR-Dateien (JSON) FSH-Quellcode - nötig, wenn ein IG noch kein FSH besitzt. |
| Heuristische Schätzung | Eine näherungsweise, auf Erfahrungswerten beruhende Schätzung - kein exakter Wert, sondern eine Spanne. |
| id / packageId / name / title | Verschiedene Kennungen eines IG: id ist die technische Kurzbezeichnung, packageId der Paketname zur Auslieferung, name der maschinenlesbare Name, title der Anzeigetitel. |
| IG Publisher | Das offizielle Werkzeug von HL7, das aus den Quelldateien eines IG die fertige Webseite (HTML) und das Veröffentlichungspaket erzeugt. |
| ig.ini | Eine kleine Startkonfigurationsdatei, die dem IG Publisher grundlegende Bau-Einstellungen vorgibt. |
| Implementierungsleitfaden (IG) | Ein Dokumentenpaket, das beschreibt, wie ein FHIR-Standard für einen konkreten Anwendungsfall genau zu verwenden ist - mit Regeln, Beispielen und erklärendem Text. |
| Include (Vorlagen-Fragment) | Vorlagen-Mechanismus des IG Publishers: Mit einem Include-Befehl bindet man vorgefertigte HTML-Fragmente (z.B. die Strukturtabelle einer Ressource) in eine Seite ein. |
| Invariant | Eine zusätzliche Prüfregel (Bedingung), die eine Ressource erfüllen muss, um gültig zu sein. |
| Lizenz | Die Nutzungsbedingungen des IG; CC0-1.0 bedeutet Gemeinfreiheit, also freie Nutzung ohne Einschränkung. |
| Logical Model | Ein abstraktes Datenmodell, das Inhalte fachlich beschreibt, ohne direkt an einen FHIR-Ressourcentyp gebunden zu sein. |
| Mapping | Eine Zuordnung, die zeigt, wie Elemente eines Modells anderen Standards oder Modellen entsprechen. |
| Mehrsprachigkeit (i18n) | Fähigkeit eines IG, Inhalte in mehreren Sprachen bereitzustellen; eine Sprache ist führend/verbindlich. |
| Mermaid-Diagramm | Ein aus Textbeschreibung erzeugtes Diagramm (hier ein Tortendiagramm), das direkt in Markdown eingebettet wird. |
| Narrative-Seite | Eine frei geschriebene Erklärseite des IG (Fliesstext, meist Markdown), im Gegensatz zu den automatisch generierten Artefaktseiten. |
| Pflichtseiten | Ein festes Raster an Standardseiten (z.B. Startseite, Anwendungsfälle, Konformität, Änderungen), das ein vollständiger IG enthalten sollte. |
| Pinning (gepinnt/floating) | 'Gepinnt' heißt, eine Abhängigkeit ist auf eine feste Version festgelegt; 'floating' heißt, sie folgt automatisch der neuesten Version - was Builds weniger reproduzierbar macht. |
| Profile | Eine Einschränkung/Anpassung eines FHIR-Basistyps für einen bestimmten Zweck - legt fest, welche Felder Pflicht sind, welche Werte erlaubt sind usw. |
| Publisher | Die herausgebende Organisation, die für den IG verantwortlich zeichnet. |
| QA-Meldungen (Errors/Warnings/Hints) | Hinweise aus dem Build-Qualitätsbericht: Fehler verhindern eine saubere Veröffentlichung, Warnungen und Hinweise sind weniger kritisch. |
| QC-Regel (Qualitätsregel) | Eine formalisierte Prüfregel, die beim Qualitätslauf prüft, ob Ressourcen gültig sind und Konventionen (z.B. Namensschema) einhalten. |
| Quell-/Zielformat (source/target) | 'source' kennzeichnet Seiten im ursprünglichen Plattformformat, 'target' Seiten bereits im Format des Ziel-IG. |
| RuleSet | Ein wiederverwendbarer Block von FSH-Regeln, der in mehreren Artefakten eingebunden werden kann, um Wiederholungen zu vermeiden. |
| Snapshot / Differential | Zwei Sichten eines Profils: Differential zeigt nur die Änderungen gegenüber der Basis, Snapshot die vollständige Struktur mit allen Elementen. |
| statischer / full-Modus | Statisch heißt, es wird nur der Quellcode ausgewertet ohne den IG zu bauen; im full-Modus wird zusätzlich gebaut, um z.B. Validierungsfehler zu erfassen. |
| Status (draft/active) | Reifegrad eines IG oder Artefakts; 'draft' bedeutet Entwurf, noch nicht endgültig freigegeben. |
| Stub-Seite | Eine sehr kurze Seite (z.B. nur Navigation oder Platzhalter, unter 20 Wörtern), die keinen echten Inhalt trägt. |
| SUSHI | Das Werkzeug, das FSH-Dateien in fertige FHIR-Ressourcen (JSON) umwandelt. |
| sushi-config.yaml | Die zentrale Konfigurationsdatei eines FSH-basierten IG: enthält Kennungen, Version, Abhängigkeiten, Seiten- und Menüstruktur. |
| Unterdrückte Warnungen | Bewusst ausgeblendete QA-Meldungen, die als bekannt/akzeptiert gelten und den Bericht nicht stören sollen. |
| Validierung | Prüfung, ob eine FHIR-Ressource dem Standard und ihrem Profil entspricht. |
| ValueSet | Eine definierte Auswahl erlaubter Codes (Werteliste), die für ein bestimmtes Feld zulässig sind. |
| Übersetzungs-Supplement | Eine separate Datei, die übersetzte Texte zu einer Terminologie- oder Strukturressource liefert, ohne das Original zu verändern. |

</div>
