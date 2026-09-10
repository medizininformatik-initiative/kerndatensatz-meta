#!/usr/bin/env bash
# self-check-substitute.sh — substitute the documented SELF-CHECK values into
# WORKSPACE copies of this template repository's build inputs, so the template
# repo's own CI can prove the pipeline builds.
#
# WHY THIS EXISTS AS A SCRIPT
#   This repository ships {{PLACEHOLDER}} values so a module author starts from
#   a documented scaffold; it is therefore not buildable as-is. The substitution
#   used to live inline in .github/workflows/ig-publisher.yml. A SECOND build
#   workflow now needs exactly the same substitution — release-demo.yml, which
#   renders the demo the Pages root index advertises. Two copies of an
#   80-line table is how the two builds silently drift apart, which is the
#   class of bug release-demo.yml exists to end. So the table lives here, once,
#   and both workflows call this script.
#
#   THE TEMPLATE REPO ONLY. In a module created from this template every
#   placeholder is already replaced, so both workflows gate the call on the
#   repository name and this script never runs there.
#
# WHAT IT TOUCHES
#   sushi-config.yaml, ig.ini and every build input under input/ — contents AND
#   file names (input/translations/de/ImplementationGuide-mii-ig-{{MODULE_SLUG}}.po
#   must be RENAMED as well as substituted, or the publisher silently ignores it
#   and German pages fall back to English titles). Nothing is ever committed:
#   the workflows do not push source.
#
# THE DEMO VERSION — SELF_CHECK_RELEASE_TAG
#   CALVER_VERSION is what the rendered demo displays as its version. Left to
#   its default it is a fixed draft value, which is right for a branch preview.
#   For a RELEASE demo that default is exactly the defect this script's caller
#   fixes: the published demo used to claim a version unrelated to the release
#   it was promoted for (demo/v0.5.2/ rendered "… v2026.0.0"). Set
#   SELF_CHECK_RELEASE_TAG=vX.Y.Z and CALVER_VERSION becomes
#   <CALVER_YEAR>.0.0-template.X.Y.Z — the MII CalVer shape the scaffold
#   teaches, carrying the template release it was built from, so the render
#   cannot claim a different one. release-demo.yml asserts the built
#   ImplementationGuide carries exactly this value.
#
# USAGE
#   bash scripts/self-check-substitute.sh [--root <dir>]
#     --root   repository root to operate on (default: current directory)
#   env SELF_CHECK_RELEASE_TAG   optional release tag, e.g. v0.5.2
#
# Exit code: 0 on success; non-zero if any placeholder survives (see the guards
# at the end) or the arguments are wrong.
set -euo pipefail

ROOT="."
while [ $# -gt 0 ]; do
  case "$1" in
    --root) ROOT="${2:?--root needs a directory}"; shift 2;;
    -h|--help) sed -n '2,45p' "$0"; exit 0;;
    *) echo "self-check-substitute: unknown argument '$1'" >&2; exit 2;;
  esac
done
cd "${ROOT}"

# ── the self-check value table — THE single source of truth ──────────────────
# Derived from the placeholder table at the top of sushi-config.yaml. These
# stand in only so the template repo's OWN CI can prove the pipeline builds; a
# real module replaces them. MODULE_SLUG drives id/packageId/canonical. The
# rendered IG is the module template itself — NOT a "demo module": this scaffold
# is a starting point for a new MII KDS module IG, or a migration target for an
# existing Simplifier MII IG.
CALVER_YEAR="2027"

# CALVER_VERSION: fixed draft for a preview; tag-derived for a release demo.
if [ -n "${SELF_CHECK_RELEASE_TAG:-}" ]; then
  tag="${SELF_CHECK_RELEASE_TAG}"
  case "${tag}" in
    v[0-9]*.[0-9]*.[0-9]*) ;;
    *) echo "self-check-substitute: SELF_CHECK_RELEASE_TAG='${tag}' is not a vMAJOR.MINOR.PATCH tag" >&2; exit 2;;
  esac
  CALVER_VERSION="${CALVER_YEAR}.0.0-template.${tag#v}"
else
  CALVER_VERSION="${CALVER_YEAR}.0.0-draft.1"
fi

placeholders="$(mktemp)"
trap 'rm -f "${placeholders}"' EXIT
cat > "${placeholders}" <<PLACEHOLDERS
MODULE_SLUG|template
MODULE_NAME|Template
MODULE_TITLE|Module Template
MODULE_DESCRIPTION|Self-check build of the mii-kds-module-template scaffold. This repository is a template for creating a new MII KDS module Implementation Guide, or a migration target for an existing Simplifier MII IG. Every value here is a placeholder — replace them all when you create a real module.
CALVER_VERSION|${CALVER_VERSION}
CALVER_YEAR|${CALVER_YEAR}
RELEASE_DATE|2027-01-01
COPYRIGHT_START_YEAR|2027
APPROVAL_DATE|2027-01-01
MODULE_AUTHOR_EMAIL|noreply@example.org
TOPIC_NCI_CODE|C15607
GITHUB_ORG|medizininformatik-initiative
REPO_NAME|mii-kds-module-template
PLACEHOLDERS

