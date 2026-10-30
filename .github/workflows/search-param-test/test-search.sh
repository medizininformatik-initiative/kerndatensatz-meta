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
# encounter
test_includes_resource_type "AdverseEvent with _include=AdverseEvent:encounter" \
                           "AdverseEvent" "_include=AdverseEvent:encounter" "Encounter"

# instance
test_includes_resource_type "AdverseEvent with _include=AdverseEvent:instance" \
                           "AdverseEvent" "_include=AdverseEvent:instance" "Procedure"

# =========================================================
# BodyStructure
# =========================================================
# location-qualifier
test_at_least_one "BodyStructure with location-qualifier=http://snomed.info/sct|7771000 count" \
                  "$(search "BodyStructure" "location-qualifier=http://snomed.info/sct%7C7771000")"

# =========================================================
# CarePlan
# =========================================================
# TODO: Add tests for CarePlan.contributor

# addresses
test_includes_resource_type "CarePlan with _include=CarePlan:addresses" \
                           "CarePlan" "_include=CarePlan:addresses" "Condition"

# created
test_at_least_one "CarePlan with created=2024-03-28 count" \
                  "$(search "CarePlan" "created=2024-03-28")"

# description
test_at_least_one "CarePlan with description=The patient count" \
                  "$(search "CarePlan" "description=The%20patient")"

# supporting-info
test_includes_resource_type "CarePlan with _include=CarePlan:supporting-info" \
                           "CarePlan" "_include=CarePlan:supporting-info" "DiagnosticReport"

# =========================================================
# Composition
# =========================================================
# Composition.section.author
test_includes_resource_type "Composition with _include=Composition:section-author" \
                  "Composition" "_include=Composition:section-author" "Practitioner"

# attester-mode
test_at_least_one "Composition with attester-mode=legal count" \
                  "$(search "Composition" "attester-mode=legal")"

# custodian
test_includes_resource_type "Composition with _include=Composition:custodian" \
                           "Composition" "_include=Composition:custodian" "Organization"

# relates-to-code
test_at_least_one "Composition with relates-to-code=replaces count" \
                  "$(search "Composition" "relates-to-code=replaces")"

# section-title
test_at_least_one "Composition with section-title=Diagnostic Report count" \
                  "$(search "Composition" "section-title=Diagnostic%20Report")"

# =========================================================
# Condition
# =========================================================
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

# asserted-date
test_at_least_one "Condition with asserted-date=2020-03-15 count" \
                  "$(search "Condition" "asserted-date=2020-03-15")"

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
test_at_least_one "Consent with Consent.provision.provision.type=permit and Consent.provision.provision.code=urn:oid:2.16.840.1.113883.3.1937.777.24.5.3%7C2.16.840.1.113883.3.1937.777.24.5.3.7 count" \
                    "$(search "Consent" "mii-provision-provision-code-type=urn:oid:2.16.840.1.113883.3.1937.777.24.5.3%7C2.16.840.1.113883.3.1937.777.24.5.3.7%24permit")"

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

# conclusion-text
test_at_least_one "DiagnosticReport with conclusion-text=There are count" \
                  "$(search "DiagnosticReport" "conclusion-text=There%20are")"

# =========================================================
# DocumentReference
# =========================================================
# size
test_at_least_one "DocumentReference with size=986112 count" \
                  "$(search "DocumentReference" "size=986112")"

# title
test_at_least_one "DocumentReference with title=Kolon-Organoid Kulturprotokoll count" \
                  "$(search "DocumentReference" "title=Kolon-Organoid%20Kulturprotokoll")"

# creation
test_at_least_one "DocumentReference with creation=2024-02-20 count" \
                  "$(search "DocumentReference" "creation=2024-02-20")"

# doc-status
test_at_least_one "DocumentReference with doc-status=final count" \
                  "$(search "DocumentReference" "doc-status=final")"

