Instance: mii-sp-fall-encounter-servicetype
InstanceOf: SearchParameter
Usage: #definition
* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/SearchParameter/Encounter-servicetype"
* insert SP_Publisher
* insert Version
* name = "MII_SP_Fall_Encounter_ServiceType"
* status = #active
* experimental = false
* date = "2023-11-10"
* description = "Suchparameter für Encounter.serviceType"
* code = #service-type
* base = #Encounter 
* type = #token
* expression = "Encounter.serviceType"