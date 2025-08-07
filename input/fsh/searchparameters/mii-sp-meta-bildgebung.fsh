Instance: mii-sp-bildgebung-supporting-info
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/SearchParameter/mii-sp-bildgebung-supporting-info"
* insert SP_Publisher
* insert Version
* name = "MII_SP_Bildgebung_Supporting_Info"
* status = #active
* experimental = false
* insert Date
* description = "Suchparameter für CarePlan.supportingInfo | DiagnosticReport.extension.supportingInfo"
* code = #supporting-info
* base[+] = #CarePlan
* base[+] = #DiagnosticReport
* type = #reference
* expression = "CarePlan.supportingInfo | DiagnosticReport.extension('http://hl7.org/fhir/5.0/StructureDefinition/extension-DiagnosticReport.supportingInfo').extension('reference').value"
* target[+] = #DiagnosticReport

Instance: mii-sp-bildgebung-description
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/SearchParameter/mii-sp-bildgebung-description"
* insert SP_Publisher
* insert Version
* insert Date
* name = "MII_SP_Bildgebung_Description"
* status = #active
* experimental = false
* description = "Suchparameter für CarePlan.description | ImagingStudy.description | ImagingStudy.series.description"
* code = #description
* base[+] = #CarePlan
* base[+] = #ImagingStudy
* type = #string
* expression = "CarePlan.description | ImagingStudy.description | ImagingStudy.series.description"
* modifier[+] = #contains
* modifier[+] = #exact
* modifier[+] = #missing

// BodyStructure
Instance: mii-sp-bildgebung-body-structure-location-qualifier
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/SearchParameter/mii-sp-bildgebung-body-structure-location-qualifier"
* insert SP_Publisher
* insert Version
* insert Date
* name = "MII_SP_Bildgebung_Koerperstruktur_Location_Qualifier"
* status = #active
* experimental = false
* description = "Suchparameter für BodyStructure.locationQualifier"
* code = #location-qualifier
* base = #BodyStructure
* type = #token
* expression = "BodyStructure.locationQualifier"
* modifier[+] = #text
* modifier[+] = #not
* modifier[+] = #above
* modifier[+] = #below
* modifier[+] = #in
* modifier[+] = #not-in
* modifier[+] = #missing

//Composition
Instance: mii-sp-bildgebung-composition-section-title
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/SearchParameter/mii-sp-bildgebung-composition-section-title"
* insert SP_Publisher
* insert Version
* insert Date
* name = "MII_SP_Bildgebung_Composition_Section_Title"
* status = #active
* experimental = false
* description = "Suchparameter für Composition.section.title"
* code = #section-title
* base = #Composition
* type = #string
* expression = "Composition.section.title"
* modifier[+] = #contains
* modifier[+] = #exact
* modifier[+] = #missing

Instance: mii-sp-bildgebung-composition-section-author
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/SearchParameter/mii-sp-bildgebung-composition-section-author"
* insert SP_Publisher
* insert Version
* insert Date
* name = "MII_SP_Bildgebung_Composition_Section_Author"
* status = #active
* experimental = false
* description = "Suchparameter für Composition.section.author"
* code = #section-author
* base = #Composition
* type = #reference
* expression = "Composition.section.author"
* target = #Practitioner

//DiagnosticReport
Instance: mii-sp-bildgebung-diagnostic-report-conclusion
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/SearchParameter/mii-sp-bildgebung-diagnostic-report-conclusion"
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert Version
* insert Date
* name = "MII_SP_Bildgebung_Diagnostic_Report_Conclusion"
* status = #active
* experimental = false
* description = "Suchparameter für DiagnosticReport.conclusion"
* code = #conclusion-text
* base = #DiagnosticReport
* type = #string
* expression = "DiagnosticReport.conclusion"
* modifier[+] = #contains
* modifier[+] = #exact
* modifier[+] = #missing

//ImagingStudy
Instance: mii-sp-bildgebung-imaging-study-modality-body-site
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/SearchParameter/mii-sp-bildgebung-imaging-study-modality-body-site"
* insert SP_Publisher
* insert Version
* insert Date
* name = "MII_SP_Bildgebung_Imaging_Study_Modality_Body_Site"
* status = #active
* experimental = false
* description = "Suchparameter für ImagingStudy.series.modality and ImagingStudy.series.bodySite"
* code = #modality-body-site
* base = #ImagingStudy
* type = #composite
* expression = "ImagingStudy.series"
* component[0].definition = "http://hl7.org/fhir/SearchParameter/ImagingStudy-modality"
* component[=].expression = "modality"
* component[+].definition = "http://hl7.org/fhir/SearchParameter/ImagingStudy-bodysite"
* component[=].expression = "bodysite" 

