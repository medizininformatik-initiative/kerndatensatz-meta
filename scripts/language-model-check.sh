#!/usr/bin/env bash
# language-model-check.sh — guard the English-default / German-translation model.
#
# This IG renders in ENGLISH by default (sushi-config.yaml
# `i18n-default-lang: en`) with a GERMAN translation under
# `input/translations/de/` — the same model as kerndatensatz-basis. Prose that
# calls German the default/leading/authoritative/source language contradicts the
# shipped configuration, and it has crept back in more than once, so it fails
# here instead of shipping to module authors.
#
#   scripts/language-model-check.sh        # scan the tracked text files
#
# Exit 0 = clean, 1 = residue found. Run by .github/workflows/convention-check.yml.
#
# Legitimate hits go in ALLOW below, one "<path>|<substring>" per entry — do NOT
# weaken PATTERNS.
#
# Not scanned: input/translations/de/** (the German translation itself),
# ig-template/** (the vendored mirror — fix it in ig-template-mii-kds and
# re-sync), and this file. Binary files are skipped by `git grep -I`.
#
# Bash 3.2 compatible.
set -u
cd "$(dirname "$0")/.." || exit 1

# Phrases that assert the wrong language model. Curated, not fuzzy: every entry
# below was an actual defect in this repo.
#
# Word boundaries are written as `[^A-Za-z]` / `(^|[^A-Za-z])` / `([^A-Za-z]|$)`,
# NOT as `\b`: git's built-in regex engine is not the GNU one, and it silently
# matches nothing for a `\b` pattern on some platforms — a guard that quietly
# under-matches is worse than no guard. The sibling ig-template-mii-kds script
# writes them the same way.
PATTERNS=(
  'german[^.]{0,30}[^A-Za-z](default|leading|authoritative|binding)([^A-Za-z]|$)'
  'german[^A-Za-z]{0,6}(is|stays|remains|as)?[^A-Za-z]{0,6}(the[^A-Za-z]{0,6})?(source|original)([^A-Za-z]|$)'
  'german[^.]{0,25}[^A-Za-z]the (source|original)([^A-Za-z]|$)'
  'falls back to german'
  'leave it german'
  'german-led([^A-Za-z]|$)'
  'german starter page'
  '(^|[^A-Za-z])de-default([^A-Za-z]|$)'
  'back to en-default'
  'deutsch \(standardsprache\)'
  'i18n-lang:[^]]{0,20}[^A-Za-z]en([^A-Za-z]|$)'
  'input/translations/en([^A-Za-z]|$)'
)

# Reviewed exceptions: "<path>|<substring of the offending line>", one per line.
# A module author writing their own prose can record a legitimate hit here
# without blanking a whole file from the scan.
ALLOW=''

args=()
for pattern in "${PATTERNS[@]}"; do
  args+=(-e "$pattern")
done

hits="$(git grep -n -I -i -E "${args[@]}" -- . \
  ':(exclude)input/translations/de' \
  ':(exclude)ig-template' \
  ':(exclude)scripts/language-model-check.sh')"
rc=$?

# git grep exits 0 on a hit, 1 on no hit, and >1 on an error. The error case
# must not be mistaken for a clean tree, so the status is handled explicitly.
case "$rc" in
  1) echo "language-model-check: no German-default residue found."; exit 0;;
  0) ;;
  *) echo "ERROR: git grep failed (exit $rc)." >&2; exit "$rc";;
esac

status=0
while IFS= read -r hit; do
  [ -n "$hit" ] || continue
  f="${hit%%:*}"
  allowed=0
  while IFS= read -r entry; do
    [ -n "$entry" ] || continue
    case "$entry" in
      "$f|"*)
        needle="${entry#*|}"
        case "$hit" in *"$needle"*) allowed=1;; esac;;
    esac
  done <<EOF
$ALLOW
EOF
  [ "$allowed" = 1 ] && continue
  echo "$hit"
  status=1
done <<EOF
$hits
EOF

if [ "$status" != 0 ]; then
  cat >&2 <<'MSG'

German-default language residue found (see the lines above).

This IG is English-default with a German translation:
  - input/pagecontent/**            English — the source
  - input/translations/de/**        German  — the translation, renders on /de/
  - input/includes/menu.xml         English — the source menu
There is no input/translations/en/, and kerndatensatz-basis is en-default too,
so "deviates from basis" is never the right rewrite — delete such claims.

If a hit is legitimate, add it to ALLOW in scripts/language-model-check.sh with a
reason in the commit message. Do not widen the exclusions or relax PATTERNS.
MSG
else
  echo "language-model-check: no German-default residue found."
fi
exit "$status"
