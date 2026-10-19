# Anleitung für Implementierende - MII IG Meta v2027.0.0-ballot.rc3

* [**Inhaltsverzeichnis**](toc.md)
* [**Anleitung**](guidance.md)
* **Anleitung für Implementierende**

## Anleitung für Implementierende

 Diese Seite enthält Übersetzungen aus der Originalsprache, in der der Leitfaden verfasst wurde. Informationen zu diesen Übersetzungen und Anweisungen zum Abgeben von Feedback zu den Übersetzungen finden Sie [hier](translationinfo.md). 

Nutzen Sie das [herunterladbare FHIR-Paket](downloads.md) als versionierte Quelle für Validierung und Implementierung. Die erzeugten Artefaktseiten stellen die normativen JSON- und XML-Darstellungen bereit.

Bei der Implementierung von Suchparametern:

* Verwenden Sie das [MII-SearchParameter-Profil](StructureDefinition-mii-pr-meta-searchparameter.md) als Grundlage. Es definiert die Mindestanforderungen, die im MII-Kerndatensatz veröffentlichte SearchParameter-Ressourcen erfüllen müssen.
* Prüfen Sie die [Suchparameterliste](artifacts.md#2) und das [CapabilityStatement des Meta-Moduls](capability-statements.md), um die zusätzlich für den MII-Kerndatensatz definierten benutzerdefinierten Suchparameter zu ermitteln.
* Für den gebündelten Import in einen FHIR-Server stehen auf der Seite [Beispiele](examples.md) ein SearchParameter-Collection-Bundle und ein SearchParameter-Transaction-Bundle bereit. Beide Bundles enthalten sämtliche aktiven SearchParameter-Ressourcen, die dieses Modul veröffentlicht.

