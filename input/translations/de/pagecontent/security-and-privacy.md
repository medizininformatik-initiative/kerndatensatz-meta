<!-- markdownlint-disable MD041 -->
<!-- Deutsche Übersetzung von input/pagecontent/security-and-privacy.md.
     Aufgebaut in den abgestimmten DREI Stufen: (1) das übergreifende
     übergreifende Datenschutzkonzept, (2) DIMP im Datenportal, (3) die
     modul-spezifischen Aspekte. Stufen 1 und 2 sind statischer übergreifender
     Inhalt — behalten; Stufe 3 füllt Ihr Modul aus. Beide Sprachfassungen
     müssen dasselbe aussagen. -->


Dieser Abschnitt richtet sich an Sicherheits- und Datenschutz-Fachleute.
Allgemeine Anforderungen stehen in der FHIR-Kernspezifikation —
[Security & Privacy Module](https://build.fhir.org/secpriv-module.html) und die
[Security-Checkliste](https://build.fhir.org/security.html). Diese Seite
wiederholt sie nicht; sie verlinkt den übergreifenden Datenschutzrahmen und nennt,
was **für dieses Modul spezifisch** ist.

#### 1. Das übergreifende Datenschutzkonzept

Das
[übergreifende Datenschutzkonzept der Medizininformatik-Initiative](https://www.medizininformatik-initiative.de/de/datenschutzkonzept)
regelt, wie Patientendaten über das Netz der Datenintegrationszentren hinweg
für die Forschung verarbeitet werden
dürfen: die Rechtsgrundlage (der Broad Consent der MII), die Rollen der
Datenintegrationszentren und der Use-&-Access-Committees sowie die
standortübergreifenden Anwendungsszenarien (Machbarkeitsanfragen, verteilte
Analysen, Daten- und Bioproben-Bereitstellung). Alles, was dieses Modul
spezifiziert, bewegt sich innerhalb dieses Rahmens — dieser Leitfaden fügt
keinen eigenen Verarbeitungszweck hinzu.

#### 2. De-Identifikation, Minimierung und Pseudonymisierung (DIMP)

Wie Daten, die ein Datenintegrationszentrum verlassen, praktisch
de-identifiziert werden, spezifiziert
[DIMP (De-Identification — Minimisation — Pseudonymisation)](https://medizininformatik-initiative.github.io/dataportal/data-node/DIMP.html)
in der Dokumentation des Datenportals: direkte Identifikatoren werden
entfernt, vom genehmigten Projekt nicht benötigte Datenelemente entfallen, und
identifizierende Werte werden durch projektspezifische Pseudonyme ersetzt
(FHIR-Pseudonymizer-Konfiguration). Die Profile dieses Moduls beschreiben die
Daten *vor* Anwendung von DIMP; welche Elemente eine konkrete
Datenbereitstellung erreicht, entscheidet je Projekt die DIMP-Konfiguration,
nicht dieser Leitfaden.

#### 3. Modul-spezifische Aspekte

> Über den oben verlinkten übergreifenden Rahmen hinaus — das übergreifende
> Datenschutzkonzept, den ihm zugrunde liegenden Broad Consent und DIMP —
> führt dieses Modul keine Datenkategorie, die eigene Sicherheits- oder
> Datenschutzaspekte aufwirft, und stellt keine modulspezifischen Sicherheits-
> oder Datenschutzanforderungen an Implementierende.
