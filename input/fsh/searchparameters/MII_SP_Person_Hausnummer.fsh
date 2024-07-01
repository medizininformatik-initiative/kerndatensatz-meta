Instance: mii-sp-person-hausnummer
InstanceOf: SearchParameter
Usage: #definition
* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-person/SearchParameter/Patient-Hausnummer"
* insert Version
* insert SP_Publisher
* name = "MII_SP_Person_Hausnummer"
* status = #active
* experimental = false
* date = "2022-02-21"
* description = "Suchparameter für Patient.address.line.extension:Hausnummer"
* code = #hausnummer
* base = #Patient
* type = #string
* expression = "Patient.address.line.extension('http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber').value"