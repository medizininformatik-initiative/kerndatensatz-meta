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

Instance: mii-sp-meta-condition-evidence-detail
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* insert Version
* experimental = false
* date = "2024-10-24"
* name = "MII_SP_Meta_Condition_Evidence_Detail"
* description = "SearchParameter for Condition.evidence.detail"
* status = #active 
* code = #evidence-detail
* base = #Condition 
* type = #reference
* target = #List
* expression = "Condition.evidence.detail"

// Instance: mii-sp-meta-condition-ext-morphology-behavior-icdo3
// InstanceOf: SearchParameter
// Usage: #definition
// * insert SP_Publisher
// * insert LicenseCodeableCCBY40Instance
// * insert SP_Profile
// * insert Version
// * name = "MII_SP_Meta_Condition_Extension_Morphology_Behaviour_ICDO3"
// * description = "SearchParameter for Condition.extension[morphology-behaviour-icdo3]"
// * status = #active 
// * code = #morphology-behavior-icdo3
// * base = #Diagnosis
// * type = #token
// * expression = "Condition.extension.where(url='https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-ex-onko-histology-morphology-behavior-icdo3').value"

//----------------------------------------
// SearchParameters for Histologie
//----------------------------------------

// No search parameters to cover

//----------------------------------------
// SearchParameters for TNM Klassifikationen
//----------------------------------------
Instance: mii-sp-meta-observation-hasmember
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* insert Version
* experimental = false
* date = "2024-10-24"
* name = "MII_SP_Meta_Observation_hasMember"
* description = "SearchParameter for Observation.hasMember"
* status = #active 
* code = #has-member
* base = #Observation 
* type = #reference
* expression = "Observation.hasMember"

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
//Instance: mii-sp-meta-procedure-ext-operation-intention // im IG sollte kleingeschrieben werden im profil + Dokumentationsdatum auch
//InstanceOf: SearchParameter
//Usage: #definition
//* insert SP_Publisher
//* insert LicenseCodeableCCBY40Instance
//* insert SP_Profile
//* insert Version
//* name = "MII_SP_Meta_Procedure_Operation_Extension_Intention"
//* description = "SearchParameter for Procedure.extension.intention"
//* status = #active 
//* code = #intention
//* base = #Procedure
//* type = #token
//* expression = "Procedure.extension.where(url='https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-ex-onko-operation-intention').value"

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
// Instance: mii-sp-meta-procedure-strahlentherapie-ext-stellungzurop
// InstanceOf: SearchParameter
// Usage: #definition
// * insert SP_Publisher
// * insert LicenseCodeableCCBY40Instance
// * insert SP_Profile
// * insert Version
// * name = "MII_SP_Meta_Procedure_Strahlentherapie_Extension_StellungZurOp"
// * description = "SearchParameter for Procedure.extension.stellung"
// * status = #active 
// * code = #stellung
// * base = #Procedure
// * type = #token
// * expression = "Procedure.extension.where(url='https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-ex-onko-strahlentherapie-stellung-zur-op').value"

// Instance: mii-sp-meta-procedure-strahlentherapie-ext-applikationsart
// InstanceOf: SearchParameter
// Usage: #definition
// * insert SP_Publisher
// * insert LicenseCodeableCCBY40Instance
// * insert SP_Profile
// * insert Version
// * name = "MII_SP_Meta_Strahlentherapie_Extension_Applikationsart"
// * description = "SearchParameter for Procedure.extension:bestrahlung.extension:applikationsart"
// * status = #active 
// * code = #bestrahlung-applikationsart
// * base = #Procedure
// * type = #token
// * expression = "Procedure.extension.where(url='https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-ex-onko-strahlentherapie-bestrahlung').extension.where(url='Applikationsart').value"

// Instance: mii-sp-meta-procedure-strahlentherapie-ext-strahlenart
// InstanceOf: SearchParameter
// Usage: #definition
// * insert SP_Publisher
// * insert LicenseCodeableCCBY40Instance
// * insert SP_Profile
// * insert Version
// * name = "MII_SP_Meta_Procedure_Strahlentherapie_Extension_Strahlenart"
// * description = "SearchParameter for Procedure.extension:bestrahlung.extension:strahlenart"
// * status = #active 
// * code = #bestrahlung-strahlenart
// * base = #Procedure
// * type = #token
// * expression = "Procedure.extension.where(url='https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-ex-onko-strahlentherapie-bestrahlung').extension.where(url='Strahlenart').value"

// Instance: mii-sp-meta-procedure-strahlentherapie-extension-zielgebiet
// InstanceOf: SearchParameter
// Usage: #definition
// * insert SP_Publisher
// * insert LicenseCodeableCCBY40Instance
// * insert SP_Profile
// * insert Version
// * name = "MII_SP_Meta_Procedure_Strahlentherapie_Extension_Zielgebiet"
// * description = "SearchParameter for Procedure.extension:bestrahlung.extension:zielgebiet"
// * status = #active 
// * code = #bestrahlung-zielgebiet
// * base = #Procedure
// * type = #token
// * expression = "Procedure.extension.where(url='https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-ex-onko-strahlentherapie-bestrahlung').extension.where(url='Zielgebiet').value"

