#!/bin/bash -e

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

# Copy and rename the pregenerated Bundle to search-params.json
cp "$SCRIPT_DIR"/../../../fsh-generated/resources/Bundle-mii-exa-meta-searchparam-collection-bundle.json "$SCRIPT_DIR/search-params.json"