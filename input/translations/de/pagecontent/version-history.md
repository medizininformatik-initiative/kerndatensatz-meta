<!-- markdownlint-disable MD041 -->

## Versionsschema

Das Meta-Modul verwendet das KDS-Schema der Kalender-Versionierung in einer
SemVer-kompatiblen Form: `JJJJ.MINOR.PATCH[-label]`. Die aktuelle Version ist
`2027.0.0-ballot.rc1`.

* `JJJJ` ist das Jahr, in dem der Leitfaden gilt und genutzt werden soll.
* `MINOR` wird für nicht brechende Ergänzungen und Präzisierungen erhöht.
* `PATCH` wird für Korrekturen erhöht.
* `label` kennzeichnet ein Vorab- oder Build-Release wie `ballot` oder
  `cibuild`.

Stabile Releases lassen sich anhand der drei numerischen Bestandteile
vergleichen. Zwischen Labels wird keine Reihenfolge abgeleitet.

## Artefakt-Versionen

FHIR-Artefakte eines Releases tragen die Version des Leitfadens und des Pakets.
Die maschinenlesbaren Metadaten deklarieren den Versionsalgorithmus `semver`,
die Paketquelle und Manifest-Parameter; siehe
[Metadaten-Übersicht](metadata.html). Dieses Release deklariert keine
`artifact-versionPolicy`.

## Release-Prozess

Releases folgen dem
[MII Module Release Workflow](https://github.com/medizininformatik-initiative/kerndatensatz-meta/wiki/Module-Release-Workflow).
Die [Änderungshistorie](changes.html) dokumentiert die Änderungen jeder Version.
Die Quelle enthält keinen modulspezifischen Unterstützungszeitraum und keine
eigene Abkündigungsrichtlinie.

## Versionsvergleich

Ab der zweiten formalen IG-Publisher-Publikation kann ein maschinell erzeugter
Vergleich die Änderungshistorie ergänzen. Voraussetzung sind eine
Publikationshistorie an der kanonischen URL und ein ladbares Vorversionspaket.
Bis diese Voraussetzungen erfüllt sind, bleibt der Versionsvergleich
deaktiviert.
