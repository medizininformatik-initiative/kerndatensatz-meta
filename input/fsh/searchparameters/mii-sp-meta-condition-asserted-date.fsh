Instance: mii-sp-meta-condition-asserted-date
InstanceOf: SearchParameter
Usage: #definition
* insert Version
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_Condition_Asserted_Date"
* status = #active
* experimental = false
* date = "2026-08-25"
* description = "Suchparameter für Condition.extension:assertedDate (Standardextension http://hl7.org/fhir/StructureDefinition/condition-assertedDate)"
* code = #asserted-date
* base = #Condition
* type = #date
* expression = "Condition.extension.where(url = 'http://hl7.org/fhir/StructureDefinition/condition-assertedDate').value"