# nlp-processing-status
test_at_least_one "DocumentReference with nlp-processing-status=https://www.medizininformatik-initiative.de/fhir/ext/modul-dokument/CodeSystem/mii-cs-dokument-nlp-processing-status|unprocessed count" \
                  "$(search "DocumentReference" "nlp-processing-status=https://www.medizininformatik-initiative.de/fhir/ext/modul-dokument/CodeSystem/mii-cs-dokument-nlp-processing-status%7Cunprocessed")"

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
# characteristicDescription
test_at_least_one "EvidenceVariable with characteristicDescription=Alter mindestens count" \
                  "$(search "EvidenceVariable" "characteristicDescription=Alter%20mindestens")"

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
# ImagingStudy
# =========================================================
# ImagingStudy.series modality-body-site
test_at_least_one "ImagingStudy with modality-body-site=http://dicom.nema.org/resources/ontology/DCM|MR\$http://snomed.info/sct|76752008 count" \
                  "$(search "ImagingStudy" "modality-body-site=http://dicom.nema.org/resources/ontology/DCM%7CMR%24http://snomed.info/sct%7C76752008")"

# description
test_at_least_one "ImagingStudy with description=Mamma count" \
                  "$(search "ImagingStudy" "description=Mamma")"

# bildgebungsgrund
test_at_least_one "ImagingStudy with bildgebungsgrund=Verdacht auf count" \
                  "$(search "ImagingStudy" "bildgebungsgrund=Verdacht%20auf")"

# instance-image-type
test_at_least_one "ImagingStudy with instance-image-type=https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/CodeSystem/mii-cs-bildgebung-instance-image-type|ORIGINAL count" \
                  "$(search "ImagingStudy" "instance-image-type=https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/CodeSystem/mii-cs-bildgebung-instance-image-type%7CORIGINAL")"

# instance-number
test_at_least_one "ImagingStudy with instance-number=28 count" \
                  "$(search "ImagingStudy" "instance-number=28")"

# study-modality
test_at_least_one "ImagingStudy with study-modality=http://dicom.nema.org/resources/ontology/DCM|MR count" \
                  "$(search "ImagingStudy" "study-modality=http://dicom.nema.org/resources/ontology/DCM%7CMR")"

# number-instances
test_at_least_one "ImagingStudy with number-instances=294 count" \
                  "$(search "ImagingStudy" "number-instances=294")"

# number-series
test_at_least_one "ImagingStudy with number-series=11 count" \
                  "$(search "ImagingStudy" "number-series=11")"

# procedure-reference
test_includes_resource_type "ImagingStudy with _include=ImagingStudy:procedure-reference" \
                           "ImagingStudy" "_include=ImagingStudy:procedure-reference" "Procedure"

# contrast-bolus-details
test_includes_resource_type "ImagingStudy with _include=ImagingStudy:contrast-bolus-details" \
                           "ImagingStudy" "_include=ImagingStudy:contrast-bolus-details" "MedicationAdministration"

# contrast-bolus
test_at_least_one "ImagingStudy with contrast-bolus=true count" \
                  "$(search "ImagingStudy" "contrast-bolus=true")"

# series-laterality
test_at_least_one "ImagingStudy with series-laterality=http://snomed.info/sct|419161000 count" \
                  "$(search "ImagingStudy" "series-laterality=http://snomed.info/sct%7C419161000")"

# series-number
test_at_least_one "ImagingStudy with series-number=9 count" \
                  "$(search "ImagingStudy" "series-number=9")"

# scanning-sequence-variant
test_at_least_one "ImagingStudy with scanning-sequence-variant=https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/CodeSystem/mii-cs-bildgebung-scanning-sequence-variant|SP count" \
                  "$(search "ImagingStudy" "scanning-sequence-variant=https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/CodeSystem/mii-cs-bildgebung-scanning-sequence-variant%7CSP")"

# scanning-sequence
test_at_least_one "ImagingStudy with scanning-sequence=https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/CodeSystem/mii-cs-bildgebung-scanning-sequence|SE count" \
                  "$(search "ImagingStudy" "scanning-sequence=https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/CodeSystem/mii-cs-bildgebung-scanning-sequence%7CSE")"

