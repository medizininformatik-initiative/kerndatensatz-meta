//----------------------------------------
// SearchParameters for Specimen
//----------------------------------------
Instance: mii-sp-patho-request
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert Version
* name = "MII_SP_Patho_Request"
* description = "SearchParameter for Specimen.request"
* status = #active
* code = #request
* base = #Specimen
* type = #reference
* expression = "Specimen.request"

Instance: mii-sp-patho-collection-method
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert Version
* name = "MII_SP_Patho_Collection_Method"
* description = "SearchParameter for Specimen.collection.method"
* status = #active 
* code = #collection-method
* base = #Specimen 
* type = #token
* expression = "Specimen.collection.method"

Instance: mii-sp-patho-collection-body-site
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert Version
* name = "MII_SP_Patho_Collection_Body_Site"
* description = "SearchParameter for Specimen.collection.bodySite"
* status = #active
* code = #collection-body-site
* base = #Specimen
* type = #token
* expression = "Specimen.collection.bodySite"

Instance: mii-sp-patho-processing-procedure
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert Version
* name = "MII_SP_Patho_Processing_Procedure"
* description = "SearchParameter for Specimen.processing.procedure"
* status = #active
* code = #processing-procedure
* base = #Specimen
* type = #token
* expression = "Specimen.processing.procedure"

Instance: mii-sp-patho-processing-additive
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert Version
* name = "MII_SP_Patho_Processing_Additive"
* description = "SearchParameter for Specimen.processing.additive"
* status = #active
* code = #processing-additive
* base = #Specimen
* type = #reference
* expression = "Specimen.processing.additive as Reference"

Instance: mii-sp-patho-processing-date
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert Version
* name = "MII_SP_Patho_Processing_Date"
* description = "SearchParameter for Specimen.processing.time"
* status = #active
* code = #processing-date
* base = #Specimen
* type = #date
* expression = "Specimen.processing.time"

Instance: mii-sp-patho-container-additive
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert Version
* name = "MII_SP_Patho_Container_Additive"
* description = "SearchParameter for Specimen.container.additive"
* status = #active
* code = #container-additive
* base = #Specimen
* type = #reference
* expression = "Specimen.container.additive as Reference"

//-----------------------------------------
// SearchParameters for Observation
//-----------------------------------------
Instance: mii-sp-patho-body-site
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert Version
* name = "MII_SP_Patho_Body_Site"
* description = "SearchParameter for Observation.bodySite"
* status = #active
* code = #body-site
* base = #Observation
* type = #token
* expression = "Observation.bodySite"

Instance: mii-sp-patho-value-ratio
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert Version
* name = "MII_SP_Patho_Value_Ratio"
* description = "SearchParameter for Observation.valueRatio"
* status = #active
* code = #value-ratio
* base = #Observation
* type = #composite
* expression = "Observation.value.ofType(Ratio)"
* component[0].definition = "https://www.medizininformatik-initiative.de/fhir/ext/modul-patho/SearchParameter/mii-sp-patho-value-ratio-numerator"
* component[=].expression = "numerator"
* component[+].definition = "https://www.medizininformatik-initiative.de/fhir/ext/modul-patho/SearchParameter/mii-sp-patho-value-ratio-denominator"
* component[=].expression = "denominator"

Instance: mii-sp-patho-value-ratio-numerator
InstanceOf: SearchParameter
Usage: #definition
* url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-patho/SearchParameter/mii-sp-patho-value-ratio-numerator"
* insert SP_Publisher
* insert Version
* name = "MII_SP_Patho_Value_Ratio_Numerator"
* status = #active
* experimental = false
* description = "SearchParameter for Observation.valueRatio.numerator"
* code = #value-ratio-numerator
* base = #Observation
* type = #quantity
* expression = "Observation.value.ofType(Ratio).numerator"

Instance: mii-sp-patho-value-ratio-denominator
InstanceOf: SearchParameter
Usage: #definition
* url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-patho/SearchParameter/mii-sp-patho-value-ratio-denominator"
* insert SP_Publisher
* insert Version
* name = "MII_SP_Patho_Value_Ratio_Denominator"
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
Instance: mii-sp-patho-reason-code
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert Version
* name = "MII_SP_Patho_Reason_Code"
* description = "SearchParameter for ServiceRequest.reasonCode"
* status = #active
* code = #reason-code
* base = #ServiceRequest
* type = #token
* expression = "ServiceRequest.reasonCode"

Instance: mii-sp-patho-supporting-info
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert Version
* name = "MII_SP_Patho_Reason_Code"
* description = "SearchParameter for ServiceRequest.supportingInfo"
* status = #active
* code = #supporting-info
* base = #ServiceRequest
* type = #reference
* expression = "ServiceRequest.supportingInfo"

//-----------------------------------------
// SearchParameters for DiagnosticReport
//-----------------------------------------
Instance: mii-sp-patho-imaging-study
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert Version
* name = "MII_SP_Patho_Imaging_Study"
* description = "SearchParameter for DiagnosticReport.imagingStudy"
* status = #active
* code = #imaging-study
* base = #DiagnosticReport
* type = #reference
* expression = "DiagnosticReport.imagingStudy"

//-----------------------------------------
// SearchParameters for Composition
//-----------------------------------------
Instance: mii-sp-patho-attester-mode
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert Version
* name = "MII_SP_Patho_Attester_Mode"
* code = #attester-mode
* description = "SearchParameter for Composition.attester.mode"
* status = #active
* base = #Composition
* type = #token
* expression = "Composition.attester.mode"

Instance: mii-sp-patho-custodian
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert Version
* name = "MII_SP_Patho_Custodian"
* description = "SearchParameter for Composition.custodian"
* status = #active
* code = #custodian
* base = #Composition
* type = #reference
* expression = "Composition.custodian"

Instance: mii-sp-patho-relates-to-code
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert Version
* name = "MII_SP_Patho_Relates_To_Code"
* description = "SearchParameter for Composition.relatesTo.code"
* status = #active
* code = #relates-to-code
* base = #Composition
* type = #token
* expression = "Composition.relatesTo.code"

//-----------------------------------------
// SearchParameters for Media
//-----------------------------------------
Instance: mii-sp-patho-part-of
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert Version
* name = "MII_SP_Patho_Part_Of"
* code = #part-of
* description = "SearchParameter for Media.partOf"
* status = #active
* base = #Media
* type = #reference
* expression = "Media.partOf"