Instance: mii-sp-bildgebung-imaging-study-bildgebungsgrund
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/SearchParameter/mii-sp-bildgebung-imaging-study-bildgebungsgrund"
* insert SP_Publisher
* insert Version
* insert Date
* name = "MII_SP_Bildgebung_Imaging_Study_Bildgebungsgrund"
* status = #active
* experimental = false
* description = "Suchparameter für ImagingStudy.Extension.Bildgebungsgrund"
* code = #bildgebungsgrund
* base = #ImagingStudy
* type = #string
* expression = "ImagingStudy.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-bildgebungsgrund').value"
* modifier[+] = #contains
* modifier[+] = #exact
* modifier[+] = #missing

Instance: mii-sp-bildgebung-imaging-study-modality
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/SearchParameter/mii-sp-bildgebung-imaging-study-modality"
* insert SP_Publisher
* insert Version
* insert Date
* name = "MII_SP_Bildgebung_Imaging_Study_Modality"
* status = #active
* experimental = false
* description = "Suchparameter für ImagingStudy.modality"
* code = #study-modality
* base = #ImagingStudy
* type = #token
* expression = "ImagingStudy.modality"
* modifier[+] = #text
* modifier[+] = #not
* modifier[+] = #above
* modifier[+] = #below
* modifier[+] = #in
* modifier[+] = #not-in
* modifier[+] = #missing

Instance: mii-sp-bildgebung-reason-reference
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/SearchParameter/mii-sp-bildgebung-reason-reference"
* insert SP_Publisher
* insert Version
* insert Date
* name = "MII_SP_Bildgebung_Reason_Reference"
* status = #active
* experimental = false
* description = "Suchparameter für ImagingStudy.reasonReference"
* code = #reason-reference
* base = #ImagingStudy
* type = #reference
* expression = "ImagingStudy.reasonReference"
* target[+] = #Condition
* target[+] = #Observation
* target[+] = #DiagnosticReport
* target[+] = #DocumentReference

Instance: mii-sp-bildgebung-imaging-study-number-series
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/SearchParameter/mii-sp-bildgebung-imaging-study-number-series"
* insert SP_Publisher
* insert Version
* insert Date
* name = "MII_SP_Bildgebung_Imaging_Study_Number_Series"
* status = #active
* experimental = false
* description = "Suchparameter für ImagingStudy.numberOfSeries"
* code = #number-series
* base = #ImagingStudy
* type = #number
* expression = "ImagingStudy.numberOfSeries"
* comparator[+] = #eq 
* comparator[+] = #gt 
* comparator[+] = #lt
* comparator[+] = #ge 
* comparator[+] = #le

Instance: mii-sp-bildgebung-imaging-study-number-instances
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/SearchParameter/mii-sp-bildgebung-imaging-study-number-instances"
* insert SP_Publisher
* insert Version
* insert Date
* name = "MII_SP_Bildgebung_Imaging_Study_Number_Instances"
* status = #active
* experimental = false
* description = "Suchparameter für ImagingStudy.numberOfSeries"
* code = #number-instances
* base = #ImagingStudy
* type = #number
* expression = "ImagingStudy.numberOfInstances | ImagingStudy.series.numberOfInstances"
* comparator[+] = #eq 
* comparator[+] = #gt 
* comparator[+] = #lt
* comparator[+] = #ge 
* comparator[+] = #le

Instance: mii-sp-bildgebung-imaging-study-procedure-reference
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/SearchParameter/mii-sp-bildgebung-imaging-study-procedure-reference"
* insert SP_Publisher
* insert Version
* insert Date
* name = "MII_SP_Bildgebung_Imaging_Study_Procedure_Reference"
* status = #active
* experimental = false
* description = "Suchparameter für ImagingStudy.procedureReference"
* code = #procedure-reference
* base = #ImagingStudy
* type = #reference
* expression = "ImagingStudy.procedureReference"
* target = #Procedure

Instance: mii-sp-bildgebung-imaging-study-series-ctdi-volume
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/SearchParameter/mii-sp-bildgebung-imaging-study-series-ctdi-volume"
* insert SP_Publisher
* insert Version
* insert Date
* name = "MII_SP_Bildgebung_Imaging_Study_Series_CTDI_Volume"
* status = #active
* experimental = false
* description = "Suchparameter für ImagingStudy.series.extension.CTDIvolume"
* code = #ctdi-volume
* base = #ImagingStudy
* type = #quantity
* expression = "ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-ct').extension('CTDIvol').value"
* comparator[+] = #eq 
* comparator[+] = #gt 
* comparator[+] = #lt
* comparator[+] = #ge 
* comparator[+] = #le  

