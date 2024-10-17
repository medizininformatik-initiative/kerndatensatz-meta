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
* timestamp = "2024-10-17T16:08:00+01:00"
// Person
* insert AddTransactionEntry(mii-sp-meta-patient-adresszusatz)
* insert AddTransactionEntry(mii-sp-meta-patient-assignerpid)
* insert AddTransactionEntry(mii-sp-meta-researchsubject-consent)
* insert AddTransactionEntry(mii-sp-meta-patient-gemeindeschluessel)
* insert AddTransactionEntry(mii-sp-meta-patient-hausnummer)
* insert AddTransactionEntry(mii-sp-meta-patient-otheramtlich)
* insert AddTransactionEntry(mii-sp-meta-patient-postfach)
* insert AddTransactionEntry(mii-sp-meta-patient-prefix)
* insert AddTransactionEntry(mii-sp-meta-patient-prefixqualifier)
* insert AddTransactionEntry(mii-sp-meta-patient-stadtteil)
* insert AddTransactionEntry(mii-sp-meta-patient-strasse)
// Diagnose
* insert AddTransactionEntry(mii-sp-meta-condition-icd10gm-diagnosesicherheit)
* insert AddTransactionEntry(mii-sp-meta-condition-icd10gm-mehrfachcodierung)
* insert AddTransactionEntry(mii-sp-meta-condition-icd10gm-seitenlokalisation)
// Prozedur
* insert AddTransactionEntry(mii-sp-meta-procedure-bodysite)
* insert AddTransactionEntry(mii-sp-meta-procedure-dokumentationsdatum)
* insert AddTransactionEntry(mii-sp-meta-procedure-durchfuehrungsabsicht)
// Fall
* insert AddTransactionEntry(mii-sp-meta-encounter-diagnosis-use)
* insert AddTransactionEntry(mii-sp-meta-encounter-hospitalization-admitsource)
* insert AddTransactionEntry(mii-sp-meta-encounter-location-physical-type)
* insert AddTransactionEntry(mii-sp-meta-encounter-servicetype)
// Medikation
* insert AddTransactionEntry(mii-sp-meta-medication-ingredient-strength-numerator)
* insert AddTransactionEntry(mii-sp-meta-medication-ingredient-strength-denominator)
* insert AddTransactionEntry(mii-sp-meta-medication-ingredient-strength)
* insert AddTransactionEntry(mii-sp-meta-medication-reasonreference)
* insert AddTransactionEntry(mii-sp-meta-medication-dosage-site)
* insert AddTransactionEntry(mii-sp-meta-medication-dosage-route)
* insert AddTransactionEntry(mii-sp-meta-medication-dosage-doserange-low)
* insert AddTransactionEntry(mii-sp-meta-medication-dosage-doserange-high)
* insert AddTransactionEntry(mii-sp-meta-medication-dosage-doserange)
* insert AddTransactionEntry(mii-sp-meta-medication-dosage-dosequantity)
* insert AddTransactionEntry(mii-sp-meta-medication-dosage-rateratio-numerator)
* insert AddTransactionEntry(mii-sp-meta-medication-dosage-rateratio-denominator)
* insert AddTransactionEntry(mii-sp-meta-medication-dosage-rateratio)
* insert AddTransactionEntry(mii-sp-meta-medication-dosage-raterange-low)
* insert AddTransactionEntry(mii-sp-meta-medication-dosage-raterange-high)
* insert AddTransactionEntry(mii-sp-meta-medication-dosage-raterange)
* insert AddTransactionEntry(mii-sp-meta-medication-dosage-ratequantity)
* insert AddTransactionEntry(mii-sp-meta-medication-list-mode)
// Consent
* insert AddTransactionEntry(mii-sp-meta-consent-policyuri)
* insert AddTransactionEntry(mii-sp-meta-consent-provisioncode)
* insert AddTransactionEntry(mii-sp-meta-consent-provisioncodeperiod)
* insert AddTransactionEntry(mii-sp-meta-consent-provisioncodetype)
* insert AddTransactionEntry(mii-sp-meta-consent-provisionperiod)
* insert AddTransactionEntry(mii-sp-meta-consent-provisiontype)
// Biobank
* insert AddTransactionEntry(mii-sp-meta-specimen-diagnose)
// Mikrobio
* insert AddTransactionEntry(mii-sp-meta-observation-interpretation)
// MolGen
* insert AddTransactionEntry(mii-sp-meta-servicerequest-reasoncode)
* insert AddTransactionEntry(mii-sp-meta-servicerequest-reasonreference)
* insert AddTransactionEntry(mii-sp-meta-task-reasoncode)
* insert AddTransactionEntry(mii-sp-meta-task-reasonreference)
* insert AddTransactionEntry(mii-sp-meta-task-for)
* insert AddTransactionEntry(mii-sp-meta-familymemberhistory-reasoncode)
* insert AddTransactionEntry(mii-sp-meta-familymemberhistory-reasonreference)
// Patho
* insert AddTransactionEntry(mii-sp-meta-specimen-request)
* insert AddTransactionEntry(mii-sp-meta-specimen-collection-method)
* insert AddTransactionEntry(mii-sp-meta-specimen-collection-body-site)
* insert AddTransactionEntry(mii-sp-meta-specimen-processing-procedure)
* insert AddTransactionEntry(mii-sp-meta-specimen-processing-additive)
* insert AddTransactionEntry(mii-sp-meta-specimen-processing-date)
* insert AddTransactionEntry(mii-sp-meta-specimen-container-additive)
* insert AddTransactionEntry(mii-sp-meta-observation-value-ratio)
* insert AddTransactionEntry(mii-sp-meta-observation-value-ratio-numerator)
* insert AddTransactionEntry(mii-sp-meta-observation-value-ratio-denominator)
* insert AddTransactionEntry(mii-sp-meta-servicerequest-supportinginfo)
* insert AddTransactionEntry(mii-sp-meta-diagnosticreport-imagingstudy)
* insert AddTransactionEntry(mii-sp-meta-composition-attester-mode)
* insert AddTransactionEntry(mii-sp-meta-composition-custodian)
* insert AddTransactionEntry(mii-sp-meta-composition-relatesto-code)
* insert AddTransactionEntry(mii-sp-meta-media-partof)
// ICU
* insert AddTransactionEntry(mii-sp-meta-device-property-type)
* insert AddTransactionEntry(mii-sp-meta-devicemetric-source)
* insert AddTransactionEntry(mii-sp-meta-observation-bodysite)
* insert AddTransactionEntry(mii-sp-meta-observation-component-interpretation)
* insert AddTransactionEntry(mii-sp-meta-observation-referencerange)
* insert AddTransactionEntry(mii-sp-meta-observation-referencerange-low)
* insert AddTransactionEntry(mii-sp-meta-observation-referencerange-high)
* insert AddTransactionEntry(mii-sp-meta-observation-issued)
* insert AddTransactionEntry(mii-sp-meta-procedure-recorder)
// Studie
* insert AddTransactionEntry(mii-sp-meta-documentreference-attachment-title)
* insert AddTransactionEntry(mii-sp-meta-documentreference-attachment-size)
* insert AddTransactionEntry(mii-sp-meta-evidencevariable-characteristic-description)
* insert AddTransactionEntry(mii-sp-meta-library-quellregister)
* insert AddTransactionEntry(mii-sp-meta-library-relatedartifact-url)
* insert AddTransactionEntry(mii-sp-meta-researchstudy-arm-name)
* insert AddTransactionEntry(mii-sp-meta-researchstudy-label)
* insert AddTransactionEntry(mii-sp-meta-researchstudy-akronym)
* insert AddTransactionEntry(mii-sp-meta-researchstudy-finanzierung)
* insert AddTransactionEntry(mii-sp-meta-researchstudy-studienregister)
* insert AddTransactionEntry(mii-sp-meta-researchstudy-rekrutierungsstand-datum)
* insert AddTransactionEntry(mii-sp-meta-researchstudy-rekrutierungsstand-genauigkeit)
* insert AddTransactionEntry(mii-sp-meta-researchstudy-rekrutierungsstand)
* insert AddTransactionEntry(mii-sp-meta-researchstudy-rekrutierungsziel)
* insert AddTransactionEntry(mii-sp-meta-researchstudy-rekrutierungsstart)

