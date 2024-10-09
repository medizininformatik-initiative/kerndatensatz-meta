Instance: mii-sp-meta-servicerequest-reasoncode
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
//* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-molgen/SearchParameter/ServiceRequest-ReasonCode"
* name = "MII_SP_Meta_ServiceRequest_ReasonCode"
* status = #active
* experimental = false
* date = "2024-10-08"
* description = "Suchparameter für ServiceRequest.reasonCode"
* code = #reason-code
* base = #ServiceRequest
* type = #token
* expression = "ServiceRequest.reasonCode"

Instance: mii-sp-meta-servicerequest-reasonreference
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
//* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-molgen/SearchParameter/ServiceRequest-ReasonReference"
* name = "MII_SP_Meta_ServiceRequest_ReasonReference"
* status = #active
* experimental = false
* date = "2024-10-08"
* description = "Suchparameter für ServiceRequest.reasonReference"
* code = #reason-reference
* base = #ServiceRequest
* type = #reference
* expression = "ServiceRequest.reasonReference"
* target[+] = #Condition
* target[+] = #Observation
* target[+] = #DiagnosticReport
* target[+] = #DocumentReference

Instance: mii-sp-meta-task-reasoncode
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
//* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-molgen/SearchParameter/Task-ReasonCode"
* name = "MII_SP_Meta_Task_ReasonCode"
* status = #active
* experimental = false
* date = "2024-10-08"
* description = "Suchparameter für Task.reasonCode"
* code = #reason-code
* base = #Task
* type = #token
* expression = "Task.reasonCode"

Instance: mii-sp-meta-task-reasonreference
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
//* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-molgen/SearchParameter/Task-ReasonReference"
* name = "MII_SP_Meta_Task_ReasonReference"
* status = #active
* experimental = false
* date = "2024-10-08"
* description = "Suchparameter für Task.reasonReference"
* code = #reason-reference
* base = #Task
* type = #reference
* expression = "Task.reasonReference"
* target[0] = #Observation

Instance: mii-sp-meta-task-for
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
//* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-molgen/SearchParameter/Task-For"
* name = "MII_Meta_Task_For"
* status = #active
* experimental = false
* date = "2024-10-08"
* description = "Suchparameter für Task.for"
* code = #for
* base = #Task
* type = #reference
* expression = "Task.for"
* target[0] = #Patient

Instance: mii-sp-meta-familymemberhistory-reasoncode
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
//* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-molgen/SearchParameter/FamilyMemberHistory-ReasonCode"
* name = "MII_SP_Meta_FamilyMemberHistory_ReasonCode"
* status = #active
* experimental = false
* date = "2024-10-08"
* description = "Suchparameter für FamilyMemberHistory.reasonCode"
* code = #reason-code
* base = #FamilyMemberHistory
* type = #token
* expression = "FamilyMemberHistory.reasonCode"

Instance: mii-sp-meta-familymemberhistory-reasonreference
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
//* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-molgen/SearchParameter/FamilyMemberHistory-ReasonReference"
* name = "MII_SP_Meta_FamilyMemberHistory_ReasonReference"
* status = #active
* experimental = false
* date = "2024-10-08"
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