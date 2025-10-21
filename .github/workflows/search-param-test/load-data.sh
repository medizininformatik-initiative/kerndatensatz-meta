#!/bin/bash -e

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
BASE="http://localhost:8080/fhir"
MII_TESTDATA_VERSION="v2025.0.0-dev.7"
BLAZECTL_VERSION="1.1.0"
BLAZECTL_URL="https://github.com/samply/blazectl/releases/download/v${BLAZECTL_VERSION}/blazectl-${BLAZECTL_VERSION}-linux-amd64.tar.gz"

echo "Finding testdata bundle URL..."
# Get the download URL for the testdata-bundles-ndjson file
ZIP_URL=$(curl -s "https://api.github.com/repos/medizininformatik-initiative/mii-testdata/releases/tags/${MII_TESTDATA_VERSION}" | \
  jq -r '.assets[] | select(.name | startswith("testdata-bundles-ndjson-")) | .browser_download_url')

if [ -z "$ZIP_URL" ]; then
  echo "Error: Could not find testdata-bundles-ndjson asset for version ${MII_TESTDATA_VERSION}"
  exit 1
fi

echo "Using ZIP_URL: $ZIP_URL"

echo "Installing blazectl..."
# Download blazectl
curl -LO "$BLAZECTL_URL"

# Extract blazectl
tar xzf "blazectl-${BLAZECTL_VERSION}-linux-amd64.tar.gz"

# Move to PATH
sudo mv ./blazectl /usr/local/bin/blazectl

# Verify installation
blazectl --version

echo "Downloading test data..."
# Download the NDJSON bundles zip file
curl -L -o "$SCRIPT_DIR/testdata-bundles.zip" "$ZIP_URL"

# Extract all NDJSON files from the zip
unzip -o "$SCRIPT_DIR/testdata-bundles.zip" -d "$SCRIPT_DIR/testdata"

echo "Uploading bundles to FHIR server..."
# Upload all NDJSON files using blazectl
blazectl upload --server "$BASE" "$SCRIPT_DIR/testdata"

echo "Data loading completed successfully!"