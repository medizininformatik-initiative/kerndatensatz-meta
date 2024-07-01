Instance: mii-sp-fall-encounter-location-physical-type
InstanceOf: SearchParameter
Usage: #definition
* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/SearchParameter/Encounter-location-physicalType"
* insert SP_Publisher
* insert Version
* name = "MII_SP_Fall_Encounter_Location_PhysicalType"
* status = #active
* experimental = false
* date = "2023-11-10"
* description = "Suchparameter für Encounter.location.physicalType"
* code = #location-physical-type
* base = #Encounter 
* type = #token
* expression = "Encounter.location.physicalType"