# series-started
test_at_least_one "ImagingStudy with series-started=2024-07-19 count" \
                  "$(search "ImagingStudy" "series-started=2024-07-19")"

# reason-reference
test_includes_resource_type "ImagingStudy with _include=ImagingStudy:reason-reference" \
                           "ImagingStudy" "_include=ImagingStudy:reason-reference" "Condition"

# instance-pixel-spacing-x
test_at_least_one "ImagingStudy with instance-pixel-spacing-x=0.260417 count" \
                  "$(search "ImagingStudy" "instance-pixel-spacing-x=0.260417")"

# instance-pixel-spacing-y
test_at_least_one "ImagingStudy with instance-pixel-spacing-y=0.260417 count" \
                  "$(search "ImagingStudy" "instance-pixel-spacing-y=0.260417")"

# instance-slice-thickness
test_at_least_one "ImagingStudy with instance-slice-thickness=3 count" \
                  "$(search "ImagingStudy" "instance-slice-thickness=3")"

# echo-time
test_at_least_one "ImagingStudy with echo-time=388 count" \
                  "$(search "ImagingStudy" "echo-time=388")"

# flip-angle
test_at_least_one "ImagingStudy with flip-angle=130 count" \
                  "$(search "ImagingStudy" "flip-angle=130")"

# inversion-time
test_at_least_one "ImagingStudy with inversion-time=900 count" \
                  "$(search "ImagingStudy" "inversion-time=900")"

# magnetic-field-strength
test_at_least_one "ImagingStudy with magnetic-field-strength=3 count" \
                  "$(search "ImagingStudy" "magnetic-field-strength=3")"

# repetition-time
test_at_least_one "ImagingStudy with repetition-time=5000 count" \
                  "$(search "ImagingStudy" "repetition-time=5000")"

# =========================================================
# Library
# =========================================================
# quellregister
test_at_least_one "Library with quellregister=true count" \
                  "$(search "Library" "quellregister=true")"

# relatedArtifactUrl
test_at_least_one "Library with relatedArtifactUrl=https://drks.de/ count" \
                  "$(search "Library" "relatedArtifactUrl=https://drks.de/")"

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

# --- MedicationStatement ---

# dose-quantity
test_at_least_one "MedicationStatement with dose-quantity=80|http://unitsofmeasure.org|mg count" \
                  "$(search "MedicationStatement" "dose-quantity=80%7Chttp://unitsofmeasure.org%7Cmg")"

# doserange-high
test_at_least_one "MedicationStatement with doserange-high=80|http://unitsofmeasure.org|mg count" \
                  "$(search "MedicationStatement" "doserange-high=80%7Chttp://unitsofmeasure.org%7Cmg")"

# doserange-low
test_at_least_one "MedicationStatement with doserange-low=40|http://unitsofmeasure.org|mg count" \
                  "$(search "MedicationStatement" "doserange-low=40%7Chttp://unitsofmeasure.org%7Cmg")"

# ratequantity
test_at_least_one "MedicationStatement with ratequantity=3.3|http://unitsofmeasure.org|mg/h count" \
                  "$(search "MedicationStatement" "ratequantity=3.3%7Chttp://unitsofmeasure.org%7Cmg/h")"

# raterange-high
test_at_least_one "MedicationStatement with raterange-high=4|http://unitsofmeasure.org|mg/h count" \
                  "$(search "MedicationStatement" "raterange-high=4%7Chttp://unitsofmeasure.org%7Cmg/h")"

# raterange-low
test_at_least_one "MedicationStatement with raterange-low=2|http://unitsofmeasure.org|mg/h count" \
                  "$(search "MedicationStatement" "raterange-low=2%7Chttp://unitsofmeasure.org%7Cmg/h")"

# rateratio-denominator
test_at_least_one "MedicationStatement with rateratio-denominator=1|http://unitsofmeasure.org|d count" \
                  "$(search "MedicationStatement" "rateratio-denominator=1%7Chttp://unitsofmeasure.org%7Cd")"

