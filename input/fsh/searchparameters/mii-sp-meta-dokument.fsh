Instance: mii-sp-meta-dokument-documentreference-attachment-creation
InstanceOf: MII_PR_Meta_SearchParameter
Usage: #definition
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
//* url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-dokument/SearchParameter/DocumentReference-creation"
* name = "MII_SP_Meta_DocumentReference_Attachment_Creation"
* status = #active
* description = "Suchparameter für DocumentReference.content.attachment.creation"
* experimental = false
* date = "2025-06-23"
* code = #creation
* base = #DocumentReference
* type = #date
* expression = "DocumentReference.content.attachment.creation"

Instance: mii-sp-meta-dokument-documentreference-doc-status
InstanceOf: MII_PR_Meta_SearchParameter
Usage: #definition
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
//* url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-dokument/SearchParameter/DocumentReference-doc-status"
* name = "MII_SP_Meta_DocumentReference_Document_Status"
* status = #active
* description = "Suchparameter für DocumentReference.docStatus"
* experimental = false
* date = "2025-06-23"
* code = #doc-status
* base = #DocumentReference
* type = #token
* expression = "DocumentReference.docStatus"

Instance: mii-sp-meta-dokument-documentreference-nlp-processing-status
InstanceOf: MII_PR_Meta_SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-dokument/SearchParameter/DocumentReference-nlp-processing-status"
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_DocumentReference_NLP_Processing_Status"
* status = #active
* description = "Suchparameter für DocumentReference.extension[nlp-processing-status].valueCodeableConcept"
* experimental = false
* date = "2025-06-23"
* code = #nlp-processing-status
* base = #DocumentReference
* type = #token
* expression = "DocumentReference.extension.where(url='https://www.medizininformatik-initiative.de/fhir/ext/modul-dokument/StructureDefinition/mii-ex-dokument-nlp-processing-status').valueCodeableConcept"