Instance: mii-sp-bildgebung-imaging-study-series-exposure-time
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/SearchParameter/mii-sp-bildgebung-imaging-study-series-exposure-time"
* insert SP_Publisher
* insert Version
* insert Date
* name = "MII_SP_Bildgebung_Imaging_Study_Series_Exposure_Time"
* status = #active
* experimental = false
* description = "Suchparameter für ImagingStudy.series.extension.exposureTime"
* code = #exposure-time
* base = #ImagingStudy
* type = #quantity
* expression = "ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-ct').extension('exposureTime').value | ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-mg-cr-dx').extension('exposureTime').value"
* comparator[+] = #eq 
* comparator[+] = #gt 
* comparator[+] = #lt
* comparator[+] = #ge 
* comparator[+] = #le 

Instance: mii-sp-bildgebung-imaging-study-series-exposure
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/SearchParameter/mii-sp-bildgebung-imaging-study-series-exposure"
* insert SP_Publisher
* insert Version
* insert Date
* name = "MII_SP_Bildgebung_Imaging_Study_Series_Exposure"
* status = #active
* experimental = false
* description = "Suchparameter für ImagingStudy.series.extension.exposure"
* code = #exposure
* base = #ImagingStudy
* type = #quantity
* expression = "ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-ct').extension('exposure').value | ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-mg-cr-dx').extension('exposure').value"
* comparator[+] = #eq 
* comparator[+] = #gt 
* comparator[+] = #lt
* comparator[+] = #ge 
* comparator[+] = #le 

Instance: mii-sp-bildgebung-imaging-study-series-xray-tube-current
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/SearchParameter/mii-sp-bildgebung-imaging-study-series-xray-tube-current"
* insert SP_Publisher
* insert Version
* insert Date
* name = "MII_SP_Bildgebung_Imaging_Study_Series_xRay_Tube_Current"
* status = #active
* experimental = false
* description = "Suchparameter für ImagingStudy.series.extension.xRayTubeCurrent"
* code = #xray-tube-current
* base = #ImagingStudy
* type = #quantity
* expression = "ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-ct').extension('xRayTubeCurrent').value | ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-mg-cr-dx').extension('xRayTubeCurrent').value"
* comparator[+] = #eq 
* comparator[+] = #gt 
* comparator[+] = #lt
* comparator[+] = #ge 
* comparator[+] = #le 

Instance: mii-sp-bildgebung-imaging-study-series-kvp
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/SearchParameter/mii-sp-bildgebung-imaging-study-series-kvp"
* insert SP_Publisher
* insert Version
* insert Date
* name = "MII_SP_Bildgebung_Imaging_Study_Series_KVP"
* status = #active
* experimental = false
* description = "Suchparameter für ImagingStudy.series.extension.kvp"
* code = #kvp
* base = #ImagingStudy
* type = #quantity
* expression = "ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-ct').extension('KVP').value | ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-mg-cr-dx').extension('KVP').value"
* comparator[+] = #eq 
* comparator[+] = #gt 
* comparator[+] = #lt
* comparator[+] = #ge 
* comparator[+] = #le

Instance: mii-sp-bildgebung-imaging-study-series-view-position
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/SearchParameter/mii-sp-bildgebung-imaging-study-series-view-position"
* insert SP_Publisher
* insert Version
* insert Date
* name = "MII_SP_Bildgebung_Imaging_Study_Series_View_Position"
* status = #active
* experimental = false
* description = "Suchparameter für ImagingStudy.series.extension.viewPosition"
* code = #view-position
* base = #ImagingStudy
* type = #token
* expression = "ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-mg-cr-dx').extension('viewPosition').value"
* modifier[+] = #text
* modifier[+] = #not
* modifier[+] = #above
* modifier[+] = #below
* modifier[+] = #in
* modifier[+] = #not-in
* modifier[+] = #missing 

Instance: mii-sp-bildgebung-imaging-study-series-magnetic-field-strength
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/SearchParameter/mii-sp-bildgebung-imaging-study-series-magnetic-field-strength"
* insert SP_Publisher
* insert Version
* insert Date
* name = "MII_SP_Bildgebung_Imaging_Study_Series_Magnetic_Field_Strength"
* status = #active
* experimental = false
* description = "Suchparameter für ImagingStudy.series.extension.magneticFieldStrength"
* code = #magnetic-field-strength
* base = #ImagingStudy
* type = #quantity
* expression = "ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-mr').extension('magneticFieldStrength').value"
* comparator[+] = #eq 
* comparator[+] = #gt 
* comparator[+] = #lt
* comparator[+] = #ge 
* comparator[+] = #le

