<!-- markdownlint-disable MD041 -->


#### Version 2027.0.0-ballot.rc1

**Datum:** 2026-08-31

* **Geändert:** Publikationsworkflow und Narrativ von Simplifier auf den HL7 IG
  Publisher migriert; die Identitäten der veröffentlichten FHIR-Artefakte
  wurden beibehalten.
* **Hinzugefügt:** Ein während der Migration erzeugtes, zu prüfendes
  CapabilityStatement im Status `draft`.

#### Version 2026.0.0

**Datum:** 24.11.2025

* `Added`: Weitere `SearchParameter`-Ressourcen für `ImagingStudy`

#### Version 2025.0.3

**Datum:** 04.11.2025

* `Removed`: Die `SearchParameter`-Ressource für
  `Specimen.collection.bodysite` wurde `retired`, da der Suchparameter bereits
  Bestandteil des FHIR-Core-Standards ist.

#### Version 2025.0.2

**Datum:** 21.10.2025

* `Added`: `SearchParameter`-Ressource für Procedure OPS-Seitenlokalisation.
  Siehe: [Kerndatensatz Suchparameter](search-parameters.html)

#### Version 2025.0.1

**Datum:** 07.10.2025

* `Changed`: `CodeSystem`-Ressource `MII_CS_Meta_DIZ_Standorte` der
  Medizininformatik-Initiative Standorte aktualisiert. Siehe:
  [Medizininformatik-Initiative Standorte](CodeSystem-mii-cs-meta-diz-standorte.html)
* `Added`: `SearchParameter`-Ressourcen der Erweiterungsmodule Bildgebung und
  Dokument. Siehe: [Kerndatensatz Suchparameter](search-parameters.html)

#### Version 2025.0.0

**Datum:** 03.12.2024

* Der Status des `MII-Reference`-Profils wurde auf `retired` gesetzt. Dieses
  Profil soll nicht mehr verwendet werden.
* SearchParameter-Ressourcen aus Basis- und Erweiterungsmodulen werden nun
  zentral über das Meta-Modul veröffentlicht. Siehe:
  [Liste Kerndatensatz Suchparameter](search-parameters.html)
* `MII_PR_Meta_SearchParameter`-Profil hinzugefügt. Dieses enthält die
  Mindestanforderungen, die Suchparameter in der MII erfüllen müssen.
* `MII_EX_Meta_License_Codeable`-Extension hinzugefügt. Diese Extension kann
  verwendet werden, um maschinenverarbeitbare Lizenzinformationen über im
  Kerndatensatz veröffentlichte Artefakte bereitzustellen.
