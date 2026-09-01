# Artifacts Summary - MII IG Meta v2027.0.0-ballot.rc1

* [**Table of Contents**](toc.md)
* **Artifacts Summary**

## Artifacts Summary

This page provides a list of the FHIR artifacts defined as part of this implementation guide.

### Behavior: Capability Statements 

The following artifacts define the specific capabilities that different types of systems are expected to have in order to comply with this implementation guide. Systems conforming to this implementation guide are expected to declare conformance to one or more of the following capability statements.

| | |
| :--- | :--- |
| [ MII CapabilityStatement Meta Server Capabilities  ](CapabilityStatement-mii-cps-meta-server-capabilities.md) | Migration-generated proposal describing the resource types and search parameters published by the Meta module. Review before use as a normative capability statement. |

### Behavior: Search Parameters 

These define the properties by which a RESTful server can be searched. They can also be used for sorting and including related resources.

| | |
| :--- | :--- |
| [ mii-sp-meta-adverseevent-encounter  ](SearchParameter-mii-sp-meta-adverseevent-encounter.md) | SearchParameter for AdverseEvent.encounter |
| [ mii-sp-meta-adverseevent-suspectentity-instance  ](SearchParameter-mii-sp-meta-adverseevent-suspectentity-instance.md) | SearchParameter for AdverseEvent.suspectEntity.instance |
| [ mii-sp-meta-body-structure-location-qualifier  ](SearchParameter-mii-sp-meta-body-structure-location-qualifier.md) | Suchparameter für BodyStructure.locationQualifier |
| [ mii-sp-meta-careplan-addresses  ](SearchParameter-mii-sp-meta-careplan-addresses.md) | SearchParameter for CarePlan.addresses |
| [ mii-sp-meta-careplan-contributor  ](SearchParameter-mii-sp-meta-careplan-contributor.md) | SearchParameter for CarePlan.contributor |
| [ mii-sp-meta-careplan-created  ](SearchParameter-mii-sp-meta-careplan-created.md) | SearchParameter for CarePlan.created |
| [ mii-sp-meta-composition-attester-mode  ](SearchParameter-mii-sp-meta-composition-attester-mode.md) | SearchParameter for Composition.attester.mode |
| [ mii-sp-meta-composition-custodian  ](SearchParameter-mii-sp-meta-composition-custodian.md) | SearchParameter for Composition.custodian |
| [ mii-sp-meta-composition-relatesto-code  ](SearchParameter-mii-sp-meta-composition-relatesto-code.md) | SearchParameter for Composition.relatesTo.code |
| [ mii-sp-meta-composition-section-author  ](SearchParameter-mii-sp-meta-composition-section-author.md) | Suchparameter für Composition.section.author |
| [ mii-sp-meta-composition-section-title  ](SearchParameter-mii-sp-meta-composition-section-title.md) | Suchparameter für Composition.section.title |
| [ mii-sp-meta-condition-evidence-detail  ](SearchParameter-mii-sp-meta-condition-evidence-detail.md) | SearchParameter for Condition.evidence.detail |
| [ mii-sp-meta-condition-icd10gm-diagnosesicherheit  ](SearchParameter-mii-sp-meta-condition-icd10gm-diagnosesicherheit.md) | Suchparameter für Condition.code.coding:icd10-gm.extension:Diagnosesicherheit |
| [ mii-sp-meta-condition-icd10gm-mehrfachcodierung  ](SearchParameter-mii-sp-meta-condition-icd10gm-mehrfachcodierung.md) | Suchparameter für Condition.code.coding:icd10-gm.extension:Mehrfachcodierungs-Kennzeichen |
| [ mii-sp-meta-condition-icd10gm-seitenlokalisation  ](SearchParameter-mii-sp-meta-condition-icd10gm-seitenlokalisation.md) | Suchparameter für Condition.code.coding:icd10-gm.extension:Seitenlokalisation |
| [ mii-sp-meta-condition-verification-status  ](SearchParameter-mii-sp-meta-condition-verification-status.md) | SearchParameter for Condition.verificationStatus |
| [ mii-sp-meta-consent-policyuri  ](SearchParameter-mii-sp-meta-consent-policyuri.md) | Suche in der Policy URI (versionsspezifische Policy / Broad Consent) |
| [ mii-sp-meta-consent-provisioncode  ](SearchParameter-mii-sp-meta-consent-provisioncode.md) | Suche im Code der Provison |
| [ mii-sp-meta-consent-provisioncodeperiod  ](SearchParameter-mii-sp-meta-consent-provisioncodeperiod.md) | Composite-Suche nach Zeitraum (period) einer bestimmten, durch einen Code definierten, Provision. |
| [ mii-sp-meta-consent-provisioncodetype  ](SearchParameter-mii-sp-meta-consent-provisioncodetype.md) | Composite-Suche nach Typ (type) einer bestimmten, durch einen Code definierten, Provision. |
| [ mii-sp-meta-consent-provisionperiod  ](SearchParameter-mii-sp-meta-consent-provisionperiod.md) | Suche im Zeitraum der Provision. Dieser Suchparameter bezieht sich explizit auf die zweite Verschachtelungsebene von provison. |
| [ mii-sp-meta-consent-provisiontype  ](SearchParameter-mii-sp-meta-consent-provisiontype.md) | Suche im Typ der Provison (permit, deny). |
| [ mii-sp-meta-description  ](SearchParameter-mii-sp-meta-description.md) | 
| | | |
| :--- | :--- | :--- |
| Suchparameter für CarePlan.description | ImagingStudy.description | ImagingStudy.series.description |
 |