Instance: mii-meta-searchparam-collection-bundle
InstanceOf: Bundle
* type = #collection
* timestamp = "2024-10-17T16:08:00+01:00"
// Person
* insert AddCollectionEntry(mii-sp-meta-patient-adresszusatz)
* insert AddCollectionEntry(mii-sp-meta-patient-assignerpid)
* insert AddCollectionEntry(mii-sp-meta-researchsubject-consent)
* insert AddCollectionEntry(mii-sp-meta-patient-gemeindeschluessel)
* insert AddCollectionEntry(mii-sp-meta-patient-hausnummer)
* insert AddCollectionEntry(mii-sp-meta-patient-otheramtlich)
* insert AddCollectionEntry(mii-sp-meta-patient-postfach)
* insert AddCollectionEntry(mii-sp-meta-patient-prefix)
* insert AddCollectionEntry(mii-sp-meta-patient-prefixqualifier)
* insert AddCollectionEntry(mii-sp-meta-patient-stadtteil)
* insert AddCollectionEntry(mii-sp-meta-patient-strasse)
// Diagnose
* insert AddCollectionEntry(mii-sp-meta-condition-icd10gm-diagnosesicherheit)
* insert AddCollectionEntry(mii-sp-meta-condition-icd10gm-mehrfachcodierung)
* insert AddCollectionEntry(mii-sp-meta-condition-icd10gm-seitenlokalisation)
// Prozedur
* insert AddCollectionEntry(mii-sp-meta-procedure-bodysite)
* insert AddCollectionEntry(mii-sp-meta-procedure-dokumentationsdatum)
* insert AddCollectionEntry(mii-sp-meta-procedure-durchfuehrungsabsicht)
// Fall
* insert AddCollectionEntry(mii-sp-meta-encounter-diagnosis-use)
* insert AddCollectionEntry(mii-sp-meta-encounter-hospitalization-admitsource)
* insert AddCollectionEntry(mii-sp-meta-encounter-location-physical-type)
* insert AddCollectionEntry(mii-sp-meta-encounter-servicetype)
// Medikation
* insert AddCollectionEntry(mii-sp-meta-medication-ingredient-strength-numerator)
* insert AddCollectionEntry(mii-sp-meta-medication-ingredient-strength-denominator)
* insert AddCollectionEntry(mii-sp-meta-medication-ingredient-strength)
* insert AddCollectionEntry(mii-sp-meta-medication-reasonreference)
* insert AddCollectionEntry(mii-sp-meta-medication-dosage-site)
* insert AddCollectionEntry(mii-sp-meta-medication-dosage-route)
* insert AddCollectionEntry(mii-sp-meta-medication-dosage-doserange-low)
* insert AddCollectionEntry(mii-sp-meta-medication-dosage-doserange-high)
* insert AddCollectionEntry(mii-sp-meta-medication-dosage-doserange)
* insert AddCollectionEntry(mii-sp-meta-medication-dosage-dosequantity)
* insert AddCollectionEntry(mii-sp-meta-medication-dosage-rateratio-numerator)
* insert AddCollectionEntry(mii-sp-meta-medication-dosage-rateratio-denominator)
* insert AddCollectionEntry(mii-sp-meta-medication-dosage-rateratio)
* insert AddCollectionEntry(mii-sp-meta-medication-dosage-raterange-low)
* insert AddCollectionEntry(mii-sp-meta-medication-dosage-raterange-high)
* insert AddCollectionEntry(mii-sp-meta-medication-dosage-raterange)
* insert AddCollectionEntry(mii-sp-meta-medication-dosage-ratequantity)
* insert AddCollectionEntry(mii-sp-meta-medication-list-mode)
// Consent
* insert AddCollectionEntry(mii-sp-meta-consent-policyuri)
* insert AddCollectionEntry(mii-sp-meta-consent-provisioncode)
* insert AddCollectionEntry(mii-sp-meta-consent-provisioncodeperiod)
* insert AddCollectionEntry(mii-sp-meta-consent-provisioncodetype)
* insert AddCollectionEntry(mii-sp-meta-consent-provisionperiod)
* insert AddCollectionEntry(mii-sp-meta-consent-provisiontype)
// Biobank
* insert AddCollectionEntry(mii-sp-meta-specimen-diagnose)
// Mikrobio
* insert AddCollectionEntry(mii-sp-meta-observation-interpretation)
// MolGen
* insert AddCollectionEntry(mii-sp-meta-servicerequest-reasoncode)
* insert AddCollectionEntry(mii-sp-meta-servicerequest-reasonreference)
* insert AddCollectionEntry(mii-sp-meta-task-reasoncode)
* insert AddCollectionEntry(mii-sp-meta-task-reasonreference)
* insert AddCollectionEntry(mii-sp-meta-task-for)
* insert AddCollectionEntry(mii-sp-meta-familymemberhistory-reasoncode)
* insert AddCollectionEntry(mii-sp-meta-familymemberhistory-reasonreference)
// Patho
* insert AddCollectionEntry(mii-sp-meta-specimen-request)
* insert AddCollectionEntry(mii-sp-meta-specimen-collection-method)
* insert AddCollectionEntry(mii-sp-meta-specimen-collection-body-site)
* insert AddCollectionEntry(mii-sp-meta-specimen-processing-procedure)
* insert AddCollectionEntry(mii-sp-meta-specimen-processing-additive)
* insert AddCollectionEntry(mii-sp-meta-specimen-processing-date)
* insert AddCollectionEntry(mii-sp-meta-specimen-container-additive)
* insert AddCollectionEntry(mii-sp-meta-observation-value-ratio)
* insert AddCollectionEntry(mii-sp-meta-observation-value-ratio-numerator)
* insert AddCollectionEntry(mii-sp-meta-observation-value-ratio-denominator)
* insert AddCollectionEntry(mii-sp-meta-servicerequest-supportinginfo)
* insert AddCollectionEntry(mii-sp-meta-diagnosticreport-imagingstudy)
* insert AddCollectionEntry(mii-sp-meta-composition-attester-mode)
* insert AddCollectionEntry(mii-sp-meta-composition-custodian)
* insert AddCollectionEntry(mii-sp-meta-composition-relatesto-code)
* insert AddCollectionEntry(mii-sp-meta-media-partof)

