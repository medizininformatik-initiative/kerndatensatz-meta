Instance: mii-sp-meta-condition-icd10gm-mehrfachcodierung
InstanceOf: SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/SearchParameter/Condition-code-icd10gm-mehrfachcodierung"
* insert Version
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_Condition_ICD10GM_Mehrfachcodierung"
* status = #active
* experimental = false
* date = "2024-10-08"
* description = "Suchparameter für Condition.code.coding:icd10-gm.extension:Mehrfachcodierungs-Kennzeichen"
* code = #icd10gm-mehrfachcodierung
* base = #Condition
* type = #token
* expression = "Condition.code.coding.extension.where(url = 'http://fhir.de/StructureDefinition/icd-10-gm-mehrfachcodierungs-kennzeichen').value"

//Instance: mii-sp-diagnose-icd10gm-code-mehrfachcodierung
//InstanceOf: SearchParameter
//Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/SearchParameter/Condition-code-icd10gm-code-mehrfachcodierung"
//* insert SP_Publisher
//* insert Version
//* name = "MII_SP_Diagnose-ICD10GM-Code-Mehrfachcodierung"
//* status = #active
//* experimental = false
//* date = "2024-03-26"
//* description = "Composite Suchparameter für Condition.code.coding:icd10-gm und Condition.code.coding:icd10-gm.extension:Mehrfachcodierungs-Kennzeichen"
//* code = #icd10gm-code-mehrfachcodierung
//* base = #Condition
//* type = #composite
//* expression = "Condition"
//* component[0].definition = "http://hl7.org/fhir/SearchParameter/clinical-code"
//* component[=].expression = "code"
//* component[+].definition = "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/SearchParameter/Condition-code-icd10gm-mehrfachcodierung"
//* component[=].expression = "code.coding.extension.where(url = 'http://fhir.de/StructureDefinition/icd-10-gm-mehrfachcodierungs-kennzeichen').value"