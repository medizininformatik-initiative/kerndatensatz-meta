# Suchparameter - MII IG Meta v2027.0.0-ballot

* [**Inhaltsverzeichnis**](toc.md)
* **Suchparameter**

## Suchparameter

Das Meta-Modul definiert die Suchparameter, die von den Modulen des MII-Kerndatensatzes gemeinsam genutzt werden. Die Tabelle listet alle aktiven Suchparameter, sortiert nach dem Ressourcentyp, für den sie gelten.

* **Code** ist der Name, der in einer Suchanfrage verwendet wird, und verlinkt auf die vollständige Definition.
* **Ausdruck** ist der FHIRPath-Ausdruck, den der Server indiziert.

Beispielanfragen sind im [CapabilityStatement](CapabilityStatement-mii-cps-meta-server-capabilities.md) dokumentiert: Jede wird in der CI gegen einen FHIR-Server mit den [MII-Testdaten](https://github.com/medizininformatik-initiative/mii-testdata) ausgeführt. Ein Suchparameter ohne Beispiel hat noch keinen Test.

Um alle Suchparameter in einen FHIR-Server zu laden, nutzen Sie das [Collection-Bundle](Bundle-mii-exa-meta-searchparam-collection-bundle.md) oder das [Transaction-Bundle](Bundle-mii-exa-meta-searchparam-transaction-bundle.md).

### Aktive Suchparameter

| | | | |
| :--- | :--- | :--- | :--- |
| Ressourcentyp | Code | Typ | Ausdruck |
| AdverseEvent | [encounter](SearchParameter-mii-sp-meta-adverseevent-encounter.md) | reference | AdverseEvent.encounter |
| AdverseEvent | [instance](SearchParameter-mii-sp-meta-adverseevent-suspectentity-instance.md) | reference | AdverseEvent.suspectEntity.instance |
| BodyStructure | [location-qualifier](SearchParameter-mii-sp-meta-body-structure-location-qualifier.md) | token | BodyStructure.locationQualifier |
| CarePlan | [addresses](SearchParameter-mii-sp-meta-careplan-addresses.md) | reference | CarePlan.addresses |
| CarePlan | [contributor](SearchParameter-mii-sp-meta-careplan-contributor.md) | reference | CarePlan.contributor |
| CarePlan | [created](SearchParameter-mii-sp-meta-careplan-created.md) | date | CarePlan.created |
| CarePlan, DiagnosticReport | [supporting-info](SearchParameter-mii-sp-meta-supporting-info.md) | reference | CarePlan.supportingInfo | DiagnosticReport.extension('http://hl7.org/fhir/5.0/StructureDefinition/extension-DiagnosticReport.supportingInfo').extension('reference').value |
| CarePlan, ImagingStudy | [description](SearchParameter-mii-sp-meta-description.md) | string | CarePlan.description | ImagingStudy.description | ImagingStudy.series.description |
| Composition | [attester-mode](SearchParameter-mii-sp-meta-composition-attester-mode.md) | token | Composition.attester.mode |
| Composition | [custodian](SearchParameter-mii-sp-meta-composition-custodian.md) | reference | Composition.custodian |
| Composition | [relates-to-code](SearchParameter-mii-sp-meta-composition-relatesto-code.md) | token | Composition.relatesTo.code |
| Composition | [section-author](SearchParameter-mii-sp-meta-composition-section-author.md) | reference | Composition.section.author |
| Composition | [section-title](SearchParameter-mii-sp-meta-composition-section-title.md) | string | Composition.section.title |
| Condition | [asserted-date](SearchParameter-mii-sp-meta-condition-asserted-date.md) | date | Condition.extension.where(url = 'http://hl7.org/fhir/StructureDefinition/condition-assertedDate').value |
| Condition | [icd10gm-diagnosesicherheit](SearchParameter-mii-sp-meta-condition-icd10gm-diagnosesicherheit.md) | token | Condition.code.coding.extension.where(url = 'http://fhir.de/StructureDefinition/icd-10-gm-diagnosesicherheit').value |
| Condition | [icd10gm-mehrfachcodierung](SearchParameter-mii-sp-meta-condition-icd10gm-mehrfachcodierung.md) | token | Condition.code.coding.extension.where(url = 'http://fhir.de/StructureDefinition/icd-10-gm-mehrfachcodierungs-kennzeichen').value |
| Condition | [icd10gm-seitenlokalisation](SearchParameter-mii-sp-meta-condition-icd10gm-seitenlokalisation.md) | token | Condition.code.coding.extension.where(url = 'http://fhir.de/StructureDefinition/seitenlokalisation').value |
| Consent | [mii-policy-uri](SearchParameter-mii-sp-meta-consent-policyuri.md) | uri | Consent.policy.uri |
| Consent | [mii-provision-provision-code](SearchParameter-mii-sp-meta-consent-provisioncode.md) | token | Consent.provision.provision.code |
| Consent | [mii-provision-provision-code-period](SearchParameter-mii-sp-meta-consent-provisioncodeperiod.md) | composite | Consent.provision.provision |
| Consent | [mii-provision-provision-code-type](SearchParameter-mii-sp-meta-consent-provisioncodetype.md) | composite | Consent.provision.provision |
| Consent | [mii-provision-provision-period](SearchParameter-mii-sp-meta-consent-provisionperiod.md) | date | Consent.provision.provision.period |
| Consent | [mii-provision-provision-type](SearchParameter-mii-sp-meta-consent-provisiontype.md) | token | Consent.provision.provision.type |
| Device | [property-type](SearchParameter-mii-sp-meta-device-property-type.md) | token | Device.property.type |
| DiagnosticReport | [conclusion-text](SearchParameter-mii-sp-meta-diagnostic-report-conclusion.md) | string | DiagnosticReport.conclusion |
| DiagnosticReport | [imaging-study](SearchParameter-mii-sp-meta-diagnosticreport-imagingstudy.md) | reference | DiagnosticReport.imagingStudy |
| DocumentReference | [creation](SearchParameter-mii-sp-meta-dokument-documentreference-attachment-creation.md) | date | DocumentReference.content.attachment.creation |
| DocumentReference | [doc-status](SearchParameter-mii-sp-meta-dokument-documentreference-doc-status.md) | token | DocumentReference.docStatus |
| DocumentReference | [nlp-processing-status](SearchParameter-mii-sp-meta-dokument-documentreference-nlp-processing-status.md) | token | DocumentReference.extension.where(url='https://www.medizininformatik-initiative.de/fhir/ext/modul-dokument/StructureDefinition/mii-ex-dokument-nlp-processing-status').value |
| DocumentReference | [size](SearchParameter-mii-sp-meta-documentreference-attachment-size.md) | number | DocumentReference.content.attachment.size |
| DocumentReference | [title](SearchParameter-mii-sp-meta-documentreference-attachment-title.md) | string | DocumentReference.content.attachment.title |
| Encounter | [aufnahmegrund-drittestelle](SearchParameter-mii-sp-meta-encounter-aufnahmegrund-drittestelle.md) | token | Encounter.extension.where(url = 'http://fhir.de/StructureDefinition/Aufnahmegrund').extension.where(url = 'DritteStelle').value |
| Encounter | [aufnahmegrund-ersteundzweitestelle](SearchParameter-mii-sp-meta-encounter-aufnahmegrund-ersteundzweitestelle.md) | token | Encounter.extension.where(url = 'http://fhir.de/StructureDefinition/Aufnahmegrund').extension.where(url = 'ErsteUndZweiteStelle').value |
| Encounter | [aufnahmegrund-viertestelle](SearchParameter-mii-sp-meta-encounter-aufnahmegrund-viertestelle.md) | token | Encounter.extension.where(url = 'http://fhir.de/StructureDefinition/Aufnahmegrund').extension.where(url = 'VierteStelle').value |
| Encounter | [diagnosis-use](SearchParameter-mii-sp-meta-encounter-diagnosis-use.md) | token | Encounter.diagnosis.use |
| Encounter | [entlassungsgrund-drittestelle](SearchParameter-mii-sp-meta-encounter-entlassungsgrund-drittestelle.md) | token | Encounter.hospitalization.dischargeDisposition.extension.where(url = 'http://fhir.de/StructureDefinition/Entlassungsgrund').extension.where(url = 'DritteStelle').value |
| Encounter | [entlassungsgrund-ersteundzweitestelle](SearchParameter-mii-sp-meta-encounter-entlassungsgrund-ersteundzweitestelle.md) | token | Encounter.hospitalization.dischargeDisposition.extension.where(url = 'http://fhir.de/StructureDefinition/Entlassungsgrund').extension.where(url = 'ErsteUndZweiteStelle').value |
| Encounter | [hospitalization-admitsource](SearchParameter-mii-sp-meta-encounter-hospitalization-admitsource.md) | token | Encounter.hospitalization.admitSource |
| Encounter | [location-physical-type](SearchParameter-mii-sp-meta-encounter-location-physical-type.md) | token | Encounter.location.physicalType |
| Encounter | [service-type](SearchParameter-mii-sp-meta-encounter-servicetype.md) | token | Encounter.serviceType |
| EvidenceVariable | [characteristicDescription](SearchParameter-mii-sp-meta-evidencevariable-characteristic-description.md) | string | EvidenceVariable.characteristic.description |
| FamilyMemberHistory | [reason-code](SearchParameter-mii-sp-meta-familymemberhistory-reasoncode.md) | token | FamilyMemberHistory.reasonCode |
| FamilyMemberHistory | [reason-reference](SearchParameter-mii-sp-meta-familymemberhistory-reasonreference.md) | reference | FamilyMemberHistory.reasonReference |
| ImagingStudy | [bildgebungsgrund](SearchParameter-mii-sp-meta-imaging-study-bildgebungsgrund.md) | string | ImagingStudy.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-bildgebungsgrund').value |
| ImagingStudy | [contrast-bolus](SearchParameter-mii-sp-meta-imaging-study-series-contrast-bolus.md) | token | ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-kontrastmittel').extension('contrastBolus').value |
| ImagingStudy | [contrast-bolus-details](SearchParameter-mii-sp-meta-imaging-study-series-contrast-bolus-details.md) | reference | ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-kontrastmittel').extension('contrastBolusDetails').value |
| ImagingStudy | [convolutional-kernel](SearchParameter-mii-sp-meta-imaging-study-series-convolutional-kernel.md) | string | ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-ct').extension('convolutionalKernel').value |
| ImagingStudy | [ctdi-volume](SearchParameter-mii-sp-meta-imaging-study-series-ctdi-volume.md) | quantity | ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-ct').extension('CTDIvol').value |
| ImagingStudy | [echo-time](SearchParameter-mii-sp-meta-imaging-study-series-echo-time.md) | quantity | ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-mr').extension('echoTime').value |
| ImagingStudy | [exposure](SearchParameter-mii-sp-meta-imaging-study-series-exposure.md) | quantity | ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-ct').extension('exposure').value | ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-mg-cr-dx').extension('exposure').value |
| ImagingStudy | [exposure-time](SearchParameter-mii-sp-meta-imaging-study-series-exposure-time.md) | quantity | ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-ct').extension('exposureTime').value | ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-mg-cr-dx').extension('exposureTime').value |
| ImagingStudy | [flip-angle](SearchParameter-mii-sp-meta-imaging-study-series-flip-angle.md) | quantity | ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-mr').extension('flipAngle').value |
| ImagingStudy | [instance-burned-in-annotation](SearchParameter-mii-sp-meta-imaging-study-instance-burned-in-annotation.md) | token | ImagingStudy.series.instance.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-instanz-details').extension('burnedInAnnotation').value |
| ImagingStudy | [instance-image-type](SearchParameter-mii-sp-meta-imaging-study-instance-image-type.md) | token | ImagingStudy.series.instance.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-instanz-details').extension('imageType').value |
| ImagingStudy | [instance-number](SearchParameter-mii-sp-meta-imaging-study-instance-number.md) | number | ImagingStudy.series.instance.number |
| ImagingStudy | [instance-pixel-spacing-x](SearchParameter-mii-sp-meta-imaging-study-instance-pixel-x.md) | quantity | ImagingStudy.series.instance.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-instanz-details').extension('pixelSpacingX').value |
| ImagingStudy | [instance-pixel-spacing-y](SearchParameter-mii-sp-meta-imaging-study-instance-pixel-y.md) | quantity | ImagingStudy.series.instance.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-instanz-details').extension('pixelSpacingY').value |
| ImagingStudy | [instance-slice-thickness](SearchParameter-mii-sp-meta-imaging-study-instance-slice-thickness.md) | quantity | ImagingStudy.series.instance.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-instanz-details').extension('sliceThickness').value |
| ImagingStudy | [inversion-time](SearchParameter-mii-sp-meta-imaging-study-series-inversion-time.md) | quantity | ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-mr').extension('inversionTime').value |
| ImagingStudy | [kvp](SearchParameter-mii-sp-meta-imaging-study-series-kvp.md) | quantity | ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-ct').extension('KVP').value | ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-mg-cr-dx').extension('KVP').value |
| ImagingStudy | [magnetic-field-strength](SearchParameter-mii-sp-meta-imaging-study-series-magnetic-field-strength.md) | quantity | ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-mr').extension('magneticFieldStrength').value |
| ImagingStudy | [modality-body-site](SearchParameter-mii-sp-meta-imaging-study-modality-body-site.md) | composite | ImagingStudy.series |
| ImagingStudy | [number-instances](SearchParameter-mii-sp-meta-imaging-study-number-instances.md) | number | ImagingStudy.numberOfInstances | ImagingStudy.series.numberOfInstances |
| ImagingStudy | [number-series](SearchParameter-mii-sp-meta-imaging-study-number-series.md) | number | ImagingStudy.numberOfSeries |
| ImagingStudy | [procedure-reference](SearchParameter-mii-sp-meta-imaging-study-procedure-reference.md) | reference | ImagingStudy.procedureReference |
| ImagingStudy | [pulse-frequency](SearchParameter-mii-sp-meta-imaging-study-series-pulse-frequency.md) | quantity | ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-us').extension('pulseRepetitionFrequency').value |
| ImagingStudy | [radionuclide](SearchParameter-mii-sp-meta-imaging-study-series-radionuclide.md) | token | ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-pt').extension('radionuclide').value | ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-nm').extension('radionuclide').value |
| ImagingStudy | [radionuclide-half-life](SearchParameter-mii-sp-meta-imaging-study-series-radionuclide-half-life.md) | quantity | ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-pt').extension('radionuclideHalfLife').value | ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-nm').extension('radionuclideHalfLife').value |
| ImagingStudy | [radionuclide-total-dose](SearchParameter-mii-sp-meta-imaging-study-series-radionuclide-total-dose.md) | quantity | ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-pt').extension('radionuclideTotalDose').value | ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-nm').extension('radionuclideTotalDose').value |
| ImagingStudy | [radiopharmaceutical](SearchParameter-mii-sp-meta-imaging-study-series-radiopharmaceutical.md) | token | ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-pt').extension('radiopharmaceutical').value | ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-nm').extension('radiopharmaceutical').value |
| ImagingStudy | [reason-reference](SearchParameter-mii-sp-meta-reason-reference.md) | reference | ImagingStudy.reasonReference |
| ImagingStudy | [repetition-time](SearchParameter-mii-sp-meta-imaging-study-series-repetition-time.md) | quantity | ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-mr').extension('repetitionTime').value |
| ImagingStudy | [scanning-sequence](SearchParameter-mii-sp-meta-imaging-study-series-scanning-sequence.md) | token | ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-mr').extension('scanningSequence').value |
| ImagingStudy | [scanning-sequence-variant](SearchParameter-mii-sp-meta-imaging-study-series-scanning-sequence-variant.md) | token | ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-mr').extension('scanningSequenceVariant').value |
| ImagingStudy | [series-laterality](SearchParameter-mii-sp-meta-imaging-study-series-laterality.md) | token | ImagingStudy.series.laterality |
| ImagingStudy | [series-number](SearchParameter-mii-sp-meta-imaging-study-series-number.md) | number | ImagingStudy.series.number |
| ImagingStudy | [series-started](SearchParameter-mii-sp-meta-imaging-study-series-started.md) | date | ImagingStudy.series.started |
| ImagingStudy | [series-type](SearchParameter-mii-sp-meta-imaging-study-series-series-type.md) | token | ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-pt').extension('seriesType').value |
| ImagingStudy | [slice-thickness](SearchParameter-mii-sp-meta-imaging-study-series-slice-thickness.md) | quantity | ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-serie-schichtdicke').value |
| ImagingStudy | [study-modality](SearchParameter-mii-sp-meta-imaging-study-modality.md) | token | ImagingStudy.modality |
| ImagingStudy | [tracer-exposure-time](SearchParameter-mii-sp-meta-imaging-study-series-tracer-exposure-time.md) | quantity | ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-pt').extension('tracerExposureTime').value | ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-nm').extension('tracerExposureTime').value |
| ImagingStudy | [transducer-frequency](SearchParameter-mii-sp-meta-imaging-study-series-transducer-frequency.md) | quantity | ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-us').extension('transducerFrequency').value |
| ImagingStudy | [transducer-type](SearchParameter-mii-sp-meta-imaging-study-series-transducer-type.md) | token | ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-us').extension('transducerType').value |
| ImagingStudy | [ultrasound-color](SearchParameter-mii-sp-meta-imaging-study-series-ultrasound-color.md) | token | ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-us').extension('ultrasoundPresent').value |
| ImagingStudy | [units](SearchParameter-mii-sp-meta-imaging-study-series-units.md) | token | ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-pt').extension('units').value | ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-nm').extension('units').value |
| ImagingStudy | [view-position](SearchParameter-mii-sp-meta-imaging-study-series-view-position.md) | token | ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-mg-cr-dx').extension('viewPosition').value |
| ImagingStudy | [xray-tube-current](SearchParameter-mii-sp-meta-imaging-study-series-xray-tube-current.md) | quantity | ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-ct').extension('xRayTubeCurrent').value | ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-mg-cr-dx').extension('xRayTubeCurrent').value |
| Library | [quellregister](SearchParameter-mii-sp-meta-library-quellregister.md) | token | Library.extension.where(url='https://www.medizininformatik-initiative.de/fhir/modul-studie/StructureDefinition/mii-ex-studie-quell-register').value |
| Library | [relatedArtifactUrl](SearchParameter-mii-sp-meta-library-relatedartifact-url.md) | uri | Library.relatedArtifact.document.url |
| List | [mode](SearchParameter-mii-sp-meta-medication-list-mode.md) | token | List.mode |
| Media | [part-of](SearchParameter-mii-sp-meta-media-partof.md) | reference | Media.partOf |
| Medication | [ingredient-strength](SearchParameter-mii-sp-meta-medication-ingredient-strength.md) | composite | Medication.ingredient.strength |
| Medication | [ingredient-strength-denominator](SearchParameter-mii-sp-meta-medication-ingredient-strength-denominator.md) | quantity | Medication.ingredient.strength.denominator |
| Medication | [ingredient-strength-numerator](SearchParameter-mii-sp-meta-medication-ingredient-strength-numerator.md) | quantity | Medication.ingredient.strength.numerator |
| MedicationAdministration | [part-of](SearchParameter-mii-sp-meta-medication-partof.md) | reference | MedicationAdministration.partOf |
| MedicationStatement, MedicationAdministration | [reason-reference](SearchParameter-mii-sp-meta-medication-reasonreference.md) | reference | MedicationAdministration.reasonReference | MedicationStatement.reasonReference |
| MedicationStatement, MedicationAdministration, MedicationRequest | [dosage-route](SearchParameter-mii-sp-meta-medication-dosage-route.md) | token | MedicationAdministration.dosage.route | MedicationStatement.dosage.route | MedicationRequest.dosageInstruction.route |
| MedicationStatement, MedicationAdministration, MedicationRequest | [dosage-site](SearchParameter-mii-sp-meta-medication-dosage-site.md) | token | MedicationAdministration.dosage.site | MedicationStatement.dosage.site | MedicationRequest.dosageInstruction.site |
| MedicationStatement, MedicationAdministration, MedicationRequest | [ratequantity](SearchParameter-mii-sp-meta-medication-dosage-ratequantity.md) | quantity | MedicationStatement.dosage.doseAndRate.rate.ofType(Quantity) | MedicationAdministration.dosage.rate.ofType(Quantity) | MedicationRequest.dosageInstruction.doseAndRate.rate.ofType(Quantity) |
| MedicationStatement, MedicationAdministration, MedicationRequest | [rateratio](SearchParameter-mii-sp-meta-medication-dosage-rateratio.md) | composite | MedicationStatement.dosage.doseAndRate.rate.ofType(Ratio) | MedicationAdministration.dosage.rate.ofType(Ratio) | MedicationRequest.dosageInstruction.doseAndRate.rate.ofType(Ratio) |
| MedicationStatement, MedicationAdministration, MedicationRequest | [rateratio-denominator](SearchParameter-mii-sp-meta-medication-dosage-rateratio-denominator.md) | quantity | MedicationStatement.dosage.doseAndRate.rate.ofType(Ratio).denominator | MedicationAdministration.dosage.rate.ofType(Ratio).denominator | MedicationRequest.dosageInstruction.doseAndRate.rate.ofType(Ratio).denominator |
| MedicationStatement, MedicationAdministration, MedicationRequest | [rateratio-numerator](SearchParameter-mii-sp-meta-medication-dosage-rateratio-numerator.md) | quantity | MedicationStatement.dosage.doseAndRate.rate.ofType(Ratio).numerator | MedicationAdministration.dosage.rate.ofType(Ratio).numerator | MedicationRequest.dosageInstruction.doseAndRate.rate.ofType(Ratio).numerator |
| MedicationStatement, MedicationRequest | [doserange](SearchParameter-mii-sp-meta-medication-dosage-doserange.md) | composite | MedicationStatement.dosage.doseAndRate.dose.ofType(Range) | MedicationRequest.dosageInstruction.doseAndRate.dose.ofType(Range) |
| MedicationStatement, MedicationRequest | [doserange-high](SearchParameter-mii-sp-meta-medication-dosage-doserange-high.md) | quantity | MedicationStatement.dosage.doseAndRate.dose.ofType(Range).high | MedicationRequest.dosageInstruction.doseAndRate.dose.ofType(Range).high |
| MedicationStatement, MedicationRequest | [doserange-low](SearchParameter-mii-sp-meta-medication-dosage-doserange-low.md) | quantity | MedicationStatement.dosage.doseAndRate.dose.ofType(Range).low | MedicationRequest.dosageInstruction.doseAndRate.dose.ofType(Range).low |
| MedicationStatement, MedicationRequest | [raterange](SearchParameter-mii-sp-meta-medication-dosage-raterange.md) | composite | MedicationStatement.dosage.doseAndRate.rate.ofType(Range) | MedicationRequest.dosageInstruction.doseAndRate.rate.ofType(Range) |
| MedicationStatement, MedicationRequest | [raterange-high](SearchParameter-mii-sp-meta-medication-dosage-raterange-high.md) | quantity | MedicationStatement.dosage.doseAndRate.rate.ofType(Range).high | MedicationRequest.dosageInstruction.doseAndRate.rate.ofType(Range).high |
| MedicationStatement, MedicationRequest | [raterange-low](SearchParameter-mii-sp-meta-medication-dosage-raterange-low.md) | quantity | MedicationStatement.dosage.doseAndRate.rate.ofType(Range).low | MedicationRequest.dosageInstruction.doseAndRate.rate.ofType(Range).low |
| MedicationStatement, MedicationRequest, MedicationAdministration | [dose-quantity](SearchParameter-mii-sp-meta-medication-dosage-dosequantity.md) | quantity | MedicationStatement.dosage.doseAndRate.dose.ofType(Quantity) | MedicationRequest.dosageInstruction.doseAndRate.dose.ofType(Quantity) | MedicationAdministration.dosage.dose |
| Observation | [body-site](SearchParameter-mii-sp-meta-observation-bodysite.md) | token | Observation.bodySite |
| Observation | [body-structure](SearchParameter-mii-sp-meta-observation-body-structure.md) | reference | Observation.extension('http://hl7.org/fhir/5.0/StructureDefinition/extension-Observation.bodyStructure').value |
| Observation | [component-interpretation](SearchParameter-mii-sp-meta-observation-component-interpretation.md) | token | Observation.component.interpretation |
| Observation | [interpretation](SearchParameter-mii-sp-meta-observation-interpretation.md) | token | Observation.interpretation |
| Observation | [issued](SearchParameter-mii-sp-meta-observation-issued.md) | date | Observation.issued |
| Observation | [reference-range](SearchParameter-mii-sp-meta-observation-referencerange.md) | composite | Observation.referenceRange | Observation.component.referenceRange |
| Observation | [reference-range-high](SearchParameter-mii-sp-meta-observation-referencerange-high.md) | quantity | Observation.referenceRange.high | Observation.component.referenceRange.high |
| Observation | [reference-range-low](SearchParameter-mii-sp-meta-observation-referencerange-low.md) | quantity | Observation.referenceRange.low | Observation.component.referenceRange.low |
| Observation | [series-uid](SearchParameter-mii-sp-meta-observation-series-uid.md) | token | Observation.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-series-uid').value |
| Observation | [sop-instance-uid](SearchParameter-mii-sp-meta-observation-sop-instance-uid.md) | token | Observation.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-sop-instanz-uid').value |
| Observation | [value-ratio](SearchParameter-mii-sp-meta-observation-value-ratio.md) | composite | Observation.value.ofType(Ratio) |
| Observation | [value-ratio-denominator](SearchParameter-mii-sp-meta-observation-value-ratio-denominator.md) | quantity | Observation.value.ofType(Ratio).denominator |
| Observation | [value-ratio-numerator](SearchParameter-mii-sp-meta-observation-value-ratio-numerator.md) | quantity | Observation.value.ofType(Ratio).numerator |
| Patient | [adresszusatz](SearchParameter-mii-sp-meta-patient-adresszusatz.md) | string | Patient.address.line.extension('http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-additionalLocator').value |
| Patient | [assigner-pid](SearchParameter-mii-sp-meta-patient-assignerpid.md) | token | Patient.identifier.assigner.identifier |
| Patient | [gemeindeschluessel](SearchParameter-mii-sp-meta-patient-gemeindeschluessel.md) | token | Patient.address.city.extension('http://fhir.de/StructureDefinition/destatis/ags').value |
| Patient | [hausnummer](SearchParameter-mii-sp-meta-patient-hausnummer.md) | string | Patient.address.line.extension('http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber').value |
| Patient | [other-amtlich](SearchParameter-mii-sp-meta-patient-otheramtlich.md) | token | Patient.gender.extension('http://fhir.de/StructureDefinition/gender-amtlich-de').value |
| Patient | [postfach](SearchParameter-mii-sp-meta-patient-postfach.md) | string | Patient.address.line.extension.where(url='http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-postBox').value |
| Patient | [prefix](SearchParameter-mii-sp-meta-patient-prefix.md) | token | Patient.name.prefix |
| Patient | [prefix-qualifier](SearchParameter-mii-sp-meta-patient-prefixqualifier.md) | token | Patient.name.prefix.extension('http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier').value |
| Patient | [stadtteil](SearchParameter-mii-sp-meta-patient-stadtteil.md) | string | Patient.address.extension('http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-precinct').value |
| Patient | [strasse](SearchParameter-mii-sp-meta-patient-strasse.md) | string | Patient.address.line.extension('http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName').value |
| Procedure | [bodySite](SearchParameter-mii-sp-meta-procedure-bodysite.md) | token | Procedure.bodySite |
| Procedure | [complication](SearchParameter-mii-sp-meta-procedure-complication.md) | token | Procedure.complication |
| Procedure | [dokumentationsdatum](SearchParameter-mii-sp-meta-procedure-dokumentationsdatum.md) | date | Procedure.extension('http://fhir.de/StructureDefinition/ProzedurDokumentationsdatum').value |
| Procedure | [durchfuehrungsabsicht](SearchParameter-mii-sp-meta-procedure-durchfuehrungsabsicht.md) | token | Procedure.extension('https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Durchfuehrungsabsicht').value |
| Procedure | [ops-seitenlokalisation](SearchParameter-mii-sp-meta-procedure-ops-seitenlokalisation.md) | token | Procedure.code.coding.extension.where(url = 'http://fhir.de/StructureDefinition/seitenlokalisation').value |
| Procedure | [outcome](SearchParameter-mii-sp-meta-procedure-outcome.md) | token | Procedure.outcome |
| Procedure | [recorder](SearchParameter-mii-sp-meta-procedure-recorder.md) | reference | Procedure.recorder |
| Procedure | [report](SearchParameter-mii-sp-meta-read-proc-report.md) | reference | Procedure.report |
| ResearchStudy | [akronym](SearchParameter-mii-sp-meta-researchstudy-akronym.md) | string | ResearchStudy.extension.where(url='https://www.medizininformatik-initiative.de/fhir/modul-studie/StructureDefinition/mii-ex-studie-akronym').value |
| ResearchStudy | [armName](SearchParameter-mii-sp-meta-researchstudy-arm-name.md) | string | ResearchStudy.arm.name |
| ResearchStudy | [finanzierung](SearchParameter-mii-sp-meta-researchstudy-finanzierung.md) | string | ResearchStudy.extension.where(url='https://www.medizininformatik-initiative.de/fhir/modul-studie/StructureDefinition/mii-ex-studie-finanzierung').value |
| ResearchStudy | [label](SearchParameter-mii-sp-meta-researchstudy-label.md) | string | ResearchStudy.extension.where(url='http://hl7.org/fhir/5.0/StructureDefinition/extension-ResearchStudy.label').extension.where(url='value').value |
| ResearchStudy | [rekrutierungsstand](SearchParameter-mii-sp-meta-researchstudy-rekrutierungsstand.md) | number | ResearchStudy.extension.where(url='https://www.medizininformatik-initiative.de/fhir/modul-studie/StructureDefinition/mii-ex-studie-rekrutierung').extension.where(url='rekrutierungsstand').value |
| ResearchStudy | [rekrutierungsstand-datum](SearchParameter-mii-sp-meta-researchstudy-rekrutierungsstand-datum.md) | date | ResearchStudy.extension.where(url='https://www.medizininformatik-initiative.de/fhir/modul-studie/StructureDefinition/mii-ex-studie-rekrutierung').extension.where(url='rekrutierungsstand-datum').value |
| ResearchStudy | [rekrutierungsstand-genauigkeit](SearchParameter-mii-sp-meta-researchstudy-rekrutierungsstand-genauigkeit.md) | string | ResearchStudy.extension.where(url='https://www.medizininformatik-initiative.de/fhir/modul-studie/StructureDefinition/mii-ex-studie-rekrutierung').extension.where(url='rekrutierungsstand-genauigkeit').value |
| ResearchStudy | [rekrutierungsstart](SearchParameter-mii-sp-meta-researchstudy-rekrutierungsstart.md) | date | ResearchStudy.extension.where(url='https://www.medizininformatik-initiative.de/fhir/modul-studie/StructureDefinition/mii-ex-studie-rekrutierung').extension.where(url='rekrutierungsstart').value |
| ResearchStudy | [rekrutierungsziel](SearchParameter-mii-sp-meta-researchstudy-rekrutierungsziel.md) | number | ResearchStudy.extension.where(url='https://www.medizininformatik-initiative.de/fhir/modul-studie/StructureDefinition/mii-ex-studie-rekrutierung').extension.where(url='rekrutierungsziel').value |
| ResearchStudy | [studienregister](SearchParameter-mii-sp-meta-researchstudy-studienregister.md) | reference | ResearchStudy.extension.where(url='https://www.medizininformatik-initiative.de/fhir/modul-studie/StructureDefinition/mii-ex-studie-studienregister').value |
| ResearchSubject | [consent](SearchParameter-mii-sp-meta-researchsubject-consent.md) | reference | ResearchSubject.consent |
| ServiceRequest | [reason-code](SearchParameter-mii-sp-meta-servicerequest-reasoncode.md) | token | ServiceRequest.reasonCode |
| ServiceRequest | [reason-reference](SearchParameter-mii-sp-meta-servicerequest-reasonreference.md) | reference | ServiceRequest.reasonReference |
| ServiceRequest | [supporting-info](SearchParameter-mii-sp-meta-servicerequest-supportinginfo.md) | reference | ServiceRequest.supportingInfo |
| Specimen | [collection-method](SearchParameter-mii-sp-meta-specimen-collection-method.md) | token | Specimen.collection.method |
| Specimen | [container-additive](SearchParameter-mii-sp-meta-specimen-container-additive.md) | reference | (Specimen.container.additive.ofType(Reference)) |
| Specimen | [diagnose](SearchParameter-mii-sp-meta-specimen-diagnose.md) | reference | Specimen.extension.where(url='https://www.medizininformatik-initiative.de/fhir/ext/modul-biobank/StructureDefinition/Diagnose').value |
| Specimen | [processing-additive](SearchParameter-mii-sp-meta-specimen-processing-additive.md) | reference | Specimen.processing.additive.ofType(Reference) |
| Specimen | [processing-date](SearchParameter-mii-sp-meta-specimen-processing-date.md) | date | Specimen.processing.time.ofType(dateTime) | Specimen.processing.time.ofType(Period) |
| Specimen | [processing-procedure](SearchParameter-mii-sp-meta-specimen-processing-procedure.md) | token | Specimen.processing.procedure |
| Specimen | [request](SearchParameter-mii-sp-meta-specimen-request.md) | reference | Specimen.request |
| Task | [for](SearchParameter-mii-sp-meta-task-for.md) | reference | Task.for |
| Task | [reason-code](SearchParameter-mii-sp-meta-task-reasoncode.md) | token | Task.reasonCode |
| Task | [reason-reference](SearchParameter-mii-sp-meta-task-reasonreference.md) | reference | Task.reasonReference |