Instance: mii-sp-bildgebung-imaging-study-series-scanning-sequence
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/SearchParameter/mii-sp-bildgebung-imaging-study-series-scanning-sequence"
* insert SP_Publisher
* insert Version
* insert Date
* name = "MII_SP_Bildgebung_Imaging_Study_Series_Scanning_Sequence"
* status = #active
* experimental = false
* description = "Suchparameter für ImagingStudy.series.extension.scanningSequence"
* code = #scanning-sequence
* base = #ImagingStudy
* type = #token
* expression = "ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-mr').extension('scanningSequence').value"
* modifier[+] = #text
* modifier[+] = #not
* modifier[+] = #above
* modifier[+] = #below
* modifier[+] = #in
* modifier[+] = #not-in
* modifier[+] = #missing 

Instance: mii-sp-bildgebung-imaging-study-series-scanning-sequence-variant
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/SearchParameter/mii-sp-bildgebung-imaging-study-series-scanning-sequence-variant"
* insert SP_Publisher
* insert Version
* insert Date
* name = "MII_SP_Bildgebung_Imaging_Study_Series_Scanning_Sequence_Variant"
* status = #active
* experimental = false
* description = "Suchparameter für ImagingStudy.series.extension.scanningSequenceVariant"
* code = #scanning-sequence-variant
* base = #ImagingStudy
* type = #token
* expression = "ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-mr').extension('scanningSequenceVariant').value"
* modifier[+] = #text
* modifier[+] = #not
* modifier[+] = #above
* modifier[+] = #below
* modifier[+] = #in
* modifier[+] = #not-in
* modifier[+] = #missing 

Instance: mii-sp-bildgebung-imaging-study-series-echo-time
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/SearchParameter/mii-sp-bildgebung-imaging-study-series-echo-time"
* insert SP_Publisher
* insert Version
* insert Date
* name = "MII_SP_Bildgebung_Imaging_Study_Series_Echo_Time"
* status = #active
* experimental = false
* description = "Suchparameter für ImagingStudy.series.extension.echoTime"
* code = #echo-time
* base = #ImagingStudy
* type = #quantity
* expression = "ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-mr').extension('echoTime').value"
* comparator[+] = #eq 
* comparator[+] = #gt 
* comparator[+] = #lt
* comparator[+] = #ge 
* comparator[+] = #le

Instance: mii-sp-bildgebung-imaging-study-series-repetition-time
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/SearchParameter/mii-sp-bildgebung-imaging-study-series-repetition-time"
* insert SP_Publisher
* insert Version
* insert Date
* name = "MII_SP_Bildgebung_Imaging_Study_Series_Repetition_Time"
* status = #active
* experimental = false
* description = "Suchparameter für ImagingStudy.series.extension.repetitionTime"
* code = #repetition-time
* base = #ImagingStudy
* type = #quantity
* expression = "ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-mr').extension('repetitionTime').value"
* comparator[+] = #eq 
* comparator[+] = #gt 
* comparator[+] = #lt
* comparator[+] = #ge 
* comparator[+] = #le

Instance: mii-sp-bildgebung-imaging-study-series-inversion-time
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/SearchParameter/mii-sp-bildgebung-imaging-study-series-inversion-time"
* insert SP_Publisher
* insert Version
* insert Date
* name = "MII_SP_Bildgebung_Imaging_Study_Series_Inversion_Time"
* status = #active
* experimental = false
* description = "Suchparameter für ImagingStudy.series.extension.inversionTime"
* code = #inversion-time
* base = #ImagingStudy
* type = #quantity
* expression = "ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-mr').extension('inversionTime').value"
* comparator[+] = #eq 
* comparator[+] = #gt 
* comparator[+] = #lt
* comparator[+] = #ge 
* comparator[+] = #le

Instance: mii-sp-bildgebung-imaging-study-series-flip-angle
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/SearchParameter/mii-sp-bildgebung-imaging-study-series-flip-angle"
* insert SP_Publisher
* insert Version
* insert Date
* name = "MII_SP_Bildgebung_Imaging_Study_Series_Flip_Angle"
* status = #active
* experimental = false
* description = "Suchparameter für ImagingStudy.series.extension.flipAngle"
* code = #flip-angle
* base = #ImagingStudy
* type = #quantity
* expression = "ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-mr').extension('flipAngle').value"
* comparator[+] = #eq 
* comparator[+] = #gt 
* comparator[+] = #lt
* comparator[+] = #ge 
* comparator[+] = #le

Instance: mii-sp-bildgebung-imaging-study-series-radiopharmaceutical
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/SearchParameter/mii-sp-bildgebung-imaging-study-series-radiopharmaceutical"
* insert SP_Publisher
* insert Version
* insert Date
* name = "MII_SP_Bildgebung_Imaging_Study_Radiopharmaceutical"
* status = #active
* experimental = false
* description = "Suchparameter für ImagingStudy.series.extension.radiopharmaceutical"
* code = #radiopharmaceutical
* base = #ImagingStudy
* type = #token
* expression = "ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-pt').extension('radiopharmaceutical').value | ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-nm').extension('radiopharmaceutical').value"
* modifier[+] = #text
* modifier[+] = #not
* modifier[+] = #above
* modifier[+] = #below
* modifier[+] = #in
* modifier[+] = #not-in
* modifier[+] = #missing

