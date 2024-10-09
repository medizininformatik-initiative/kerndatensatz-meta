Instance: mii-sp-meta-consent-provisionperiod
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/modul-consent/SearchParameter/mii-sp-consent-provisionperiod"
// * version = "1.0.7"
* insert Version
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_Consent_ProvisionPeriod"
* status = #active
* date = "2024-10-07"
* description = "Suche im Zeitraum der Provision. Dieser Suchparameter bezieht sich explizit auf die zweite Verschachtelungsebene von provison."
* code = #mii-provision-provision-period
* base = #Consent
* type = #date
* expression = "Consent.provision.provision.period"
* multipleOr = true
* multipleAnd = true