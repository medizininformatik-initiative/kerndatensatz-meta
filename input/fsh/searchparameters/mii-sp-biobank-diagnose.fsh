Instance: mii-sp-biobank-diagnose
InstanceOf: SearchParameter
Usage: #definition
* url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-biobank/SearchParameter/diagnose"
* name = "diagnose"
* status = #active
* experimental = true
* description = "Suchparameter für die Extension Diagnose am Profil Bioprobe"
* code = #diagnose
* base = #Specimen
* type = #reference
* expression = "Specimen.extension.where(url='https://www.medizininformatik-initiative.de/fhir/ext/modul-biobank/StructureDefinition/Diagnose').value"
* target = #Condition
* chain = "*"