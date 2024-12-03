#!/bin/bash -e

test() {
  if [ "$2" = "$3" ]; then
    echo "OK 👍: the $1 is $3"
  else
    echo "Fail 😞: the $1 is $2, expected $3"
    exit 1
  fi
}

test_at_least_one() {
  if [ "$2" -ge 1 ]; then
    echo "OK 👍: the $1 is $2 (expected at least 1)"
  else
    echo "Fail 😞: the $1 is $2, expected at least 1"
    exit 1
  fi
}

BASE="http://localhost:8080/fhir"

# Function to perform a search
search() {
  local resource_type=$1
  local search_params=$2
  curl -sH 'Prefer: handling=strict' "$BASE/$resource_type?$search_params&_summary=count" | jq .total
}

# SearchParameter tests sorted by resource type

# =========================================================
# AdverseEvent
# =========================================================
# TODO: Add tests for AdverseEvent.encounter
# TODO: Add tests for AdverseEvent.suspectEntity.instance

# =========================================================
# CarePlan
# =========================================================
# TODO: Add tests for CarePlan.addresses
# TODO: Add tests for CarePlan.contributor
# TODO: Add tests for CarePlan.created

# =========================================================
# Composition
# =========================================================
# Composition.attester.mode
test "Composition.attester.mode=legal count" \
     "$(search "Composition" "attester-mode=legal")" \
     "1"

# Composition.custodian
test "Composition.custodian count" \
     "$(search "Composition" "custodian=Organization/mii-exa-test-data-organization-charite")" \
     "1"

# Composition.relatesTo.code
test "Composition.relatesTo.code=appends count" \
     "$(search "Composition" "relates-to-code=appends")" \
     "1"

# =========================================================
# Condition
# =========================================================
# TODO: Add tests for Condition.evidence.detail

# Condition code diagnosesicherheit mehrfachcodierung seitenlokalisation
B05_3="http://fhir.de/CodeSystem/bfarm/icd-10-gm|B05.3"
H67_1="http://fhir.de/CodeSystem/bfarm/icd-10-gm|H67.1"
A="https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_ICD_DIAGNOSESICHERHEIT|A"
G="https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_ICD_DIAGNOSESICHERHEIT|G"
L="https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_ICD_SEITENLOKALISATION|L"
R="https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_ICD_SEITENLOKALISATION|R"
B="https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_ICD_SEITENLOKALISATION|B"
M="http://fhir.de/CodeSystem/icd-10-gm-mehrfachcodierungs-kennzeichen|*"
E="http://fhir.de/CodeSystem/icd-10-gm-mehrfachcodierungs-kennzeichen|†"

# Suchparameter: code
test "Condition.code B05.3 count" \
     "$(search "Condition" "code=$B05_3")" \
     "1"

test "Condition.code H67.1 count" \
     "$(search "Condition" "code=$H67_1")" \
     "1"

# Suchparameter: icd10gm-diagnosesicherheit
test "Condition.code Diagnosesicherheit B05.3/A count" \
     "$(search "Condition" "code=$B05_3&icd10gm-diagnosesicherheit=$A")" \
     "0"

test "Condition.code Diagnosesicherheit B05.3/G count" \
     "$(search "Condition" "code=$B05_3&icd10gm-diagnosesicherheit=$G")" \
     "1"

# Suchparameter: icd10gm-seitenlokalisation
test "Condition.code Seitenlokalisation B05.3/B count" \
     "$(search "Condition" "code=$B05_3&icd10gm-seitenlokalisation=$B")" \
     "1"

test "Condition.code Seitenlokalisation B05.3/R count" \
     "$(search "Condition" "code=$B05_3&icd10gm-seitenlokalisation=$R")" \
     "0"

# Suchparameter: icd10gm-mehrfachcodierung
test "Condition.code Mehrfachcodierung B05.3/M count" \
     "$(search "Condition" "code=$B05_3&icd10gm-mehrfachcodierung=$M")" \
     "0"

test "Condition.code Mehrfachcodierung B05.3/E count" \
     "$(search "Condition" "code=$B05_3&icd10gm-mehrfachcodierung=$E")" \
     "1"

# Condition.verificationStatus
test_at_least_one "Condition with verificationStatus=confirmed count" \
                  "$(search "Condition" "verification-status=confirmed")" 

