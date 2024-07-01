Instance: DocumentReference-title
InstanceOf: SearchParameter
Usage: #definition
* url = "https://www.medizininformatik-initiative.de/fhir/modul-studie/SearchParameter/DocumentReference-title"
* version = "1.0.0-ballot"
* name = "SP_MII_Studie_Title"
* status = #active
* description = "Suchparameter für DocumentReference.content.attachment.title"
* experimental = false
* code = #title
* base = #DocumentReference
* type = #string
* expression = "DocumentReference.content.attachment.title"

Instance: DocumentReference-size
InstanceOf: SearchParameter
Usage: #definition
* url = "https://www.medizininformatik-initiative.de/fhir/modul-studie/SearchParameter/DocumentReference-size"
* version = "1.0.0-ballot"
* name = "SP_MII_Studie_Size"
* status = #active
* description = "Suchparameter für DocumentReference.content.attachment.size"
* experimental = false
* code = #size
* base = #DocumentReference
* type = #number
* expression = "DocumentReference.content.attachment.size"

Instance: EvidenceVariable-characteristic-description
InstanceOf: SearchParameter
Usage: #definition
* url = "https://www.medizininformatik-initiative.de/fhir/modul-studie/SearchParameter/ResearchStudy-characteristic-description"
* version = "1.0.0-ballot"
* name = "SP_MII_Studie_CharacteristicDescription"
* status = #active
* description = "Suchparameter für ResearchStudy.characteristic.description"
* experimental = false
* code = #characteristicDescription
* base = #EvidenceVariable
* type = #string
* expression = "ResearchStudy.characteristic.description"

Instance: Library-quellregister
InstanceOf: SearchParameter
Usage: #definition
* url = "https://www.medizininformatik-initiative.de/fhir/modul-studie/SearchParameter/Library-quellregister"
* version = "1.0.0-ballot"
* name = "SP_MII_Studie_Quellregister"
* status = #active
* description = "Suchparameter für Library.extension:QuellRegister"
* experimental = false
* code = #quellregister
* base = #Library
* type = #token
* expression = "Library.extension.where(url='https://www.medizininformatik-initiative.de/fhir/modul-studie/StructureDefinition/mii-ex-studie-quell-register').value"

Instance: Library-relatedArtifactUrl
InstanceOf: SearchParameter
Usage: #definition
* url = "https://www.medizininformatik-initiative.de/fhir/modul-studie/SearchParameter/Library-relatedArtifactUrl"
* version = "1.0.0-ballot"
* name = "SP_MII_Studie_RelatedArtifactUrl"
* status = #active
* description = "Suchparameter für Library.relatedArtifact.document.url"
* experimental = false
* code = #relatedArtifactUrl
* base = #Library
* type = #uri
* expression = "Library.relatedArtifact.document.url"

Instance: ResearchStudy-armName
InstanceOf: SearchParameter
Usage: #definition
* url = "https://www.medizininformatik-initiative.de/fhir/modul-studie/SearchParameter/ResearchStudy-armName"
* version = "1.0.0-ballot"
* name = "SP_MII_Studie_ArmName"
* status = #active
* description = "Suchparameter für ResearchStudy.arm.name"
* experimental = false
* code = #armName
* base = #ResearchStudy
* type = #string
* expression = "ResearchStudy.arm.name"

Instance: ResearchStudy-label
InstanceOf: SearchParameter
Usage: #definition
* url = "https://www.medizininformatik-initiative.de/fhir/modul-studie/SearchParameter/ResearchStudy-label"
* version = "1.0.0-ballot"
* name = "SP_MII_Studie_Label"
* status = #active
* description = "Suchparameter für ResearchStudy.extension:label"
* experimental = false
* code = #label
* base = #ResearchStudy
* type = #string
* expression = "ResearchStudy.extension.where(url='http://hl7.org/fhir/5.0/StructureDefinition/extension-ResearchStudy.label').extension.where(url='value').value"

Instance: ResearchStudy-akronym
InstanceOf: SearchParameter
Usage: #definition
* url = "https://www.medizininformatik-initiative.de/fhir/modul-studie/SearchParameter/ResearchStudy-akronym"
* version = "1.0.0-ballot"
* name = "SP_MII_Studie_Akronym"
* status = #active
* description = "Suchparameter für ResearchStudy.extension:Akronym"
* experimental = false
* code = #akronym
* base = #ResearchStudy
* type = #string
* expression = "ResearchStudy.extension.where(url='https://www.medizininformatik-initiative.de/fhir/modul-studie/StructureDefinition/mii-ex-studie-akronym').value"

Instance: ResearchStudy-finanzierung
InstanceOf: SearchParameter
Usage: #definition
* url = "https://www.medizininformatik-initiative.de/fhir/modul-studie/SearchParameter/ResearchStudy-finanzierung"
* version = "1.0.0-ballot"
* name = "SP_MII_Studie_Finanzierung"
* status = #active
* description = "Suchparameter für ResearchStudy.extension:Finanzierung"
* experimental = false
* code = #finanzierung
* base = #ResearchStudy
* type = #string
* expression = "ResearchStudy.extension.where(url='https://www.medizininformatik-initiative.de/fhir/modul-studie/StructureDefinition/mii-ex-studie-finanzierung').value"