# rateratio-numerator
test_at_least_one "MedicationStatement with rateratio-numerator=80|http://unitsofmeasure.org|mg count" \
                  "$(search "MedicationStatement" "rateratio-numerator=80%7Chttp://unitsofmeasure.org%7Cmg")"

# dosage-route
test_at_least_one "MedicationStatement with dosage-route=http://snomed.info/sct|26643006 count" \
                  "$(search "MedicationStatement" "dosage-route=http://snomed.info/sct%7C26643006")"

# --- MedicationRequest ---

# dosage-route
test_at_least_one "MedicationRequest with dosage-route=http://snomed.info/sct|26643006 count" \
                  "$(search "MedicationRequest" "dosage-route=http://snomed.info/sct%7C26643006")"

# dosage-site
test_at_least_one "MedicationRequest with dosage-site=http://snomed.info/sct|123851003 count" \
                  "$(search "MedicationRequest" "dosage-site=http://snomed.info/sct%7C123851003")"

# --- MedicationAdministration ---

# dose-quantity
test_at_least_one "MedicationAdministration with dose-quantity=111|http://unitsofmeasure.org|mL count" \
                  "$(search "MedicationAdministration" "dose-quantity=111%7Chttp://unitsofmeasure.org%7CmL")"

# ratequantity
test_at_least_one "MedicationAdministration with ratequantity=111|http://unitsofmeasure.org|mL/min count" \
                  "$(search "MedicationAdministration" "ratequantity=111%7Chttp://unitsofmeasure.org%7CmL/min")"

# rateratio-denominator
test_at_least_one "MedicationAdministration with rateratio-denominator=1|http://unitsofmeasure.org|min count" \
                  "$(search "MedicationAdministration" "rateratio-denominator=1%7Chttp://unitsofmeasure.org%7Cmin")"

# rateratio-numerator
test_at_least_one "MedicationAdministration with rateratio-numerator=30|http://unitsofmeasure.org|mL count" \
                  "$(search "MedicationAdministration" "rateratio-numerator=30%7Chttp://unitsofmeasure.org%7CmL")"

# dosage-site
test_at_least_one "MedicationAdministration with dosage-site=http://snomed.info/sct|368208006 count" \
                  "$(search "MedicationAdministration" "dosage-site=http://snomed.info/sct%7C368208006")"

# reason-reference
test_includes_resource_type "MedicationAdministration with _include=MedicationAdministration:reason-reference" \
                           "MedicationAdministration" "_include=MedicationAdministration:reason-reference" "Condition"

# =========================================================
# Observation
# =========================================================
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

# TODO: value-ratio

# body-site
test_at_least_one "Observation with body-site=http://snomed.info/sct|76752008 count" \
                  "$(search "Observation" "body-site=http://snomed.info/sct%7C76752008")"

# component-interpretation
test_at_least_one "Observation with component-interpretation=http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation|N count" \
                  "$(search "Observation" "component-interpretation=http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation%7CN")"

# reference-range-high
test_at_least_one "Observation with reference-range-high=3000|http://unitsofmeasure.org|mL count" \
                  "$(search "Observation" "reference-range-high=3000%7Chttp://unitsofmeasure.org%7CmL")"

# reference-range-low
test_at_least_one "Observation with reference-range-low=1000|http://unitsofmeasure.org|mL count" \
                  "$(search "Observation" "reference-range-low=1000%7Chttp://unitsofmeasure.org%7CmL")"

# series-uid
test_at_least_one "Observation with series-uid=1.2.34.5.6789.1.2.34.5678912.34567891234567891234 count" \
                  "$(search "Observation" "series-uid=1.2.34.5.6789.1.2.34.5678912.34567891234567891234")"

# sop-instance-uid
test_at_least_one "Observation with sop-instance-uid=1.2.34.5.6789.1.2.3.45678.9123456789123456789123456789 count" \
                  "$(search "Observation" "sop-instance-uid=1.2.34.5.6789.1.2.3.45678.9123456789123456789123456789")"

