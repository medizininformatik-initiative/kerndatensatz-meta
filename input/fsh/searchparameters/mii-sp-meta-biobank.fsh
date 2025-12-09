Instance: mii-sp-meta-organization-beschreibung
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile

* name = "MII_SP_Biobank_Organization_Beschreibung"
* status = #active
* experimental = false
* date = "2025-12-09"
* description = "Search Organization by the beschreibung extension (string)"
* code = #beschreibung
* base = #Organization
* type = #string
* expression = "Organization.extension.where(url='https://fhir.bbmri-eric.eu/fhir/StructureDefinition/miabis-organization-description-extension').value.as(string)"

Instance: mii-sp-meta-specimen-anzahl-aliquots
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile

* name = "MII_SP_Biobank_Specimen_Anzahl_Aliquots"
* status = #active
* experimental = false
* date = "2025-12-09"
* description = "Search specimens by the mii-ex-biobank-anzahl-aliquots extension (integer)"
* code = #anzahl-aliquots
* base = #Specimen
* type = #number
* expression = "Specimen.extension.where(url='https://www.medizininformatik-initiative.de/fhir/ext/modul-biobank/StructureDefinition/mii-ex-biobank-anzahl-aliquots').value.as(integer)"

Instance: mii-sp-meta-specimen-anzahl-passagen
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile

* name = "MII_SP_Biobank_Specimen_Anzahl_Passagen"
* status = #active
* experimental = false
* date = "2025-12-09"
* description = "Search specimens by the mii-ex-biobank-anzahl-passagen extension (integer)"
* code = #anzahl-passagen
* base = #Specimen
* type = #number
* expression = "Specimen.extension.where(url='https://www.medizininformatik-initiative.de/fhir/ext/modul-biobank/StructureDefinition/mii-ex-biobank-anzahl-passagen').value.as(integer)"

Instance: mii-sp-meta-specimen-container-capacity
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile

* name = "MII_SP_Biobank_Specimen_Container_Capacity"
* status = #active
* experimental = false
* date = "2025-12-09"
* description = "Search specimens by container capacity"
* code = #container-capacity
* base = #Specimen
* type = #quantity
* expression = "Specimen.container.capacity"

Instance: mii-sp-meta-specimen-container-specimen-quantity
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile

* name = "MII_SP_Biobank_Specimen_Container_Specimen_Quantity"
* status = #active
* experimental = false
* date = "2025-12-09"
* description = "Search specimens by container specimenQuantity"
* code = #container-specimen-quantity
* base = #Specimen
* type = #quantity
* expression = "Specimen.container.specimenQuantity"

Instance: mii-sp-meta-organization-collection-design
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile

* name = "MII_SP_Biobank_Organization_CollectionDesign"
* status = #active
* experimental = false
* date = "2025-12-09"
* description = "Search Organization by the collectionDesign extension (CodeableConcept)"
* code = #collection-design
* base = #Organization
* type = #token
* expression = "Organization.extension.where(url='https://fhir.bbmri-eric.eu/fhir/StructureDefinition/miabis-collection-design-extension').value.as(CodeableConcept)"

Instance: mii-sp-meta-specimen-einstellung-blutversorgung
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile

* name = "MII_SP_Biobank_Specimen_Einstellung_Blutversorgung"
* status = #active
* experimental = false
* date = "2025-12-09"
* description = "Search specimens by the EinstellungBlutversorgung extension (dateTime)"
* code = #einstellung-blutversorgung
* base = #Specimen
* type = #date
* expression = "Specimen.collection.extension.where(url='https://www.medizininformatik-initiative.de/fhir/ext/modul-biobank/StructureDefinition/EinstellungBlutversorgung').value.as(dateTime)"

Instance: mii-sp-meta-specimen-fasting-status
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile

* name = "MII_SP_Biobank_Specimen_Fasting_Status"
* status = #active
* experimental = false
* date = "2025-12-09"
* description = "Search specimens by fasting status (CodeableConcept only)"
* code = #fasting-status
* base = #Specimen
* type = #token
* expression = "Specimen.collection.fastingStatus.as(CodeableConcept)"

Instance: mii-sp-meta-specimen-gehoert-zu
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile

* name = "MII_SP_Biobank_Specimen_Gehoert_Zu"
* status = #active
* experimental = false
* date = "2025-12-09"
* description = "Search specimens by the VerwaltendeOrganisation extension (Reference)"
* code = #gehoert-zu
* base = #Specimen
* type = #reference
* expression = "Specimen.extension.where(url='https://www.medizininformatik-initiative.de/fhir/ext/modul-biobank/StructureDefinition/VerwaltendeOrganisation').value.as(Reference)"

Instance: mii-sp-meta-specimen-kulturprotokoll
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile

