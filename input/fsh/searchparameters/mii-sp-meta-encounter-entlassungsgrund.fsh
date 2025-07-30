Instance: mii-sp-meta-encounter-entlassungsgrund-ersteundzweitestelle
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_Encounter_Entlassungsgrund_ErsteUndZweiteStelle"
* status = #active
* experimental = false
* date = "2025-07-21"
* description = "Suchparameter für Encounter.hospitalization.dischargeDisposition.extension:Entlassungsgrund.extension:ErsteUndZweiteStelle"
* code = #entlassungsgrund-ersteundzweitestelle
* base = #Encounter 
* type = #token
* expression = "Encounter.hospitalization.dischargeDisposition.extension.where(url = 'http://fhir.de/StructureDefinition/Entlassungsgrund').extension.where(url = 'ErsteUndZweiteStelle').value"

Instance: mii-sp-meta-encounter-entlassungsgrund-drittestelle
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_Encounter_Entlassungsgrund_DritteStelle"
* status = #active
* experimental = false
* date = "2025-07-21"
* description = "Suchparameter für Encounter.hospitalization.dischargeDisposition.extension:Entlassungsgrund.extension:DritteStelle"
* code = #entlassungsgrund-drittestelle
* base = #Encounter 
* type = #token
* expression = "Encounter.hospitalization.dischargeDisposition.extension.where(url = 'http://fhir.de/StructureDefinition/Entlassungsgrund').extension.where(url = 'DritteStelle').value"
