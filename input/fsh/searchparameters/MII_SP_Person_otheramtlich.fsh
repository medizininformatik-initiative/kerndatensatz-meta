Instance: mii-sp-person-otheramtlich
InstanceOf: SearchParameter
Usage: #definition
* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-person/SearchParameter/Patient-OtherAmtlich"
* insert Version
* insert SP_Publisher
* name = "MII_SP_Person_OtherAmtlich"
* status = #active
* experimental = false
* date = "2022-02-21"
* description = "Suchparameter für Patient.gender.extension:other-amtlich"
* code = #other-amtlich
* base = #Patient
* type = #token
* expression = "Patient.gender.extension('http://fhir.de/StructureDefinition/gender-amtlich-de').value"