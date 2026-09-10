Instance: mii-sp-meta-procedure-dokumentationsdatum
InstanceOf: SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/SearchParameter/Procedure-Dokumentationsdatum"
* insert Version
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_Procedure_Dokumentationsdatum"
* status = #active
* experimental = false
* date = "2026-09-01"
* description = "Suchparameter für Procedure.extension:Dokumentationsdatum"
* code = #dokumentationsdatum
* base = #Procedure
* type = #date
* expression = "Procedure.extension('http://fhir.de/StructureDefinition/ProzedurDokumentationsdatum').value"