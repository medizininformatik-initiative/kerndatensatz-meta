Instance: mii-sp-meta-patient-postfach
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/core/modul-person/SearchParameter/Patient-Postfach"
* insert Version
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_Patient_Postfach"
* status = #active
* experimental = false
* date = "2024-10-07"
* description = "Suchparameter für Patient.address.line.extension:Postfach"
* code = #postfach
* base = #Patient
* type = #string
* expression = "Patient.address.line.extension.where(url='http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-postBox').value"