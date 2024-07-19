RuleSet: AddTransactionEntry(resource)
* entry[+].fullUrl = "https://www.medizininformatik-initiative.de/SearchParameter/{resource}"
* entry[=].resource = {resource}
* entry[=].request.method = #PUT
* entry[=].request.url = "SearchParameter/{resource}"

RuleSet: AddCollectionEntry(resource)
* entry[+].fullUrl = "https://www.medizininformatik-initiative.de/SearchParameter/{resource}"
* entry[=].resource = {resource}

Instance: mii-meta-searchparam-transaction-bundle
InstanceOf: Bundle
* type = #transaction
* timestamp = "2024-07-10T18:37:00+01:00"
// Person
* insert AddTransactionEntry(mii-sp-person-adresszusatz)
* insert AddTransactionEntry(mii-sp-person-assignerpid)
* insert AddTransactionEntry(mii-sp-person-consent)
* insert AddTransactionEntry(mii-sp-person-gemeindeschluessel)
* insert AddTransactionEntry(mii-sp-person-hausnummer)
* insert AddTransactionEntry(mii-sp-person-otheramtlich)
* insert AddTransactionEntry(mii-sp-person-postfach)
* insert AddTransactionEntry(mii-sp-person-prefix)
* insert AddTransactionEntry(mii-sp-person-prefixqualifier)
* insert AddTransactionEntry(mii-sp-person-stadtteil)
* insert AddTransactionEntry(mii-sp-person-strasse)
// Diagnose
* insert AddTransactionEntry(mii-sp-diagnose-icd10gm-diagnosesicherheit)
* insert AddTransactionEntry(mii-sp-diagnose-icd10gm-mehrfachcodierung)
* insert AddTransactionEntry(mii-sp-diagnose-icd10gm-seitenlokalisation)
// Prozedur
* insert AddTransactionEntry(mii-sp-prozedur-bodysite)
* insert AddTransactionEntry(mii-sp-prozedur-dokumentationsdatum)
* insert AddTransactionEntry(mii-sp-prozedur-durchfuehrungsabsicht)
// Fall
* insert AddTransactionEntry(mii-sp-fall-encounter-diagnosis-use)
* insert AddTransactionEntry(mii-sp-fall-encounter-hospitalization-admitsource)
* insert AddTransactionEntry(mii-sp-fall-encounter-location-physical-type)
* insert AddTransactionEntry(mii-sp-fall-encounter-servicetype)
// Medikation
* insert AddTransactionEntry(mii-sp-medikation-medication-ingredient-strength-numerator)
* insert AddTransactionEntry(mii-sp-medikation-medication-ingredient-strength-denominator)
* insert AddTransactionEntry(mii-sp-medikation-medication-ingredient-strength)
* insert AddTransactionEntry(mii-sp-medikation-medication-reasonreference)
* insert AddTransactionEntry(mii-sp-medikation-dosage-site)
* insert AddTransactionEntry(mii-sp-medikation-dosage-route)
* insert AddTransactionEntry(mii-sp-medikation-dosage-doserange-low)
* insert AddTransactionEntry(mii-sp-medikation-dosage-doserange-high)
* insert AddTransactionEntry(mii-sp-medikation-dosage-doserange)
* insert AddTransactionEntry(mii-sp-medikation-dosage-dosequantity)
* insert AddTransactionEntry(mii-sp-medikation-dosage-rateratio-numerator)
* insert AddTransactionEntry(mii-sp-medikation-dosage-rateratio-denominator)
* insert AddTransactionEntry(mii-sp-medikation-dosage-rateratio)
* insert AddTransactionEntry(mii-sp-medikation-dosage-raterange-low)
* insert AddTransactionEntry(mii-sp-medikation-dosage-raterange-high)
* insert AddTransactionEntry(mii-sp-medikation-dosage-raterange)
* insert AddTransactionEntry(mii-sp-medikation-dosage-ratequantity)
* insert AddTransactionEntry(mii-sp-medikation-list-mode)
// Consent
* insert AddTransactionEntry(mii-sp-consent-policyuri)
* insert AddTransactionEntry(mii-sp-consent-provisioncode)
* insert AddTransactionEntry(mii-sp-consent-provisioncodeperiod)
* insert AddTransactionEntry(mii-sp-consent-provisioncodetype)
* insert AddTransactionEntry(mii-sp-consent-provisionperiod)
* insert AddTransactionEntry(mii-sp-consent-provisiontype)
// Biobank
* insert AddTransactionEntry(mii-sp-biobank-diagnose)
// Mikrobio
* insert AddTransactionEntry(mii-sp-mikrobio-interpretation)
// MolGen
* insert AddTransactionEntry(mii-sp-molgen-servicerequest-reasoncode)
* insert AddTransactionEntry(mii-sp-molgen-servicerequest-reasonreference)
* insert AddTransactionEntry(mii-sp-molgen-task-reasoncode)
* insert AddTransactionEntry(mii-sp-molgen-task-reasonreference)
* insert AddTransactionEntry(mii-sp-molgen-task-for)
* insert AddTransactionEntry(mii-sp-molgen-familymemberhistory-reasoncode)
* insert AddTransactionEntry(mii-sp-molgen-familymemberhistory-reasonreference)
// Patho
* insert AddTransactionEntry(mii-sp-patho-request)
* insert AddTransactionEntry(mii-sp-patho-collection-method)
* insert AddTransactionEntry(mii-sp-patho-collection-body-site)
* insert AddTransactionEntry(mii-sp-patho-processing-procedure)
* insert AddTransactionEntry(mii-sp-patho-processing-additive)
* insert AddTransactionEntry(mii-sp-patho-processing-date)
* insert AddTransactionEntry(mii-sp-patho-container-additive)
* insert AddTransactionEntry(mii-sp-patho-body-site)
* insert AddTransactionEntry(mii-sp-patho-value-ratio)
* insert AddTransactionEntry(mii-sp-patho-value-ratio-numerator)
* insert AddTransactionEntry(mii-sp-patho-value-ratio-denominator)
* insert AddTransactionEntry(mii-sp-patho-reason-code)
* insert AddTransactionEntry(mii-sp-patho-supporting-info)
* insert AddTransactionEntry(mii-sp-patho-imaging-study)
* insert AddTransactionEntry(mii-sp-patho-attester-mode)
* insert AddTransactionEntry(mii-sp-patho-custodian)
* insert AddTransactionEntry(mii-sp-patho-relates-to-code)
* insert AddTransactionEntry(mii-sp-patho-part-of)
// ICU
* insert AddTransactionEntry(sp-mii-icu-device-property-type)
* insert AddTransactionEntry(mii-sp-icu-devicemetric-source)
* insert AddTransactionEntry(mii-sp-icu-observation-bodysite)
* insert AddTransactionEntry(mii-sp-icu-observation-component-interpretation)
* insert AddTransactionEntry(mii-sp-icu-observation-component-referencerange)
* insert AddTransactionEntry(mii-sp-icu-observation-interpretation)
* insert AddTransactionEntry(mii-sp-icu-observation-issued)
* insert AddTransactionEntry(mii-sp-icu-procedure-recorder)
// Studie
* insert AddTransactionEntry(DocumentReference-title)
* insert AddTransactionEntry(DocumentReference-size)
* insert AddTransactionEntry(EvidenceVariable-characteristic-description)
* insert AddTransactionEntry(Library-quellregister)
* insert AddTransactionEntry(Library-relatedArtifactUrl)
* insert AddTransactionEntry(ResearchStudy-armName)
* insert AddTransactionEntry(ResearchStudy-label)
* insert AddTransactionEntry(ResearchStudy-akronym)
* insert AddTransactionEntry(ResearchStudy-finanzierung)
* insert AddTransactionEntry(ResearchStudy-studienregister)
* insert AddTransactionEntry(ResearchStudy-rekrutierungsstand-datum)
* insert AddTransactionEntry(ResearchStudy-rekrutierungsstand-genauigkeit)
* insert AddTransactionEntry(ResearchStudy-rekrutierungsstand)
* insert AddTransactionEntry(ResearchStudy-rekrutierungsziel)
* insert AddTransactionEntry(ResearchStudy-rekrutierungsstart)

