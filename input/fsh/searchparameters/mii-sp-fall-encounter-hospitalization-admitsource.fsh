Instance: mii-sp-fall-encounter-hospitalization-admitsource
InstanceOf: SearchParameter
Usage: #definition
* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/SearchParameter/Encounter-hospitalization-admitSource"
* insert SP_Publisher
* insert Version
* name = "MII_SP_Fall_Encounter_Hospitalization_AdmitSource"
* status = #active
* experimental = false
* date = "2023-11-10"
* description = "Suchparameter für Encounter.hospitalization.admitSource"
* code = #hospitalization-admitsource
* base = #Encounter 
* type = #token
* expression = "Encounter.hospitalization.admitSource"