* name = "MII_SP_Biobank_Specimen_Kulturprotokoll"
* status = #active
* experimental = false
* date = "2025-12-09"
* description = "Search specimens by the mii-ex-biobank-kulturprotokoll extension (Reference)"
* code = #kulturprotokoll
* base = #Specimen
* type = #reference
* expression = "Specimen.extension.where(url='https://www.medizininformatik-initiative.de/fhir/ext/modul-biobank/StructureDefinition/mii-ex-biobank-kulturprotokoll').value.as(Reference)"

Instance: mii-sp-meta-specimen-art-der-modifikation
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile

* name = "MII_SP_Biobank_Specimen_Art_Der_Modifikation"
* status = #active
* experimental = false
* date = "2025-12-09"
* description = "Search specimens by artDerModifikation in the mii_ex_biobank_modifikationen extension (Coding)"
* code = #art-der-modifikation
* base = #Specimen
* type = #token
* expression = "Specimen.extension.where(url='https://www.medizininformatik-initiative.de/fhir/ext/modul-biobank/StructureDefinition/mii_ex_biobank_modifikationen').extension.where(url='artDerModifikation').value.as(Coding)"

Instance: mii-sp-meta-specimen-zielgen
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile

* name = "MII_SP_Biobank_Specimen_Zielgen"
* status = #active
* experimental = false
* date = "2025-12-09"
* description = "Search specimens by zielgen in the mii_ex_biobank_modifikationen extension (string)"
* code = #zielgen
* base = #Specimen
* type = #string
* expression = "Specimen.extension.where(url='https://www.medizininformatik-initiative.de/fhir/ext/modul-biobank/StructureDefinition/mii_ex_biobank_modifikationen').extension.where(url='zielgen').value"

Instance: mii-sp-meta-specimen-modifikationen
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile

* name = "MII_SP_Biobank_Specimen_Modifikationen"
* status = #active
* experimental = false
* date = "2025-12-09"
* description = "Composite search parameter for specimens based on artDerModifikation and zielgen in mii_ex_biobank_modifikationen extension"
* code = #modifikationen
* base = #Specimen
* type = #composite
* expression = "extension.where(url='https://www.medizininformatik-initiative.de/fhir/ext/modul-biobank/StructureDefinition/mii_ex_biobank_modifikationen')"
* component[+].definition = "https://www.medizininformatik-initiative.de/fhir/ext/modul-biobank/SearchParameter/mii-sp-meta-specimen-art-der-modifikation"
* component[=].expression = "extension.where(url='artDerModifikation').value"
* component[+].definition = "https://www.medizininformatik-initiative.de/fhir/ext/modul-biobank/SearchParameter/mii-sp-meta-specimen-zielgen"
* component[=].expression = "extension.where(url='zielgen').value"

Instance: mii-sp-meta-specimen-note
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile

* name = "MII_SP_Biobank_Specimen_Note"
* status = #active
* experimental = false
* date = "2025-12-09"
* description = "Search specimens by note text"
* code = #note
* base = #Specimen
* type = #string
* expression = "Specimen.note.text"

Instance: mii-sp-meta-specimen-probenebene
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile

* name = "MII_SP_Biobank_Specimen_bene"
* status = #active
* experimental = false
* date = "2025-12-09"
* description = "Search specimens by the mii-ex-biobank-ebene extension (Coding)"
* code = #probenebene
* base = #Specimen
* type = #token
* expression = "Specimen.extension.where(url='https://www.medizininformatik-initiative.de/fhir/ext/modul-biobank/StructureDefinition/mii-ex-biobank-ebene').value.as(Coding)"

Instance: mii-sp-meta-specimen-processing-temp
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile

* name = "MII_SP_Biobank_Specimen_Processing-Temp"
* status = #active
* experimental = false
* date = "2025-12-09"
* description = "Search specimens by the Temperaturbedingungen extension (Range)"
* code = #processing-temp
* base = #Specimen
* type = #quantity
* expression = "Specimen.processing.extension.where(url='https://www.medizininformatik-initiative.de/fhir/ext/modul-biobank/StructureDefinition/Temperaturbedingungen').value.as(Range)"

Instance: mii-sp-meta-organization-collection-setting
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile

* name = "MII_SP_Biobank_Organization_CollectionSetting"
* status = #active
* experimental = false
* date = "2025-12-09"
* description = "Search Organization by the collectionSetting extension (CodeableConcept)"
* code = #collection-setting
* base = #Organization
* type = #token
* expression = "Organization.extension.where(url='https://fhir.bbmri-eric.eu/fhir/StructureDefinition/miabis-sample-collection-setting-extension').value.as(CodeableConcept)"

Instance: mii-sp-meta-organization-contact-rolle
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile

* name = "MII_SP_Biobank_Organization_Contact_Rolle"
* status = #active
* experimental = false
* date = "2025-12-09"
* description = "Search Organization contacts by the rolle extension (CodeableConcept)"
* code = #contact-rolle
* base = #Organization
* type = #token
* expression = "Organization.contact.extension.where(url='https://www.medizininformatik-initiative.de/fhir/ext/modul-biobank/StructureDefinition/KontaktRolle').value.as(CodeableConcept)"
