Instance: mii-sp-meta-consent-provisioncodetype
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/modul-consent/SearchParameter/mii-sp-consent-provisioncodetype"
// * version = "1.0.7"
* insert Version
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_Consent_ProvisionCodeType"
* status = #active
* date = "2024-10-07"
* description = "Composite-Suche nach Typ (type) einer bestimmten, durch einen Code definierten, Provision."
* code = #mii-provision-provision-code-type
* base = #Consent
* type = #composite
* expression = "Consent.provision.provision"
* component[0].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-consent-provisioncode"
* component[=].expression = "code"
* component[+].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-consent-provisiontype"
* component[=].expression = "type"