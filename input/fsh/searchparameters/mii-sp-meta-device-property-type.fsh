Instance: mii-sp-meta-device-property-type
InstanceOf: SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-icu/SearchParameter/device-property-type"
* insert SP_Publisher
* insert Version
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_Device_Property_Type"
* status = #active
* experimental = false
* date = "2024-10-08"
* description = "Suchparameter für Device.property.type"
* code = #property-type
* base = #Device
* type = #token
* expression = "Device.property.type"