subst() { # $1=file  (stdin: KEY|VALUE lines)
  local file="$1" key val esc tmp
  while IFS='|' read -r key val; do
    [ -z "${key}" ] && continue
    esc="$(printf '%s' "${val}" | sed -e 's/[&/\]/\\&/g')"
    # NOT `sed -i`: that flag takes an argument on BSD sed and none on GNU sed,
    # so an in-place edit that works on the CI runner fails on a maintainer's
    # macOS when they run scripts/self-check-substitute.test.mjs. Redirecting
    # through a temp file and writing back with `cat` is portable AND keeps the
    # target's inode and permissions. The `s///` expression itself is identical
    # under both seds.
    tmp="$(mktemp)"
    sed "s/{{${key}}}/${esc}/g" "${file}" > "${tmp}"
    cat "${tmp}" > "${file}"
    rm -f "${tmp}"
  done
}

# sushi-config.yaml + ig.ini (ig.ini's `ig =` line references
# ImplementationGuide-mii-ig-{{MODULE_SLUG}}.json; the `template =` line is left
# untouched — it already names a buildable template: the repository-URL default,
# or the vendored ig-template/ fallback).
subst sushi-config.yaml < "${placeholders}"
subst ig.ini < "${placeholders}"

# EVERY build input that may carry a placeholder — not just the narrative pages.
# FSH is compiled by SUSHI, so an unsubstituted {{...}} there is a hard type
# error ("Cannot assign string value: ... does not match element type: id"), and
# input/resources JSON is read by the publisher.
find input -type f \( -name '*.md' -o -name '*.xml' -o -name '*.fsh' -o -name '*.json' -o -name '*.po' \) 2>/dev/null | while read -r page; do
  subst "${page}" < "${placeholders}"
done

# Placeholders also appear in FILE NAMES, not only in contents: the IG-level
# translation catalogue is named after the IG resource
# (ImplementationGuide-mii-ig-{{MODULE_SLUG}}.po), and the publisher matches it
# to fsh-generated/resources/<Type>-<id>.json BY NAME. Left unrenamed it is
# silently ignored and the translated variant falls back to default-language
# page titles — visible as English breadcrumbs on a fully translated page.
# Rename after the content pass so both are done.
find input -depth -name '*{{*}}*' | while read -r placeheld; do
  renamed="${placeheld}"
  while IFS='|' read -r key val; do
    [ -z "${key}" ] && continue
    renamed="${renamed//\{\{${key}\}\}/${val}}"
  done < "${placeholders}"
  [ "${renamed}" = "${placeheld}" ] && continue
  mv "${placeheld}" "${renamed}"
  echo "renamed $(basename "${placeheld}") -> $(basename "${renamed}")"
done

# Guard: no build input may still carry a placeholder after substitution.
if find input -name '*{{*}}*' | grep -q .; then
  echo "::error::A build input still has an unsubstituted {{PLACEHOLDER}} in its FILE NAME after the self-check substitution."
  find input -name '*{{*}}*'
  exit 1
fi
if grep -rl '{{[A-Z0-9_]\{2,\}}}' input 2>/dev/null | grep -qv '/README\.md$'; then
  echo "::error::A build input still contains an unsubstituted {{PLACEHOLDER}} after the self-check substitution."
  grep -rn '{{[A-Z0-9_]\{2,\}}}' input | grep -v '/README\.md:' | head -10
  exit 1
fi
# Guard: no ACTIVE (non-comment) placeholder may survive in sushi-config.yaml.
if grep -vE '^[[:space:]]*#' sushi-config.yaml | grep -q '{{[A-Za-z0-9_]*}}'; then
  echo "::error::A self-check value is missing from the substitution table — an active {{PLACEHOLDER}} survives in sushi-config.yaml."
  grep -nvE '^[[:space:]]*#' sushi-config.yaml | grep '{{[A-Za-z0-9_]*}}'
  exit 1
fi
# Guard: the version the render will display is the one that was asked for.
# The scaffold quotes the value (`version: "{{CALVER_VERSION}}"`), so accept it
# with or without quotes rather than depending on that detail.
if ! grep -qE "^version:[[:space:]]*[\"']?${CALVER_VERSION}[\"']?[[:space:]]*(#.*)?\$" sushi-config.yaml; then
  echo "::error::sushi-config.yaml does not declare 'version: ${CALVER_VERSION}' after substitution."
  grep -nE '^version:' sushi-config.yaml || true
  exit 1
fi
# Publish the value the render will carry, so a caller can assert against it
# without re-deriving the formula (release-demo.yml does exactly that).
if [ -n "${GITHUB_OUTPUT:-}" ]; then
  echo "demo_version=${CALVER_VERSION}" >> "${GITHUB_OUTPUT}"
fi
echo "::notice::Template-repo self-check: substituted self-check placeholders into WORKSPACE copies of sushi-config.yaml, ig.ini and the narrative pages (never committed), CALVER_VERSION=${CALVER_VERSION}. A created module replaces the placeholders for real and skips this step."
