Instance: mii-sp-icu-procedure-recorder
InstanceOf: SearchParameter
Usage: #definition
* url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-icu/SearchParameter/procedure-recorder"
* version = "2024.0.0-ballot"
* publisher = "Medizininformatik Initiative"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.medizininformatik-initiative.de"
* name = "SP_MII_ICU_Procedure_Recorder"
* status = #active
* experimental = false
* date = "2024-01-02"
* description = "Suchparameter für Procedure.recorder"
* code = #recorder
* base = #Procedure
* type = #reference
* expression = "Procedure.recorder"