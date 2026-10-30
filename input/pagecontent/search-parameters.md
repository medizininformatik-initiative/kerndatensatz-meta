<!-- markdownlint-disable MD041 -->

The Meta module defines the search parameters that are shared across the
modules of the MII core data set. The table lists every active search
parameter, ordered by the resource type it applies to.

* **Code** is the name used in a search request and links to the full
  definition.
* **Expression** is the FHIRPath expression the server indexes.
* **Example** shows a query that the search parameter tests run in CI against a
  FHIR server loaded with the
  [MII test data](https://github.com/medizininformatik-initiative/mii-testdata).
  The same examples are documented in the
  [CapabilityStatement](CapabilityStatement-mii-cps-meta-server-capabilities.html).
  A search parameter without an example has no test yet.

To load all search parameters into a FHIR server, use the
[collection Bundle](Bundle-mii-exa-meta-searchparam-collection-bundle.html) or
the [transaction Bundle](Bundle-mii-exa-meta-searchparam-transaction-bundle.html).

### Active search parameters

{% sql {
  "query": "SELECT (SELECT group_concat(b.value, ', ') FROM json_each(CAST(s.Json AS TEXT), '$.base') b) AS Base, json_extract(CAST(s.Json AS TEXT), '$.code') AS Code, s.Web, json_extract(CAST(s.Json AS TEXT), '$.type') AS Type, json_extract(CAST(s.Json AS TEXT), '$.expression') AS Expression, (SELECT group_concat(replace(replace(d, '**Examples** (tested in CI):' || char(10) || char(10), ''), '**Example** (tested in CI): ', ''), char(10)) FROM (SELECT DISTINCT json_extract(p.value, '$.documentation') AS d FROM Resources c, json_each(CAST(c.Json AS TEXT), '$.rest[0].resource') r, json_each(r.value, '$.searchParam') p WHERE c.Type = 'CapabilityStatement' AND json_extract(p.value, '$.definition') = s.Url AND d IS NOT NULL)) AS Example FROM Resources s WHERE s.Type = 'SearchParameter' AND s.Status <> 'retired' ORDER BY Base, Code",
  "class": "grid",
  "columns": [
    {
      "title": "Resource type",
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
      "title": "Type",
      "type": "text",
      "source": "Type"
    },
    {
      "title": "Expression",
      "type": "text",
      "source": "Expression"
    },
    {
      "title": "Example",
      "type": "markdown",
      "source": "Example"
    }
  ]
} %}

### Retired search parameters

These search parameters duplicated a FHIR R4 core search parameter. Use the
core search parameter of the same code instead; see the
[changelog](changes.html).

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
      "title": "Description",
      "type": "markdown",
      "source": "Description"
    }
  ]
} %}
