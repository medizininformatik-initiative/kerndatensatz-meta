Instance: mii-sp-icu-observation-referencerange
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
* type = #token
* expression = "Observation.referenceRange"