Instance: mii-sp-bildgebung-imaging-study-series-radionuclide
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/SearchParameter/mii-sp-bildgebung-imaging-study-series-radionuclide"
* insert SP_Publisher
* insert Version
* insert Date
* name = "MII_SP_Bildgebung_Imaging_Study_Radionuclide"
* status = #active
* experimental = false
* description = "Suchparameter für ImagingStudy.series.extension.radionuclide"
* code = #radionuclide
* base = #ImagingStudy
* type = #token
* expression = "ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-pt').extension('radionuclide').value | ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-nm').extension('radionuclide').value"
* modifier[+] = #text
* modifier[+] = #not
* modifier[+] = #above
* modifier[+] = #below
* modifier[+] = #in
* modifier[+] = #not-in
* modifier[+] = #missing

Instance: mii-sp-bildgebung-imaging-study-series-tracer-exposure-time
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/SearchParameter/mii-sp-bildgebung-imaging-study-series-tracer-exposure-time"
* insert SP_Publisher
* insert Version
* insert Date
* name = "MII_SP_Bildgebung_Imaging_Study_Series_Tracer_Exposure_Time"
* status = #active
* experimental = false
* description = "Suchparameter für ImagingStudy.series.tracerExposureTime"
* code = #tracer-exposure-time
* base = #ImagingStudy
* type = #quantity
* expression = "ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-pt').extension('tracerExposureTime').value | ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-nm').extension('tracerExposureTime').value"
* comparator[+] = #eq 
* comparator[+] = #gt 
* comparator[+] = #lt
* comparator[+] = #ge 
* comparator[+] = #le

Instance: mii-sp-bildgebung-imaging-study-series-units
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/SearchParameter/mii-sp-bildgebung-imaging-study-series-units"
* insert SP_Publisher
* insert Version
* insert Date
* name = "MII_SP_Bildgebung_Imaging_Study_Series_Units"
* status = #active
* experimental = false
* description = "Suchparameter für ImagingStudy.series.extension.units"
* code = #units
* base = #ImagingStudy
* type = #token
* expression = "ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-pt').extension('units').value | ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-nm').extension('units').value"
* modifier[+] = #text
* modifier[+] = #not
* modifier[+] = #above
* modifier[+] = #below
* modifier[+] = #in
* modifier[+] = #not-in
* modifier[+] = #missing

Instance: mii-sp-bildgebung-imaging-study-series-radionuclide-total-dose
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/SearchParameter/mii-sp-bildgebung-imaging-study-series-radionuclide-total-dose"
* insert SP_Publisher
* insert Version
* insert Date
* name = "MII_SP_Bildgebung_Imaging_Study_Series_Radionuclide_Total_Dose"
* status = #active
* experimental = false
* description = "Suchparameter für ImagingStudy.series.extension.radionuclideTotalDose"
* code = #radionuclide-total-dose
* base = #ImagingStudy
* type = #quantity
* expression = "ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-pt').extension('radionuclideTotalDose').value | ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-nm').extension('radionuclideTotalDose').value"
* comparator[+] = #eq 
* comparator[+] = #gt 
* comparator[+] = #lt
* comparator[+] = #ge 
* comparator[+] = #le

Instance: mii-sp-bildgebung-imaging-study-series-radionuclide-half-life
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/SearchParameter/mii-sp-bildgebung-imaging-study-series-radionuclide-half-life"
* insert SP_Publisher
* insert Version
* insert Date
* name = "MII_SP_Bildgebung_Imaging_Study_Series_Radionuclide_Half_Life"
* status = #active
* experimental = false
* description = "Suchparameter für ImagingStudy.series.extension.radionuclideHalfLife"
* code = #radionuclide-half-life
* base = #ImagingStudy
* type = #quantity
* expression = "ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-pt').extension('radionuclideHalfLife').value | ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-nm').extension('radionuclideHalfLife').value"
* comparator[+] = #eq 
* comparator[+] = #gt 
* comparator[+] = #lt
* comparator[+] = #ge 
* comparator[+] = #le

