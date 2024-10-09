Instance: mii-sp-meta-patient-adresszusatz
InstanceOf: SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-person/SearchParameter/Patient-Adresszusatz"
* insert Version
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_Person_Adresszusatz"
* status = #active
* experimental = false
* date = "2024-10-07"
* description = "Suchparameter für Patient.address.line.extension:Adresszusatz"
* code = #adresszusatz
* base = #Patient
* type = #string
* expression = "Patient.address.line.extension('http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-additionalLocator').value"