#!/bin/bash -e

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
BASE="http://localhost:8080/fhir"
ZIP_URL="https://github.com/medizininformatik-initiative/mii-testdata/releases/download/v2025.0.0-dev.3/testdata-bundles-ndjson-20250729-142729.zip"
BLAZECTL_VERSION="1.0.0"
BLAZECTL_URL="https://github.com/samply/blazectl/releases/download/v${BLAZECTL_VERSION}/blazectl-${BLAZECTL_VERSION}-linux-amd64.tar.gz"

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