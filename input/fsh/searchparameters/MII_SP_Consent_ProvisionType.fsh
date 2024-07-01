Instance: mii-sp-consent-provisiontype
InstanceOf: SearchParameter
Usage: #definition
* url = "https://www.medizininformatik-initiative.de/fhir/modul-consent/SearchParameter/mii-sp-consent-provisiontype"
* version = "1.0.7"
* name = "MII_SP_Consent_ProvisionType"
* status = #active
* date = "2023-05-09"
* description = "Suche im Typ der Provison (permit, deny)."
* code = #mii-provision-provision-type
* base = #Consent
* type = #token
* expression = "Consent.provision.provision.type"
* multipleOr = true
* multipleAnd = true