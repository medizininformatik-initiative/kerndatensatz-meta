Instance: mii-sp-meta-consent-provisioncode
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/modul-consent/SearchParameter/mii-sp-consent-provisioncode"
// * version = "1.0.7"
* insert Version
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_Consent_ProvisionCode"
* status = #active
* date = "2024-10-07"
* description = "Suche im Code der Provison"
* code = #mii-provision-provision-code
* base = #Consent
* type = #token
* expression = "Consent.provision.provision.code"
* multipleOr = true
* multipleAnd = true