Instance: mii-sp-person-stadtteil
InstanceOf: SearchParameter
Usage: #definition
* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-person/SearchParameter/Patient-Stadtteil"
* insert Version
* insert SP_Publisher
* name = "MII_SP_Person_Stadtteil"
* status = #active
* experimental = false
* date = "2022-02-21"
* description = "Suchparameter für Patient.address.extension:Stadtteil"
* code = #stadtteil
* base = #Patient
* type = #string
* expression = "Patient.address.extension('http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-precinct').value"