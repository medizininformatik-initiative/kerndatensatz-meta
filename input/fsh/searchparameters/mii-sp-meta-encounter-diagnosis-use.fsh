Instance: mii-sp-meta-encounter-diagnosis-use
InstanceOf: SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/SearchParameter/Encounter-diagnosis-use"
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_Encounter_DiagnosisUse"
* status = #active
* experimental = false
* date = "2024-10-08"
* description = "Suchparameter für Encounter.diagnosis.use"
* code = #diagnosis-use
* base = #Encounter 
* type = #token
* expression = "Encounter.diagnosis.use"