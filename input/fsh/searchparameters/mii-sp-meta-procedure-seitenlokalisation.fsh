Instance: mii-sp-meta-procedure-ops-seitenlokalisation
InstanceOf: SearchParameter
Usage: #definition
* insert Version
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_Procedure_OPS_Seitenlokalisation"
* status = #active
* experimental = false
* date = "2025-10-21"
* description = "Suchparameter für Procedure.code.coding:ops.extension:Seitenlokalisation"
* code = #ops-seitenlokalisation
* base = #Procedure
* type = #token
* expression = "Procedure.code.coding.extension.where(url = 'http://fhir.de/StructureDefinition/seitenlokalisation').value"