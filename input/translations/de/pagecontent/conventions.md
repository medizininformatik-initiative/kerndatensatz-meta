<!-- markdownlint-disable MD041 -->

Diese Seite beschreibt Konventionen, die die KDS-Module auf ihre Artefakte und
Beispiele anwenden. Das Meta-Modul dokumentiert sie, weil sie modulübergreifend
gelten. Umgesetzt sind sie als gemeinsame Bibliothek von FSH-`RuleSet`s, die
jedes Modul in seine Artefakte einfügt; siehe
[input/fsh/rulesets](https://github.com/medizininformatik-initiative/kerndatensatz-meta/tree/main/input/fsh/rulesets).

### Kennzeichnung von Testdaten

Die KDS-Module kennzeichnen ihre Beispielinstanzen als Testdaten mit dem
Sicherheitslabel `HTEST` („test health data“) aus dem HL7-Codesystem
[v3-ActReason](https://terminology.hl7.org/CodeSystem-v3-ActReason.html):

```
* meta.security[+] = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST "test health data"
```

Das Label setzt das RuleSet `TestDataLabel`. Gelangt ein Beispiel in ein
Produktivsystem, lässt es sich so von echten Patientendaten unterscheiden.

Die eigenen Beispiele des Meta-Moduls sind die
[Collection- und Transaction-Bundles der SearchParameter](examples.html) zum
Import in einen FHIR-Server. Sie enthalten keine Patientendaten und
tragen deshalb kein Testdaten-Label.

Die Anforderungen an KDS-Testdaten beschreibt die Wiki-Seite
[KDS-Testdaten](https://github.com/medizininformatik-initiative/kerndatensatz-meta/wiki/KDS%E2%80%90Testdaten); die Testdaten selbst werden in
[mii-testdata](https://github.com/medizininformatik-initiative/mii-testdata)
gepflegt.

### Lizenzierung

Dieser Leitfaden steht unter der
[Creative Commons Namensnennung 4.0 International Lizenz](https://creativecommons.org/licenses/by/4.0/deed.de)
(`CC-BY-4.0`), © 2019+ Medizininformatik-Initiative (MII). Der in der Fußzeile
genannte Herausgeber ist die Organisation, die den Leitfaden veröffentlicht und
pflegt; er ist nicht der Rechteinhaber.

* **Konformitätsartefakte** geben ihre Lizenz maschinenlesbar mit der
  CRMI-Extension
  [`crmi-license`](https://hl7.org/fhir/uv/crmi/STU2/StructureDefinition-crmi-license.html)
  in `meta.extension` an, mit dem SPDX-Code `CC-BY-4.0` (RuleSets
  `LicenseCodeableCCBY40` und `LicenseCodeableCCBY40Instance`).
* **Artefakte, die SNOMED-CT-Codes verwenden,** tragen den Urheberhinweis von
  SNOMED International in `copyright` (RuleSet `SnomedLicense`). Der Wortlaut
  stammt von SNOMED International und wird nicht verändert.
* **Externe Codesysteme** unterliegen dem Urheberrecht ihrer Herausgeber.
* Die Extension
  [MII EX Meta License Codeable](StructureDefinition-mii-ex-meta-license-codeable.html)
  ist veraltet (deprecated). Neue Artefakte verwenden `crmi-license`.

### Weitere KDS-weite Regeln

* Konformitätsverben, Must Support und Umgang mit fehlenden Daten:
  [Conformance](https://github.com/medizininformatik-initiative/kerndatensatz-meta/wiki/Conformance)
* Benennung von FHIR-Ressourcen:
  [Namenskonventionen](https://github.com/medizininformatik-initiative/kerndatensatz-meta/wiki/Namenskonventionen-f%C3%BCr-FHIR%E2%80%90Ressourcen-in-der-MII)
* Versionen von Codesystemen:
  [Terminology Version Policy](https://github.com/medizininformatik-initiative/kerndatensatz-meta/wiki/Terminology-Version-Policy) (Englisch)
* Releases: [Module Release Workflow](https://github.com/medizininformatik-initiative/kerndatensatz-meta/wiki/Module-Release-Workflow) und
  [Versionierung](version-history.html)
* Berechenbare Metadaten der Artefakte: [Metadaten-Übersicht](metadata.html)