| [ mii-sp-meta-device-property-type  ](SearchParameter-mii-sp-meta-device-property-type.md) | Suchparameter für Device.property.type |
| [ mii-sp-meta-devicemetric-source  ](SearchParameter-mii-sp-meta-devicemetric-source.md) | Suchparameter für DeviceMetric.source |
| [ mii-sp-meta-diagnostic-report-conclusion  ](SearchParameter-mii-sp-meta-diagnostic-report-conclusion.md) | Suchparameter für DiagnosticReport.conclusion |
| [ mii-sp-meta-diagnosticreport-imagingstudy  ](SearchParameter-mii-sp-meta-diagnosticreport-imagingstudy.md) | SearchParameter for DiagnosticReport.imagingStudy |
| [ mii-sp-meta-documentreference-attachment-size  ](SearchParameter-mii-sp-meta-documentreference-attachment-size.md) | Suchparameter für DocumentReference.content.attachment.size |
| [ mii-sp-meta-documentreference-attachment-title  ](SearchParameter-mii-sp-meta-documentreference-attachment-title.md) | Suchparameter für DocumentReference.content.attachment.title |
| [ mii-sp-meta-dokument-documentreference-attachment-creation  ](SearchParameter-mii-sp-meta-dokument-documentreference-attachment-creation.md) | Suchparameter für DocumentReference.content.attachment.creation |
| [ mii-sp-meta-dokument-documentreference-doc-status  ](SearchParameter-mii-sp-meta-dokument-documentreference-doc-status.md) | Suchparameter für DocumentReference.docStatus |
| [ mii-sp-meta-dokument-documentreference-nlp-processing-status  ](SearchParameter-mii-sp-meta-dokument-documentreference-nlp-processing-status.md) | Suchparameter für DocumentReference.extension[nlp-processing-status].valueCodeableConcept |
| [ mii-sp-meta-encounter-aufnahmegrund-drittestelle  ](SearchParameter-mii-sp-meta-encounter-aufnahmegrund-drittestelle.md) | Suchparameter für Encounter.extension:Aufnahmegrund.extension:DritteStelle |
| [ mii-sp-meta-encounter-aufnahmegrund-ersteundzweitestelle  ](SearchParameter-mii-sp-meta-encounter-aufnahmegrund-ersteundzweitestelle.md) | Suchparameter für Encounter.extension:Aufnahmegrund.extension:ErsteUndZweiteStelle |
| [ mii-sp-meta-encounter-aufnahmegrund-viertestelle  ](SearchParameter-mii-sp-meta-encounter-aufnahmegrund-viertestelle.md) | Suchparameter für Encounter.extension:Aufnahmegrund.extension:VierteStelle |
| [ mii-sp-meta-encounter-diagnosis-use  ](SearchParameter-mii-sp-meta-encounter-diagnosis-use.md) | Suchparameter für Encounter.diagnosis.use |
| [ mii-sp-meta-encounter-entlassungsgrund-drittestelle  ](SearchParameter-mii-sp-meta-encounter-entlassungsgrund-drittestelle.md) | Suchparameter für Encounter.hospitalization.dischargeDisposition.extension:Entlassungsgrund.extension:DritteStelle |
| [ mii-sp-meta-encounter-entlassungsgrund-ersteundzweitestelle  ](SearchParameter-mii-sp-meta-encounter-entlassungsgrund-ersteundzweitestelle.md) | Suchparameter für Encounter.hospitalization.dischargeDisposition.extension:Entlassungsgrund.extension:ErsteUndZweiteStelle |
| [ mii-sp-meta-encounter-hospitalization-admitsource  ](SearchParameter-mii-sp-meta-encounter-hospitalization-admitsource.md) | Suchparameter für Encounter.hospitalization.admitSource |
| [ mii-sp-meta-encounter-location-physical-type  ](SearchParameter-mii-sp-meta-encounter-location-physical-type.md) | Suchparameter für Encounter.location.physicalType |
| [ mii-sp-meta-encounter-servicetype  ](SearchParameter-mii-sp-meta-encounter-servicetype.md) | Suchparameter für Encounter.serviceType |
| [ mii-sp-meta-evidencevariable-characteristic-description  ](SearchParameter-mii-sp-meta-evidencevariable-characteristic-description.md) | Suchparameter für EvidenceVariable.characteristic.description |
| [ mii-sp-meta-familymemberhistory-reasoncode  ](SearchParameter-mii-sp-meta-familymemberhistory-reasoncode.md) | Suchparameter für FamilyMemberHistory.reasonCode |
| [ mii-sp-meta-familymemberhistory-reasonreference  ](SearchParameter-mii-sp-meta-familymemberhistory-reasonreference.md) | Suchparameter für FamilyMemberHistory.reasonReference |
| [ mii-sp-meta-imaging-study-bildgebungsgrund  ](SearchParameter-mii-sp-meta-imaging-study-bildgebungsgrund.md) | Suchparameter für ImagingStudy.Extension.Bildgebungsgrund |
| [ mii-sp-meta-imaging-study-instance-burned-in-annotation  ](SearchParameter-mii-sp-meta-imaging-study-instance-burned-in-annotation.md) | Suchparameter für ImagingStudy.series.instance.extension.burnedInAnnotation |
| [ mii-sp-meta-imaging-study-instance-image-type  ](SearchParameter-mii-sp-meta-imaging-study-instance-image-type.md) | Suchparameter für ImagingStudy.series.instance.extension.imageType |
| [ mii-sp-meta-imaging-study-instance-number  ](SearchParameter-mii-sp-meta-imaging-study-instance-number.md) | Suchparameter für ImagingStudy.series.instance.number |
| [ mii-sp-meta-imaging-study-instance-pixel-x  ](SearchParameter-mii-sp-meta-imaging-study-instance-pixel-x.md) | Suchparameter für ImagingStudy.series.instance.extension.pixelSpacingX |
| [ mii-sp-meta-imaging-study-instance-pixel-y  ](SearchParameter-mii-sp-meta-imaging-study-instance-pixel-y.md) | Suchparameter für ImagingStudy.series.instance.extension.pixelSpacingY |
| [ mii-sp-meta-imaging-study-instance-slice-thickness  ](SearchParameter-mii-sp-meta-imaging-study-instance-slice-thickness.md) | Suchparameter für ImagingStudy.series.instance.extension.sliceThickness |
| [ mii-sp-meta-imaging-study-modality  ](SearchParameter-mii-sp-meta-imaging-study-modality.md) | Suchparameter für ImagingStudy.modality |
| [ mii-sp-meta-imaging-study-modality-body-site  ](SearchParameter-mii-sp-meta-imaging-study-modality-body-site.md) | Suchparameter für ImagingStudy.series.modality and ImagingStudy.series.bodySite |
| [ mii-sp-meta-imaging-study-number-instances  ](SearchParameter-mii-sp-meta-imaging-study-number-instances.md) | Suchparameter für ImagingStudy.numberOfSeries |
| [ mii-sp-meta-imaging-study-number-series  ](SearchParameter-mii-sp-meta-imaging-study-number-series.md) | Suchparameter für ImagingStudy.numberOfSeries |
| [ mii-sp-meta-imaging-study-procedure-reference  ](SearchParameter-mii-sp-meta-imaging-study-procedure-reference.md) | Suchparameter für ImagingStudy.procedureReference |
| [ mii-sp-meta-imaging-study-series-contrast-bolus  ](SearchParameter-mii-sp-meta-imaging-study-series-contrast-bolus.md) | Suchparameter für ImagingStudy.series.extension.contrastBolus |
| [ mii-sp-meta-imaging-study-series-contrast-bolus-details  ](SearchParameter-mii-sp-meta-imaging-study-series-contrast-bolus-details.md) | Suchparameter für ImagingStudy.series.extension.contrastBolusDetails |
| [ mii-sp-meta-imaging-study-series-convolutional-kernel  ](SearchParameter-mii-sp-meta-imaging-study-series-convolutional-kernel.md) | Suchparameter für ImagingStudy.series.extension.convolutionalKernel |
| [ mii-sp-meta-imaging-study-series-ctdi-volume  ](SearchParameter-mii-sp-meta-imaging-study-series-ctdi-volume.md) | Suchparameter für ImagingStudy.series.extension.CTDIvolume |
| [ mii-sp-meta-imaging-study-series-echo-time  ](SearchParameter-mii-sp-meta-imaging-study-series-echo-time.md) | Suchparameter für ImagingStudy.series.extension.echoTime |
| [ mii-sp-meta-imaging-study-series-exposure  ](SearchParameter-mii-sp-meta-imaging-study-series-exposure.md) | Suchparameter für ImagingStudy.series.extension.exposure |
| [ mii-sp-meta-imaging-study-series-exposure-time  ](SearchParameter-mii-sp-meta-imaging-study-series-exposure-time.md) | Suchparameter für ImagingStudy.series.extension.exposureTime |
| [ mii-sp-meta-imaging-study-series-flip-angle  ](SearchParameter-mii-sp-meta-imaging-study-series-flip-angle.md) | Suchparameter für ImagingStudy.series.extension.flipAngle |
| [ mii-sp-meta-imaging-study-series-inversion-time  ](SearchParameter-mii-sp-meta-imaging-study-series-inversion-time.md) | Suchparameter für ImagingStudy.series.extension.inversionTime |
| [ mii-sp-meta-imaging-study-series-kvp  ](SearchParameter-mii-sp-meta-imaging-study-series-kvp.md) | Suchparameter für ImagingStudy.series.extension.kvp |
| [ mii-sp-meta-imaging-study-series-laterality  ](SearchParameter-mii-sp-meta-imaging-study-series-laterality.md) | Suchparameter für ImagingStudy.series.laterality |
| [ mii-sp-meta-imaging-study-series-magnetic-field-strength  ](SearchParameter-mii-sp-meta-imaging-study-series-magnetic-field-strength.md) | Suchparameter für ImagingStudy.series.extension.magneticFieldStrength |
| [ mii-sp-meta-imaging-study-series-number  ](SearchParameter-mii-sp-meta-imaging-study-series-number.md) | Suchparameter für ImagingStudy.series.number |
| [ mii-sp-meta-imaging-study-series-pulse-frequency  ](SearchParameter-mii-sp-meta-imaging-study-series-pulse-frequency.md) | Suchparameter für ImagingStudy.series.extension.pulseRepetitionFrequency |
| [ mii-sp-meta-imaging-study-series-radionuclide  ](SearchParameter-mii-sp-meta-imaging-study-series-radionuclide.md) | Suchparameter für ImagingStudy.series.extension.radionuclide |
| [ mii-sp-meta-imaging-study-series-radionuclide-half-life  ](SearchParameter-mii-sp-meta-imaging-study-series-radionuclide-half-life.md) | Suchparameter für ImagingStudy.series.extension.radionuclideHalfLife |
| [ mii-sp-meta-imaging-study-series-radionuclide-total-dose  ](SearchParameter-mii-sp-meta-imaging-study-series-radionuclide-total-dose.md) | Suchparameter für ImagingStudy.series.extension.radionuclideTotalDose |
| [ mii-sp-meta-imaging-study-series-radiopharmaceutical  ](SearchParameter-mii-sp-meta-imaging-study-series-radiopharmaceutical.md) | Suchparameter für ImagingStudy.series.extension.radiopharmaceutical |
| [ mii-sp-meta-imaging-study-series-repetition-time  ](SearchParameter-mii-sp-meta-imaging-study-series-repetition-time.md) | Suchparameter für ImagingStudy.series.extension.repetitionTime |
| [ mii-sp-meta-imaging-study-series-scanning-sequence  ](SearchParameter-mii-sp-meta-imaging-study-series-scanning-sequence.md) | Suchparameter für ImagingStudy.series.extension.scanningSequence |
| [ mii-sp-meta-imaging-study-series-scanning-sequence-variant  ](SearchParameter-mii-sp-meta-imaging-study-series-scanning-sequence-variant.md) | Suchparameter für ImagingStudy.series.extension.scanningSequenceVariant |
| [ mii-sp-meta-imaging-study-series-series-type  ](SearchParameter-mii-sp-meta-imaging-study-series-series-type.md) | ImagingStudy.series.extension.seriesType |
| [ mii-sp-meta-imaging-study-series-slice-thickness  ](SearchParameter-mii-sp-meta-imaging-study-series-slice-thickness.md) | Suchparameter für ImagingStudy.series.extension.sliceThickness |
| [ mii-sp-meta-imaging-study-series-started  ](SearchParameter-mii-sp-meta-imaging-study-series-started.md) | Suchparameter für ImagingStudy.series.started |
| [ mii-sp-meta-imaging-study-series-tracer-exposure-time  ](SearchParameter-mii-sp-meta-imaging-study-series-tracer-exposure-time.md) | Suchparameter für ImagingStudy.series.tracerExposureTime |
| [ mii-sp-meta-imaging-study-series-transducer-frequency  ](SearchParameter-mii-sp-meta-imaging-study-series-transducer-frequency.md) | Suchparameter für ImagingStudy.series.extension.transducerFrequency |
| [ mii-sp-meta-imaging-study-series-transducer-type  ](SearchParameter-mii-sp-meta-imaging-study-series-transducer-type.md) | ImagingStudy.series.extension.transducerType |
| [ mii-sp-meta-imaging-study-series-ultrasound-color  ](SearchParameter-mii-sp-meta-imaging-study-series-ultrasound-color.md) | ImagingStudy.series.extension.ultrasoundPresent |
| [ mii-sp-meta-imaging-study-series-units  ](SearchParameter-mii-sp-meta-imaging-study-series-units.md) | Suchparameter für ImagingStudy.series.extension.units |
| [ mii-sp-meta-imaging-study-series-view-position  ](SearchParameter-mii-sp-meta-imaging-study-series-view-position.md) | Suchparameter für ImagingStudy.series.extension.viewPosition |
| [ mii-sp-meta-imaging-study-series-xray-tube-current  ](SearchParameter-mii-sp-meta-imaging-study-series-xray-tube-current.md) | Suchparameter für ImagingStudy.series.extension.xRayTubeCurrent |
| [ mii-sp-meta-library-quellregister  ](SearchParameter-mii-sp-meta-library-quellregister.md) | Suchparameter für Library.extension:QuellRegister |
| [ mii-sp-meta-library-relatedartifact-url  ](SearchParameter-mii-sp-meta-library-relatedartifact-url.md) | Suchparameter für Library.relatedArtifact.document.url |
| [ mii-sp-meta-media-partof  ](SearchParameter-mii-sp-meta-media-partof.md) | SearchParameter for Media.partOf |
| [ mii-sp-meta-medication-dosage-dosequantity  ](SearchParameter-mii-sp-meta-medication-dosage-dosequantity.md) | 
| | | |
| :--- | :--- | :--- |
| Suchparameter für MedicationStatement.dosage.doseAndRate.doseQuantity | MedicationRequest.dosageInstruction.doseAndRate.doseQuantity | MedicationAdministration.dosage.dose |
 |
