Instance: mii-sp-person-assignerpid
InstanceOf: SearchParameter
Usage: #definition
* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-person/SearchParameter/Patient-AssignerPID"
* insert Version
* insert SP_Publisher
* name = "MII_SP_Person_AssignerPID"
* status = #active
* experimental = false
* date = "2022-02-21"
* description = "Suchparameter für Patient.identifier.assigner.identifier"
* code = #assigner-pid
* base = #Patient
* type = #token
* expression = "Patient.identifier.assigner.identifier"