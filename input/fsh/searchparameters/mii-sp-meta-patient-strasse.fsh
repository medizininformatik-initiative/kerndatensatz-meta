Instance: mii-sp-meta-patient-strasse
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/core/modul-person/SearchParameter/Patient-Strasse"
* insert Version
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_Patient_Strasse"
* status = #active
* experimental = false
* date = "2026-09-01"
* description = "Suchparameter für Patient.address.line.extension:Strasse"
* code = #strasse
* base = #Patient
* type = #string
* expression = "Patient.address.line.extension('http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName').value"