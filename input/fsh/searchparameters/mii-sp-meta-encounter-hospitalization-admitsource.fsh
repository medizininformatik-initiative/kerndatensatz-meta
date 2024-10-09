Instance: mii-sp-meta-encounter-hospitalization-admitsource
InstanceOf: SearchParameter
Usage: #definition
* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/SearchParameter/Encounter-hospitalization-admitSource"
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_Encounter_Hospitalization_AdmitSource"
* status = #active
* experimental = false
* date = "2024-10-08"
* description = "Suchparameter für Encounter.hospitalization.admitSource"
* code = #hospitalization-admitsource
* base = #Encounter 
* type = #token
* expression = "Encounter.hospitalization.admitSource"