Instance: mii-sp-consent-provisioncode
InstanceOf: SearchParameter
Usage: #definition
* url = "https://www.medizininformatik-initiative.de/fhir/modul-consent/SearchParameter/mii-sp-consent-provisioncode"
* version = "1.0.7"
* name = "MII_SP_Consent_ProvisionCode"
* status = #active
* date = "2023-05-09"
* description = "Suche im Code der Provison"
* code = #mii-provision-provision-code
* base = #Consent
* type = #token
* expression = "Consent.provision.provision.code"
* multipleOr = true
* multipleAnd = true