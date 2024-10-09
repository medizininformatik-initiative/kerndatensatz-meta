Instance: mii-sp-meta-encounter-servicetype
InstanceOf: SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/SearchParameter/Encounter-servicetype"
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_Encounter_ServiceType"
* status = #active
* experimental = false
* date = "2024-10-08"
* description = "Suchparameter für Encounter.serviceType"
* code = #service-type
* base = #Encounter 
* type = #token
* expression = "Encounter.serviceType"