Instance: mii-sp-bildgebung-imaging-study-series-series-type
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/SearchParameter/mii-sp-bildgebung-imaging-study-series-series-type"
* insert SP_Publisher
* insert Version
* insert Date
* name = "MII_SP_Bildgebung_Imaging_Study_Series_Series_Type"
* status = #active
* experimental = false
* description = "ImagingStudy.series.extension.seriesType"
* code = #series-type
* base = #ImagingStudy
* type = #token
* expression = "ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-pt').extension('seriesType').value"
* modifier[+] = #text
* modifier[+] = #not
* modifier[+] = #above
* modifier[+] = #below
* modifier[+] = #in
* modifier[+] = #not-in
* modifier[+] = #missing

Instance: mii-sp-bildgebung-imaging-study-series-transducer-type
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/SearchParameter/mii-sp-bildgebung-imaging-study-series-transducer-type"
* insert SP_Publisher
* insert Version
* insert Date
* name = "MII_SP_Bildgebung_Imaging_Study_Series_Transducer_Type"
* status = #active
* experimental = false
* description = "ImagingStudy.series.extension.transducerType"
* code = #transducer-type
* base = #ImagingStudy
* type = #token
* expression = "ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-us').extension('transducerType').value"
* modifier[+] = #text
* modifier[+] = #not
* modifier[+] = #above
* modifier[+] = #below
* modifier[+] = #in
* modifier[+] = #not-in
* modifier[+] = #missing

Instance: mii-sp-bildgebung-imaging-study-series-transducer-frequency
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/SearchParameter/mii-sp-bildgebung-imaging-study-series-transducer-frequency"
* insert SP_Publisher
* insert Version
* insert Date
* name = "MII_SP_Bildgebung_Imaging_Study_Series_Transducer_Frequency"
* status = #active
* experimental = false
* description = "Suchparameter für ImagingStudy.series.extension.transducerFrequency"
* code = #transducer-frequency
* base = #ImagingStudy
* type = #quantity
* expression = "ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-us').extension('transducerFrequency').value"
* comparator[+] = #eq 
* comparator[+] = #gt 
* comparator[+] = #lt
* comparator[+] = #ge 
* comparator[+] = #le

Instance: mii-sp-bildgebung-imaging-study-series-pulse-frequency
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/SearchParameter/mii-sp-bildgebung-imaging-study-series-pulse-frequency"
* insert SP_Publisher
* insert Version
* insert Date
* name = "MII_SP_Bildgebung_Imaging_Study_Series_Pulse_Frequency"
* status = #active
* experimental = false
* description = "Suchparameter für ImagingStudy.series.extension.pulseRepetitionFrequency"
* code = #pulse-frequency
* base = #ImagingStudy
* type = #quantity
* expression = "ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-us').extension('pulseRepetitionFrequency').value"
* comparator[+] = #eq 
* comparator[+] = #gt 
* comparator[+] = #lt
* comparator[+] = #ge 
* comparator[+] = #le

Instance: mii-sp-bildgebung-imaging-study-series-ultrasound-color
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/SearchParameter/mii-sp-bildgebung-imaging-study-series-ultrasound-color"
* insert SP_Publisher
* insert Version
* insert Date
* name = "MII_SP_Bildgebung_Imaging_Study_Series_Ultrasound_Color"
* status = #active
* experimental = false
* description = "ImagingStudy.series.extension.ultrasoundPresent"
* code = #ultrasound-color
* base = #ImagingStudy
* type = #token
* expression = "ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-modalitaet-us').extension('ultrasoundPresent').value"
* modifier[+] = #text
* modifier[+] = #not
* modifier[+] = #above
* modifier[+] = #below
* modifier[+] = #in
* modifier[+] = #not-in
* modifier[+] = #missing

Instance: mii-sp-bildgebung-imaging-study-series-contrast-bolus
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/SearchParameter/mii-sp-bildgebung-imaging-study-series-contrast-bolus"
* insert SP_Publisher
* insert Version
* insert Date
* name = "MII_SP_Bildgebung_Imaging_Study_Series_Contrast_Bolus"
* status = #active
* experimental = false
* description = "Suchparameter für ImagingStudy.series.extension.contrastBolus"
* code = #contrast-bolus
* base = #ImagingStudy
* type = #token
* expression = "ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-kontrastmittel').extension('contrastBolus').value"
* modifier[+] = #text
* modifier[+] = #not
* modifier[+] = #above
* modifier[+] = #below
* modifier[+] = #in
* modifier[+] = #not-in
* modifier[+] = #missing

Instance: mii-sp-bildgebung-imaging-study-series-contrast-bolus-details
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/SearchParameter/mii-sp-bildgebung-imaging-study-series-contrast-bolus-details"
* insert SP_Publisher
* insert Version
* insert Date
* name = "MII_SP_Bildgebung_Imaging_Study_Contrast_Bolus_Details"
* status = #active
* experimental = false
* description = "Suchparameter für ImagingStudy.series.extension.contrastBolusDetails"
* code = #contrast-bolus-details
* base = #ImagingStudy
* type = #reference
* expression = "ImagingStudy.series.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-kontrastmittel').extension('contrastBolusDetails').value"
* target[+] = #MedicationStatement
* target[+] = #MedicationAdministration

