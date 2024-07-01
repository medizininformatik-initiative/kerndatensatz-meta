Instance: mii-sp-diagnose-icd10gm-seitenlokalisation
InstanceOf: SearchParameter
Usage: #definition
* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/SearchParameter/Condition-code-icd10gm-extension-seitenlokalisation"
* insert Version
* insert SP_Publisher
* name = "MII_SP_Diagnose-ICD10GM-Seitenlokalisation"
* status = #active
* experimental = false
* date = "2024-03-26"
* description = "Suchparameter für Condition.code.coding:icd10-gm.extension:Seitenlokalisation"
* code = #icd10gm-seitenlokalisation
* base = #Condition
* type = #token
* expression = "Condition.code.coding.extension.where(url = 'http://fhir.de/StructureDefinition/seitenlokalisation').value"

//Instance: mii-sp-diagnose-icd10gm-code-seitenlokalisation
//InstanceOf: SearchParameter
//Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/SearchParameter/Condition-code-icd10gm-code-seitenlokalisation"
//* insert SP_Publisher
//* insert Version
//* name = "MII_SP_Diagnose-ICD10GM-Code-Seitenlokalisation"
//* status = #active
//* experimental = false
//* date = "2024-03-26"
//* description = "Composite Suchparameter für Condition.code.coding:icd10-gm und Condition.code.coding:icd10-gm.extension:Seitenlokalisation"
//* code = #icd10gm-code-seitenlokalisation
//* base = #Condition
//* type = #composite
//* expression = "Condition"
//* component[0].definition = "http://hl7.org/fhir/SearchParameter/clinical-code"
//* component[=].expression = "code"
//* component[+].definition = "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/SearchParameter/Condition-code-coding-icd10gm-extension-seitenlokalisation"
//* component[=].expression = "code.coding.extension.where(url = 'http://fhir.de/StructureDefinition/seitenlokalisation').value"