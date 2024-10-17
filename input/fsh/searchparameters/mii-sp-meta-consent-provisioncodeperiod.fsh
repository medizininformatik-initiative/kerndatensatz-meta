Instance: mii-sp-meta-consent-provisioncodeperiod
InstanceOf: SearchParameter
Usage: #definition
//* url = "https://www.medizininformatik-initiative.de/fhir/modul-consent/SearchParameter/mii-sp-consent-provisioncodeperiod"
//* version = "1.0.7"
* insert Version
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_Consent_ProvisionCodePeriod"
* status = #active
* experimental = false
* date = "2024-10-17"
* description = "Composite-Suche nach Zeitraum (period) einer bestimmten, durch einen Code definierten, Provision."
* code = #mii-provision-provision-code-period
* base = #Consent
* type = #composite
* expression = "Consent.provision.provision"
* component[0].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-consent-provisioncode"
* component[=].expression = "code"
* component[+].definition = "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-consent-provisionperiod"
* component[=].expression = "period"