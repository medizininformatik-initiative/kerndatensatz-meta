Instance: mii-sp-meta-consent-provisiontype
InstanceOf: SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/modul-consent/SearchParameter/mii-sp-consent-provisiontype"
//* version = "1.0.7"
* insert Version
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_Consent_ProvisionType"
* status = #active
* date = "2024-10-07"
* description = "Suche im Typ der Provison (permit, deny)."
* code = #mii-provision-provision-type
* base = #Consent
* type = #token
* expression = "Consent.provision.provision.type"
* multipleOr = true
* multipleAnd = true