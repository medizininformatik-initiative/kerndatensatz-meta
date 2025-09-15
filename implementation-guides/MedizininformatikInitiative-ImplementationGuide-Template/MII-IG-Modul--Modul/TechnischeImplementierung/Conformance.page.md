---
parent: 
---
# Conformance

Diese Seite beschreibt, wie Konformitätsanforderungen dokumentiert werden. Eine ggf. aktuellere Version ist im [Kerndatensatz-Wiki](https://github.com/medizininformatik-initiative/kerndatensatz-meta/wiki/Conformance) dokumentiert.

---

## Anforderungsdokumentation

Anforderungen in dieser Spezifikation werden durch folgende in Großbuchstaben geschriebenen Schlüsselworte (Conformance verbs) basierend auf [RFC-2119](https://datatracker.ietf.org/doc/html/rfc2119) gekennzeichnet:

| Deutsch                      	| Englisch    	       |
|------------------------------	|--------------------- |
| MUSS / MÜSSEN                	| MUST / SHALL         |
| DARF NICHT / DÜRFEN NICHT    	| MUST NOT / SHALL NOT |
| VERPFLICHTEND                	| REQUIRED    	       |
| SOLLTE / SOLLTEN             	| SHOULD      	       |
| SOLLTE NICHT / SOLLTEN NICHT 	| SHOULD NOT  	       |
| EMPFOHLEN                    	| RECOMMENDED 	       |
| KANN / OPTIONAL               | MAY                  |

---

## Must Support (MS)

### Definition

Elemente einer FHIR-Ressource können in einem Profil als mandatorisch oder [Must Support](http://hl7.org/fhir/R4/profiling.html#mustsupport) gekennzeichnet werden.

- **Obligatorische Elemente** sind Elemente mit Mindestkardinalität `1` (z.B. `1..1`, `1..*`). Diese MÜSSEN grundsätzlich vorhanden sein. In Ausnahmefällen können die Werte fehlen -> in diesem Fall MUSS die Abswesenheit durch Mechanismen wie `Data-Absent-Reason Extension` dokumentiert werden (siehe [Abschnitt *Fehlende Daten*](#fehlende-daten))

- **Must Support (MS)** bei einem Element bedeutet, dass Systeme dieses Element unterstützen MÜSSEN, auch wenn die Kardinalität `0..*` lautet. **Unterstützen** heißt: Systeme MÜSSEN in der Lage sein, das Element zu befüllen, zu speichern, anzuzeigen und korrekt zu verarbeiten.

### Anforderungen

#### Daten-erzeugende Systeme (z.B. FHIR-API eines Datenintegrationszentrums)

Ein konformes daten-erzeugendes System MUSS:
- ein MS-Element mit Daten füllen, sofern diese lokal verfügbar sind (z.B. über ETL aus dem Primärsystem),
- das MS-Element in der Ressource speichern können,
- das MS-Element auf Anfrage (z.B. bei einer Feasibility-Query) bereitstellen.

#### Daten-verarbeitende Systeme (z.B. anfragende Anwendungen)

Ein konformes daten-verarbeitendes System MUSS:
- MS-Elemente dem Benutzer korrekt anzeigen,
- die Werte für Berechnungen oder Weiterverarbeitung berücksichtigen können,
- Ressourceninstanzen mit MS-Elementen fehlerfrei verarbeiten, ohne dass Fehler oder Abbrüche entstehen.

---

## Fehlende Daten

Es gibt Situationen, in denen Informationen zu einem bestimmten Datenelement fehlen und das Quellsystem den Grund für das Fehlen nicht kennt.  

- Liegt dem Quellsystem keine Dateninstanz für ein Element mit einer Mindestkardinalität `0` vor (einschließlich der mit *Must Support* gekennzeichneten Elemente), MUSS das Datenelement in der Ressource **ausgelassen** werden.  
- Handelt es sich bei dem Datenelement um ein **obligatorisches Element** (d.h. Mindestkardinalität `1..`), MUSS es **vorhanden sein**, auch wenn das Quellsystem keine Daten hat.

Dies ist im Folgenden zusammengefasst:

### Nicht-codierte Datenelemente
- Es MUSS die Extension [`Data-Absent-Reason`](http://hl7.org/fhir/R4/extension-data-absent-reason.html) am Datentyp und der Code `unknown` verwendet werden.

### Codierte Datenelemente mit ValueSet-Binding „example“, „preferred“ oder „extensible“
- Wenn das Quellsystem **nur Freitext** enthält, SOLLTE ausschließlich das Textelement (`CodeableConcept.text`) genutzt werden.   
- Wenn weder Text noch codierte Daten vorhanden sind:  
  - wenn das ValueSet einen „unbekannt“-Code enthält, SOLL dieser verwendet werden.  
  - wenn kein „unbekannt“-Code im ValueSet vorhanden ist, SOLL der Code `unknown` aus dem CodeSystem [DataAbsentReason](http://hl7.org/fhir/R4/codesystem-data-absent-reason.html) genutzt werden.

### Codierte Datenelemente mit ValueSet-Binding „required“
- wenn das ValueSet einen „unbekannt“-Code enthält, MUSS dieser verwendet werden.  
- wenn kein „unbekannt“-Code im ValueSet vorhanden ist, MUSS ein Konzept aus dem ValueSet verwendet werden, da die Instanz ansonsten **nicht konform** ist.

---