| [ mii-sp-meta-medication-dosage-doserange  ](SearchParameter-mii-sp-meta-medication-dosage-doserange.md) | 
| | |
| :--- | :--- |
| Suchparameter für MedicationStatement.dosage.doseAndRate.doseRange | MedicationRequest.dosageInstruction.doseAndRate.doseRange |
 |
| [ mii-sp-meta-medication-dosage-doserange-high  ](SearchParameter-mii-sp-meta-medication-dosage-doserange-high.md) | 
| | |
| :--- | :--- |
| Suchparameter für MedicationStatement.dosage.doseAndRate.doseRange.high | MedicationRequest.dosageInstruction.doseAndRate.doseRange.high |
 |
| [ mii-sp-meta-medication-dosage-doserange-low  ](SearchParameter-mii-sp-meta-medication-dosage-doserange-low.md) | 
| | |
| :--- | :--- |
| Suchparameter für MedicationStatement.dosage.doseAndRate.doseRange.low | MedicationRequest.dosageInstruction.doseAndRate.doseRange.low |
 |
| [ mii-sp-meta-medication-dosage-ratequantity  ](SearchParameter-mii-sp-meta-medication-dosage-ratequantity.md) | 
| | | |
| :--- | :--- | :--- |
| Suchparameter für MedicationStatement.dosage.doseAndRate.rateQuantity | MedicationAdministration.dosage.rateQuantity | MedicationRequest.dosageInstruction.doseAndRate.rateQuantity |
 |
