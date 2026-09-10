#!/usr/bin/env bash
# Seed the FHIR package cache with the previous version(s) named by the
# `version-comparison` parameter in sushi-config.yaml, so the IG Publisher's
# PreviousVersionComparator can load them.
#
# NOTE: this covers ONE of the two prerequisites — the package cache. The
# comparator ALSO requires <canonical>/package-list.json to be fetchable
# (it takes the package id from it, even for explicit versions); MII modules
# get that with their first formal publication. See sushi-config.yaml.
#
# WHY THIS EXISTS: the publisher resolves an explicit comparison version via
# the local package cache (~/.fhir/packages/<packageId>#<version>). This
# module's packages are not on packages.fhir.org, so the cache must be seeded
# from somewhere this repository controls: the GitHub Release assets —
# module-release.yml attaches package.tgz to every release for exactly this
# purpose.
#
# Behaviour:
#   - No active `version-comparison:` parameter  -> exit 0 silently (the
#     scaffold ships the parameter commented out; a first release has nothing
#     to compare against).
#   - Version already cached                     -> skip.
#   - Release asset missing / download fails     -> ::warning and exit 0. The
#     publisher then reports the comparison as unavailable on the comparison
#     page; the build itself must not fail for a missing historical artifact
#     (skip-not-fail, like the terminology fallback).
#
# Requirements: curl, python3, tar. GITHUB_TOKEN and GITHUB_REPOSITORY are
# provided by GitHub Actions; locally, set them (or rely on a public repo,
# where the download works without a token).
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cfg="${repo_root}/sushi-config.yaml"
cache="${HOME}/.fhir/packages"

read -r pkg_id versions <<<"$(python3 - "$cfg" <<'PY'
import re, sys
pkg, vers = "", []
in_params = False
for raw in open(sys.argv[1], encoding="utf-8"):
    line = raw.rstrip("\n")
    if re.match(r"^packageId:\s*(\S+)", line):
        pkg = re.match(r"^packageId:\s*(\S+)", line).group(1)
    if re.match(r"^parameters:", line):
        in_params = True
        continue
    if in_params and re.match(r"^\S", line):
        in_params = False
    if in_params:
        m = re.match(r"^\s+version-comparison:\s*[\"']?([^\"'#\s]+)[\"']?\s*$", line)
        if m and not line.lstrip().startswith("#"):
            vers.append(m.group(1))
print(pkg, " ".join(vers))
PY
)"

if [ -z "${versions:-}" ]; then
  echo "seed-comparison-cache: no active version-comparison parameter — nothing to seed."
  exit 0
fi
if [[ "${pkg_id}" == *"{{"* ]]; then
  echo "::warning::seed-comparison-cache: packageId still holds a placeholder (${pkg_id}) — skipping."
  exit 0
fi

repo="${GITHUB_REPOSITORY:-}"
if [ -z "${repo}" ]; then
  origin="$(git -C "${repo_root}" remote get-url origin 2>/dev/null || true)"
  repo="$(printf '%s' "${origin}" | sed -E 's|.*github.com[:/]||; s|\.git$||')"
fi

# ${auth[@]+...} keeps `set -u` happy on bash 3.2 (macOS) when the array is empty.
auth=()
[ -n "${GITHUB_TOKEN:-}" ] && auth=(-H "Authorization: Bearer ${GITHUB_TOKEN}")

for v in ${versions}; do
  dest="${cache}/${pkg_id}#${v}"
  if [ -d "${dest}" ]; then
    echo "seed-comparison-cache: ${pkg_id}#${v} already cached."
    continue
  fi
  echo "seed-comparison-cache: fetching package.tgz of release v${v} from ${repo} ..."
  release_json="$(curl -fsSL ${auth[@]+"${auth[@]}"} \
      "https://api.github.com/repos/${repo}/releases/tags/v${v}" 2>/dev/null || true)"
  asset_url=""
  if [ -n "${release_json}" ]; then
    asset_url="$(printf '%s' "${release_json}" \
      | python3 -c "import json,sys; d=json.load(sys.stdin); print(next((a['url'] for a in d.get('assets',[]) if a['name']=='package.tgz'), ''))" \
      2>/dev/null || true)"
  fi
  if [ -z "${asset_url}" ]; then
    echo "::warning::seed-comparison-cache: release v${v} has no package.tgz asset — the comparison page will report the version as unavailable. Attach package.tgz to the release (module-release.yml does this automatically for new releases)."
    continue
  fi
  tmp="$(mktemp -d)"
  if curl -fsSL ${auth[@]+"${auth[@]}"} -H "Accept: application/octet-stream" \
      "${asset_url}" --output "${tmp}/package.tgz"; then
    mkdir -p "${dest}"
    tar -xzf "${tmp}/package.tgz" -C "${dest}"
    echo "seed-comparison-cache: cached ${pkg_id}#${v}."
  else
    echo "::warning::seed-comparison-cache: download failed for v${v} — the comparison page will report the version as unavailable."
  fi
  rm -rf "${tmp}"
done
