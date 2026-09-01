#!/usr/bin/env bash

set -euo pipefail

if [[ $# -lt 1 || $# -gt 2 ]]; then
  echo "Usage: scripts/copy-localized-table-backgrounds.sh <output-directory> [--check]" >&2
  exit 2
fi

output_directory="${1%/}"
mode="${2:-copy}"
if [[ "${mode}" != "copy" && "${mode}" != "--check" ]]; then
  echo "Unknown mode: ${mode}" >&2
  exit 2
fi
if [[ ! -d "${output_directory}" ]]; then
  echo "Output directory does not exist: ${output_directory}" >&2
  exit 1
fi

shopt -s nullglob
table_backgrounds=("${output_directory}"/tbl_bck*.png)
copied=0
missing=0

for language_directory in \
  "${output_directory}/en" \
  "${output_directory}/de"; do
  [[ -d "${language_directory}" ]] || continue

  for source in "${table_backgrounds[@]}"; do
    [[ -f "${source}" ]] || continue
    destination="${language_directory}/${source##*/}"
    [[ -f "${destination}" ]] && continue

    if [[ "${mode}" == "--check" ]]; then
      echo "Missing localized table background: ${destination}" >&2
      missing=$((missing + 1))
    else
      cp "${source}" "${destination}"
      copied=$((copied + 1))
    fi
  done
done

if [[ "${mode}" == "--check" && "${missing}" -ne 0 ]]; then
  echo "Found ${missing} missing localized table background file(s)." >&2
  exit 1
fi

if [[ "${mode}" == "--check" ]]; then
  echo "Localized table backgrounds are complete."
else
  echo "Copied ${copied} missing localized table background file(s)."
fi
