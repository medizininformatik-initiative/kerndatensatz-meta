Instance: mii-sp-meta-patient-otheramtlich
InstanceOf: SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-person/SearchParameter/Patient-OtherAmtlich"
* insert Version
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_Patient_OtherAmtlich"
* status = #active
* experimental = false
* date = "2024-10-07"
* description = "Suchparameter für Patient.gender.extension:other-amtlich"
* code = #other-amtlich
* base = #Patient
* type = #token
* expression = "Patient.gender.extension('http://fhir.de/StructureDefinition/gender-amtlich-de').value"