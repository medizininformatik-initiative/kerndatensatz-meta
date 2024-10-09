Instance: mii-sp-meta-patient-assignerpid
InstanceOf: SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-person/SearchParameter/Patient-AssignerPID"
* insert Version
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_Patient_AssignerPID"
* status = #active
* experimental = false
* date = "2024-10-07"
* description = "Suchparameter für Patient.identifier.assigner.identifier"
* code = #assigner-pid
* base = #Patient
* type = #token
* expression = "Patient.identifier.assigner.identifier"