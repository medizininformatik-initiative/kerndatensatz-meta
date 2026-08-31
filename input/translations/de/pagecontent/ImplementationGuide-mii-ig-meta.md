<!-- markdownlint-disable MD041 -->

<!-- German mirror of input/pagecontent/ImplementationGuide-mii-ig-meta.md —
     both files must say the same thing. ALL generated fragments (cross-version
     analysis included) are language-selected via lang-fragment: the pinned
     publisher writes _includes/<name>-<lang>.xhtml plus a bare default-language
     alias, and no .html variant — kerndatensatz-basis' .html include names
     belong to a different publisher version, do not copy them here.
     FILE NAME CARRIES THE IG ID — rename together with the English page and
     the IG-level .po catalogue (docs/recipes/create-a-new-module.md step 4). -->
Diese ImplementationGuide-Ressource definiert die technischen Details dieser
Publikation, einschließlich Abhängigkeiten und Veröffentlichungsparametern.

- [XML](../ImplementationGuide-mii-ig-meta.xml)
- [JSON](../ImplementationGuide-mii-ig-meta.json)

### Versionsübergreifende Analyse

{% lang-fragment cross-version-analysis.xhtml %}

### IG-Abhängigkeiten

Dieser IG enthält die folgenden Abhängigkeiten von anderen IGs.

{% lang-fragment dependency-table.xhtml %}

> **Woher die Versionen kommen.** Jedes Paket der Tabelle ist direkt in
> [`sushi-config.yaml`](https://github.com/medizininformatik-initiative/kerndatensatz-meta/blob/main/sushi-config.yaml)
> (`dependencies:`) gepinnt — auch `hl7.terminology.r4` (THO) und
> `hl7.fhir.uv.extensions.r4`, und diese beiden mit Bedacht: Die
> [Automatik des IG Publishers](https://build.fhir.org/ig/FHIR/ig-guidance/versions.html#automatic-packages)
> liest ausschließlich die **eigene** Abhängigkeitsliste dieses Leitfadens;
> ohne direkten Pin würde jeder Build stillschweigend das jeweils aktuellste
> THO-/Extensions-Release injizieren — eine allein im MII-Meta-Paket gepinnte
> Version kann den Build nicht steuern (verifiziert im Publisher-Quellcode des
> gepinnten Release). Eine wöchentliche Prüfung warnt, wenn diese beiden Pins
> von den Vorgaben des gepinnten Meta-Pakets abweichen; die von einem
> konkreten Build verwendeten Versionen stehen in dessen `qa-versions.json`.
{: .ig-highlight .ig-highlight-grey}

### Globale Profile

Dieser IG deklariert die folgenden globalen Profile — Profile, die für jede
unter diesem Leitfaden ausgetauschte Instanz ihres Ressourcentyps gelten. Eine
leere Tabelle bedeutet: Dieses Modul deklariert keine.

{% lang-fragment globals-table.xhtml %}

### Urheberrechte

{% lang-fragment ip-statements.xhtml %}

### IG-Parametereinstellungen und Expansionsparameter

Expansionsparameter sind Query-Parameter, die an eine `ValueSet`-
`$expand`-Operation übergeben werden können, um zu steuern, wie das ValueSet
expandiert wird — also wie die vollständige Liste der Codes aus der
ValueSet-Definition erzeugt wird. Die für diesen IG verwendeten
[IG-Parameter](https://hl7.org/fhir/tools/en/CodeSystem-ig-parameters.html)
sind in
[`sushi-config.yaml`](https://github.com/medizininformatik-initiative/kerndatensatz-meta/blob/main/sushi-config.yaml)
(`parameters:`) deklariert. Dieses Modul pinnt seine Expansionsparameter über
das [Meta-Expansionsmanifest](Parameters-mii-param-meta-manifest.html); siehe
die [Metadaten-Übersicht](metadata.html).
