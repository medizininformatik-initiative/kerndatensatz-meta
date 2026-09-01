Instance: mii-sp-meta-specimen-diagnose
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-biobank/SearchParameter/diagnose"
* insert Version
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_Specimen_Diagnose"
* date = "2026-09-01"
* status = #active
* experimental = true
* description = "Suchparameter für die Extension Diagnose am Profil Bioprobe"
* code = #diagnose
* base = #Specimen
* type = #reference
* expression = "Specimen.extension.where(url='https://www.medizininformatik-initiative.de/fhir/ext/modul-biobank/StructureDefinition/Diagnose').value"
* target = #Condition
* chain = "*"