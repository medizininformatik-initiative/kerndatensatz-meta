Instance: mii-sp-meta-encounter-aufnahmegrund-ersteundzweitestelle
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_Encounter_Aufnahmegrund_ErsteUndZweiteStelle"
* status = #active
* experimental = false
* date = "2025-07-14"
* description = "Suchparameter für Encounter.extension:Aufnahmegrund.extension:ErsteUndZweiteStelle"
* code = #aufnahmegrund-ersteundzweitestelle
* base = #Encounter 
* type = #token
* expression = "Encounter.extension.where(url = 'http://fhir.de/StructureDefinition/Aufnahmegrund').extension.where(url = 'ErsteUndZweiteStelle').value"

Instance: mii-sp-meta-encounter-aufnahmegrund-drittestelle
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_Encounter_Aufnahmegrund_DritteStelle"
* status = #active
* experimental = false
* date = "2025-07-14"
* description = "Suchparameter für Encounter.extension:Aufnahmegrund.extension:DritteStelle"
* code = #aufnahmegrund-drittestelle
* base = #Encounter 
* type = #token
* expression = "Encounter.extension.where(url = 'http://fhir.de/StructureDefinition/Aufnahmegrund').extension.where(url = 'DritteStelle').value"

Instance: mii-sp-meta-encounter-aufnahmegrund-viertestelle
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_Encounter_Aufnahmegrund_VierteStelle"
* status = #active
* experimental = false
* date = "2025-07-14"
* description = "Suchparameter für Encounter.extension:Aufnahmegrund.extension:VierteStelle"
* code = #aufnahmegrund-viertestelle
* base = #Encounter 
* type = #token
* expression = "Encounter.extension.where(url = 'http://fhir.de/StructureDefinition/Aufnahmegrund').extension.where(url = 'VierteStelle').value"