Instance: ResearchStudy-studienregister
InstanceOf: SearchParameter
Usage: #definition
* url = "https://www.medizininformatik-initiative.de/fhir/modul-studie/SearchParameter/ResearchStudy-studienregister"
* version = "1.0.0-ballot"
* name = "SP_MII_Studie_Studienregister"
* status = #active
* description = "Suchparameter für ResearchStudy.extension:Studienregister"
* experimental = false
* code = #studienregister
* base = #ResearchStudy
* type = #reference
* expression = "ResearchStudy.extension.where(url='https://www.medizininformatik-initiative.de/fhir/modul-studie/StructureDefinition/mii-ex-studie-studienregister').value"

Instance: ResearchStudy-rekrutierungsstand-datum
InstanceOf: SearchParameter
Usage: #definition
* url = "https://www.medizininformatik-initiative.de/fhir/modul-studie/SearchParameter/ResearchStudy-rekrutierungsstand-datum"
* version = "1.0.0-ballot"
* name = "SP_MII_Studie_RekrutierungsstandDatum"
* status = #active
* description = "Suchparameter für ResearchStudy.extension:Rekrutierung.extension:rekrutierungsstand-datum"
* experimental = false
* code = #rekrutierungsstand-datum
* base = #ResearchStudy
* type = #date
* expression = "ResearchStudy.extension.where(url='https://www.medizininformatik-initiative.de/fhir/modul-studie/StructureDefinition/mii-ex-studie-rekrutierung').extension.where(url='rekrutierungsstand-datum').value"

Instance: ResearchStudy-rekrutierungsstand-genauigkeit
InstanceOf: SearchParameter
Usage: #definition
* url = "https://www.medizininformatik-initiative.de/fhir/modul-studie/SearchParameter/ResearchStudy-rekrutierungsstand-genauigkeit"
* version = "1.0.0-ballot"
* name = "SP_MII_Studie_RekrutierungsstandGenauigkeit"
* status = #active
* description = "Suchparameter für ResearchStudy.extension:Rekrutierung.extension:rekrutierungsstand-genauigkeit"
* experimental = false
* code = #rekrutierungsstand-genauigkeit
* base = #ResearchStudy
* type = #string
* expression = "ResearchStudy.extension.where(url='https://www.medizininformatik-initiative.de/fhir/modul-studie/StructureDefinition/mii-ex-studie-rekrutierung').extension.where(url='rekrutierungsstand-genauigkeit').value"

Instance: ResearchStudy-rekrutierungsstand
InstanceOf: SearchParameter
Usage: #definition
* url = "https://www.medizininformatik-initiative.de/fhir/modul-studie/SearchParameter/ResearchStudy-rekrutierungsstand"
* version = "1.0.0-ballot"
* name = "SP_MII_Studie_Rekrutierungsstand"
* status = #active
* description = "Suchparameter für ResearchStudy.extension:Rekrutierung.extension:rekrutierungsstand"
* experimental = false
* code = #rekrutierungsstand
* base = #ResearchStudy
* type = #number
* expression = "ResearchStudy.extension.where(url='https://www.medizininformatik-initiative.de/fhir/modul-studie/StructureDefinition/mii-ex-studie-rekrutierung').extension.where(url='rekrutierungsstand').value"

Instance: ResearchStudy-rekrutierungsziel
InstanceOf: SearchParameter
Usage: #definition
* url = "https://www.medizininformatik-initiative.de/fhir/modul-studie/SearchParameter/ResearchStudy-rekrutierungsziel"
* version = "1.0.0-ballot"
* name = "SP_MII_Studie_Rekrutierungsziel"
* status = #active
* description = "Suchparameter für ResearchStudy.extension:Rekrutierung.extension:rekrutierungsziel"
* experimental = false
* code = #rekrutierungsziel
* base = #ResearchStudy
* type = #number
* expression = "ResearchStudy.extension.where(url='https://www.medizininformatik-initiative.de/fhir/modul-studie/StructureDefinition/mii-ex-studie-rekrutierung').extension.where(url='rekrutierungsziel').value"

Instance: ResearchStudy-rekrutierungsstart
InstanceOf: SearchParameter
Usage: #definition
* url = "https://www.medizininformatik-initiative.de/fhir/modul-studie/SearchParameter/ResearchStudy-rekrutierungsstart"
* version = "1.0.0-ballot"
* name = "SP_MII_Studie_Rekrutierungsstart"
* status = #active
* description = "Suchparameter für ResearchStudy.extension:Rekrutierung.extension:rekrutierungsstart"
* experimental = false
* code = #rekrutierungsstart
* base = #ResearchStudy
* type = #date
* expression = "ResearchStudy.extension.where(url='https://www.medizininformatik-initiative.de/fhir/modul-studie/StructureDefinition/mii-ex-studie-rekrutierung').extension.where(url='rekrutierungsstart').value"