Instance: mii-sp-bildgebung-imaging-study-series-number
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/SearchParameter/mii-sp-bildgebung-imaging-study-series-number"
* insert SP_Publisher
* insert Version
* insert Date
* name = "MII_SP_Bildgebung_Imaging_Study_Series_Number"
* status = #active
* experimental = false
* description = "Suchparameter für ImagingStudy.series.number"
* code = #series-number
* base = #ImagingStudy
* type = #number
* expression = "ImagingStudy.series.number"
* comparator[+] = #eq 
* comparator[+] = #gt 
* comparator[+] = #lt
* comparator[+] = #ge 
* comparator[+] = #le

Instance: mii-sp-bildgebung-imaging-study-series-laterality
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/SearchParameter/mii-sp-bildgebung-imaging-study-series-laterality"
* insert SP_Publisher
* insert Version
* insert Date
* name = "MII_SP_Bildgebung_Imaging_Study_Series_Laterality"
* status = #active
* experimental = false
* description = "Suchparameter für ImagingStudy.series.laterality"
* code = #series-laterality
* base = #ImagingStudy
* type = #token
* expression = "ImagingStudy.series.laterality"
* modifier[+] = #text
* modifier[+] = #not
* modifier[+] = #above
* modifier[+] = #below
* modifier[+] = #in
* modifier[+] = #not-in
* modifier[+] = #missing

Instance: mii-sp-bildgebung-imaging-study-series-started
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/SearchParameter/mii-sp-bildgebung-imaging-study-series-started"
* insert SP_Publisher
* insert Version
* insert Date
* name = "MII_SP_Bildgebung_Imaging_Study_Series_Started"
* status = #active
* experimental = false
* description = "Suchparameter für ImagingStudy.series.started"
* code = #series-started
* base = #ImagingStudy
* type = #date
* expression = "ImagingStudy.series.started"

Instance: mii-sp-bildgebung-imaging-study-instance-pixel-x
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/SearchParameter/mii-sp-bildgebung-imaging-study-instance-pixel-spacing-x"
* insert SP_Publisher
* insert Version
* insert Date
* name = "MII_SP_Bildgebung_Imaging_Study_Instance_Pixel_Spacing_X"
* status = #active
* experimental = false
* description = "Suchparameter für ImagingStudy.series.instance.extension.pixelSpacingX"
* code = #instance-pixel-spacing-x
* base = #ImagingStudy
* type = #quantity
* expression = "ImagingStudy.series.instance.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-instanz-details').extension('pixelSpacingX').value"
* comparator[+] = #eq 
* comparator[+] = #gt 
* comparator[+] = #lt
* comparator[+] = #ge 
* comparator[+] = #le

Instance: mii-sp-bildgebung-imaging-study-instance-pixel-y
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/SearchParameter/mii-sp-bildgebung-imaging-study-instance-pixel-spacing-y"
* insert SP_Publisher
* insert Version
* insert Date
* name = "MII_SP_Bildgebung_Imaging_Study_Instance_Pixel_Spacing_Y"
* status = #active
* experimental = false
* description = "Suchparameter für ImagingStudy.series.instance.extension.pixelSpacingY"
* code = #instance-pixel-spacing-y
* base = #ImagingStudy
* type = #quantity
* expression = "ImagingStudy.series.instance.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-instanz-details').extension('pixelSpacingY').value"
* comparator[+] = #eq 
* comparator[+] = #gt 
* comparator[+] = #lt
* comparator[+] = #ge 
* comparator[+] = #le

Instance: mii-sp-bildgebung-imaging-study-instance-slice-thickness
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/SearchParameter/mii-sp-bildgebung-imaging-study-instance-slice-thickness"
* insert SP_Publisher
* insert Version
* insert Date
* name = "MII_SP_Bildgebung_Imaging_Study_Instance_Slice_Thickness"
* status = #active
* experimental = false
* description = "Suchparameter für ImagingStudy.series.instance.extension.sliceThickness"
* code = #instance-slice-thickness
* base = #ImagingStudy
* type = #quantity
* expression = "ImagingStudy.series.instance.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-instanz-details').extension('sliceThickness').value"
* comparator[+] = #eq 
* comparator[+] = #gt 
* comparator[+] = #lt
* comparator[+] = #ge 
* comparator[+] = #le