# value-ratio-denominator
test_at_least_one "Observation with value-ratio-denominator=128|http://unitsofmeasure.org|{titer} count" \
                  "$(search "Observation" "value-ratio-denominator=128%7Chttp://unitsofmeasure.org%7C%7Btiter%7D")"

# value-ratio-numerator
test_at_least_one "Observation with value-ratio-numerator=1|http://unitsofmeasure.org|{titer} count" \
                  "$(search "Observation" "value-ratio-numerator=1%7Chttp://unitsofmeasure.org%7C%7Btiter%7D")"

# =========================================================
# Patient
# =========================================================
# adresszusatz
test "Patient with adresszusatz=Burg count" \
     "$(search "Patient" "adresszusatz=Burg")" \
     "0"

test_at_least_one "Patient with adresszusatz=Schloss count" \
     "$(search "Patient" "adresszusatz=Schloss")"

# Patient assigner-pid
test_at_least_one "Patient with assigner-pid=http://fhir.de/sid/arge-ik/iknr|123456789 count" \
     "$(search "Patient" "assigner-pid=http://fhir.de/sid/arge-ik/iknr|123456789")" 

# ResearchSubject consent
# test "ResearchSubject with consent=Consent/mii-exa-test-data-patient-1-consent-1 count" "$(search "ResearchSubject" "consent=Consent/mii-exa-test-data-patient-1-consent-1")" "1"

# Patient gemeindeschluessel
test_at_least_one "Patient with gemeindeschluessel=http://fhir.de/sid/destatis/ags|11000000 count" \
     "$(search "Patient" "gemeindeschluessel=http://fhir.de/sid/destatis/ags|11000000")"

# Patient strasse hausnummer stadtteil
test_at_least_one "Patient with strasse=Dorfstraße&hausnummer=9&stadtteil=Malchow count" \
     "$(search "Patient" "strasse=Dorfstraße&hausnummer=9&stadtteil=Malchow")"

# Patient gender other-amtlich
test_at_least_one "Patient with other-amtlich=http://fhir.de/CodeSystem/gender-amtlich-de|D count" \
    "$(search "Patient" "other-amtlich=http://fhir.de/CodeSystem/gender-amtlich-de|D")"

# Patient postfach
# TODO
# test "Patient with postfach=Postfach count" \
#      "$(search "Patient" "postfach=Postfach-252618")" 
#      "1"

# Patient prefix
test_at_least_one "Patient with prefix=Prinz von Preußen count" \
     "$(search "Patient" "prefix=Prinz%20von%20Preußen")"

# prefix-qualifier
test_at_least_one "Patient with prefix-qualifier=NB count" \
     "$(search "Patient" "prefix-qualifier=NB")"

# stadtteil
test_at_least_one "Patient with stadtteil=Malchow count" \
     "$(search "Patient" "stadtteil=Malchow")"

# strasse
test_at_least_one "Patient with strasse=Dorfstraße count" \
     "$(search "Patient" "strasse=Dorfstraße")"

# postfach
test_at_least_one "Patient with postfach=Postfach-252618 count" \
                  "$(search "Patient" "postfach=Postfach-252618")"

# =========================================================
# Procedure
# =========================================================
# bodySite
test_at_least_one "Procedure with bodySite=http://snomed.info/sct|44714003 count" \
                  "$(search "Procedure" "bodySite=http://snomed.info/sct%7C44714003")"

# dokumentationsdatum
test_at_least_one "Procedure with dokumentationsdatum=2024-02-20 count" \
                  "$(search "Procedure" "dokumentationsdatum=2024-02-20")"

# durchfuehrungsabsicht
test_at_least_one "Procedure with durchfuehrungsabsicht=http://snomed.info/sct|262202000 count" \
                  "$(search "Procedure" "durchfuehrungsabsicht=http://snomed.info/sct%7C262202000")"

