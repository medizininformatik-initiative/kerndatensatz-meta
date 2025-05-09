Instance: mii-sp-meta-mtb-clinicalimpression-effectiveperiod-start
InstanceOf: MII_PR_Meta_SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/SearchParameter/Encounter-location-physicalType"
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_ClinicalImpression_EffectivePeriod_Start"
* status = #draft
* experimental = false
* date = "2025-05-26"
* description = "Suchparameter für ClinicalImpression.effectivePeriod.start"
* code = #period-start
* base = #ClinicalImpression 
* type = #date
* expression = "ClinicalImpression.effectivePeriod.start"

Instance: mii-sp-meta-mtb-clinicalimpression-effectiveperiod-end
InstanceOf: MII_PR_Meta_SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/SearchParameter/Encounter-location-physicalType"
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_ClinicalImpression_EffectivePeriod_End"
* status = #draft
* experimental = false
* date = "2025-05-26"
* description = "Suchparameter für ClinicalImpression.effectivePeriod.end"
* code = #period-end
* base = #ClinicalImpression 
* type = #date
* expression = "ClinicalImpression.effectivePeriod.end"

Instance: mii-sp-meta-mtb-condition-stage-assessment
InstanceOf: MII_PR_Meta_SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/SearchParameter/Encounter-location-physicalType"
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_Condition_Stage_Assessment"
* status = #draft
* experimental = false
* date = "2025-05-26"
* description = "Suchparameter für Condition.stage.assessment"
* code = #assessment
* base = #Condition 
* type = #reference
* expression = "Condition.stage.assessment"

Instance: mii-sp-meta-mtb-condition-leitlinie-therapielinie
InstanceOf: MII_PR_Meta_SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/SearchParameter/Encounter-location-physicalType"
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_Condition_Leitlinie_Therapielinie"
* status = #draft
* experimental = false
* date = "2025-05-26"
* description = "Suchparameter für Condition.extension[LeitlinenbehandlungStatus].extension[Therapielinie].valueUnsignedInt"
* code = #leitlinie
* base = #Condition 
* type = #number
* expression = "Condition.extension[LeitlinenbehandlungStatus].extension[Therapielinie].valueUnsignedInt"

Instance: mii-sp-meta-mtb-condition-leitlinie-zulassungsstatus
InstanceOf: MII_PR_Meta_SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/SearchParameter/Encounter-location-physicalType"
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_Condition_Leitlinie_Zulassungsstatus"
* status = #draft
* experimental = false
* date = "2025-05-26"
* description = "Suchparameter für Condition.extension[LeitlinenbehandlungStatus].extension[Zulassungsstatus].valueCodeableConcept"
* code = #therapielinie
* base = #Condition 
* type = #token
* expression = "Condition.extension[LeitlinenbehandlungStatus].extension[Zulassungsstatus].valueCodeableConcept"

Instance: mii-sp-meta-mtb-request-group-action-resource
InstanceOf: MII_PR_Meta_SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/SearchParameter/Encounter-location-physicalType"
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_RequestGroup_Action_Resource"
* status = #draft
* experimental = false
* date = "2025-05-26"
* description = "Suchparameter für RequestGroup.action.resource"
* code = #action-resource
* base = #RequestGroup 
* type = #reference
* expression = "RequestGroup.action.resource"

Instance: mii-sp-meta-mtb-request-group-extension-prioritaet
InstanceOf: MII_PR_Meta_SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/SearchParameter/Encounter-location-physicalType"
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_RequestGroup_Extension_Prioritaet"
* status = #draft
* experimental = false
* date = "2025-05-26"
* description = "Suchparameter für RequestGroup.extension[Prioritaet]"
* code = #prioritaet
* base = #RequestGroup 
* type = #number
* expression = "RequestGroup.extension[Prioritaet]"

Instance: mii-sp-meta-mtb-extension-evidenzgraduierung
InstanceOf: MII_PR_Meta_SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/SearchParameter/Encounter-location-physicalType"
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_Extension_Evidenzgraduierung"
* status = #draft
* experimental = false
* date = "2025-05-26"
* description = "Suchparameter für *.extension[Evidenzgraduierung]"
* code = #evidenzgraduierung
* base[+] = #RequestGroup 
* base[+] = #MedicationRequest
* type = #token
* expression[+] = "RequestGroup.extension[Evidenzgraduierung]"
* expression[+] = "MedicationRequest.extension[Evidenzgraduierung]"

