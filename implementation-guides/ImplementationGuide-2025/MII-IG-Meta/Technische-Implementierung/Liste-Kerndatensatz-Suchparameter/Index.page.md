---
topic: SearchParameter
---

## {{page-title}}

Auf dieser Seite sind alle im Kerndatensatz definierten Suchparameter aufgeführt. Zusätzlich können die [Suchparameter der FHIR-Kernspezifikation](http://hl7.org/fhir/R4/searchparameter-registry.html) verwendet werden. Die Kerndatensatzmodule legen in ihrem CapabilityStatement fest, welche Suchparameter für das jeweilige Modul unterstützt werden müssen.

@```
from
	SearchParameter
select
	ResourceType: base, Parameter: code, Type: type, Description: description, Paths: expression, Id: id
order by
	ResourceType
```