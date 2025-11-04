## {{page-title}}

**Version: 2025.0.3**

Datum 04.11.2025

* `Removed`: Die `SearchParameter`-Ressource für `Specimen.collection.bodysite` wurde `retired`, da der Suchparameter bereits Bestandteil des FHIR-Core-Standards ist.

**Version: 2025.0.2**

Datum 21.10.2025

* `Added`: `SearchParameter`-Ressource für Procedure OPS-Seitenlokalisation. Siehe: {{pagelink: SearchParameter, text: Kerndatensatz Suchparameter, hint: CDS-SearchParameter}}

**Version: 2025.0.1**

Datum 07.10.2025

* `Changed`: `CodeSystem`-Ressource `MII_CS_Meta_DIZ_Standorte` der Medizininformatik-Initiative Standorte aktualisiert. Siehe: {{pagelink: CodeSystemMIIStandorte, text: Medizininformatik-Initiative Standorte, hint: MII_CS_Meta_DIZ_Standorte}}
* `Added`: `SearchParameter`-Ressourcen der Erweiterungsmodule Bildgebung und Dokument. Siehe: Siehe: {{pagelink: SearchParameter, text: Kerndatensatz Suchparameter, hint: CDS-SearchParameter}}

**Version: 2025.0.0**

Datum 03.12.2024

* Der Status des `MII-Reference`-Profils wurde auf `retired` gesetzt. Dieses Profil soll nicht mehr verwendet werden.
* SearchParameter-Ressourcen aus Basis- und Erweiterungsmodulen werden nun zentral über das Meta-Modul veröffentlicht. Siehe: {{pagelink: SearchParameter, text: Liste Kerndatensatz Suchparameter, hint: Übersicht Suchparameter im Kerndatensatz}}
* `MII_PR_Meta_SearchParameter`-Profil hinzugefügt. Dieses enthält die Mindestanforderungen, die Suchparameter in der MII erfüllen müssen.
* `MII_EX_Meta_License_Codeable`-Extension hinzugefügt. Diese Extension kann verwendet werden, um maschinenverarbeitbare Lizenzinformationen über im Kerndatensatz veröffentlichte Artefakte bereitzustellen.