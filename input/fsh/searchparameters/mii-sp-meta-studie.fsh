Instance: mii-sp-meta-documentreference-attachment-title
InstanceOf: SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/modul-studie/SearchParameter/DocumentReference-title"
* insert Version
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_DocumentReference_Attachment_Title"
* status = #active
* description = "Suchparameter für DocumentReference.content.attachment.title"
* experimental = false
* date = "2024-10-17"
* code = #title
* base = #DocumentReference
* type = #string
* expression = "DocumentReference.content.attachment.title"

Instance: mii-sp-meta-documentreference-attachment-size
InstanceOf: SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/modul-studie/SearchParameter/DocumentReference-size"
* insert Version
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_DocumentReference_Attachment_Size"
* status = #active
* description = "Suchparameter für DocumentReference.content.attachment.size"
* experimental = false
* date = "2024-10-17"
* code = #size
* base = #DocumentReference
* type = #number
* expression = "DocumentReference.content.attachment.size"

Instance: mii-sp-meta-evidencevariable-characteristic-description
InstanceOf: SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/modul-studie/SearchParameter/ResearchStudy-characteristic-description"
* insert Version
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_EvidenceVariable_Characteristic_Description"
* status = #active
* description = "Suchparameter für EvidenceVariable.characteristic.description"
* experimental = false
* date = "2024-10-17"
* code = #characteristicDescription
* base = #EvidenceVariable
* type = #string
* expression = "EvidenceVariable.characteristic.description"

Instance: mii-sp-meta-library-quellregister
InstanceOf: SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/modul-studie/SearchParameter/Library-quellregister"
* insert Version
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_Library_Quellregister"
* status = #active
* description = "Suchparameter für Library.extension:QuellRegister"
* experimental = false
* date = "2024-10-17"
* code = #quellregister
* base = #Library
* type = #token
* expression = "Library.extension.where(url='https://www.medizininformatik-initiative.de/fhir/modul-studie/StructureDefinition/mii-ex-studie-quell-register').value"

Instance: mii-sp-meta-library-relatedartifact-url
InstanceOf: SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/modul-studie/SearchParameter/Library-relatedArtifactUrl"
* insert Version
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_Library_RelatedArtifact_Url"
* status = #active
* description = "Suchparameter für Library.relatedArtifact.document.url"
* experimental = false
* date = "2024-10-17"
* code = #relatedArtifactUrl
* base = #Library
* type = #uri
* expression = "Library.relatedArtifact.document.url"

Instance: mii-sp-meta-researchstudy-arm-name
InstanceOf: SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/modul-studie/SearchParameter/ResearchStudy-armName"
* insert Version
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_ResearchStudy_Arm_Name"
* status = #active
* description = "Suchparameter für ResearchStudy.arm.name"
* experimental = false
* date = "2024-10-17"
* code = #armName
* base = #ResearchStudy
* type = #string
* expression = "ResearchStudy.arm.name"

Instance: mii-sp-meta-researchstudy-label
InstanceOf: SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/modul-studie/SearchParameter/ResearchStudy-label"
* insert Version
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_ResearchStudy_Label"
* status = #active
* description = "Suchparameter für ResearchStudy.extension:label"
* experimental = false
* date = "2024-10-17"
* code = #label
* base = #ResearchStudy
* type = #string
* expression = "ResearchStudy.extension.where(url='http://hl7.org/fhir/5.0/StructureDefinition/extension-ResearchStudy.label').extension.where(url='value').value"

Instance: mii-sp-meta-researchstudy-akronym
InstanceOf: SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/modul-studie/SearchParameter/ResearchStudy-akronym"
* insert Version
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_ResearchStudy_Akronym"
* status = #active
* description = "Suchparameter für ResearchStudy.extension:Akronym"
* experimental = false
* date = "2024-10-17"
* code = #akronym
* base = #ResearchStudy
* type = #string
* expression = "ResearchStudy.extension.where(url='https://www.medizininformatik-initiative.de/fhir/modul-studie/StructureDefinition/mii-ex-studie-akronym').value"

Instance: mii-sp-meta-researchstudy-finanzierung
InstanceOf: SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/modul-studie/SearchParameter/ResearchStudy-finanzierung"
* insert Version
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_ResearchStudy_Finanzierung"
* status = #active
* description = "Suchparameter für ResearchStudy.extension:Finanzierung"
* experimental = false
* date = "2024-10-17"
* code = #finanzierung
* base = #ResearchStudy
* type = #string
* expression = "ResearchStudy.extension.where(url='https://www.medizininformatik-initiative.de/fhir/modul-studie/StructureDefinition/mii-ex-studie-finanzierung').value"