Instance: mii-sp-meta-mtb-request-group-extension-publikation
InstanceOf: MII_PR_Meta_SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/SearchParameter/Encounter-location-physicalType"
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_RequestGroup_Extension_Publikation"
* status = #draft
* experimental = false
* date = "2025-05-26"
* description = "Suchparameter für RequestGroup.extension[Publikation]"
* code = #publikation
* base = #RequestGroup 
* type = #token // Nicht ganz klar, ob eventuell auch string möglich
* expression = "RequestGroup.extension[Publikation]"

Instance: mii-sp-meta-mtb-careplan-activity-outcomereference
InstanceOf: MII_PR_Meta_SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/SearchParameter/Encounter-location-physicalType"
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_CarePlan_Activity_outcomeReference"
* status = #draft
* experimental = false
* date = "2025-05-26"
* description = "Suchparameter für CarePlan.activity.outcomeReference"
* code = #outcome-reference
* base = #CarePlan
* type = #reference
* expression = "CarePlan.activity.outcomeReference"

Instance: mii-sp-meta-mtb-claim-type
InstanceOf: MII_PR_Meta_SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/SearchParameter/Encounter-location-physicalType"
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_Claim_type"
* status = #draft
* experimental = false
* date = "2025-05-26"
* description = "Suchparameter für Claim.type"
* code = #claim-type
* base = #Claim
* type = #token
* expression = "Claim.type"

Instance: mii-sp-meta-mtb-claim-related-claim
InstanceOf: MII_PR_Meta_SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/SearchParameter/Encounter-location-physicalType"
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_Claim_related_claim"
* status = #draft
* experimental = false
* date = "2025-05-26"
* description = "Suchparameter für Claim.related.claim"
* code = #claim-related
* base = #Claim
* type = #reference
* expression = "Claim.related.claim"

Instance: mii-sp-meta-mtb-claim-related-relationship
InstanceOf: MII_PR_Meta_SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/SearchParameter/Encounter-location-physicalType"
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_Claim_related_relationship"
* status = #draft
* experimental = false
* date = "2025-05-26"
* description = "Suchparameter für Claim.related.relationship"
* code = #claim-relationship
* base = #Claim
* type = #token
* expression = "Claim.related.relationship"

Instance: mii-sp-meta-mtb-claim-response-entscheidung
InstanceOf: MII_PR_Meta_SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/SearchParameter/Encounter-location-physicalType"
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_ClaimResponse_Entscheidung"
* status = #draft
* experimental = false
* date = "2025-05-26"
* description = "Suchparameter für ClaimResponse.extension[Entscheidung].valueCodeableConcept"
* code = #claimresponse-entscheidung
* base = #ClaimResponse
* type = #token
* expression = "ClaimResponse.extension[Entscheidung].valueCodeableConcept"

Instance: mii-sp-meta-mtb-claim-response-ablehnungsgrund
InstanceOf: MII_PR_Meta_SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/SearchParameter/Encounter-location-physicalType"
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_ClaimResponse_Ablehnungsgrund"
* status = #draft
* experimental = false
* date = "2025-05-26"
* description = "Suchparameter für ClaimResponse.extension[Ablehnungsgrund].valueCodeableConcept"
* code = #claimresponse-ablehnungsgrund
* base = #ClaimResponse
* type = #token
* expression = "ClaimResponse.extension[Ablehnungsgrund].valueCodeableConcept"

Instance: mii-sp-meta-mtb-medicationstatement-dosage
InstanceOf: MII_PR_Meta_SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/SearchParameter/Encounter-location-physicalType"
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_MedicationStatement_Dosage"
* status = #draft
* experimental = false
* date = "2025-05-26"
* description = "Suchparameter für MedicationStatement.dosage"
* code = #dosisdichte
* base = #MedicationStatement
* type = #token
* expression = "MedicationStatement.dosage"

Instance: mii-sp-meta-mtb-procedure-status-reason
InstanceOf: MII_PR_Meta_SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/SearchParameter/Encounter-location-physicalType"
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_Procedure_StatusReason"
* status = #draft
* experimental = false
* date = "2025-05-26"
* description = "Suchparameter für procedure.statusReason"
* code = #status-reason
* base = #Procedure
* type = #token
* expression = "procedure.statusReason"

Instance: mii-sp-meta-mtb-procedure-extension-causedby
InstanceOf: MII_PR_Meta_SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/SearchParameter/Encounter-location-physicalType"
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_Procedure_CausedBy"
* status = #draft
* experimental = false
* date = "2025-05-26"
* description = "Suchparameter für procedure.extension[causedBy]"
* code = #caused-by
* base = #Procedure
* type = #reference
* expression = "procedure.extension[causedBy].valueReference"

