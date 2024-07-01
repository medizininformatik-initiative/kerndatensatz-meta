Instance: mii-sp-fall-encounter-diagnosis-use
InstanceOf: SearchParameter
Usage: #definition
* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/SearchParameter/Encounter-diagnosis-use"
* insert SP_Publisher
* insert Version
* name = "MII_SP_Fall_Encounter_DiagnosisUse"
* status = #active
* experimental = false
* date = "2023-11-10"
* description = "Suchparameter für Encounter.diagnosis.use"
* code = #diagnosis-use
* base = #Encounter 
* type = #token
* expression = "Encounter.diagnosis.use"