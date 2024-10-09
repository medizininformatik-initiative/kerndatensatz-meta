Instance: mii-sp-meta-patient-stadtteil
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/core/modul-person/SearchParameter/Patient-Stadtteil"
* insert Version
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_Patient_Stadtteil"
* status = #active
* experimental = false
* date = "2024-10-07"
* description = "Suchparameter für Patient.address.extension:Stadtteil"
* code = #stadtteil
* base = #Patient
* type = #string
* expression = "Patient.address.extension('http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-precinct').value"