Instance: mii-meta-searchparam-collection-bundle
InstanceOf: Bundle
* type = #collection
* timestamp = "2024-07-10T18:48:00+01:00"
// Person
* insert AddCollectionEntry(mii-sp-person-adresszusatz)
* insert AddCollectionEntry(mii-sp-person-assignerpid)
* insert AddCollectionEntry(mii-sp-person-consent)
* insert AddCollectionEntry(mii-sp-person-gemeindeschluessel)
* insert AddCollectionEntry(mii-sp-person-hausnummer)
* insert AddCollectionEntry(mii-sp-person-otheramtlich)
* insert AddCollectionEntry(mii-sp-person-postfach)
* insert AddCollectionEntry(mii-sp-person-prefix)
* insert AddCollectionEntry(mii-sp-person-prefixqualifier)
* insert AddCollectionEntry(mii-sp-person-stadtteil)
* insert AddCollectionEntry(mii-sp-person-strasse)
// Diagnose
* insert AddCollectionEntry(mii-sp-diagnose-icd10gm-diagnosesicherheit)
* insert AddCollectionEntry(mii-sp-diagnose-icd10gm-mehrfachcodierung)
* insert AddCollectionEntry(mii-sp-diagnose-icd10gm-seitenlokalisation)
// Prozedur
* insert AddCollectionEntry(mii-sp-prozedur-bodysite)
* insert AddCollectionEntry(mii-sp-prozedur-dokumentationsdatum)
* insert AddCollectionEntry(mii-sp-prozedur-durchfuehrungsabsicht)
// Fall
* insert AddCollectionEntry(mii-sp-fall-encounter-diagnosis-use)
* insert AddCollectionEntry(mii-sp-fall-encounter-hospitalization-admitsource)
* insert AddCollectionEntry(mii-sp-fall-encounter-location-physical-type)
* insert AddCollectionEntry(mii-sp-fall-encounter-servicetype)
// Medikation
* insert AddCollectionEntry(mii-sp-medikation-medication-ingredient-strength-numerator)
* insert AddCollectionEntry(mii-sp-medikation-medication-ingredient-strength-denominator)
* insert AddCollectionEntry(mii-sp-medikation-medication-ingredient-strength)
* insert AddCollectionEntry(mii-sp-medikation-medication-reasonreference)
* insert AddCollectionEntry(mii-sp-medikation-dosage-site)
* insert AddCollectionEntry(mii-sp-medikation-dosage-route)
* insert AddCollectionEntry(mii-sp-medikation-dosage-doserange-low)
* insert AddCollectionEntry(mii-sp-medikation-dosage-doserange-high)
* insert AddCollectionEntry(mii-sp-medikation-dosage-doserange)
* insert AddCollectionEntry(mii-sp-medikation-dosage-dosequantity)
* insert AddCollectionEntry(mii-sp-medikation-dosage-rateratio-numerator)
* insert AddCollectionEntry(mii-sp-medikation-dosage-rateratio-denominator)
* insert AddCollectionEntry(mii-sp-medikation-dosage-rateratio)
* insert AddCollectionEntry(mii-sp-medikation-dosage-raterange-low)
* insert AddCollectionEntry(mii-sp-medikation-dosage-raterange-high)
* insert AddCollectionEntry(mii-sp-medikation-dosage-raterange)
* insert AddCollectionEntry(mii-sp-medikation-dosage-ratequantity)
* insert AddCollectionEntry(mii-sp-medikation-list-mode)
// Consent
* insert AddCollectionEntry(mii-sp-consent-policyuri)
* insert AddCollectionEntry(mii-sp-consent-provisioncode)
* insert AddCollectionEntry(mii-sp-consent-provisioncodeperiod)
* insert AddCollectionEntry(mii-sp-consent-provisioncodetype)
* insert AddCollectionEntry(mii-sp-consent-provisionperiod)
* insert AddCollectionEntry(mii-sp-consent-provisiontype)
// Biobank
* insert AddCollectionEntry(mii-sp-biobank-diagnose)
// Mikrobio
* insert AddCollectionEntry(mii-sp-mikrobio-interpretation)
// MolGen
* insert AddCollectionEntry(mii-sp-molgen-servicerequest-reasoncode)
* insert AddCollectionEntry(mii-sp-molgen-servicerequest-reasonreference)
* insert AddCollectionEntry(mii-sp-molgen-task-reasoncode)
* insert AddCollectionEntry(mii-sp-molgen-task-reasonreference)
* insert AddCollectionEntry(mii-sp-molgen-task-for)
* insert AddCollectionEntry(mii-sp-molgen-familymemberhistory-reasoncode)
* insert AddCollectionEntry(mii-sp-molgen-familymemberhistory-reasonreference)
// Patho
* insert AddCollectionEntry(mii-sp-patho-request)
* insert AddCollectionEntry(mii-sp-patho-collection-method)
* insert AddCollectionEntry(mii-sp-patho-collection-body-site)
* insert AddCollectionEntry(mii-sp-patho-processing-procedure)
* insert AddCollectionEntry(mii-sp-patho-processing-additive)
* insert AddCollectionEntry(mii-sp-patho-processing-date)
* insert AddCollectionEntry(mii-sp-patho-container-additive)
* insert AddCollectionEntry(mii-sp-patho-body-site)
* insert AddCollectionEntry(mii-sp-patho-value-ratio)
* insert AddCollectionEntry(mii-sp-patho-value-ratio-numerator)
* insert AddCollectionEntry(mii-sp-patho-value-ratio-denominator)
* insert AddCollectionEntry(mii-sp-patho-reason-code)
* insert AddCollectionEntry(mii-sp-patho-supporting-info)
* insert AddCollectionEntry(mii-sp-patho-imaging-study)
* insert AddCollectionEntry(mii-sp-patho-attester-mode)
* insert AddCollectionEntry(mii-sp-patho-custodian)
* insert AddCollectionEntry(mii-sp-patho-relates-to-code)
* insert AddCollectionEntry(mii-sp-patho-part-of)
// ICU
* insert AddCollectionEntry(sp-mii-icu-device-property-type)
* insert AddCollectionEntry(mii-sp-icu-devicemetric-source)
* insert AddCollectionEntry(mii-sp-icu-observation-bodysite)
* insert AddCollectionEntry(mii-sp-icu-observation-component-interpretation)
* insert AddCollectionEntry(mii-sp-icu-observation-component-referencerange)
* insert AddCollectionEntry(mii-sp-icu-observation-interpretation)
* insert AddCollectionEntry(mii-sp-icu-observation-issued)
* insert AddCollectionEntry(mii-sp-icu-observation-referencerange)
* insert AddCollectionEntry(mii-sp-icu-procedure-recorder)
// Studie
* insert AddCollectionEntry(DocumentReference-title)
* insert AddCollectionEntry(DocumentReference-size)
* insert AddCollectionEntry(EvidenceVariable-characteristic-description)
* insert AddCollectionEntry(Library-quellregister)
* insert AddCollectionEntry(Library-relatedArtifactUrl)
* insert AddCollectionEntry(ResearchStudy-armName)
* insert AddCollectionEntry(ResearchStudy-label)
* insert AddCollectionEntry(ResearchStudy-akronym)
* insert AddCollectionEntry(ResearchStudy-finanzierung)
* insert AddCollectionEntry(ResearchStudy-studienregister)
* insert AddCollectionEntry(ResearchStudy-rekrutierungsstand-datum)
* insert AddCollectionEntry(ResearchStudy-rekrutierungsstand-genauigkeit)
* insert AddCollectionEntry(ResearchStudy-rekrutierungsstand)
* insert AddCollectionEntry(ResearchStudy-rekrutierungsziel)
* insert AddCollectionEntry(ResearchStudy-rekrutierungsstart)