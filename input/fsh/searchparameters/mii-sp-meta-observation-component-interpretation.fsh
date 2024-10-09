Instance: mii-sp-meta-observation-component-interpretation
InstanceOf: SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-icu/SearchParameter/observation-component-interpretation"
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_Observation_Component_Interpretation"
* status = #active
* experimental = false
* date = "2024-10-08"
* description = "Suchparameter für Observation.component.interpretation"
* code = #component-interpretation
* base = #Observation
* type = #token
* expression = "Observation.component.interpretation"