| [ mii-sp-meta-medication-dosage-raterange  ](SearchParameter-mii-sp-meta-medication-dosage-raterange.md) | 
| | |
| :--- | :--- |
| Suchparameter für MedicationStatement.dosage.doseAndRate.rateRange | MedicationRequest.dosageInstruction.doseAndRate.rateRange |
 |
| [ mii-sp-meta-medication-dosage-raterange-high  ](SearchParameter-mii-sp-meta-medication-dosage-raterange-high.md) | 
| | |
| :--- | :--- |
| Suchparameter für MedicationStatement.dosage.doseAndRate.rateRange.high | MedicationRequest.dosageInstruction.doseAndRate.rateRange.high |
 |
| [ mii-sp-meta-medication-dosage-raterange-low  ](SearchParameter-mii-sp-meta-medication-dosage-raterange-low.md) | 
| | |
| :--- | :--- |
| Suchparameter für MedicationStatement.dosage.doseAndRate.rateRange.low | MedicationRequest.dosageInstruction.doseAndRate.rateRange.low |
 |
| [ mii-sp-meta-medication-dosage-rateratio  ](SearchParameter-mii-sp-meta-medication-dosage-rateratio.md) | 
| | | |
| :--- | :--- | :--- |
| MedicationStatement.dosage.doseAndRate.rate.ofType(Ratio) | MedicationAdministration.dosage.rate.ofType(Ratio) | MedicationRequest.dosageInstruction.doseAndRate.rate.ofType(Ratio) |
 |
