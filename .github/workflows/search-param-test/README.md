# MII CDS Search Parameter Tests

This directory contains automated tests for custom MII core data set FHIR search parameters against a Blaze FHIR server loaded with test data.

## Overview

The `test-search.sh` script provides comprehensive testing of FHIR search parameters to ensure they work correctly. The tests run against a Blaze FHIR server instance loaded with test data.

## Test Environment

- **FHIR Server**: Blaze FHIR Server
- **Test Data**: Loaded from [mii-testdata repository](https://github.com/medizininformatik-initiative/mii-testdata)
- **Search Parameters**: Blaze loads the `Bundle-mii-exa-meta-searchparam-collection-bundle.json` from this repository
- **Base URL**: `http://localhost:8080/fhir`

> **Important**: Any new search parameter tests must have corresponding test data resources present in the [mii-testdata repository](https://github.com/medizininformatik-initiative/mii-testdata). Additionally, any custom search parameter to test needs to be included in the `Bundle-mii-exa-meta-searchparam-collection-bundle.json` and loaded by Blaze.

## Test Functions

### Basic Test Functions

#### `test(description, actual, expected)`
Tests for exact equality between actual and expected values.

```bash
test "Patient count with specific ID" \
     "$(search "Patient" "identifier=123456")" \
     "1"
```

#### `test_at_least_one(description, actual)`
Tests that at least one result is returned (actual >= 1). This function is preferred over `test()` because updates to test data could add matching resources/elements, causing `test()` to fail when exact counts change, while `test_at_least_one()` remains robust.

```bash
test_at_least_one "Condition with ICD code" \
                  "$(search "Condition" "code=http://fhir.de/CodeSystem/bfarm/icd-10-gm|B05.3")"
```

### Search Functions

#### `search(resource_type, search_params)`
Performs a FHIR search and returns the total count of matching resources.

```bash
# Returns the total count of Patient resources matching the search
count=$(search "Patient" "gender=male&active=true")
```

#### `test_includes_resource_type(description, resource_type, search_params, expected_resource_type)`
Tests whether a specific resource type is included in search results (useful for `_has`, `_include`, `_revinclude` and `Reference` type search parameters).

```bash
# Test that Patient search with _include returns Practitioner resources
test_includes_resource_type "Patient search with _include=Patient:general-practitioner" \
                           "Patient" "_include=Patient:general-practitioner" "Practitioner"
```

## Adding New Search Parameter Tests

### 1. Ensure Test Data Exists

Before adding a test, verify that the required test data exists in the [mii-testdata repository](https://github.com/medizininformatik-initiative/mii-testdata). If not, you'll need to:

1. Add the necessary test resources to the mii-testdata repository
2. Ensure the GitHub Action uses an updated release with your test data

### 2. Choose the Appropriate Test Function

- Use `test()` when you know the exact expected count
- Use `test_at_least_one()` when you expect one or more results
- Use `test_includes_resource_type()` when testing `_has`, `_include`, `_revinclude` functionality

### 3. Follow the Existing Pattern

Tests are organized by resource type. Add your test in the appropriate section:

```bash
# =========================================================
# ResourceType
# =========================================================
# SearchParameter.element
test_at_least_one "ResourceType with parameter=value count" \
                  "$(search "ResourceType" "parameter=value")"
```

### 4. URL Encoding

Remember to URL-encode special characters in search parameters:

```bash
# Pipe character (|) becomes %7C
# Space becomes %20
# & in parameter values needs to be properly escaped
test_at_least_one "Device with property-type=urn:iso:std:iso:11073:10101|69684 count" \
                  "$(search "Device" "property-type=urn:iso:std:iso:11073:10101%7C69684")"
```

## Example Test Cases

### Basic Search Parameter Test

```bash
# Test a simple code search parameter
test_at_least_one "Condition with ICD-10 code B05.3" \
                  "$(search "Condition" "code=http://fhir.de/CodeSystem/bfarm/icd-10-gm%7CB05.3")"
```

### Complex Search Parameter Test

```bash
# Test multiple parameters
test "Patient with specific address components" \
     "$(search "Patient" "address-postalcode=12345&address-city=Berlin")" \
     "2"
```

### Include Parameter Test

```bash
# Test that searching MedicationStatement includes referenced Condition resources
test_includes_resource_type "MedicationStatement with _include=MedicationStatement:reason-reference" \
                           "MedicationStatement" "_include=MedicationStatement:reason-reference" "Condition"
```

### Custom Search Parameter Test

```bash
# Test MII-specific search parameters
test_at_least_one "Patient with gemeindeschluessel" \
                  "$(search "Patient" "gemeindeschluessel=http://fhir.de/sid/destatis/ags%7C11000000")"
```

## Running Tests

### Local Testing

To run the tests locally, ensure you have:

1. Blaze FHIR server running on `http://localhost:8080/fhir`
2. The search parameter collection Bundle imported into Blaze
3. Test data loaded from mii-testdata repository
4. `curl` and `jq` installed

```bash
chmod +x test-search.sh
./test-search.sh
```

### CI/CD Testing

The tests run automatically in GitHub Actions. The workflow:

1. Starts a Blaze FHIR server
2. Imports the search parameter collection Bundle
3. Loads test data from mii-testdata
4. Runs the tests
5. Reports results

## Troubleshooting

### Common Issues

1. **Test Data Missing**: Ensure your test data exists in mii-testdata repository
2. **URL Encoding**: Special characters in search parameters must be properly encoded
3. **Case Sensitivity**: FHIR search parameters are case-sensitive

### Debugging Failed Tests

1. Check if the search parameter is implemented correctly
2. Verify test data contains the expected resources
3. Test the search manually using curl:

```bash
curl -sH 'Prefer: handling=strict' \
     "http://localhost:8080/fhir/Patient?identifier=test-id" | jq
```

## Contributing

When adding new search parameter tests:

1. Follow the existing code structure and naming conventions
2. Add tests in the appropriate resource type section
3. Include comments explaining complex search parameters
4. Ensure test data exists in mii-testdata repository

## Dependencies

- **curl**: For HTTP requests to FHIR server
- **jq**: For JSON parsing
- **bash**: Shell environment with basic utilities (wc, tr, etc.)
- **Blaze FHIR Server**: Running with mii-testdata and custom search parameters loaded
