Instance: mii-sp-meta-observation-referencerange
InstanceOf: SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-icu/SearchParameter/observation-referencerange"
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_Observation_ReferenceRange"
* status = #active
* experimental = false
* date = "2024-10-08"
* description = "Suchparameter für Observation.referenceRange"
* code = #reference-range
* base = #Observation
* type = #composite
* expression = "Observation.referenceRange | Observation.component.referenceRange"
* component[0].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-observation-referencerange-high"
* component[=].expression = "high"
* component[+].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-observation-referencerange-low"
* component[=].expression = "low"

Instance: mii-sp-meta-observation-referencerange-low
InstanceOf: SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-icu/SearchParameter/observation-referencerange-low"
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_Observation_ReferenceRange_Low"
* status = #active
* experimental = false
* date = "2024-10-08"
* description = "Suchparameter für Observation.referenceRange.low"
* code = #reference-range-low
* base = #Observation
* type = #quantity
* expression = "Observation.referenceRange.low | Observation.component.referenceRange.low"

Instance: mii-sp-meta-observation-referencerange-high
InstanceOf: SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-icu/SearchParameter/observation-referencerange-high"
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_Observation_ReferenceRange_High"
* status = #active
* experimental = false
* date = "2024-10-08"
* description = "Suchparameter für Observation.referenceRange.high"
* code = #reference-range-high
* base = #Observation
* type = #quantity
* expression = "Observation.referenceRange.high | Observation.component.referenceRange.high"