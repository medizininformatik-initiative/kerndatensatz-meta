<!-- markdownlint-disable MD041 -->

Das Meta-Modul definiert die Suchparameter, die von den Modulen des
MII-Kerndatensatzes gemeinsam genutzt werden. Die Tabelle listet alle aktiven
Suchparameter, sortiert nach dem Ressourcentyp, für den sie gelten.

* **Code** ist der Name, der in einer Suchanfrage verwendet wird, und verlinkt
  auf die vollständige Definition.
* **Ausdruck** ist der FHIRPath-Ausdruck, den der Server indiziert.

Beispielanfragen sind im
[CapabilityStatement](CapabilityStatement-mii-cps-meta-server-capabilities.html)
dokumentiert: Jede wird in der CI gegen einen FHIR-Server mit den
[MII-Testdaten](https://github.com/medizininformatik-initiative/mii-testdata)
ausgeführt. Ein Suchparameter ohne Beispiel hat noch keinen Test.

Um alle Suchparameter in einen FHIR-Server zu laden, nutzen Sie das
[Collection-Bundle](Bundle-mii-exa-meta-searchparam-collection-bundle.html) oder
das [Transaction-Bundle](Bundle-mii-exa-meta-searchparam-transaction-bundle.html).

### Aktive Suchparameter

{% sql {
  "query": "SELECT (SELECT group_concat(b.value, ', ') FROM json_each(CAST(s.Json AS TEXT), '$.base') b) AS Base, json_extract(CAST(s.Json AS TEXT), '$.code') AS Code, s.Web, json_extract(CAST(s.Json AS TEXT), '$.type') AS Type, json_extract(CAST(s.Json AS TEXT), '$.expression') AS Expression FROM Resources s WHERE s.Type = 'SearchParameter' AND s.Status <> 'retired' ORDER BY Base, Code",
  "class": "grid",
  "columns": [
    {
      "title": "Ressourcentyp",
      "type": "text",
      "source": "Base"
    },
    {
      "title": "Code",
      "type": "link",
      "source": "Code",
      "target": "Web"
    },
    {
      "title": "Typ",
      "type": "text",
      "source": "Type"
    },
    {
      "title": "Ausdruck",
      "type": "text",
      "source": "Expression"
    }
  ]
} %}

### Zurückgezogene Suchparameter

Diese Suchparameter waren identisch mit einem Suchparameter aus FHIR R4 core.
Verwenden Sie stattdessen den Core-Suchparameter mit demselben Code; siehe die
[Änderungshistorie](changes.html).

{% sql {
  "query": "SELECT s.Name, s.Web, s.Description FROM Resources s WHERE s.Type = 'SearchParameter' AND s.Status = 'retired' ORDER BY s.Name",
  "class": "grid",
  "columns": [
    {
      "title": "Name",
      "type": "link",
      "source": "Name",
      "target": "Web"
    },
    {
      "title": "Beschreibung",
      "type": "markdown",
      "source": "Description"
    }
  ]
} %}