# =========================================================
# Consent
# =========================================================
# Consent.policy.uri
test_at_least_one "Consent with policy.uri=urn:oid:2.16.840.1.113883.3.1937.777.24.2.1791 count" \
                  "$(search "Consent" "mii-policy-uri=urn:oid:2.16.840.1.113883.3.1937.777.24.2.1791")"

# Consent.provision.provision.code
test_at_least_one "Consent with provision.code=urn:oid:2.16.840.1.113883.3.1937.777.24.5.3|2.16.840.1.113883.3.1937.777.24.5.3.9 count" \
                  "$(search "Consent" "mii-provision-provision-code=urn:oid:2.16.840.1.113883.3.1937.777.24.5.3%7C2.16.840.1.113883.3.1937.777.24.5.3.9")"

# Consent.provision.provision mii-provision-provision-code-period
# TODO: fix this test probably related to url encoding $
# test_at_least_one "Consent with mii-provision-provision-code-period=urn:oid:2.16.840.1.113883.3.1937.777.24.5.3|2.16.840.1.113883.3.1937.777.24.5.3.9 ge2024-02-23 count" \
#                   "$(search "Consent" "mii-provision-provision-code-period=urn:oid:2.16.840.1.113883.3.1937.777.24.5.3|2.16.840.1.113883.3.1937.777.24.5.3.9$ge2024-02-23")"

# Consent.provision.provision mii-provision-provision-code-type
# TODO 

# Consent.provision.provision.period
test_at_least_one "Consent with mii-provision-provision-period=ge2024 count" \
                  "$(search "Consent" "mii-provision-provision-period=ge2024")"

# Consent.provision.provision.type
test_at_least_one "Consent with mii-provision-provision-type=permit count" \
                  "$(search "Consent" "mii-provision-provision-type=permit")"

# =========================================================
# Device
# =========================================================
# Device.property.type
test "Device with property-type=urn:iso:std:iso:11073:10101|70934 count" \
     "$(search "Device" "property-type=urn:iso:std:iso:11073:10101%7C70934")" \
     "1"

# =========================================================
# DeviceMetric
# =========================================================
# DeviceMetric.source
test_at_least_one "DeviceMetric with source=Device/mii-exa-test-data-patient-1-ecmo-dialysis-device count" \
                  "$(search "DeviceMetric" "source=Device/mii-exa-test-data-patient-1-ecmo-dialysis-device")"

# =========================================================
# DiagnosticReport
# =========================================================
# TODO: DiagnosticReport.imagingStudy

# =========================================================
# DocumentReference
# =========================================================
# TODO: DocumentReference.content.attachment.size
# TODO: DocumentReference.content.attachment.title

# =========================================================
# Encounter
# =========================================================
# Encounter.diagnosis.use
test_at_least_one "Encounter with diagnosis-use=http://terminology.hl7.org/CodeSystem/diagnosis-role|AD count" \
                  "$(search "Encounter" "diagnosis-use=http://terminology.hl7.org/CodeSystem/diagnosis-role%7CAD")"

# Encounter.hospitalization.admitSource
test_at_least_one "Encounter with hospitalization-admitsource=http://fhir.de/CodeSystem/dgkev/Aufnahmeanlass|E count" \
                  "$(search "Encounter" "hospitalization-admitsource=http://fhir.de/CodeSystem/dgkev/Aufnahmeanlass%7CE")"

# Encounter.location.physicalType
test_at_least_one "Encounter with location-physical-type=http://terminology.hl7.org/CodeSystem/location-physical-type|ro count" \
                  "$(search "Encounter" "location-physical-type=http://terminology.hl7.org/CodeSystem/location-physical-type%7Cro")"

# Encounter.serviceType
test_at_least_one "Encounter with service-type=http://fhir.de/CodeSystem/dkgev/Fachabteilungsschluessel|0100 count" \
                  "$(search "Encounter" "service-type=http://fhir.de/CodeSystem/dkgev/Fachabteilungsschluessel%7C0100")"

# =========================================================
# EvidenceVariable
# =========================================================
# TODO: EvidenceVariable.characteristic.description

# =========================================================
# FamilyMemberHistory
# =========================================================
# FamilyMemberHistory.reasonCode
test_at_least_one "FamilyMemberHistory with reason-code=http://snomed.info/sct|447886005 count" \
                  "$(search "FamilyMemberHistory" "reason-code=http://snomed.info/sct%7C447886005")"

