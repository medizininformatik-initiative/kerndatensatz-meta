Instance: mii-sp-meta-patient-prefix
InstanceOf: SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-person/SearchParameter/Patient-Prefix"
* insert Version
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_Patient_Prefix"
* status = #active
* experimental = false
* date = "2024-10-07"
* description = "Suchparameter für Patient.name.prefix"
* code = #prefix
* base = #Patient
* type = #token
* expression = "Patient.name.prefix"