| [ mii-sp-meta-medication-dosage-rateratio-denominator  ](SearchParameter-mii-sp-meta-medication-dosage-rateratio-denominator.md) | 
| | | |
| :--- | :--- | :--- |
| Suchparameter für MedicationStatement.dosage.doseAndRate.rateRatio.denominator | MedicationAdministration.dosage.rate.ofType(Ratio).denominator | MedicationRequest.dosageInstruction.doseAndRate.rate.ofType(Ratio).denominator |
 |
| [ mii-sp-meta-medication-dosage-rateratio-numerator  ](SearchParameter-mii-sp-meta-medication-dosage-rateratio-numerator.md) | 
| | | |
| :--- | :--- | :--- |
| Suchparameter für MedicationStatement.dosage.doseAndRate.rateRatio.numerator | MedicationAdministration.dosage.rate.ofType(Ratio).numerator | MedicationRequest.dosageInstruction.doseAndRate.rate.ofType(Ratio).numerator |
 |
| [ mii-sp-meta-medication-dosage-route  ](SearchParameter-mii-sp-meta-medication-dosage-route.md) | 
| | | |
| :--- | :--- | :--- |
| Suchparameter für (MedicationAdministration | MedicationStatement).dosage.route | MedicationRequest.dosageInstruction.route |
 |
