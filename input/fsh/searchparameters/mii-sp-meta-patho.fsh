//----------------------------------------
// SearchParameters for Specimen
//----------------------------------------
Instance: mii-sp-meta-specimen-request
InstanceOf: SearchParameter
Usage: #definition
* insert Version
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* date = "2024-10-08"
* name = "MII_SP_Meta_Specimen_Request"
* description = "SearchParameter for Specimen.request"
* experimental = false
* status = #active
* code = #request
* base = #Specimen
* type = #reference
* expression = "Specimen.request"

Instance: mii-sp-meta-specimen-collection-method
InstanceOf: SearchParameter
Usage: #definition
* insert Version
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* date = "2024-10-08"
* name = "MII_SP_Meta_Specimen_Collection_Method"
* description = "SearchParameter for Specimen.collection.method"
* experimental = false
* status = #active 
* code = #collection-method
* base = #Specimen 
* type = #token
* expression = "Specimen.collection.method"

Instance: mii-sp-meta-specimen-collection-body-site
InstanceOf: SearchParameter
Usage: #definition
* insert Version
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* date = "2024-10-08"
* name = "MII_SP_Meta_Specimen_Collection_Body_Site"
* description = "SearchParameter for Specimen.collection.bodySite"
* experimental = false
* status = #active
* code = #collection-body-site
* base = #Specimen
* type = #token
* expression = "Specimen.collection.bodySite"

Instance: mii-sp-meta-specimen-processing-procedure
InstanceOf: SearchParameter
Usage: #definition
* insert Version
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* date = "2024-10-08"
* name = "MII_SP_Meta_Specimen_Processing_Procedure"
* description = "SearchParameter for Specimen.processing.procedure"
* experimental = false
* status = #active
* code = #processing-procedure
* base = #Specimen
* type = #token
* expression = "Specimen.processing.procedure"

Instance: mii-sp-meta-specimen-processing-additive
InstanceOf: SearchParameter
Usage: #definition
* insert Version
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* date = "2024-10-08"
* name = "MII_SP_Meta_Specimen_Processing_Additive"
* description = "SearchParameter for Specimen.processing.additive"
* experimental = false
* status = #active
* code = #processing-additive
* base = #Specimen
* type = #reference
* expression = "Specimen.processing.additive.ofType(Reference)"

Instance: mii-sp-meta-specimen-processing-date
InstanceOf: SearchParameter
Usage: #definition
* insert Version
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* date = "2024-10-08"
* name = "MII_SP_Meta_Specimen_Processing_Date"
* description = "SearchParameter for Specimen.processing.time"
* experimental = false
* status = #active
* code = #processing-date
* base = #Specimen
* type = #date
* expression = "Specimen.processing.time.ofType(dateTime) | Specimen.processing.time.ofType(Period)"

Instance: mii-sp-meta-specimen-container-additive
InstanceOf: SearchParameter
Usage: #definition
* insert Version
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* date = "2024-10-08"
* name = "MII_SP_Meta_Specimen_Container_Additive"
* description = "SearchParameter for Specimen.container.additive"
* experimental = false
* status = #active
* code = #container-additive
* base = #Specimen
* type = #reference
* expression = "(Specimen.container.additive.ofType(Reference))"

//-----------------------------------------
// SearchParameters for Observation
//-----------------------------------------
Instance: mii-sp-meta-observation-bodysite
InstanceOf: SearchParameter
Usage: #definition
* insert Version
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* date = "2024-10-08"
* name = "MII_SP_Meta_Observation_BodySite"
* description = "SearchParameter for Observation.bodySite"
* experimental = false
* status = #active
* code = #body-site
* base = #Observation
* type = #token
* expression = "Observation.bodySite"

Instance: mii-sp-meta-observation-value-ratio
InstanceOf: SearchParameter
Usage: #definition
* insert Version
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* date = "2024-10-08"
* name = "MII_SP_Meta_Observation_Value_Ratio"
* description = "SearchParameter for Observation.valueRatio"
* experimental = false
* status = #active
* code = #value-ratio
* base = #Observation
* type = #composite
* expression = "Observation.value.ofType(Ratio)"
* component[0].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-observation-value-ratio-numerator"
* component[=].expression = "numerator"
* component[+].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-observation-value-ratio-denominator"
* component[=].expression = "denominator"

