Instance: mii-sp-meta-devicemetric-source
InstanceOf: SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-icu/SearchParameter/devicemetric-source"
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_DeviceMetric_Source"
* status = #active
* experimental = false
* date = "2024-10-08"
* description = "Suchparameter für DeviceMetric.source"
* code = #source
* base = #DeviceMetric
* type = #reference
* expression = "DeviceMetric.source"