RuleSet: AddBundleEntry(resource)
* entry[+].fullUrl = "https://www.medizininformatik-initiative.de/SearchParameter/{resource}"
* entry[=].resource = {resource}
* entry[=].request.method = #PUT
* entry[=].request.url = "SearchParameter/{resource}"

Instance: mii-meta-searchparam-bundle
InstanceOf: Bundle
* type = #transaction
* timestamp = "2024-06-19T15:49:00+01:00"
// Person
* insert AddBundleEntry(mii-sp-person-adresszusatz)
* insert AddBundleEntry(mii-sp-person-assignerpid)
* insert AddBundleEntry(mii-sp-person-consent)
* insert AddBundleEntry(mii-sp-person-gemeindeschluessel)
* insert AddBundleEntry(mii-sp-person-hausnummer)
* insert AddBundleEntry(mii-sp-person-otheramtlich)
* insert AddBundleEntry(mii-sp-person-postfach)
* insert AddBundleEntry(mii-sp-person-prefix)
* insert AddBundleEntry(mii-sp-person-prefixqualifier)
* insert AddBundleEntry(mii-sp-person-stadtteil)
* insert AddBundleEntry(mii-sp-person-strasse)
// Diagnose
* insert AddBundleEntry(mii-sp-diagnose-icd10gm-diagnosesicherheit)
* insert AddBundleEntry(mii-sp-diagnose-icd10gm-mehrfachcodierung)
* insert AddBundleEntry(mii-sp-diagnose-icd10gm-seitenlokalisation)
// Prozedur
* insert AddBundleEntry(mii-sp-prozedur-bodysite)
* insert AddBundleEntry(mii-sp-prozedur-dokumentationsdatum)
* insert AddBundleEntry(mii-sp-prozedur-durchfuehrungsabsicht)
// Fall
* insert AddBundleEntry(mii-sp-fall-encounter-diagnosis-use)
* insert AddBundleEntry(mii-sp-fall-encounter-hospitalization-admitsource)
* insert AddBundleEntry(mii-sp-fall-encounter-location-physical-type)
* insert AddBundleEntry(mii-sp-fall-encounter-servicetype)
// Medikation
* insert AddBundleEntry(mii-sp-medikation-medication-ingredient-strength-numerator)
* insert AddBundleEntry(mii-sp-medikation-medication-ingredient-strength-denominator)
* insert AddBundleEntry(mii-sp-medikation-medication-ingredient-strength)
* insert AddBundleEntry(mii-sp-medikation-medication-reasonreference)
* insert AddBundleEntry(mii-sp-medikation-dosage-site)
* insert AddBundleEntry(mii-sp-medikation-dosage-route)
* insert AddBundleEntry(mii-sp-medikation-dosage-doserange-low)
* insert AddBundleEntry(mii-sp-medikation-dosage-doserange-high)
* insert AddBundleEntry(mii-sp-medikation-dosage-doserange)
* insert AddBundleEntry(mii-sp-medikation-dosage-dosequantity)
* insert AddBundleEntry(mii-sp-medikation-dosage-rateratio-numerator)
* insert AddBundleEntry(mii-sp-medikation-dosage-rateratio-denominator)
* insert AddBundleEntry(mii-sp-medikation-dosage-rateratio)
* insert AddBundleEntry(mii-sp-medikation-dosage-raterange-low)
* insert AddBundleEntry(mii-sp-medikation-dosage-raterange-high)
* insert AddBundleEntry(mii-sp-medikation-dosage-raterange)
* insert AddBundleEntry(mii-sp-medikation-dosage-ratequantity)
* insert AddBundleEntry(mii-sp-medikation-list-mode)
// Consent
* insert AddBundleEntry(mii-sp-consent-policyuri)
* insert AddBundleEntry(mii-sp-consent-provisioncode)
* insert AddBundleEntry(mii-sp-consent-provisioncodeperiod)
* insert AddBundleEntry(mii-sp-consent-provisioncodetype)
* insert AddBundleEntry(mii-sp-consent-provisionperiod)
* insert AddBundleEntry(mii-sp-consent-provisiontype)
// Biobank
* insert AddBundleEntry(mii-sp-biobank-diagnose)
// Mikrobio
* insert AddBundleEntry(mii-sp-mikrobio-interpretation)
// MolGen
* insert AddBundleEntry(mii-sp-molgen-servicerequest-reasoncode)
* insert AddBundleEntry(mii-sp-molgen-servicerequest-reasonreference)
* insert AddBundleEntry(mii-sp-molgen-task-reasoncode)
* insert AddBundleEntry(mii-sp-molgen-task-reasonreference)
* insert AddBundleEntry(mii-sp-molgen-task-for)
* insert AddBundleEntry(mii-sp-molgen-familymemberhistory-reasoncode)
* insert AddBundleEntry(mii-sp-molgen-familymemberhistory-reasonreference)
// Patho
* insert AddBundleEntry(mii-sp-patho-request)
* insert AddBundleEntry(mii-sp-patho-collection-method)
* insert AddBundleEntry(mii-sp-patho-collection-body-site)
* insert AddBundleEntry(mii-sp-patho-processing-procedure)
* insert AddBundleEntry(mii-sp-patho-processing-additive)
* insert AddBundleEntry(mii-sp-patho-processing-date)
* insert AddBundleEntry(mii-sp-patho-container-additive)
* insert AddBundleEntry(mii-sp-patho-body-site)
* insert AddBundleEntry(mii-sp-patho-value-ratio)
* insert AddBundleEntry(mii-sp-patho-value-ratio-numerator)
* insert AddBundleEntry(mii-sp-patho-value-ratio-denominator)
* insert AddBundleEntry(mii-sp-patho-reason-code)
* insert AddBundleEntry(mii-sp-patho-supporting-info)
* insert AddBundleEntry(mii-sp-patho-imaging-study)
* insert AddBundleEntry(mii-sp-patho-attester-mode)
* insert AddBundleEntry(mii-sp-patho-custodian)
* insert AddBundleEntry(mii-sp-patho-relates-to-code)
* insert AddBundleEntry(mii-sp-patho-part-of)
