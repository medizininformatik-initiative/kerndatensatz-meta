Instance: mii-sp-meta-consent-policyuri
InstanceOf: SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/modul-consent/SearchParameter/mii-sp-consent-policyuri"
//* version = "1.0.7"
* insert Version
* insert SP_Publisher
* insert SP_Profile
* insert LicenseCodeableCCBY40Instance
* name = "MII_SP_Meta_Consent_PolicyUri"
* status = #active
* experimental = false
* date = "2024-10-17"
* description = "Suche in der Policy URI (versionsspezifische Policy / Broad Consent)"
* code = #mii-policy-uri
* base = #Consent
* type = #uri
* expression = "Consent.policy.uri"
* multipleOr = true
* multipleAnd = true