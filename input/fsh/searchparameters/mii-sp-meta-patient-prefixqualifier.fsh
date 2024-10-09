Instance: mii-sp-meta-patient-prefixqualifier
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/core/modul-person/SearchParameter/Patient-PrefixQualifier"
* insert Version
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_Patient_PrefixQualifier"
* status = #active
* experimental = false
* date = "2024-10-07"
* description = "Suchparameter für Patient.name.prefix.extension:prefix-qualifier"
* code = #prefix-qualifier
* base = #Patient
* type = #token
* expression = "Patient.name.prefix.extension('http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier').value"