Instance: mii-sp-meta-mtb-procedure-note
InstanceOf: MII_PR_Meta_SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/SearchParameter/Encounter-location-physicalType"
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_Procedure_Note"
* status = #draft
* experimental = false
* date = "2025-05-26"
* description = "Suchparameter für procedure.note"
* code = #note
* base = #Procedure
* type = #string
* expression = "procedure.note.text"

Instance: mii-sp-meta-mtb-genomicstudyanalysis-method-type
InstanceOf: MII_PR_Meta_SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/SearchParameter/Encounter-location-physicalType"
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_GenomicStudyAnalysis_MethodType"
* status = #draft
* experimental = false
* date = "2025-05-26"
* description = "Suchparameter für GenomicStudyAnalysis.extension[method-type].valueCodeableConcept"
* code = #method-type
* base = #Procedure
* type = #token
* expression = "GenomicStudyAnalysis.extension[method-type].valueCodeableConcept"

Instance: mii-sp-meta-mtb-genomicstudyanalysis-genome-build
InstanceOf: MII_PR_Meta_SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/SearchParameter/Encounter-location-physicalType"
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_GenomicStudyAnalysis_GenomeBuild"
* status = #draft
* experimental = false
* date = "2025-05-26"
* description = "Suchparameter für GenomicStudyAnalysis.extension[genome-build].valueCodeableConcept"
* code = #genome-build
* base = #Procedure
* type = #token
* expression = "GenomicStudyAnalysis.extension[genome-build].valueCodeableConcept"

Instance: mii-sp-meta-mtb-genomicstudyanalysis-focus
InstanceOf: MII_PR_Meta_SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/SearchParameter/Encounter-location-physicalType"
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_GenomicStudyAnalysis_Focus"
* status = #draft
* experimental = false
* date = "2025-05-26"
* description = "Suchparameter für GenomicStudyAnalysis.extension[focus].reference"
* code = #focus
* base = #Procedure
* type = #reference
* expression = "GenomicStudyAnalysis.extension[focus].reference"

Instance: mii-sp-meta-mtb-genomicstudyanalysis-specimen
InstanceOf: MII_PR_Meta_SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/SearchParameter/Encounter-location-physicalType"
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_GenomicStudyAnalysis_Specimen"
* status = #draft
* experimental = false
* date = "2025-05-26"
* description = "Suchparameter für GenomicStudyAnalysis.extension[specimen].reference"
* code = #specimen
* base = #Procedure
* type = #reference
* expression = "GenomicStudyAnalysis.extension[specimen].reference"

Instance: mii-sp-meta-mtb-genomicstudyanalysis-device-device
InstanceOf: MII_PR_Meta_SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/SearchParameter/Encounter-location-physicalType"
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_GenomicStudyAnalysis_Device_Device"
* status = #draft
* experimental = false
* date = "2025-05-26"
* description = "Suchparameter für GenomicStudyAnalysis.extension[device].extension[device].valueReference"
* code = #device
* base = #Procedure
* type = #reference
* expression = "GenomicStudyAnalysis.extension[specimen].extension[specimen].valueReference"

Instance: mii-sp-meta-mtb-genomicstudyanalysis-device-function
InstanceOf: MII_PR_Meta_SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/SearchParameter/Encounter-location-physicalType"
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_GenomicStudyAnalysis_Device_function"
* status = #draft
* experimental = false
* date = "2025-05-26"
* description = "Suchparameter für GenomicStudyAnalysis.extension[device].extension[function].valueCodeableConcept"
* code = #device-function
* base = #Procedure
* type = #token
* expression = "GenomicStudyAnalysis.extension[device].extension[function].valueCodeableConcept"

Instance: mii-sp-meta-mtb-observation-valuerange-high
InstanceOf: MII_PR_Meta_SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/SearchParameter/Encounter-location-physicalType"
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_Observation_ValueRange_High"
* status = #draft
* experimental = false
* date = "2025-05-26"
* description = "Suchparameter für Observation.valueRange.high"
* code = #component-value-range-high
* base = #Observation
* type = #quantity
* expression = "Observation.valueRange.high"

Instance: mii-sp-meta-mtb-observation-valuerange-low
InstanceOf: MII_PR_Meta_SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/SearchParameter/Encounter-location-physicalType"
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_Observation_ValueRange_Low"
* status = #draft
* experimental = false
* date = "2025-05-26"
* description = "Suchparameter für Observation.valueRange.low"
* code = #component-value-range-low
* base = #Observation
* type = #quantity
* expression = "Observation.valueRange.low"