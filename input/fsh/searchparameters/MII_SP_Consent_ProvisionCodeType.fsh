Instance: mii-sp-consent-provisioncodetype
InstanceOf: SearchParameter
Usage: #definition
* url = "https://www.medizininformatik-initiative.de/fhir/modul-consent/SearchParameter/mii-sp-consent-provisioncodetype"
* version = "1.0.7"
* name = "MII_SP_Consent_ProvisionCodeType"
* status = #active
* date = "2023-05-09"
* description = "Composite-Suche nach Typ (type) einer bestimmten, durch einen Code definierten, Provision."
* code = #mii-provision-provision-code-type
* base = #Consent
* type = #composite
* expression = "Consent.provision.provision"
* component[0].definition = "https://www.medizininformatik-initiative.de/fhir/modul-consent/SearchParameter/mii-sp-consent-provisioncode"
* component[=].expression = "code"
* component[+].definition = "https://www.medizininformatik-initiative.de/fhir/modul-consent/SearchParameter/mii-sp-consent-provisiontype"
* component[=].expression = "type"