Instance: mii-sp-bildgebung-imaging-study-instance-image-type
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/SearchParameter/mii-sp-bildgebung-imaging-study-instance-image-type"
* insert SP_Publisher
* insert Version
* insert Date
* name = "MII_SP_Bildgebung_Imaging_Study_Instance_Image_Type"
* status = #active
* experimental = false
* description = "Suchparameter für ImagingStudy.series.instance.extension.imageType"
* code = #instance-image-type
* base = #ImagingStudy
* type = #token
* expression = "ImagingStudy.series.instance.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-instanz-details').extension('imageType').value"
* modifier[+] = #text
* modifier[+] = #not
* modifier[+] = #above
* modifier[+] = #below
* modifier[+] = #in
* modifier[+] = #not-in
* modifier[+] = #missing

Instance: mii-sp-bildgebung-imaging-study-instance-burned-in-annotation
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/SearchParameter/mii-sp-bildgebung-imaging-study-instance-burned-in-annotation"
* insert SP_Publisher
* insert Version
* insert Date
* name = "MII_SP_Bildgebung_Imaging_Study_Instance_Burned_In_Annotation"
* status = #active
* experimental = false
* description = "Suchparameter für ImagingStudy.series.instance.extension.burnedInAnnotation"
* code = #instance-burned-in-annotation
* base = #ImagingStudy
* type = #token
* expression = "ImagingStudy.series.instance.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-instanz-details').extension('burnedInAnnotation').value"
* modifier[+] = #text
* modifier[+] = #not
* modifier[+] = #above
* modifier[+] = #below
* modifier[+] = #in
* modifier[+] = #not-in
* modifier[+] = #missing

Instance: mii-sp-bildgebung-imaging-study-instance-number
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/SearchParameter/mii-sp-bildgebung-imaging-study-instance-number"
* insert SP_Publisher
* insert Version
* insert Date
* name = "MII_SP_Bildgebung_Imaging_Study_Instance_Number"
* status = #active
* experimental = false
* description = "Suchparameter für ImagingStudy.series.instance.number"
* code = #instance-number
* base = #ImagingStudy
* type = #number
* expression = "ImagingStudy.series.instance.number"
* comparator[+] = #eq 
* comparator[+] = #gt 
* comparator[+] = #lt
* comparator[+] = #ge 
* comparator[+] = #le

//Observation
Instance: mii-sp-bildgebung-observation-series-uid
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/SearchParameter/mii-sp-bildgebung-observation-series-uid"
* insert SP_Publisher
* insert Version
* insert Date
* name = "MII_SP_Bildgebung_Observation_Series_UID"
* status = #active
* experimental = false
* description = "Suchparameter für Observation.extension.seriesUID"
* code = #series-uid
* base = #Observation
* type = #token
* expression = "Observation.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-series-uid').value"
* modifier[+] = #text
* modifier[+] = #not
* modifier[+] = #above
* modifier[+] = #below
* modifier[+] = #in
* modifier[+] = #not-in
* modifier[+] = #missing

Instance: mii-sp-bildgebung-observation-sop-instance-uid
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/SearchParameter/mii-sp-bildgebung-observation-sop-instance-uid"
* insert SP_Publisher
* insert Version
* insert Date
* name = "MII_SP_Bildgebung_Observation_SOP_Instance_UID"
* status = #active
* experimental = false
* description = "Suchparameter für Observation.sopInstanceUID"
* code = #sop-instance-uid
* base = #Observation
* type = #token
* expression = "Observation.extension('https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-sop-instanz-uid').value"
* modifier[+] = #text
* modifier[+] = #not
* modifier[+] = #above
* modifier[+] = #below
* modifier[+] = #in
* modifier[+] = #not-in
* modifier[+] = #missing

Instance: mii-sp-bildgebung-observation-body-structure
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/SearchParameter/mii-sp-bildgebung-observation-body-structure"
* insert SP_Publisher
* insert Version
* insert Date
* name = "MII_SP_Bildgebung_Observation_Body_Structure"
* status = #active
* experimental = false
* description = "Suchparameter für Observation.bodyStructure"
* code = #body-structure
* base = #Observation
* type = #reference
* expression = "Observation.extension('http://hl7.org/fhir/5.0/StructureDefinition/extension-Observation.bodyStructure').value"
* target = #BodyStructure

//ReadProcedure
Instance: mii-sp-bildgebung-read-proc-report
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/SearchParameter/mii-sp-bildgebung-read-proc-report"
* insert SP_Publisher
* insert Version
* insert Date
* name = "MII_SP_Bildgebung_Read_Procedure_Report"
* status = #active
* experimental = false
* description = "Suchparameter für ReadProcedure.report"
* code = #report
* base = #Procedure
* type = #reference
* expression = "Procedure.report"
* target[+] = #DiagnosticReport
* target[+] = #Composition
* target[+] = #DocumentReference
