Instance: mii-sp-person-prefix
InstanceOf: SearchParameter
Usage: #definition
* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-person/SearchParameter/Patient-Prefix"
* insert Version
* insert SP_Publisher
* name = "MII_SP_Person_Prefix"
* status = #active
* experimental = false
* date = "2022-02-21"
* description = "Suchparameter für Patient.name.prefix"
* code = #prefix
* base = #Patient
* type = #token
* expression = "Patient.name.prefix"