---
parent: 
---
## FHIR Profile

Einleitung FHIR Profile

## Namenskonventionen für die Erstellung von FHIR-Ressourcen in der Medizininformatik-Initiative

### Allgemeines
* Möglichst eindeutige und prägnante Beschreibung des Inhalts 
* Für CodeSystems und ValueSets: Konformität mit http://hl7.org/fhir/shareablecodesystem bzw. http://hl7.org/fhir/shareablevalueset wird empfohlen 

### Festlegungen zu Modul-Bezeichnungen und Abkürzungen 
Für bestehende Module sind folgende Bezeichnungen abgestimmt:

| Vollständiger Modulname                | Technischer Modulname | Abkürzung       |
| -------------------------------------- | --------------------- | --------------- |
|                                        | **url**               | **title, name, id** |
| Modul Diagnose                         | modul-diagnose        | Diagnose        |
| Modul Laborbefund                      | modul-labor           | Labor           |
| Modul Prozedur                         | modul-prozedur        | Prozedur        |
| Modul Medikation                       | modul-medikation      | Medikation      |
| Modul Person                           | modul-person          | Person          |
| Modul Fall                             | modul-fall            | Fall            |
| Modul Consent                          | modul-consent         | Consent         |
| Modul Mikrobiologie                    | modul-mikrobio        | Mikrobio        |
| Modul Symptom/klinischer Phänotyp      | modul-symptom         | Symptom         |
| Modul Bildgebende Verfahren            | modul-bildgebung      | Bildgebung      |
| Modul Intensivmedizin                  | modul-icu             | ICU             |
| Modul Medizinisches Forschungsvorhaben | modul-studie          | Studie          |
| Modul Onkologie                        | modul-onko            | Onko            |
| Modul Pathologiebefund                 | modul-patho           | Patho           |
| Modul Molekulargenetischer Befund      | modul-molgen          | MolGen          |
| Modul Bioprobendaten                   | modul-biobank         | Biobank         |
| Modul Strukturdaten                    | modul-struktur        | Struktur        |

Für zukünftig neu hinzukommende Module wird eine deutschsprachige Benennung im Singular bevorzugt. 

### Präfixe Ressourcentypen 
* PR: StructureDefinition (Profile) 
* EX: StructureDefinition (Extension) 
* LM: Logical Model 
* VS: ValueSet 
* CS: CodeSystem 
* CM: ConceptMap 
* SM: StructureMap 
* NS: NamingSystem 
* SP: SearchParameter 
* CPS: CapabilityStatement 
* OD: OperationDefinition 
* IG: ImplementationGuide 
* EXA: Example 

### Sprache
Die bevorzugte Sprache für die Beschreibung, den Titel, sowie den Namen einer Conformance-Ressource ist Deutsch. Als Alternative kann Englisch verwendet werden, falls dies von dem jeweiligen Kümmererteam bevorzugt wird. Falls Deutsch als Sprache zur Dokumentation einer Ressource verwendet wird, muss auf den Elementen “description”, “name” und “title” eine Translation-Extension (siehe http://hl7.org/fhir/extensions/StructureDefinition-translation.html) vorhanden sein. Der Inhalt der Extension ist im englischsprachigen Implementierungsleitfaden anzuzeigen. 

### Element **title** 
(eine menschenlesbare Bezeichnung der Ressource) 
* Format: Leerzeichen und Klammern etc. erlaubt 
* Struktur: MII `<Präfix Ressourcentyp>` `<Abkürzung Modulname>` `<Beschreibung Inhalt>` (`<zusätzliche Informationen>`)  
Beispiel CodeSystem: 
`MII CS Mikrobio Mikrobiologische Erreger (Bakterien, Pilze)`
* Für ValueSets: zusätzlich [`<verwendete Terminologie (z.B. Wert aus ValueSet.compose.include.system)>`]. Bei namenslosen Terminologien weglassen (oder “Lokal”). 
Beispiel: MII VS Mikrobio Mikrobiologische Erreger (Bakterien, Pilze) [SNOMED CT]  
* Für ConceptMaps: zusätzlich [`<Quellterminologie> -> <Zielterminologie>`] 
Beispiel: `MII CM Mikrobio Mikrobiologische Erreger (Bakterien, Pilze) [LOINC -> SNOMED CT]`
Hinweis: Für den Sonderfall, bei dem ein VS oder eine CM mehrere Terminologien referenziert, sind diese mit Komma unterteilt aufzuführen 

### Element **name**
(eine maschinell verarbeitbare Bezeichnung der Ressource) 
* Format: Upper_Snake_Case 
Hinweis: Der FHIR-Standard ist CamelCase2, aber wegen besserer Menschenlesbarkeit, insbesondere von Abkürzungen, wird im Rahmen der MII davon abgewichen. 
* Struktur: entsprechend des title, aber ohne Leer- und Sonderzeichen 
* Beispiel: `MII_VS_Mikrobio_Mikrobiologische_Erreger_Bakterien_Pilze_SNOMEDCT`

### Element **id** 
(logischer Identifier der Ressource) 
* Struktur: entsprechend .name, formatiert im kebab-case (lower case und “_” durch “-” ersetzt) 
* Begrenzung auf 64 Zeichen: Bei Bedarf abkürzen 
* Beispiel: `mii-vs-mikrobio-mikrobiologische-erreger-snomedct` 

### Element **url** 
(kanonische URL der Ressource) 
* Struktur: `https://www.medizininformatik-initiative.de/fhir/core/<technischer Modulname>/<Ressourcentyp>/<id der Ressource>` für Ressourcen der Basismodule und `https://www.medizininformatik-initiative.de/fhir/ext/<technischer Modulname>/<Ressourcentyp>/<id der Ressource>` für Ressourcen innerhalb der Erweiterungsmodule.
* `<technischer Modulname>`: Technischer Name des Moduls laut obiger Tabelle 
* `<id-…>`: wie oben spezifiziert 
* Regeln für die canonical url sollen zunächst nur bei Neuerstellung angewendet werden 
* Beispiel: `https://www.medizininformatik-initiative.de/fhir/ext/modul-mikrobio/ValueSet/mii-vs-mikrobio-mikrobiologische-erreger-snomedct` 

### Referenzen
* HL7 International: Guide to Designing (FHIR) Resources: https://confluence.hl7.org/pages/viewpage.action?pageId=35718826 
* HL7 International: Naming Rules & Guidelines: https://confluence.hl7.org/pages/viewpage.action?pageId=35718826#GuidetoDesigningResources-NamingRules&Guidelines 
* HL7 International: Multi-Language support in FHIR (Localization/Internationalization): http://hl7.org/fhir/languages.html 
