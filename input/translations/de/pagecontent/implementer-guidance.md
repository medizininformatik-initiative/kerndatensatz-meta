<!-- markdownlint-disable MD041 -->

Nutzen Sie das [herunterladbare FHIR-Paket](downloads.html) als versionierte
Quelle für Validierung und Implementierung. Die erzeugten Artefaktseiten stellen
die normativen JSON- und XML-Darstellungen bereit.

Bei der Implementierung von Suchparametern:

* Verwenden Sie das
  [MII-SearchParameter-Profil](StructureDefinition-mii-pr-meta-searchparameter.html)
  als Grundlage. Es definiert die Mindestanforderungen, die im
  MII-Kerndatensatz veröffentlichte SearchParameter-Ressourcen erfüllen müssen.
* Prüfen Sie die
  [Suchparameterliste](artifacts.html#2) und das
  [CapabilityStatement des Meta-Moduls](capability-statements.html), um die
  zusätzlich für den MII-Kerndatensatz definierten benutzerdefinierten
  Suchparameter zu ermitteln.
* Für den gebündelten Import in einen FHIR-Server stehen auf der Seite
  [Beispiele](examples.html) ein SearchParameter-Collection-Bundle und ein
  SearchParameter-Transaction-Bundle bereit. Beide Bundles enthalten sämtliche
  aktiven SearchParameter-Ressourcen, die dieses Modul veröffentlicht.