Instance: mii-sp-meta-researchstudy-studienregister
InstanceOf: SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/modul-studie/SearchParameter/ResearchStudy-studienregister"
* insert Version
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_ResearchStudy_Studienregister"
* status = #active
* description = "Suchparameter für ResearchStudy.extension:Studienregister"
* experimental = false
* date = "2024-10-17"
* code = #studienregister
* base = #ResearchStudy
* type = #reference
* expression = "ResearchStudy.extension.where(url='https://www.medizininformatik-initiative.de/fhir/modul-studie/StructureDefinition/mii-ex-studie-studienregister').value"

Instance: mii-sp-meta-researchstudy-rekrutierungsstand-datum
InstanceOf: SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/modul-studie/SearchParameter/ResearchStudy-rekrutierungsstand-datum"
* insert Version
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_ResearchStudy_RekrutierungsstandDatum"
* status = #active
* description = "Suchparameter für ResearchStudy.extension:Rekrutierung.extension:rekrutierungsstand-datum"
* experimental = false
* date = "2024-10-17"
* code = #rekrutierungsstand-datum
* base = #ResearchStudy
* type = #date
* expression = "ResearchStudy.extension.where(url='https://www.medizininformatik-initiative.de/fhir/modul-studie/StructureDefinition/mii-ex-studie-rekrutierung').extension.where(url='rekrutierungsstand-datum').value"

Instance: mii-sp-meta-researchstudy-rekrutierungsstand-genauigkeit
InstanceOf: SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/modul-studie/SearchParameter/ResearchStudy-rekrutierungsstand-genauigkeit"
* insert Version
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_ResearchStudy_RekrutierungsstandGenauigkeit"
* status = #active
* description = "Suchparameter für ResearchStudy.extension:Rekrutierung.extension:rekrutierungsstand-genauigkeit"
* experimental = false
* date = "2024-10-17"
* code = #rekrutierungsstand-genauigkeit
* base = #ResearchStudy
* type = #string
* expression = "ResearchStudy.extension.where(url='https://www.medizininformatik-initiative.de/fhir/modul-studie/StructureDefinition/mii-ex-studie-rekrutierung').extension.where(url='rekrutierungsstand-genauigkeit').value"

Instance: mii-sp-meta-researchstudy-rekrutierungsstand
InstanceOf: SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/modul-studie/SearchParameter/ResearchStudy-rekrutierungsstand"
* insert Version
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_ResearchStudy_Rekrutierungsstand"
* status = #active
* description = "Suchparameter für ResearchStudy.extension:Rekrutierung.extension:rekrutierungsstand"
* experimental = false
* date = "2024-10-17"
* code = #rekrutierungsstand
* base = #ResearchStudy
* type = #number
* expression = "ResearchStudy.extension.where(url='https://www.medizininformatik-initiative.de/fhir/modul-studie/StructureDefinition/mii-ex-studie-rekrutierung').extension.where(url='rekrutierungsstand').value"

Instance: mii-sp-meta-researchstudy-rekrutierungsziel
InstanceOf: SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/modul-studie/SearchParameter/ResearchStudy-rekrutierungsziel"
* insert Version
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_ResearchStudy_Rekrutierungsziel"
* status = #active
* description = "Suchparameter für ResearchStudy.extension:Rekrutierung.extension:rekrutierungsziel"
* experimental = false
* date = "2024-10-17"
* code = #rekrutierungsziel
* base = #ResearchStudy
* type = #number
* expression = "ResearchStudy.extension.where(url='https://www.medizininformatik-initiative.de/fhir/modul-studie/StructureDefinition/mii-ex-studie-rekrutierung').extension.where(url='rekrutierungsziel').value"

Instance: mii-sp-meta-researchstudy-rekrutierungsstart
InstanceOf: SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/modul-studie/SearchParameter/ResearchStudy-rekrutierungsstart"
* insert Version
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_ResearchStudy_Rekrutierungsstart"
* status = #active
* description = "Suchparameter für ResearchStudy.extension:Rekrutierung.extension:rekrutierungsstart"
* experimental = false
* date = "2024-10-17"
* code = #rekrutierungsstart
* base = #ResearchStudy
* type = #date
* expression = "ResearchStudy.extension.where(url='https://www.medizininformatik-initiative.de/fhir/modul-studie/StructureDefinition/mii-ex-studie-rekrutierung').extension.where(url='rekrutierungsstart').value"