// Instance: mii-sp-meta-procedure-strahlentherapie-ext-ziel-lateralitaet
// InstanceOf: SearchParameter
// Usage: #definition
// * insert SP_Publisher
// * insert LicenseCodeableCCBY40Instance
// * insert SP_Profile
// * insert Version
// * name = "MII_SP_Meta_Procedure_Strahlentherapie_Extension_Bestrahlung_Ziel_Lateralitaet"
// * description = "SearchParameter for Procedure.extension:bestrahlung.extension:zielgebiet_Lateralitaet"
// * status = #active 
// * code = #bestrahlung-zielgebiet-Lateralitaet
// * base = #Procedure
// * type = #token
// * expression = "Procedure.extension.where(url='https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-ex-onko-strahlentherapie-bestrahlung').extension.where(url='Zielgebiet_Lateralitaet').value"

// Instance: mii-sp-meta-procedure-strahlentherapie-ext-gesamtdosis
// InstanceOf: SearchParameter
// Usage: #definition
// * insert SP_Publisher
// * insert LicenseCodeableCCBY40Instance
// * insert SP_Profile
// * insert Version
// * name = "MII_SP_Meta_Strahlentherapie_Extension_Gesamtdosis"
// * description = "SearchParameter for Procedure.extension:bestrahlung.extension:gesamtdosis"
// * status = #active 
// * code = #bestrahlung-gesamtdosis
// * base = #Procedure
// * type = #quantity
// * expression = "Procedure.extension.where(url='https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-ex-onko-strahlentherapie-bestrahlung').extension.where(url='Gesamtdosis').value"

// Instance: mii-sp-meta-procedure-strahlentherapie-ext-einzeldosis
// InstanceOf: SearchParameter
// Usage: #definition
// * insert SP_Publisher
// * insert LicenseCodeableCCBY40Instance
// * insert SP_Profile
// * insert Version
// * name = "MII_SP_Meta_Strahlentherapie_Extension_Einzeldosis"
// * description = "SearchParameter for Procedure.extension:bestrahlung.extension:einzeldosis"
// * status = #active 
// * code = #bestrahlung-einzeldosis
// * base = #Procedure
// * type = #quantity
// * expression = "Procedure.extension.where(url='https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-ex-onko-strahlentherapie-bestrahlung').extension.where(url='Einzeldosis').value"

// Instance: mii-sp-meta-procedure-strahlentherapie-ext-boost
// InstanceOf: SearchParameter
// Usage: #definition
// * insert SP_Publisher
// * insert LicenseCodeableCCBY40Instance
// * insert SP_Profile
// * insert Version
// * name = "MII_SP_Meta_Strahlentherapie_Extension_Boost"
// * description = "SearchParameter for Procedure.extension:bestrahlung.extension:boost"
// * status = #active 
// * code = #bestrahlung-boost
// * base = #Procedure
// * type = #token
// * expression = "Procedure.extension.where(url='https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-ex-onko-strahlentherapie-bestrahlung').extension.where(url='Boost').value"

Instance: mii-sp-meta-procedure-outcome
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* insert Version
* date = "2024-11-07"
* experimental = false
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

// Instance: mii-sp-meta-systemischetherapie-ext-stellungzurop
// InstanceOf: SearchParameter
// Usage: #definition
// * insert SP_Publisher
// * insert LicenseCodeableCCBY40Instance
// * insert SP_Profile
// * insert Version
// * name = "MII_SP_Meta_SystemischeTherapie_Extension_StellungZurOp"
// * description = "SearchParameter for Procedure.extension.stellung"
// * status = #active 
// * code = #extension-stellung
// * base = #Procedure
// * type = #token
// * expression = "Procedure.extension.where(url='https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-ex-onko-strahlentherapie-stellung').value"


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

Instance: mii-sp-meta-careplan-contributor
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* insert Version
* experimental = false
* date = "2024-10-24"
* name = "MII_SP_Meta_CarePlan_Contributor"
* description = "SearchParameter for CarePlan.contributor"
* status = #active 
* code = #contributor
* base = #CarePlan 
* type = #reference
* expression = "CarePlan.contributor" 

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
// Instance: mii-sp-meta-tod-interpretation
// InstanceOf: SearchParameter
// Usage: #definition
// * insert SP_Publisher
// * insert LicenseCodeableCCBY40Instance
// * insert SP_Profile
// * insert Version
// * name = "MII_SP_Meta_Tod_Interpreation"
// * description = "SearchParameter for Observation.interpretation"
// * status = #active
// * code = #interpretation
// * base = #Observation
// * type = #token
// * expression = "Observation.interpretation"

Instance: mii-sp-meta-observation-focus
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* insert Version
* experimental = false
* date = "2024-10-24"
* name = "MII_SP_Meta_Observation_Focus"
* description = "SearchParameter for Observation.focus"
* status = #active
* code = #focus
* base = #Observation
* type = #reference
* expression = "Observation.focus"

Instance: mii-sp-meta-observation-encounter
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* insert Version
* experimental = false
* date = "2024-10-24"
* name = "MII_SP_Meta_Observation_Encounter"
* description = "SearchParameter for Observation.encounter"
* status = #active
* code = #encounter
* base = #Observation
* type = #reference
* expression = "Observation.encounter"


//----------------------------------------
// SearchParameters for Genetische Variante
//----------------------------------------

// No search parameters to cover
