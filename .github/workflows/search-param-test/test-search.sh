#!/bin/bash -e

test() {
  if [ "$2" = "$3" ]; then
    echo "OK 👍: the $1 is $3"
  else
    echo "Fail 😞: the $1 is $2, expected $3"
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

# PERSON
# Patient adresszusatz
test "Patient with adresszusatz=Burg count" "$(search "Patient" "adresszusatz=Burg")" "0"
test "Patient with adresszusatz=Schloss count" "$(search "Patient" "adresszusatz=Schloss")" "1"

# Patient assigner-pid
test "Patient with assigner-pid=http://fhir.de/sid/arge-ik/iknr|123456789 count" "$(search "Patient" "assigner-pid=http://fhir.de/sid/arge-ik/iknr|123456789")" "1"

# ResearchSubject consent
# test "ResearchSubject with consent=Consent/mii-exa-test-data-patient-1-consent-1 count" "$(search "ResearchSubject" "consent=Consent/mii-exa-test-data-patient-1-consent-1")" "1"

# Patient gemeindeschluessel
test "Patient with gemeindeschluessel=http://fhir.de/sid/destatis/ags|11000000 count" "$(search "Patient" "gemeindeschluessel=http://fhir.de/sid/destatis/ags|11000000")" "1"

# Patient strasse hausnummer stadtteil
test "Patient with strasse=Dorfstraße&hausnummer=9&stadtteil=Malchow count" "$(search "Patient" "strasse=Dorfstraße&hausnummer=9&stadtteil=Malchow")" "1"

# Patient gender other-amtlich
test "Patient with other-amtlich=http://fhir.de/CodeSystem/gender-amtlich-de|D count" "$(search "Patient" "other-amtlich=http://fhir.de/CodeSystem/gender-amtlich-de|D")" "1"

# Patient postfach
test "Patient with postfach=Postfach count" "$(search "Patient" "postfach=Postfach")" "1"

# Patient prefix
test "Patient with prefix=Prinz von Preußen&prefix-qualifier=NB count" "$(search "Patient" "prefix=Prinz%20von%20Preußen&prefix-qualifier=NB")" "1"


# DIAGNOSE
# Condition code
B05_3="http://fhir.de/CodeSystem/bfarm/icd-10-gm|B05.3"
H67_1="http://fhir.de/CodeSystem/bfarm/icd-10-gm|H67.1"
A="https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_ICD_DIAGNOSESICHERHEIT|A"
G="https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_ICD_DIAGNOSESICHERHEIT|G"
L="https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_ICD_SEITENLOKALISATION|L"
R="https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_ICD_SEITENLOKALISATION|R"
B="https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_ICD_SEITENLOKALISATION|B"
M="http://fhir.de/CodeSystem/icd-10-gm-mehrfachcodierungs-kennzeichen|*"
E="http://fhir.de/CodeSystem/icd-10-gm-mehrfachcodierungs-kennzeichen|†"

# Suchparameter: code (zu Vergleichszwecken)
test "Condition.code B05.3 count" "$(search "Condition" "code=$B05_3")" "1"
test "Condition.code H67.1 count" "$(search "Condition" "code=$H67_1")" "1"

# Suchparameter: icd10gm-diagnosesicherheit
test "Condition.code Diagnosesicherheit B05.3/A count" "$(search "Condition" "code=$B05_3&icd10gm-diagnosesicherheit=$A")" "0"
test "Condition.code Diagnosesicherheit B05.3/G count" "$(search "Condition" "code=$B05_3&icd10gm-diagnosesicherheit=$G")" "1"

# Suchparameter: icd10gm-seitenlokalisation
test "Condition.code Seitenlokalisation B05.3/B count" "$(search "Condition" "code=$B05_3&icd10gm-seitenlokalisation=$B")" "1"
test "Condition.code Seitenlokalisation B05.3/R count" "$(search "Condition" "code=$B05_3&icd10gm-seitenlokalisation=$R")" "0"

# Suchparameter: icd10gm-mehrfachcodierung
test "Condition.code Mehrfachcodierung B05.3/M count" "$(search "Condition" "code=$B05_3&icd10gm-mehrfachcodierung=$M")" "0"
test "Condition.code Mehrfachcodierung B05.3/E count" "$(search "Condition" "code=$B05_3&icd10gm-mehrfachcodierung=$E")" "1"
# test "Condition.code Mehrfachcodierung M73.04/M count" "$(search "Condition" "code=$M73_04&icd10gm-mehrfachcodierung=$M")" "1"
# test "Condition.code Mehrfachcodierung M73.04/E count" "$(search "Condition" "code=$M73_04&icd10gm-mehrfachcodierung=$E")" "0"

