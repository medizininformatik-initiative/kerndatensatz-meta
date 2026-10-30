#!/bin/bash -e

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
BUNDLE="$SCRIPT_DIR/../../../fsh-generated/resources/Bundle-mii-exa-meta-searchparam-collection-bundle.json"

# The Bundle is SUSHI output (fsh-generated/ is not committed) — run `sushi .` first.
if [ ! -f "$BUNDLE" ]; then
  echo "Error: $BUNDLE not found — run 'sushi .' in the repository root first." >&2
  exit 1
fi

# Copy and rename the generated Bundle to search-params.json
cp "$BUNDLE" "$SCRIPT_DIR/search-params.json"