# FamilyMemberHistory.reasonReference
test_at_least_one "FamilyMemberHistory with reason-reference=Condition/mii-exa-test-data-patient-3-diagnose-1 count" \
                  "$(search "FamilyMemberHistory" "reason-reference=Condition/mii-exa-test-data-patient-3-diagnose-1")"

# =========================================================
# Library
# =========================================================
# TODO: Library quellregister
# TODO: Library.relatedArtifact.document.url

# =========================================================
# List
# =========================================================
# List.mode
test_at_least_one "List with mode=snapshot count" \
                  "$(search "List" "mode=snapshot")"

# =========================================================
# Media
# =========================================================
# Media.partOf
test_at_least_one "Media with part-of=Media/mii-exa-test-data-patient-1-patho-attached-image count" \
                  "$(search "Media" "part-of=Media/mii-exa-test-data-patient-1-patho-attached-image")"

# =========================================================
# Medication
# =========================================================
# TODO: Medication.ingredient.strength

# Medication.ingredient.strength.denominator
test_at_least_one "Medication with ingredient-strength-denominator=1|http://standardterms.edqm.eu|10219000 count" \
                  "$(search "Medication" "ingredient-strength-denominator=1%7Chttp://standardterms.edqm.eu%7C10219000")"

# Medication.ingredient.strength.numerator
test_at_least_one "Medication with ingredient-strength-numerator=100|http://unitsofmeasure.org|mg count" \
                  "$(search "Medication" "ingredient-strength-numerator=100%7Chttp://unitsofmeasure.org%7Cmg")"

# =========================================================
# MedicationStatement 
# MedicationRequest 
# MedicationAdministration
# =========================================================
# dose-quantity
test_at_least_one "MedicationRequest with dose-quantity=1500|http://unitsofmeasure.org|mg count" \
                  "$(search "MedicationRequest" "dose-quantity=1500%7Chttp://unitsofmeasure.org%7Cmg")"

# TODO: doserange

# doserange-high
test_at_least_one "MedicationRequest with doserange-high=1000|http://unitsofmeasure.org|mg count" \
                  "$(search "MedicationRequest" "doserange-high=1000%7Chttp://unitsofmeasure.org%7Cmg")"

# doserange-low
test_at_least_one "MedicationRequest with doserange-low=500|http://unitsofmeasure.org|mg count" \
                  "$(search "MedicationRequest" "doserange-low=500%7Chttp://unitsofmeasure.org%7Cmg")"

# ratequantity
test_at_least_one "MedicationRequest with ratequantity=5|http://unitsofmeasure.org|mg/min count" \
                  "$(search "MedicationRequest" "ratequantity=5%7Chttp://unitsofmeasure.org%7Cmg%2Fmin")"

# TODO: raterange

# raterange-high
test_at_least_one "MedicationRequest with raterange-high=120|http://unitsofmeasure.org|mL/h count" \
                  "$(search "MedicationRequest" "raterange-high=120%7Chttp://unitsofmeasure.org%7CmL/h")"

# raterange-low
test_at_least_one "MedicationRequest with raterange-low=60|http://unitsofmeasure.org|mL/h count" \
                  "$(search "MedicationRequest" "raterange-low=60%7Chttp://unitsofmeasure.org%7CmL/h")"

# TODO: rateratio

# rateratio-denominator
test_at_least_one "MedicationRequest with rateratio-denominator=1|http://unitsofmeasure.org|min count" \
                  "$(search "MedicationRequest" "rateratio-denominator=1%7Chttp://unitsofmeasure.org%7Cmin")"

# rateratio-numerator
test_at_least_one "MedicationRequest with rateratio-numerator=6.5|http://unitsofmeasure.org|mg count" \
                  "$(search "MedicationRequest" "rateratio-numerator=6.5%7Chttp://unitsofmeasure.org%7Cmg")"

# dosage-route
test_at_least_one "MedicationAdministration with dosage-route=http://standardterms.edqm.eu|20045000 count" \
                  "$(search "MedicationAdministration" "dosage-route=http://standardterms.edqm.eu%7C20045000")"

# dosage-site
test_at_least_one "MedicationStatement with dosage-site=http://snomed.info/sct|789218009 count" \
                  "$(search "MedicationStatement" "dosage-site=http://snomed.info/sct%7C789218009")"

# TODO: part-of
# test_at_least_one "MedicationAdministration with part-of=Procedure/mii-exa-test-data-patient-1-prozedur-2 count" \
#                   "$(search "MedicationAdministration" "part-of=Procedure/mii-exa-test-data-patient-1-prozedur-2")"

