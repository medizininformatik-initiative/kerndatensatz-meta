#!/bin/bash -e

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
BASE="http://localhost:8080/fhir"
ZIP_URL="https://github.com/medizininformatik-initiative/mii-testdata/releases/download/v1.0.1/kds-testdata-2024.0.1.zip"
BUNDLE_NAME="kds-testdata-2024.0.1/resources/Bundle-mii-exa-test-data-bundle.json"

# Download the zip file
curl -L -o "$SCRIPT_DIR/kds-testdata.zip" "$ZIP_URL"

# Extract the Bundle from the zip file
unzip -o "$SCRIPT_DIR/kds-testdata.zip" "$BUNDLE_NAME" -d "$SCRIPT_DIR"

# Send the Bundle to the base URL with a POST request
curl -sH 'Content-Type: application/fhir+json' -d @"$SCRIPT_DIR/$BUNDLE_NAME" "$BASE"