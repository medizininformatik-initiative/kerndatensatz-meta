Instance: mii-sp-meta-patient-strasse
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/core/modul-person/SearchParameter/Patient-Strasse"
* insert Version
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Person_Strasse"
* status = #active
* experimental = false
* date = "2024-10-07"
* description = "Suchparameter für Patient.address.line.extension:Strasse"
* code = #strasse
* base = #Patient
* type = #string
* expression = "Patient.address.line.extension('http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName').value"