// ICU
* insert AddCollectionEntry(mii-sp-meta-device-property-type)
* insert AddCollectionEntry(mii-sp-meta-devicemetric-source)
* insert AddCollectionEntry(mii-sp-meta-observation-bodysite)
* insert AddCollectionEntry(mii-sp-meta-observation-referencerange)
* insert AddCollectionEntry(mii-sp-meta-observation-referencerange-low)
* insert AddCollectionEntry(mii-sp-meta-observation-referencerange-high)
* insert AddCollectionEntry(mii-sp-meta-observation-component-interpretation)
* insert AddCollectionEntry(mii-sp-meta-observation-issued)
* insert AddCollectionEntry(mii-sp-meta-procedure-recorder)
// Studie
* insert AddCollectionEntry(mii-sp-meta-documentreference-attachment-title)
* insert AddCollectionEntry(mii-sp-meta-documentreference-attachment-size)
* insert AddCollectionEntry(mii-sp-meta-evidencevariable-characteristic-description)
* insert AddCollectionEntry(mii-sp-meta-library-quellregister)
* insert AddCollectionEntry(mii-sp-meta-library-relatedartifact-url)
* insert AddCollectionEntry(mii-sp-meta-researchstudy-arm-name)
* insert AddCollectionEntry(mii-sp-meta-researchstudy-label)
* insert AddCollectionEntry(mii-sp-meta-researchstudy-akronym)
* insert AddCollectionEntry(mii-sp-meta-researchstudy-finanzierung)
* insert AddCollectionEntry(mii-sp-meta-researchstudy-studienregister)
* insert AddCollectionEntry(mii-sp-meta-researchstudy-rekrutierungsstand-datum)
* insert AddCollectionEntry(mii-sp-meta-researchstudy-rekrutierungsstand-genauigkeit)
* insert AddCollectionEntry(mii-sp-meta-researchstudy-rekrutierungsstand)
* insert AddCollectionEntry(mii-sp-meta-researchstudy-rekrutierungsziel)
* insert AddCollectionEntry(mii-sp-meta-researchstudy-rekrutierungsstart)