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

# Function to test if a resource type is included in search response bundle
test_includes_resource_type() {
  local description="$1"
  local resource_type="$2"
  local search_params="$3"
  local expected_resource_type="$4"
  
  local response=$(curl -sH 'Prefer: handling=strict' "$BASE/$resource_type?$search_params")
  local resource_count=$(echo "$response" | jq -r ".entry[]? | select(.resource.resourceType == \"$expected_resource_type\") | .resource.resourceType" | wc -l | tr -d ' ')
  
  if [ "$resource_count" -ge 1 ]; then
    echo "OK 👍: $description includes $expected_resource_type resources ($resource_count found)"
  else
    echo "Fail 😞: $description does not include any $expected_resource_type resources"
    exit 1
  fi
}

# Example usage of the resource type inclusion test:
# test_includes_resource_type "Patient search with _include=Patient:general-practitioner" \
#                            "Patient" "_include=Patient:general-practitioner" "Practitioner"
#
# Additional examples:
# - Check if Observation resources are included when searching with _include=DiagnosticReport:result
# test_includes_resource_type "DiagnosticReport with _include=DiagnosticReport:result" \
#                            "DiagnosticReport" "_include=DiagnosticReport:result" "Observation"
#
# - Check if Patient resources are included in any search that should return them
# test_includes_resource_type "Encounter with _include=Encounter:patient" \
#                            "Encounter" "_include=Encounter:patient" "Patient"

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
#test "Composition.attester.mode=legal count" \
#     "$(search "Composition" "attester-mode=legal")" \
#     "1"

# Composition.custodian
#test "Composition.custodian count" \
#     "$(search "Composition" "custodian=Organization/mii-exa-test-data-organization-charite")" \
#     "1"

# Composition.relatesTo.code
#test "Composition.relatesTo.code=appends count" \
#     "$(search "Composition" "relates-to-code=appends")" \
#     "1"

# Composition.section.author
test_includes_resource_type "Composition with _include=Composition:section-author" \
                  "Composition" "_include=Composition:section-author" "Practitioner"

# Composition.section.title
test_at_least_one "Composition with section-title:contains=Left" \
                  "$(search "Composition" "section-title:contains=Left")"

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
test_at_least_one "Condition.code B05.3 count" \
     "$(search "Condition" "code=$B05_3")" 

test_at_least_one "Condition.code H67.1 count" \
     "$(search "Condition" "code=$H67_1")" 

# Suchparameter: icd10gm-diagnosesicherheit
test "Condition.code Diagnosesicherheit B05.3/A count" \
     "$(search "Condition" "code=$B05_3&icd10gm-diagnosesicherheit=$A")" \
     "0"

test_at_least_one "Condition.code Diagnosesicherheit B05.3/G count" \
     "$(search "Condition" "code=$B05_3&icd10gm-diagnosesicherheit=$G")" 

# Suchparameter: icd10gm-seitenlokalisation
test_at_least_one "Condition.code Seitenlokalisation B05.3/B count" \
     "$(search "Condition" "code=$B05_3&icd10gm-seitenlokalisation=$B")" 

test "Condition.code Seitenlokalisation B05.3/R count" \
     "$(search "Condition" "code=$B05_3&icd10gm-seitenlokalisation=$R")" \
     "0"

# Suchparameter: icd10gm-mehrfachcodierung
test "Condition.code Mehrfachcodierung B05.3/M count" \
     "$(search "Condition" "code=$B05_3&icd10gm-mehrfachcodierung=$M")" \
     "0"

test_at_least_one "Condition.code Mehrfachcodierung B05.3/E count" \
     "$(search "Condition" "code=$B05_3&icd10gm-mehrfachcodierung=$E")" 

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
test_at_least_one "Device with property-type=urn:iso:std:iso:11073:10101|69684 count" \
                  "$(search "Device" "property-type=urn:iso:std:iso:11073:10101%7C69684")" 

# =========================================================
# DeviceMetric
# =========================================================
# DeviceMetric.source
test_includes_resource_type "DeviceMetric with _include=DeviceMetric:source" \
                  "DeviceMetric" "_include=DeviceMetric:source" "Device"

# =========================================================
# DiagnosticReport
# =========================================================
# DiagnosticReport.imagingStudy
test_includes_resource_type "DiagnosticReport with _include=DiagnosticReport:imaging-study" \
                  "DiagnosticReport" "_include=DiagnosticReport:imaging-study" "ImagingStudy"

# Test if DiagnosticReport search includes related Patient resources
# test_includes_resource_type "DiagnosticReport with _include=DiagnosticReport:patient" \
#                            "DiagnosticReport" "_include=DiagnosticReport:patient" "Patient"

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

# Encounter.extension:Aufnahmegrund
test_at_least_one "Encounter with Aufnahmegrund=0101 count" \
                  "$(search "Encounter" "aufnahmegrund-ersteundzweitestelle=http://fhir.de/CodeSystem/dkgev/AufnahmegrundErsteUndZweiteStelle%7C01&aufnahmegrund-drittestelle=http://fhir.de/CodeSystem/dkgev/AufnahmegrundDritteStelle%7C0&aufnahmegrund-viertestelle=http://fhir.de/CodeSystem/dkgev/AufnahmegrundVierteStelle%7C1")"

