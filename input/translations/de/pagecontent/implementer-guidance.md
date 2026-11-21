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
  [Suchparameterliste](search-parameters.html) und das
  [CapabilityStatement des Meta-Moduls](capability-statements.html), um die
  zusätzlich für den MII-Kerndatensatz definierten benutzerdefinierten
  Suchparameter zu ermitteln.
* Für den gebündelten Import in einen FHIR-Server stehen auf der Seite
  [Beispiele](examples.html) ein SearchParameter-Collection-Bundle und ein
  SearchParameter-Transaction-Bundle bereit. Beide Bundles enthalten sämtliche
  aktiven SearchParameter-Ressourcen, die dieses Modul veröffentlicht.

### Ergebnisparameter in Modul-CapabilityStatements

`_count`, `_summary` und `_elements` steuern das Ergebnis einer Suche; sie sind
keine Suchparameter und haben keine SearchParameter-Definition. Die
CapabilityStatements der Module führen sie auf, wo ein Server sie unterstützen
muss: als `rest.resource.searchParam` mit `type` = `special` und ohne
`definition`. Das folgt dem in der FHIR-Community diskutierten Kompromiss, bis
es eine bessere Beschreibung solcher Fähigkeiten gibt. Das RuleSet
`SupportSpecialSearchParam` in `input/fsh/rulesets/cps-rules.fsh` schreibt
einen solchen Eintrag:

```
* insert SupportResource(Condition, #SHALL)
* insert SupportSpecialSearchParam(_count, #special, #SHALL)
* insert SupportSpecialSearchParam(_summary, #special, #SHALL)
```

Das CapabilityStatement des Meta-Moduls führt nur die von diesem Modul
definierten SearchParameter auf und enthält daher keine Ergebnisparameter.
