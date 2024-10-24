//----------------------------------------
// SearchParameters for Diagnose
//----------------------------------------
Instance: mii-sp-meta-condition-verification-status
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* insert Version
* experimental = false
* date = "2024-10-24"
* name = "MII_SP_Meta_Condition_Verification_Status"
* description = "SearchParameter for Condition.verificationStatus"
* status = #active 
* code = #verification-status
* base = #Condition 
* type = #token
* expression = "Condition.verificationStatus"

Instance: mii-sp-meta-condition-evidence
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* insert Version
* experimental = false
* date = "2024-10-24"
* name = "MII_SP_Meta_Condition_Evidence"
* description = "SearchParameter for Condition.evidence"
* status = #active 
* code = #evidence-detail
* base = #Condition 
* type = #reference
* expression = "Condition.evidence"

//----------------------------------------
// SearchParameters for Histologie
//----------------------------------------

// No search parameters to cover

//----------------------------------------
// SearchParameters for TNM Klassifikationen
//----------------------------------------

// No search parameters to cover


//----------------------------------------
// SearchParameters for Weitere Klassifikationen
//----------------------------------------

// No search parameters to cover

//----------------------------------------
// SearchParameters for Redidualstatus
//----------------------------------------

// No search parameters to cover

//----------------------------------------
// SearchParameters for Fernmetastasen
//----------------------------------------

// No search parameters to cover, since Lokalisation was moved from bodySite to valueCodeableConcept


//----------------------------------------
// SearchParameters for Allgemeiner Leistungszustand
//----------------------------------------

// No search parameters to cover

//----------------------------------------
// SearchParameters for Operation
//----------------------------------------

Instance: mii-sp-meta-procedure-complication
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* insert Version
* experimental = false
* date = "2024-10-24"
* name = "MII_SP_Meta_Procedure_Complication"
* description = "SearchParameter for Procedure.complication"
* status = #active 
* code = #complication
* base = #Procedure 
* type = #token
* expression = "Procedure.complication" 

//----------------------------------------
// SearchParameters for Strahlentherapie
//----------------------------------------
Instance: mii-sp-meta-procedure-outcome
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* insert Version
* name = "MII_SP_Meta_Procedure_Outcome"
* description = "SearchParameter for Procedure.outcome"
* status = #active 
* code = #outcome
* base = #Procedure 
* type = #token
* expression = "Procedure.outcome"

//----------------------------------------
// SearchParameters for Nebenwirkung
//----------------------------------------
Instance: mii-sp-meta-adverseevent-suspectentity-instance
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* insert Version
* experimental = false
* date = "2024-10-24"
* name = "MII_SP_Meta_AdverseEvent_SuspectEntity_Instance"
* description = "SearchParameter for AdverseEvent.suspectEntity.instance"
* status = #active 
* code = #instance
* base = #AdverseEvent
* type = #reference
* expression = "AdverseEvent.suspectEntity.instance" 

Instance: mii-sp-meta-adverseevent-encounter
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* insert Version
* experimental = false
* date = "2024-10-24"
* name = "MII_SP_Meta_AdverseEvent_Encounter"
* description = "SearchParameter for AdverseEvent.encounter"
* status = #active 
* code = #encounter
* base = #AdverseEvent 
* type = #reference
* expression = "AdverseEvent.encounter" 

//----------------------------------------
// SearchParameters for Systemische Therapie
//----------------------------------------

//----------------------------------------
// SearchParameters for Verlauf
//----------------------------------------

//----------------------------------------
// SearchParameters for Tumorkonferenz
//----------------------------------------
Instance: mii-sp-meta-careplan-created
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* insert Version
* experimental = false
* date = "2024-10-24"
* name = "MII_SP_Meta_CarePlan_Created"
* description = "SearchParameter for CarePlan.created"
* status = #active 
* code = #created
* base = #CarePlan 
* type = #date
* expression = "CarePlan.created" 

Instance: mii-sp-onko-careplan-supporting-info
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* insert Version
* name = "MII_SP_Care_Plan_Supporting_Info"
* description = "SearchParameter for CarePlan.SupportingInfo"
* status = #active 
* code = #supporting-info
* base = #CarePlan 
* type = #reference
* expression = "CarePlan.SupportingInfo" 

Instance: mii-sp-meta-careplan-addresses
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* insert Version
* experimental = false
* date = "2024-10-24"
* name = "MII_SP_Meta_CarePlan_Addresses"
* description = "SearchParameter for CarePlan.addresses"
* status = #active 
* code = #addresses
* base = #CarePlan 
* type = #reference
* expression = "CarePlan.addresses" 

//----------------------------------------
// SearchParameters for Tod
//----------------------------------------

// No search parameters to cover

//----------------------------------------
// SearchParameters for Genetische Variante
//----------------------------------------

// No search parameters to cover
