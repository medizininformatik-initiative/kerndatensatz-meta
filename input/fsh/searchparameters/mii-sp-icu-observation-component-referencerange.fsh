Instance: sp-mii-icu-observation-referencerange
InstanceOf: SearchParameter
Usage: #definition
* url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-icu/SearchParameter/observation-referencerange"
* version = "2024.0.0-ballot"
* publisher = "Medizininformatik Initiative"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.medizininformatik-initiative.de"
* name = "SP_MII_ICU_Observation_ReferenceRange"
* status = #active
* experimental = false
* date = "2024-01-02"
* description = "Suchparameter für Observation.referenceRange"
* code = #referenceRange
* base = #Observation
* type = #composite
* expression = "Observation.referenceRange"
* component[0].definition = "https://www.medizininformatik-initiative.de/fhir/core/modul-medikation/SearchParameter/observation-referencerange-high"
* component[=].expression = "high"
* component[+].definition = "https://www.medizininformatik-initiative.de/fhir/core/modul-medikation/SearchParameter/observation-referencerange-low"
* component[=].expression = "low"