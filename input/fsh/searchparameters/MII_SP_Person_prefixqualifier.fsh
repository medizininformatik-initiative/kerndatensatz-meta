Instance: mii-sp-person-prefixqualifier
InstanceOf: SearchParameter
Usage: #definition
* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-person/SearchParameter/Patient-PrefixQualifier"
* insert Version
* insert SP_Publisher
* name = "MII_SP_Person_PrefixQualifier"
* status = #active
* experimental = false
* date = "2022-02-21"
* description = "Suchparameter für Patient.name.prefix.extension:prefix-qualifier"
* code = #prefix-qualifier
* base = #Patient
* type = #token
* expression = "Patient.name.prefix.extension('http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier').value"