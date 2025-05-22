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
* expression = "ClinicalImpression.effective.ofType(Period).start"

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
* expression = "ClinicalImpression.effective.ofType(Period).end"

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
* description = "Suchparameter für ClinicalImpression.supportingInfo[Vortherapie].extension[LeitlinieDokumentation].extension[Therapielinie].valueUnsignedInt"
* code = #leitlinie
* base = #ClinicalImpression 
* type = #number
* expression = "ClinicalImpression.supportingInfo.where.ofType(Reference(MII_PR_MTB_Systemische_Vortherapie or MII_PR_Onko_Strahlentherapie or MII_PR_Onko_Operation or MII_PR_Prozedur_Procedure)).extension.where(url='https://www.medizininformatik-initiative.de/fhir/ext/modul-mtb/StructureDefinition/mii-ex-mtb-leitlinie-dokumentation').extension.where(url='https://www.medizininformatik-initiative.de/fhir/ext/modul-mtb/StructureDefinition/mii-ex-mtb-therapielinie').value"

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
* expression = "ClinicalImpression.supportingInfo.where.ofType(Reference(MII_PR_MTB_Systemische_Vortherapie or MII_PR_Onko_Strahlentherapie or MII_PR_Onko_Operation or MII_PR_Prozedur_Procedure)).extension.where(url='https://www.medizininformatik-initiative.de/fhir/ext/modul-mtb/StructureDefinition/mii-ex-mtb-leitlinie-dokumentation').extension.where(url='https://www.medizininformatik-initiative.de/fhir/ext/modul-mtb/StructureDefinition/mii-ex-mtb-zulassungsstatus').value"

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
* expression = "RequestGroup.extension.where(url='https://www.medizininformatik-initiative.de/fhir/ext/modul-mtb/StructureDefinition/mii-ex-mtb-empfehlung-prioritaet')"

Instance: mii-sp-meta-mtb-extension-requestgroup-evidenzgraduierung
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
* code = #rg-evidenzgraduierung
* base[+] = #RequestGroup 
* type = #token
* expression[+] = "RequestGroup.extension.where(url='https://www.medizininformatik-initiative.de/fhir/ext/modul-mtb/StructureDefinition/mii-ex-mtb-empfehlung-evidenzgraduierung')"

Instance: mii-sp-meta-mtb-extension-medicationrequest-evidenzgraduierung
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
* code = #mr-evidenzgraduierung
* base[+] = #MedicationRequest
* type = #token
* expression[+] = "MedicationRequest.extension.where(url='https://www.medizininformatik-initiative.de/fhir/ext/modul-mtb/StructureDefinition/mii-ex-mtb-empfehlung-evidenzgraduierung')"

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
* expression = "RequestGroup.extension.where(url='https://www.medizininformatik-initiative.de/fhir/ext/modul-mtb/StructureDefinition/mii-ex-mtb-empfehlung-publikation')"

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
* expression = "ClaimResponse.extension.where(url='https://www.medizininformatik-initiative.de/fhir/ext/modul-mtb/StructureDefinition/mii-ex-mtb-antwort-kostenuebernahme-entscheidung').value"

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
* expression = "ClaimResponse.extension.where(url='mii-ex-mtb-antwort-kostenuebernahme-ablehnungsgrund').value"

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
* expression = "Procedure.statusReason"

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
* expression = "Procedure.extension.where(url='http://hl7.org/fhir/StructureDefinition/procedure-causedBy')"

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
* expression = "Procedure.note.text"

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
* expression = "Procedure.extension.where(url='http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-method-type').value"

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
* expression = "Procedure.extension.where(url='http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-genome-build').value"

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
* expression = "Procedure.extension.where(url='http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-focus').value"

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
* expression = "Procedure.extension.where(url='http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-specimen').value"

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
* expression = "Procedure.extension.where(url='http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-device').extension.where(url='device').value"

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
* expression = "Procedure.extension.where(url='http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-device').extension.where(url='function').value"

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
* expression = "Observation.value.ofType(range).high"

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
* expression = "Observation.value.ofType(Range).low"

Instance: mii-sp-meta-mtb-hrd-score-lst
InstanceOf: MII_PR_Meta_SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/SearchParameter/Encounter-location-physicalType"
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_Observation_HRD_Score_LST"
* status = #draft
* experimental = false
* date = "2025-05-26"
* description = "Suchparameter für Observation.component[LST].valueInteger (Large-Scale State Transition) im MTB HRD-Score."
* code = #hrd-component-lst
* base = #Observation
* type = #number
* expression = "Observation.component.where(code.coding.where(system = 'https://nih-ncpi.github.io/ncpi-fhir-ig/CodeSystem-ncit.html' and code = 'C120466').exists()).value"

Instance: mii-sp-meta-mtb-hrd-score-tai
InstanceOf: MII_PR_Meta_SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/SearchParameter/Encounter-location-physicalType"
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_Observation_HRD_Score_TAI"
* status = #draft
* experimental = false
* date = "2025-05-26"
* description = "Suchparameter für Observation.component[TAI].valueInteger (Telomeric Allelic Imbalance) im MTB HRD-Score."
* code = #hrd-component-tai
* base = #Observation
* type = #number
* expression = "Observation.component.where(code.coding.where(system = 'https://nih-ncpi.github.io/ncpi-fhir-ig/CodeSystem-ncit.html' and code = 'C129774').exists()).value"

Instance: mii-sp-meta-mtb-hrd-score-loh
InstanceOf: MII_PR_Meta_SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/SearchParameter/Encounter-location-physicalType"
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_Observation_HRD_Score_LOH"
* status = #draft
* experimental = false
* date = "2025-05-26"
* description = "Suchparameter für Observation.component[LOH].valueInteger (Loss of Heterozygosity) im MTB HRD-Score."
* code = #hrd-component-loh
* base = #Observation
* type = #number
* expression = "Observation.component.where(code.coding.where(system = 'https://nih-ncpi.github.io/ncpi-fhir-ig/CodeSystem-ncit.html' and code = 'C18016').exists()).value"

Instance: mii-sp-meta-mtb-medicationrequest-supporting-info
InstanceOf: MII_PR_Meta_SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/SearchParameter/Encounter-location-physicalType"
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_MedicationRequest_SupportingInfo"
* status = #draft
* experimental = false
* date = "2025-05-26"
* description = "Suchparameter für MedicationRequest.supportingInfo in der MTB Therapieempfehlung."
* code = #supporting-info
* base = #MedicationRequest
* type = #reference
* expression = "MedicationRequest.supportingInformation"

Instance: mii-sp-meta-mtb-requestgroup-action-resource
InstanceOf: MII_PR_Meta_SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-fall/SearchParameter/Encounter-location-physicalType"
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_RequestGroup_Resource"
* status = #draft
* experimental = false
* date = "2025-05-26"
* description = "Suchparameter für RequestGroup.action.resource in der MTB Therapieempfehlung."
* code = #action-resource
* base = #RequestGroup
* type = #reference
* expression = "RequestGroup.action.resource"