# reason-reference
test_at_least_one "MedicationStatement with reason-reference=Condition/mii-exa-test-data-patient-1-diagnose-1 count" \
                  "$(search "MedicationStatement" "reason-reference=Condition/mii-exa-test-data-patient-1-diagnose-1")"

# =========================================================
# Observation
# =========================================================
# body-site
test_at_least_one "Observation with body-site=http://snomed.info/sct|42859004 count" \
                  "$(search "Observation" "body-site=http://snomed.info/sct%7C42859004")"

# TODO: component-interpretation

# TODO: encounter

# TODO: focus

# has-member
test_at_least_one "Observation with has-member=Observation/mii-exa-test-data-patient-1-patho-diagnostic-conclusion-1 count" \
                  "$(search "Observation" "has-member=Observation/mii-exa-test-data-patient-1-patho-diagnostic-conclusion-1")"

# interpretation
test_at_least_one "Observation with interpretation=http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation|H count" \
                  "$(search "Observation" "interpretation=http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation%7CH")"

# issued
test_at_least_one "Observation with issued=2024-02-15 count" \
                  "$(search "Observation" "issued=2024-02-15")"

# TODO: reference-range

# TODO: reference-range-high
# test_at_least_one "Observation with reference-range-high=65|http://unitsofmeasure.org|a count" \
#                   "$(search "Observation" "reference-range-high=65%7Chttp://unitsofmeasure.org%7Ca")"

# TODO: reference-range-low

# TODO: value-ratio

# value-ratio-denominator
test_at_least_one "Observation with value-ratio-denominator=1|http://unitsofmeasure.org|mL count" \
                  "$(search "Observation" "value-ratio-denominator=1%7Chttp://unitsofmeasure.org%7CmL")"

# value-ratio-numerator
test_at_least_one "Observation with value-ratio-numerator=16|http://unitsofmeasure.org|ng count" \
                  "$(search "Observation" "value-ratio-numerator=16%7Chttp://unitsofmeasure.org%7Cng")"

# =========================================================
# Patient
# =========================================================
# adresszusatz
test "Patient with adresszusatz=Burg count" \
     "$(search "Patient" "adresszusatz=Burg")" \
     "0"

test "Patient with adresszusatz=Schloss count" \
     "$(search "Patient" "adresszusatz=Schloss")" \
     "1"

# Patient assigner-pid
test "Patient with assigner-pid=http://fhir.de/sid/arge-ik/iknr|123456789 count" \
     "$(search "Patient" "assigner-pid=http://fhir.de/sid/arge-ik/iknr|123456789")" \
     "1"

# ResearchSubject consent
# test "ResearchSubject with consent=Consent/mii-exa-test-data-patient-1-consent-1 count" "$(search "ResearchSubject" "consent=Consent/mii-exa-test-data-patient-1-consent-1")" "1"

# Patient gemeindeschluessel
test "Patient with gemeindeschluessel=http://fhir.de/sid/destatis/ags|11000000 count" \
     "$(search "Patient" "gemeindeschluessel=http://fhir.de/sid/destatis/ags|11000000")" \
     "1"

# Patient strasse hausnummer stadtteil
test "Patient with strasse=Dorfstraße&hausnummer=9&stadtteil=Malchow count" \
     "$(search "Patient" "strasse=Dorfstraße&hausnummer=9&stadtteil=Malchow")" \
     "1"

# Patient gender other-amtlich
test "Patient with other-amtlich=http://fhir.de/CodeSystem/gender-amtlich-de|D count" \
    "$(search "Patient" "other-amtlich=http://fhir.de/CodeSystem/gender-amtlich-de|D")" \
    "1"

# Patient postfach
# TODO
# test "Patient with postfach=Postfach count" \
#      "$(search "Patient" "postfach=Postfach-252618")" 
#      "1"

# Patient prefix
test "Patient with prefix=Prinz von Preußen count" \
     "$(search "Patient" "prefix=Prinz%20von%20Preußen")" \
     "1"

# prefix-qualifier
test "Patient with prefix-qualifier=NB count" \
     "$(search "Patient" "prefix-qualifier=NB")" \
     "1"

# stadtteil
test "Patient with stadtteil=Malchow count" \
     "$(search "Patient" "stadtteil=Malchow")" \
     "1"

# strasse
test "Patient with strasse=Dorfstraße count" \
     "$(search "Patient" "strasse=Dorfstraße")" \
     "1"