### Zurückgezogene Suchparameter

Diese Suchparameter waren identisch mit einem Suchparameter aus FHIR R4 core. Verwenden Sie stattdessen den Core-Suchparameter mit demselben Code; siehe die [Änderungshistorie](changes.md).

| | |
| :--- | :--- |
| Name | Beschreibung |
| [MII_SP_Meta_Condition_Evidence_Detail](SearchParameter-mii-sp-meta-condition-evidence-detail.md) | SearchParameter for Condition.evidence.detail |
| [MII_SP_Meta_Condition_Verification_Status](SearchParameter-mii-sp-meta-condition-verification-status.md) | SearchParameter for Condition.verificationStatus |
| [MII_SP_Meta_DeviceMetric_Source](SearchParameter-mii-sp-meta-devicemetric-source.md) | Suchparameter für DeviceMetric.source |
| [MII_SP_Meta_Observation_Encounter](SearchParameter-mii-sp-meta-observation-encounter.md) | SearchParameter for Observation.encounter |
| [MII_SP_Meta_Observation_Focus](SearchParameter-mii-sp-meta-observation-focus.md) | SearchParameter for Observation.focus |
| [MII_SP_Meta_Observation_hasMember](SearchParameter-mii-sp-meta-observation-hasmember.md) | SearchParameter for Observation.hasMember |
| [MII_SP_Meta_Specimen_Collection_Body_Site](SearchParameter-mii-sp-meta-specimen-collection-body-site.md) | SearchParameter for Specimen.collection.bodySite |

