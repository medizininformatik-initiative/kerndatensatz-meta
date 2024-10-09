Instance: mii-sp-meta-condition-icd10gm-diagnosesicherheit
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/SearchParameter/Condition-code-icd10gm-diagnosesicherheit"
* insert Version
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_Condition_ICD10GM_Diagnosesicherheit"
* status = #active
* experimental = false
* date = "2024-10-08"
* description = "Suchparameter für Condition.code.coding:icd10-gm.extension:Diagnosesicherheit"
* code = #icd10gm-diagnosesicherheit
* base = #Condition
* type = #token
* expression = "Condition.code.coding.extension.where(url = 'http://fhir.de/StructureDefinition/icd-10-gm-diagnosesicherheit').value"

//Instance: mii-sp-diagnose-icd10gm-code-diagnosesicherheit
//InstanceOf: SearchParameter
//Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/SearchParameter/Condition-code-icd10gm-code-diagnosesicherheit"
//* insert SP_Publisher
//* insert Version
//* name = "MII_SP_Diagnose-ICD10GM-Code-Diagnosesicherheit"
//* status = #active
//* experimental = false
//* date = "2024-03-26"
//* description = "Composite Suchparameter für Condition.code.coding:icd10-gm und Condition.code.coding:icd10-gm.extension:Diagnosesicherheit"
//* code = #icd10gm-code-diagnosesicherheit
//* base = #Condition
//* type = #composite
//* expression = "Condition"
//* component[0].definition = "http://hl7.org/fhir/SearchParameter/clinical-code"
//* component[=].expression = "code"
//* component[+].definition = "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/SearchParameter/Condition-code-icd10gm-diagnosesicherheit"
//* component[=].expression = "code.coding.extension.where(url = 'http://fhir.de/StructureDefinition/icd-10-gm-diagnosesicherheit').value"