# recorder
test_includes_resource_type "Procedure with _include=Procedure:recorder" \
                  "Procedure" "_include=Procedure:recorder" "PractitionerRole"

# Suchparameter: ops-seitenlokalisation
test_at_least_one "Procedure.code Seitenlokalisation 5-322.d1/R count" \
     "$(search "Procedure" "code=http://fhir.de/CodeSystem/bfarm/ops%7C5-322.d1&ops-seitenlokalisation=$R")"

# complication
test_at_least_one "Procedure with complication=https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-operation-komplikation|N count" \
                  "$(search "Procedure" "complication=https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-operation-komplikation%7CN")"

# outcome
test_at_least_one "Procedure with outcome=http://snomed.info/sct|385669000 count" \
                  "$(search "Procedure" "outcome=http://snomed.info/sct%7C385669000")"

# report
test_includes_resource_type "Procedure with _include=Procedure:report" \
                           "Procedure" "_include=Procedure:report" "DiagnosticReport"

# =========================================================
# ResearchStudy
# =========================================================
# akronym
test_at_least_one "ResearchStudy with akronym=NSCLC-EGFR-III count" \
                  "$(search "ResearchStudy" "akronym=NSCLC-EGFR-III")"

# armName
test_at_least_one "ResearchStudy with armName=Arm A: Osimertinib count" \
                  "$(search "ResearchStudy" "armName=Arm%20A:%20Osimertinib")"

# finanzierung
test_at_least_one "ResearchStudy with finanzierung=Industriefinanzierte Studie count" \
                  "$(search "ResearchStudy" "finanzierung=Industriefinanzierte%20Studie")"

# label
test_at_least_one "ResearchStudy with label=Phase-III-Studie zu count" \
                  "$(search "ResearchStudy" "label=Phase-III-Studie%20zu")"

# rekrutierungsstand-datum
test_at_least_one "ResearchStudy with rekrutierungsstand-datum=2024-06-01 count" \
                  "$(search "ResearchStudy" "rekrutierungsstand-datum=2024-06-01")"

# rekrutierungsstand-genauigkeit
test_at_least_one "ResearchStudy with rekrutierungsstand-genauigkeit=exakt count" \
                  "$(search "ResearchStudy" "rekrutierungsstand-genauigkeit=exakt")"

# rekrutierungsstand
test_at_least_one "ResearchStudy with rekrutierungsstand=120 count" \
                  "$(search "ResearchStudy" "rekrutierungsstand=120")"

# rekrutierungsstart
test_at_least_one "ResearchStudy with rekrutierungsstart=2024-01-01 count" \
                  "$(search "ResearchStudy" "rekrutierungsstart=2024-01-01")"

# rekrutierungsziel
test_at_least_one "ResearchStudy with rekrutierungsziel=300 count" \
                  "$(search "ResearchStudy" "rekrutierungsziel=300")"

# studienregister
test_includes_resource_type "ResearchStudy with _include=ResearchStudy:studienregister" \
                           "ResearchStudy" "_include=ResearchStudy:studienregister" "Library"

# =========================================================
# ResearchSubject
# =========================================================
# consent
test_includes_resource_type "ResearchSubject with _include=ResearchSubject:consent" \
                           "ResearchSubject" "_include=ResearchSubject:consent" "Consent"

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
test_includes_resource_type "Specimen with _include=Specimen:processing-additive" \
                           "Specimen" "_include=Specimen:processing-additive" "Substance"

# processing-date
test_at_least_one "Specimen with processing-date=2024-02-15 count" \
                  "$(search "Specimen" "processing-date=2024-02-15")"

# processing-procedure
test_at_least_one "Specimen with processing-procedure=http://snomed.info/sct|1186936003 count" \
                  "$(search "Specimen" "processing-procedure=http://snomed.info/sct%7C1186936003")"

# request
test_includes_resource_type "Specimen with _include=Specimen:request" \
                           "Specimen" "_include=Specimen:request" "ServiceRequest"

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