# Encounter.hospitalization.dischargeDisposition.extension:Entlassungsgrund
test_at_least_one "Encounter with Entlassungsgrund=079 count" \
                  "$(search "Encounter" "entlassungsgrund-ersteundzweitestelle=http://fhir.de/CodeSystem/dkgev/EntlassungsgrundErsteUndZweiteStelle%7C07&entlassungsgrund-drittestelle=http://fhir.de/CodeSystem/dkgev/EntlassungsgrundDritteStelle%7C9")"

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
test_includes_resource_type "FamilyMemberHistory with _include=FamilyMemberHistory:reason-reference" \
                           "FamilyMemberHistory" "_include=FamilyMemberHistory:reason-reference" "Condition"

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
# test_at_least_one "Media with part-of=Media/mii-exa-test-data-patient-1-patho-attached-image count" \
#                   "$(search "Media" "part-of=Media/mii-exa-test-data-patient-1-patho-attached-image")"

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

# part-of
test_includes_resource_type "MedicationAdministration with _include=MedicationAdministration:part-of" \
                           "MedicationAdministration" "_include=MedicationAdministration:part-of" "Procedure"

# reason-reference
test_includes_resource_type "MedicationStatement with _include=MedicationStatement:reason-reference" \
                  "MedicationStatement" "_include=MedicationStatement:reason-reference" "Condition"

# =========================================================
# Observation
# =========================================================
# body-site
# test_at_least_one "Observation with body-site=http://snomed.info/sct|42859004 count" \
#                   "$(search "Observation" "body-site=http://snomed.info/sct%7C42859004")"

# TODO: component-interpretation

# TODO: encounter

# TODO: focus

# has-member
test_includes_resource_type "Observation with _include=Observation:has-member" \
                           "Observation" "_include=Observation:has-member" "Observation"

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
# test_at_least_one "Observation with value-ratio-denominator=1|http://unitsofmeasure.org|mL count" \
#                   "$(search "Observation" "value-ratio-denominator=1%7Chttp://unitsofmeasure.org%7CmL")"

# value-ratio-numerator
# test_at_least_one "Observation with value-ratio-numerator=16|http://unitsofmeasure.org|ng count" \
#                   "$(search "Observation" "value-ratio-numerator=16%7Chttp://unitsofmeasure.org%7Cng")"

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
test_at_least_one "Patient with assigner-pid=http://fhir.de/sid/arge-ik/iknr|123456789 count" \
     "$(search "Patient" "assigner-pid=http://fhir.de/sid/arge-ik/iknr|123456789")" 

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

# recorder
test_includes_resource_type "Procedure with _include=Procedure:recorder" \
                  "Procedure" "_include=Procedure:recorder" "PractitionerRole"

# Suchparameter: ops-seitenlokalisation
test_at_least_one "Procedure.code Seitenlokalisation 5-322.d1/R count" \
     "$(search "Procedure" "code=http://fhir.de/CodeSystem/bfarm/ops%7C5-322.d1&ops-seitenlokalisation=$R")"

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
test_includes_resource_type "ServiceRequest with _include=ServiceRequest:reason-reference" \
                   "ServiceRequest" "_include=ServiceRequest:reason-reference" "Condition"

# supporting-info
test_includes_resource_type "ServiceRequest with _include=ServiceRequest:supporting-info" \
                  "ServiceRequest" "_include=ServiceRequest:supporting-info" "ImagingStudy"

# =========================================================
# Specimen
# =========================================================
# collection-body-site - SearchParameter is retired now
# test_at_least_one "Specimen with collection-body-site=http://snomed.info/sct|789218009 count" \
#                   "$(search "Specimen" "collection-body-site=http://snomed.info/sct%7C789218009")"

# collection-method
test_at_least_one "Specimen with collection-method=http://snomed.info/sct|129300006 count" \
                  "$(search "Specimen" "collection-method=http://snomed.info/sct%7C129300006")"

# container-additive
test_includes_resource_type "Specimen with _include=Specimen:container-additive" \
                  "Specimen" "_include=Specimen:container-additive" "Substance"

# diagnose
test_includes_resource_type "Specimen with _include=Specimen:diagnose" \
                  "Specimen" "_include=Specimen:diagnose" "Condition"

# processing-additive
# test_includes_resource_type "Specimen with processing-additive=Substance/mii-exa-test-data-patient-1-patho-hematoxylin-stain count" \
#                   "$(search "Specimen" "processing-additive=Substance/mii-exa-test-data-patient-1-patho-hematoxylin-stain")"

# processing-date
# test_at_least_one "Specimen with processing-date=gt2021 count" \
#                   "$(search "Specimen" "processing-date=gt2021")"

# processing-procedure
# test_at_least_one "Specimen with processing-procedure=http://snomed.info/sct|40923002 count" \
#                   "$(search "Specimen" "processing-procedure=http://snomed.info/sct%7C40923002")"

# request
# test_at_least_one "Specimen with request=ServiceRequest/mii-exa-test-data-patient-1-patho-request-1 count" \
#                   "$(search "Specimen" "request=ServiceRequest/mii-exa-test-data-patient-1-patho-request-1")"

# =========================================================
# Task
# =========================================================
# for
test_includes_resource_type "Task with _include=Task:for" \
                  "Task" "_include=Task:for" "Patient"

# reason-code
test_at_least_one "Task with reason-code=http://snomed.info/sct|447886005 count" \
                  "$(search "Task" "reason-code=http://snomed.info/sct%7C447886005")"

# reason-reference
test_includes_resource_type "Task with _include=Task:reason-reference" \
                  "Task" "_include=Task:reason-reference" "Observation"