| [ mii-sp-meta-medication-dosage-site  ](SearchParameter-mii-sp-meta-medication-dosage-site.md) | 
| | | |
| :--- | :--- | :--- |
| Suchparameter für (MedicationAdministration | MedicationStatement).dosage.site | MedicationRequest.dosageInstruction.site |
 |
| [ mii-sp-meta-medication-ingredient-strength  ](SearchParameter-mii-sp-meta-medication-ingredient-strength.md) | Suchparameter für Medication.ingredient.strength |
| [ mii-sp-meta-medication-ingredient-strength-denominator  ](SearchParameter-mii-sp-meta-medication-ingredient-strength-denominator.md) | Suchparameter für Medication.ingredient.strength.denominator |
| [ mii-sp-meta-medication-ingredient-strength-numerator  ](SearchParameter-mii-sp-meta-medication-ingredient-strength-numerator.md) | Suchparameter für Medication.ingredient.strength.numerator |
| [ mii-sp-meta-medication-list-mode  ](SearchParameter-mii-sp-meta-medication-list-mode.md) | Suchparameter für List.mode |
| [ mii-sp-meta-medication-partof  ](SearchParameter-mii-sp-meta-medication-partof.md) | 
| | |
| :--- | :--- |
| Suchparameter für (MedicationAdministration | MedicationStatement).partOf |
 |
| [ mii-sp-meta-medication-reasonreference  ](SearchParameter-mii-sp-meta-medication-reasonreference.md) | 
| | |
| :--- | :--- |
| Suchparameter für (MedicationAdministration | MedicationStatement).reasonReference |
 |
