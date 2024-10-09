Instance: mii-sp-meta-procedure-recorder
InstanceOf: SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-icu/SearchParameter/procedure-recorder"
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_Procedure_Recorder"
* status = #active
* experimental = false
* date = "2024-10-08"
* description = "Suchparameter für Procedure.recorder"
* code = #recorder
* base = #Procedure
* type = #reference
* expression = "Procedure.recorder"