Instance: mii-sp-meta-observation-value-ratio-numerator
InstanceOf: SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-patho/SearchParameter/mii-sp-patho-value-ratio-numerator"
* insert Version
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* date = "2024-11-07"
* name = "MII_SP_Meta_Observation_Value_Ratio_Numerator"
* status = #active
* experimental = false
* description = "SearchParameter for Observation.valueRatio.numerator"
* code = #value-ratio-numerator
* base = #Observation
* type = #quantity
* expression = "Observation.value.ofType(Ratio).numerator"

Instance: mii-sp-meta-observation-value-ratio-denominator
InstanceOf: SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-patho/SearchParameter/mii-sp-patho-value-ratio-denominator"
* insert Version
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* date = "2024-10-08"
* name = "MII_SP_Meta_Observation_Value_Ratio_Denominator"
* status = #active
* experimental = false
* description = "SearchParameter for Observation.valueRatio.denominator"
* code = #value-ratio-denominator
* base = #Observation
* type = #quantity
* expression = "Observation.value.ofType(Ratio).denominator"

//-----------------------------------------
// SearchParameters for ServiceRequest
//-----------------------------------------
// Instance: mii-sp-patho-reason-code
// InstanceOf: SearchParameter
// Usage: #definition
// * insert Version
// * insert SP_Publisher
// * insert LicenseCodeableCCBY40Instance
// * insert SP_Profile
// * name = "MII_SP_Patho_Reason_Code"
// * description = "SearchParameter for ServiceRequest.reasonCode"
// * status = #active
// * code = #reason-code
// * base = #ServiceRequest
// * type = #token
// * expression = "ServiceRequest.reasonCode"

Instance: mii-sp-meta-servicerequest-supportinginfo
InstanceOf: SearchParameter
Usage: #definition
* insert Version
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* date = "2024-10-08"
* name = "MII_SP_Meta_ServiceRequest_SupportingInfo"
* description = "SearchParameter for ServiceRequest.supportingInfo"
* experimental = false
* status = #active
* code = #supporting-info
* base = #ServiceRequest
* type = #reference
* expression = "ServiceRequest.supportingInfo"

//-----------------------------------------
// SearchParameters for DiagnosticReport
//-----------------------------------------
Instance: mii-sp-meta-diagnosticreport-imagingstudy
InstanceOf: SearchParameter
Usage: #definition
* insert Version
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* date = "2024-10-08"
* name = "MII_SP_Meta_DiagnosticReport_ImagingStudy"
* description = "SearchParameter for DiagnosticReport.imagingStudy"
* experimental = false
* status = #active
* code = #imaging-study
* base = #DiagnosticReport
* type = #reference
* expression = "DiagnosticReport.imagingStudy"

//-----------------------------------------
// SearchParameters for Composition
//-----------------------------------------
Instance: mii-sp-meta-composition-attester-mode
InstanceOf: SearchParameter
Usage: #definition
* insert Version
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* date = "2024-10-08"
* name = "MII_SP_Meta_Composition_Attester_Mode"
* code = #attester-mode
* description = "SearchParameter for Composition.attester.mode"
* experimental = false
* status = #active
* base = #Composition
* type = #token
* expression = "Composition.attester.mode"

Instance: mii-sp-meta-composition-custodian
InstanceOf: SearchParameter
Usage: #definition
* insert Version
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* date = "2024-10-08"
* name = "MII_SP_Meta_Composition_Custodian"
* description = "SearchParameter for Composition.custodian"
* experimental = false
* status = #active
* code = #custodian
* base = #Composition
* type = #reference
* expression = "Composition.custodian"

Instance: mii-sp-meta-composition-relatesto-code
InstanceOf: SearchParameter
Usage: #definition
* insert Version
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* date = "2024-10-08"
* name = "MII_SP_Meta_Composition_RelatesTo_Code"
* description = "SearchParameter for Composition.relatesTo.code"
* experimental = false
* status = #active
* code = #relates-to-code
* base = #Composition
* type = #token
* expression = "Composition.relatesTo.code"

//-----------------------------------------
// SearchParameters for Media
//-----------------------------------------
Instance: mii-sp-meta-media-partof
InstanceOf: SearchParameter
Usage: #definition
* insert Version
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* date = "2024-10-08"
* name = "MII_SP_Meta_Media_PartOf"
* code = #part-of
* description = "SearchParameter for Media.partOf"
* experimental = false
* status = #active
* base = #Media
* type = #reference
* expression = "Media.partOf"