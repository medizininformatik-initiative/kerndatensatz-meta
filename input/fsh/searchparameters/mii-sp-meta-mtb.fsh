Instance: mii-sp-meta-encounter-location-physical-type
InstanceOf: SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/SearchParameter/Encounter-location-physicalType"
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_Encounter_Location_PhysicalType"
* status = #active
* experimental = false
* date = "2024-10-08"
* description = "Suchparameter für Encounter.location.physicalType"
* code = #location-physical-type
* base = #Encounter 
* type = #token
* expression = "Encounter.location.physicalType"