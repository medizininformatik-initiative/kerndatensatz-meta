#!/usr/bin/env bash
#
# publish-simplifier.sh — veröffentlicht das offizielle IG-Publisher-Paket
# (package.tgz der formalen Pages-Publikation) auf packages.simplifier.net.
#
# Warum nicht mehr Firely Bake: der Bake-Schritt move-conformance-resources
# filterte status='active' und warf draft-Terminologie aus dem Paket (gemessen
# in kerndatensatzmodul-proms, 2027.0.0-ballot.rc3: MIDOS2-CodeSystem und
# -ValueSets fehlten trotz answerValueSet-Referenzen). Seit der
# Template-Migration baut go-publish das maßgebliche package.tgz (inkl.
# Snapshots und vollständigem Manifest); Simplifier bekommt exakt dieses
# Artefakt, damit Registry und Publikation identisch sind.
# Übernommen aus kerndatensatzmodul-proms scripts/publish-simplifier.sh.
#
# Nutzung:
#   scripts/publish-simplifier.sh [VERSION]
#     Ohne Argument wird die Version aus publication-request.json gelesen.
#     Die Version muss bereits formal publiziert sein (go-publish, publish=true).
#
# Env-Overrides:
#   SKIP_SMOKETEST=1   überspringt das HAPI-Release-Gate (nicht empfohlen)
#
# Exit 0 = publiziert; Exit 1 = Verifikation fehlgeschlagen oder Upload-Fehler.

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

package_id="$(jq -r '."package-id"' publication-request.json)"
request_version="$(jq -r '.version' publication-request.json)"
request_path="$(jq -r '.path' publication-request.json)"
version="${1:-$request_version}"
publication_base="${request_path%/*}"
url="${publication_base}/${version}/package.tgz"

tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT

echo "Package : ${package_id}#${version}"
echo "Quelle  : ${url}"

curl -fsSL -o "${tmp}/package.tgz" "$url" || {
  echo "FEHLER: package.tgz nicht abrufbar — ist ${version} formal publiziert?" >&2
  exit 1
}

manifest_id="$(tar -xzOf "${tmp}/package.tgz" package/package.json | jq -r '.name')"
manifest_version="$(tar -xzOf "${tmp}/package.tgz" package/package.json | jq -r '.version')"
if [[ "${manifest_id}#${manifest_version}" != "${package_id}#${version}" ]]; then
  echo "FEHLER: Manifest ${manifest_id}#${manifest_version} passt nicht zu ${package_id}#${version}." >&2
  exit 1
fi

if [[ "${SKIP_SMOKETEST:-}" != "1" ]]; then
  scripts/hapi-smoketest.sh "${tmp}/package.tgz"
else
  echo "WARNUNG: HAPI-Smoke-Test übersprungen (SKIP_SMOKETEST=1)." >&2
fi

tarball="${tmp}/${package_id}-${version}.tgz"
cp "${tmp}/package.tgz" "$tarball"
fhir publish-package "$tarball"
echo "OK — ${package_id}#${version} auf Simplifier publiziert."
