Instance: mii-sp-molgen-servicerequest-reasoncode
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-molgen/SearchParameter/ServiceRequest-ReasonCode"
* name = "SP_MII_MolGen_ServiceRequest_ReasonCode"
* status = #active
* experimental = false
* date = "2022-07-07"
* description = "Suchparameter für ServiceRequest.reasonCode"
* code = #reason-code
* base = #ServiceRequest
* type = #token
* expression = "ServiceRequest.reasonCode"

Instance: mii-sp-molgen-servicerequest-reasonreference
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-molgen/SearchParameter/ServiceRequest-ReasonReference"
* name = "SP_MII_MolGen_ServiceRequest_ReasonReference"
* status = #active
* experimental = false
* date = "2022-07-07"
* description = "Suchparameter für ServiceRequest.reasonReference"
* code = #reason-reference
* base = #ServiceRequest
* type = #reference
* expression = "ServiceRequest.reasonReference"
* target[+] = #Condition
* target[+] = #Observation
* target[+] = #DiagnosticReport
* target[+] = #DocumentReference

Instance: mii-sp-molgen-task-reasoncode
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-molgen/SearchParameter/Task-ReasonCode"
* name = "SP_MII_MolGen_Task_ReasonCode"
* status = #active
* experimental = false
* date = "2022-07-07"
* description = "Suchparameter für Task.reasonCode"
* code = #reason-code
* base = #Task
* type = #token
* expression = "Task.reasonCode"

Instance: mii-sp-molgen-task-reasonreference
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-molgen/SearchParameter/Task-ReasonReference"
* name = "SP_MII_MolGen_Task_ReasonReference"
* status = #active
* experimental = false
* date = "2022-07-07"
* description = "Suchparameter für Task.reasonReference"
* code = #reason-reference
* base = #Task
* type = #reference
* expression = "Task.reasonReference"
* target[0] = #Observation

Instance: mii-sp-molgen-task-for
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-molgen/SearchParameter/Task-For"
* name = "SP_MII_MolGen_Task_For"
* status = #active
* experimental = false
* date = "2022-07-07"
* description = "Suchparameter für Task.for"
* code = #reason-reference
* base = #Task
* type = #reference
* expression = "Task.for"
* target[0] = #Patient

Instance: mii-sp-molgen-familymemberhistory-reasoncode
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-molgen/SearchParameter/FamilyMemberHistory-ReasonCode"
* name = "SP_MII_MolGen_FamilyMemberHistory_ReasonCode"
* status = #active
* experimental = false
* date = "2022-07-07"
* description = "Suchparameter für FamilyMemberHistory.reasonCode"
* code = #reason-code
* base = #FamilyMemberHistory
* type = #token
* expression = "FamilyMemberHistory.reasonCode"

Instance: mii-sp-molgen-familymemberhistory-reasonreference
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-molgen/SearchParameter/FamilyMemberHistory-ReasonReference"
* name = "SP_MII_MolGen_FamilyMemberHistory_ReasonReference"
* status = #active
* experimental = false
* date = "2022-07-07"
* description = "Suchparameter für FamilyMemberHistory.reasonReference"
* code = #reason-reference
* base = #FamilyMemberHistory
* type = #reference
* expression = "FamilyMemberHistory.reasonReference"
* target[0] = #Condition
* target[+] = #Observation
* target[+] = #DiagnosticReport
* target[+] = #DocumentReference
* target[+] = #AllergyIntolerance
* target[+] = #QuestionnaireResponse

//Instance: mii-sp-molgen-riskassessment-reason-code
//InstanceOf: SearchParameter
//Usage: #definition
//* insert SP_Publisher
//* insert SearchParam(riskassessment-reason-code, riskassessment-reason-code, Suche auf RiskAssessment ReasonCode, reason-code, RiskAssessment, token, RiskAssessment.reasonCode)