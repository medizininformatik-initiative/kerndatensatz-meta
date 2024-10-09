Instance: mii-sp-meta-patient-gemeindeschluessel
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/core/modul-person/SearchParameter/Patient-Gemeindeschluessel"
* insert Version
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_Patient_Gemeindeschluessel"
* status = #active
* experimental = false
* date = "2024-10-07"
* description = "Suchparameter für Patient.address.city.extension:gemeindeschluessel"
* code = #gemeindeschluessel
* base = #Patient
* type = #token
* expression = "Patient.address.city.extension('http://fhir.de/StructureDefinition/destatis/ags').value"