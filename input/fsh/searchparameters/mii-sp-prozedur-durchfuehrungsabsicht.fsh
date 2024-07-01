Instance: mii-sp-prozedur-durchfuehrungsabsicht
InstanceOf: SearchParameter
Usage: #definition
* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/SearchParameter/Procedure-Durchfuehrungsabsicht"
* insert Version
* insert SP_Publisher
* name = "MII_SP_Prozedur_Durchfuehrungsabsicht"
* status = #active
* experimental = false
* date = "2024-04-24"
* description = "Suchparameter für Procedure.extension:Durchfuehrungsabsicht"
* code = #durchfuehrungsabsicht
* base = #Procedure
* type = #token
* expression = "Procedure.extension('https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Durchfuehrungsabsicht').value"