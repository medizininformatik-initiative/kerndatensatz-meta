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
// SearchParameters for Evidence List
//----------------------------------------

Instance: mii-sp-meta-list-mode
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* insert Version
* experimental = false
* date = "2024-10-24"
* name = "MII_SP_Meta_List_Mode"
* description = "SearchParameter for List.mode"
* status = #active 
* code = #mode
* base = #List 
* type = #token
* expression = "List.mode"

Instance: mii-sp-meta-list-flag
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* insert Version
* experimental = false
* date = "2024-10-24"
* name = "MII_SP_Meta_List_Flag"
* description = "SearchParameter for List.flag"
* status = #active 
* code = #flag
* base = #List 
* type = #token
* expression = "List.flag"

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

Instance: mii-sp-meta-medicationstatement-based-on
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* insert Version
* experimental = false
* date = "2024-10-24"
* name = "MII_SP_Meta_MedicationStatement_Based_On"
* description = "SearchParameter for MedicationStatement.basedOn"
* status = #active 
* code = #note
* base = #MedicationStatement 
* type = #reference
* expression = "MedicationStatement.basedOn" 

Instance: mii-sp-meta-medicationstatement-note
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* insert Version
* experimental = false
* date = "2024-10-24"
* name = "MII_SP_Meta_MedicationStatement_Note"
* description = "SearchParameter for MedicationStatement.note"
* status = #active 
* code = #note
* base = #MedicationStatement 
* type = #string
* expression = "MedicationStatement.note" 

//----------------------------------------
// SearchParameters for Verlauf
//----------------------------------------

// No search parameters to cover

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

Instance: mii-sp-meta-observation-note
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* insert Version
* experimental = false
* date = "2024-10-24"
* name = "MII_SP_Meta_Observation_Note"
* description = "SearchParameter for Observation.note"
* status = #active 
* code = #note
* base = #Observation 
* type = #string
* expression = "Observation.note" 