# =========================================================
# Procedure
# =========================================================
# bodySite
test_at_least_one "Procedure with bodySite=http://snomed.info/sct|44714003 count" \
                  "$(search "Procedure" "bodySite=http://snomed.info/sct%7C44714003")"

# TODO: complication

# dokumentationsdatum
test_at_least_one "Procedure with dokumentationsdatum=2024-02-20 count" \
                  "$(search "Procedure" "dokumentationsdatum=2024-02-20")"

# durchfuehrungsabsicht
test_at_least_one "Procedure with durchfuehrungsabsicht=http://snomed.info/sct|262202000 count" \
                  "$(search "Procedure" "durchfuehrungsabsicht=http://snomed.info/sct%7C262202000")"

# TODO: outcome

# TODO: recorder

# =========================================================
# ResearchStudy
# =========================================================
# TODO: akronym
# TODO: armName
# TODO: finanzierung
# TODO: label
# TODO: rekrutierungsstand
# TODO: rekrutierungsstand-datum
# TODO: rekrutierungsstand-genauigkeit
# TODO: rekrutierungsstart
# TODO: rekrutierungsziel
# TODO: studienregister
# TODO: consent

# =========================================================
# ServiceRequest
# =========================================================
# reason-code
test_at_least_one "ServiceRequest with reason-code=http://snomed.info/sct|447886005 count" \
                  "$(search "ServiceRequest" "reason-code=http://snomed.info/sct%7C447886005")"

# reason-reference
test_at_least_one "ServiceRequest with reason-reference=Condition/mii-exa-test-data-patient-4-diagnose-1 count" \
                  "$(search "ServiceRequest" "reason-reference=Condition/mii-exa-test-data-patient-4-diagnose-1")"

# TODO: supporting-info

# =========================================================
# Specimen
# =========================================================
# collection-body-site
test_at_least_one "Specimen with collection-body-site=http://snomed.info/sct|716917000 count" \
                  "$(search "Specimen" "collection-body-site=http://snomed.info/sct%7C716917000")"

# collection-method
test_at_least_one "Specimen with collection-method=http://snomed.info/sct|301759007 count" \
                  "$(search "Specimen" "collection-method=http://snomed.info/sct%7C301759007")"

# container-additive
test_at_least_one "Specimen with container-additive=Substance/mii-exa-test-data-patient-1-patho-microscope-slide-mounting-med count" \
                  "$(search "Specimen" "container-additive=Substance/mii-exa-test-data-patient-1-patho-microscope-slide-mounting-med")"

# diagnose
test_at_least_one "Specimen with diagnose=Condition/mii-exa-test-data-patient-1-diagnose-1 count" \
                  "$(search "Specimen" "diagnose=Condition/mii-exa-test-data-patient-1-diagnose-1")"

# processing-additive
test_at_least_one "Specimen with processing-additive=Substance/mii-exa-test-data-patient-1-patho-hematoxylin-stain count" \
                  "$(search "Specimen" "processing-additive=Substance/mii-exa-test-data-patient-1-patho-hematoxylin-stain")"

# processing-date
test_at_least_one "Specimen with processing-date=gt2021 count" \
                  "$(search "Specimen" "processing-date=gt2021")"

# processing-procedure
test_at_least_one "Specimen with processing-procedure=http://snomed.info/sct|40923002 count" \
                  "$(search "Specimen" "processing-procedure=http://snomed.info/sct%7C40923002")"

# request
test_at_least_one "Specimen with request=ServiceRequest/mii-exa-test-data-patient-1-patho-request-1 count" \
                  "$(search "Specimen" "request=ServiceRequest/mii-exa-test-data-patient-1-patho-request-1")"

# =========================================================
# Task
# =========================================================
# for
test_at_least_one "Task with for=Patient/mii-exa-test-data-patient-3 count" \
                  "$(search "Task" "for=Patient/mii-exa-test-data-patient-3")"
# reason-code
test_at_least_one "Task with reason-code=http://snomed.info/sct|447886005 count" \
                  "$(search "Task" "reason-code=http://snomed.info/sct%7C447886005")"

# reason-reference
test_at_least_one "Task with reason-reference=Observation/mii-exa-test-data-patient-3-molgen-therapeutische-implikation-1 count" \
                  "$(search "Task" "reason-reference=Observation/mii-exa-test-data-patient-3-molgen-therapeutische-implikation-1")"