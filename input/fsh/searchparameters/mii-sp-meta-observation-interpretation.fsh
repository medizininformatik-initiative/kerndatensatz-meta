Instance: mii-sp-meta-observation-interpretation
InstanceOf: SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-mikrobio/SearchParameter/Observation-interpretation"
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_Observation_Interpretation"
* status = #active
* experimental = false
* date = "2024-10-08"
* description = "Suchparameter für Observation.interpretation"
* code = #interpretation
* base = #Observation
* type = #token
* expression = "Observation.interpretation"