| [ mii-sp-meta-observation-body-structure  ](SearchParameter-mii-sp-meta-observation-body-structure.md) | Suchparameter für Observation.bodyStructure |
| [ mii-sp-meta-observation-bodysite  ](SearchParameter-mii-sp-meta-observation-bodysite.md) | SearchParameter for Observation.bodySite |
| [ mii-sp-meta-observation-component-interpretation  ](SearchParameter-mii-sp-meta-observation-component-interpretation.md) | Suchparameter für Observation.component.interpretation |
| [ mii-sp-meta-observation-encounter  ](SearchParameter-mii-sp-meta-observation-encounter.md) | SearchParameter for Observation.encounter |
| [ mii-sp-meta-observation-focus  ](SearchParameter-mii-sp-meta-observation-focus.md) | SearchParameter for Observation.focus |
| [ mii-sp-meta-observation-hasmember  ](SearchParameter-mii-sp-meta-observation-hasmember.md) | SearchParameter for Observation.hasMember |
| [ mii-sp-meta-observation-interpretation  ](SearchParameter-mii-sp-meta-observation-interpretation.md) | Suchparameter für Observation.interpretation |
| [ mii-sp-meta-observation-issued  ](SearchParameter-mii-sp-meta-observation-issued.md) | Suchparameter für Observation.issued |
| [ mii-sp-meta-observation-referencerange  ](SearchParameter-mii-sp-meta-observation-referencerange.md) | Suchparameter für Observation.referenceRange |
| [ mii-sp-meta-observation-referencerange-high  ](SearchParameter-mii-sp-meta-observation-referencerange-high.md) | Suchparameter für Observation.referenceRange.high |
| [ mii-sp-meta-observation-referencerange-low  ](SearchParameter-mii-sp-meta-observation-referencerange-low.md) | Suchparameter für Observation.referenceRange.low |
| [ mii-sp-meta-observation-series-uid  ](SearchParameter-mii-sp-meta-observation-series-uid.md) | Suchparameter für Observation.extension.seriesUID |
| [ mii-sp-meta-observation-sop-instance-uid  ](SearchParameter-mii-sp-meta-observation-sop-instance-uid.md) | Suchparameter für Observation.sopInstanceUID |
| [ mii-sp-meta-observation-value-ratio  ](SearchParameter-mii-sp-meta-observation-value-ratio.md) | SearchParameter for Observation.valueRatio |
| [ mii-sp-meta-observation-value-ratio-denominator  ](SearchParameter-mii-sp-meta-observation-value-ratio-denominator.md) | SearchParameter for Observation.valueRatio.denominator |
| [ mii-sp-meta-observation-value-ratio-numerator  ](SearchParameter-mii-sp-meta-observation-value-ratio-numerator.md) | SearchParameter for Observation.valueRatio.numerator |
| [ mii-sp-meta-patient-adresszusatz  ](SearchParameter-mii-sp-meta-patient-adresszusatz.md) | Suchparameter für Patient.address.line.extension:Adresszusatz |
| [ mii-sp-meta-patient-assignerpid  ](SearchParameter-mii-sp-meta-patient-assignerpid.md) | Suchparameter für Patient.identifier.assigner.identifier |
| [ mii-sp-meta-patient-gemeindeschluessel  ](SearchParameter-mii-sp-meta-patient-gemeindeschluessel.md) | Suchparameter für Patient.address.city.extension:gemeindeschluessel |
| [ mii-sp-meta-patient-hausnummer  ](SearchParameter-mii-sp-meta-patient-hausnummer.md) | Suchparameter für Patient.address.line.extension:Hausnummer |
| [ mii-sp-meta-patient-otheramtlich  ](SearchParameter-mii-sp-meta-patient-otheramtlich.md) | Suchparameter für Patient.gender.extension:other-amtlich |
| [ mii-sp-meta-patient-postfach  ](SearchParameter-mii-sp-meta-patient-postfach.md) | Suchparameter für Patient.address.line.extension:Postfach |
| [ mii-sp-meta-patient-prefix  ](SearchParameter-mii-sp-meta-patient-prefix.md) | Suchparameter für Patient.name.prefix |
| [ mii-sp-meta-patient-prefixqualifier  ](SearchParameter-mii-sp-meta-patient-prefixqualifier.md) | Suchparameter für Patient.name.prefix.extension:prefix-qualifier |
| [ mii-sp-meta-patient-stadtteil  ](SearchParameter-mii-sp-meta-patient-stadtteil.md) | Suchparameter für Patient.address.extension:Stadtteil |
| [ mii-sp-meta-patient-strasse  ](SearchParameter-mii-sp-meta-patient-strasse.md) | Suchparameter für Patient.address.line.extension:Strasse |
| [ mii-sp-meta-procedure-bodysite  ](SearchParameter-mii-sp-meta-procedure-bodysite.md) | Suchparameter für Procedure.bodySite |
| [ mii-sp-meta-procedure-complication  ](SearchParameter-mii-sp-meta-procedure-complication.md) | SearchParameter for Procedure.complication |
| [ mii-sp-meta-procedure-dokumentationsdatum  ](SearchParameter-mii-sp-meta-procedure-dokumentationsdatum.md) | Suchparameter für Procedure.extension:Dokumentationsdatum |
| [ mii-sp-meta-procedure-durchfuehrungsabsicht  ](SearchParameter-mii-sp-meta-procedure-durchfuehrungsabsicht.md) | Suchparameter für Procedure.extension:Durchfuehrungsabsicht |
| [ mii-sp-meta-procedure-ops-seitenlokalisation  ](SearchParameter-mii-sp-meta-procedure-ops-seitenlokalisation.md) | Suchparameter für Procedure.code.coding:ops.extension:Seitenlokalisation |
| [ mii-sp-meta-procedure-outcome  ](SearchParameter-mii-sp-meta-procedure-outcome.md) | SearchParameter for Procedure.outcome |
| [ mii-sp-meta-procedure-recorder  ](SearchParameter-mii-sp-meta-procedure-recorder.md) | Suchparameter für Procedure.recorder |
| [ mii-sp-meta-read-proc-report  ](SearchParameter-mii-sp-meta-read-proc-report.md) | Suchparameter für ReadProcedure.report |
| [ mii-sp-meta-reason-reference  ](SearchParameter-mii-sp-meta-reason-reference.md) | Suchparameter für ImagingStudy.reasonReference |
| [ mii-sp-meta-researchstudy-akronym  ](SearchParameter-mii-sp-meta-researchstudy-akronym.md) | Suchparameter für ResearchStudy.extension:Akronym |
| [ mii-sp-meta-researchstudy-arm-name  ](SearchParameter-mii-sp-meta-researchstudy-arm-name.md) | Suchparameter für ResearchStudy.arm.name |
| [ mii-sp-meta-researchstudy-finanzierung  ](SearchParameter-mii-sp-meta-researchstudy-finanzierung.md) | Suchparameter für ResearchStudy.extension:Finanzierung |
| [ mii-sp-meta-researchstudy-label  ](SearchParameter-mii-sp-meta-researchstudy-label.md) | Suchparameter für ResearchStudy.extension:label |
| [ mii-sp-meta-researchstudy-rekrutierungsstand  ](SearchParameter-mii-sp-meta-researchstudy-rekrutierungsstand.md) | Suchparameter für ResearchStudy.extension:Rekrutierung.extension:rekrutierungsstand |
| [ mii-sp-meta-researchstudy-rekrutierungsstand-datum  ](SearchParameter-mii-sp-meta-researchstudy-rekrutierungsstand-datum.md) | Suchparameter für ResearchStudy.extension:Rekrutierung.extension:rekrutierungsstand-datum |
| [ mii-sp-meta-researchstudy-rekrutierungsstand-genauigkeit  ](SearchParameter-mii-sp-meta-researchstudy-rekrutierungsstand-genauigkeit.md) | Suchparameter für ResearchStudy.extension:Rekrutierung.extension:rekrutierungsstand-genauigkeit |
| [ mii-sp-meta-researchstudy-rekrutierungsstart  ](SearchParameter-mii-sp-meta-researchstudy-rekrutierungsstart.md) | Suchparameter für ResearchStudy.extension:Rekrutierung.extension:rekrutierungsstart |
| [ mii-sp-meta-researchstudy-rekrutierungsziel  ](SearchParameter-mii-sp-meta-researchstudy-rekrutierungsziel.md) | Suchparameter für ResearchStudy.extension:Rekrutierung.extension:rekrutierungsziel |
| [ mii-sp-meta-researchstudy-studienregister  ](SearchParameter-mii-sp-meta-researchstudy-studienregister.md) | Suchparameter für ResearchStudy.extension:Studienregister |
| [ mii-sp-meta-researchsubject-consent  ](SearchParameter-mii-sp-meta-researchsubject-consent.md) | Suchparameter für ResearchSubject.consent |
| [ mii-sp-meta-servicerequest-reasoncode  ](SearchParameter-mii-sp-meta-servicerequest-reasoncode.md) | Suchparameter für ServiceRequest.reasonCode |
| [ mii-sp-meta-servicerequest-reasonreference  ](SearchParameter-mii-sp-meta-servicerequest-reasonreference.md) | Suchparameter für ServiceRequest.reasonReference |
| [ mii-sp-meta-servicerequest-supportinginfo  ](SearchParameter-mii-sp-meta-servicerequest-supportinginfo.md) | SearchParameter for ServiceRequest.supportingInfo |
| [ mii-sp-meta-specimen-collection-body-site  ](SearchParameter-mii-sp-meta-specimen-collection-body-site.md) | SearchParameter for Specimen.collection.bodySite |
| [ mii-sp-meta-specimen-collection-method  ](SearchParameter-mii-sp-meta-specimen-collection-method.md) | SearchParameter for Specimen.collection.method |
| [ mii-sp-meta-specimen-container-additive  ](SearchParameter-mii-sp-meta-specimen-container-additive.md) | SearchParameter for Specimen.container.additive |
| [ mii-sp-meta-specimen-diagnose  ](SearchParameter-mii-sp-meta-specimen-diagnose.md) | Suchparameter für die Extension Diagnose am Profil Bioprobe |
| [ mii-sp-meta-specimen-processing-additive  ](SearchParameter-mii-sp-meta-specimen-processing-additive.md) | SearchParameter for Specimen.processing.additive |
| [ mii-sp-meta-specimen-processing-date  ](SearchParameter-mii-sp-meta-specimen-processing-date.md) | SearchParameter for Specimen.processing.time |
| [ mii-sp-meta-specimen-processing-procedure  ](SearchParameter-mii-sp-meta-specimen-processing-procedure.md) | SearchParameter for Specimen.processing.procedure |
| [ mii-sp-meta-specimen-request  ](SearchParameter-mii-sp-meta-specimen-request.md) | SearchParameter for Specimen.request |
| [ mii-sp-meta-supporting-info  ](SearchParameter-mii-sp-meta-supporting-info.md) | 
| | |
| :--- | :--- |
| Suchparameter für CarePlan.supportingInfo | DiagnosticReport.extension.supportingInfo |
 |
