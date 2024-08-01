Instance: mii-sp-icu-observation-component-referencerange
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
* code = #reference-range
* base = #Observation
* type = #composite
* expression = "Observation.referenceRange | Observation.component.referenceRange"
* component[0].definition = "https://www.medizininformatik-initiative.de/fhir/ext/modul-icu/SearchParameter/observation-referencerange-high"
* component[=].expression = "high"
* component[+].definition = "https://www.medizininformatik-initiative.de/fhir/ext/modul-icu/SearchParameter/observation-referencerange-low"
* component[=].expression = "low"

Instance: mii-sp-icu-observation-component-referencerange-low
InstanceOf: SearchParameter
Usage: #definition
* url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-icu/SearchParameter/observation-referencerange-low"
* version = "2024.0.0-ballot"
* publisher = "Medizininformatik Initiative"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.medizininformatik-initiative.de"
* name = "SP_MII_ICU_Observation_ReferenceRange_Low"
* status = #active
* experimental = false
* date = "2024-01-02"
* description = "Suchparameter für Observation.referenceRange.low"
* code = #reference-range-low
* base = #Observation
* type = #quantity
* expression = "Observation.referenceRange.low | Observation.component.referenceRange.low"

Instance: mii-sp-icu-observation-component-referencerange-high
InstanceOf: SearchParameter
Usage: #definition
* url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-icu/SearchParameter/observation-referencerange-high"
* version = "2024.0.0-ballot"
* publisher = "Medizininformatik Initiative"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.medizininformatik-initiative.de"
* name = "SP_MII_ICU_Observation_ReferenceRange_High"
* status = #active
* experimental = false
* date = "2024-01-02"
* description = "Suchparameter für Observation.referenceRange.high"
* code = #reference-range-high
* base = #Observation
* type = #quantity
* expression = "Observation.referenceRange.high | Observation.component.referenceRange.high"