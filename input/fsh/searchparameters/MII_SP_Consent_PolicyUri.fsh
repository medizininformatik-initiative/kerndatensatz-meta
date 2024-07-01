Instance: mii-sp-consent-policyuri
InstanceOf: SearchParameter
Usage: #definition
* url = "https://www.medizininformatik-initiative.de/fhir/modul-consent/SearchParameter/mii-sp-consent-policyuri"
* version = "1.0.7"
* name = "MII_SP_Consent_PolicyUri"
* status = #active
* date = "2023-05-09"
* description = "Suche in der Policy URI (versionsspezifische Policy / Broad Consent)"
* code = #mii-policy-uri
* base = #Consent
* type = #uri
* expression = "Consent.policy.uri"
* multipleOr = true
* multipleAnd = true