| [ mii-sp-meta-task-for  ](SearchParameter-mii-sp-meta-task-for.md) | Suchparameter für Task.for |
| [ mii-sp-meta-task-reasoncode  ](SearchParameter-mii-sp-meta-task-reasoncode.md) | Suchparameter für Task.reasonCode |
| [ mii-sp-meta-task-reasonreference  ](SearchParameter-mii-sp-meta-task-reasonreference.md) | Suchparameter für Task.reasonReference |

### Structures: Resource Profiles 

These define constraints on FHIR resources for systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [ MII PR Meta SearchParameter  ](StructureDefinition-mii-pr-meta-searchparameter.md) | Das Profil legt die Mindestanforderungen fest, die SearchParameter-Ressourcen im Kerndatensatz erfüllen müssen. |

### Structures: Extension Definitions 

These define constraints on FHIR data types for systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [ MII EX Meta License Codeable  ](StructureDefinition-mii-ex-meta-license-codeable.md) | This extension may be used to provide machine-processable license information about the set of data described by this resource. The extension is a R4-compatible version of the FHIR for FAIR R4B IG Licence Terms as CodeableConcept extension. |

### Terminology: Code Systems 

These define new code systems used by systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [ MII CS Meta DIZ Standorte  ](CodeSystem-mii-cs-meta-diz-standorte.md) | Medizininformatik-Initiative Standorte |

### Example: Example Instances 

These are example instances that show what data produced and consumed by systems conforming with this implementation guide might look like.

| | |
| :--- | :--- |
| [ MII Meta SearchParameter Collection Bundle  ](Bundle-mii-exa-meta-searchparam-collection-bundle.md) | Collection bundle containing the SearchParameter resources published by the MII Meta module. |
| [ MII Meta SearchParameter Transaction Bundle  ](Bundle-mii-exa-meta-searchparam-transaction-bundle.md) | Transaction bundle containing the SearchParameter resources published by the MII Meta module for convenient import into a FHIR server. |

### Other 

These are resources that are used within this implementation guide that do not fit into one of the other categories.

| |
| :--- |
| [ mii-param-meta-manifest  ](Parameters-mii-param-meta-manifest.md) |

