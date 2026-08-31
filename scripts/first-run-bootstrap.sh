#!/usr/bin/env bash
# first-run-bootstrap — one-time setup for a NEW MODULE created from this
# template repository via "Use this template". Run it ONCE, in your new module
# repository, right after creating it. See docs/recipes/first-run-setup.md for
# the click-by-click walkthrough.
#
# What it does:
#   (a) creates the `dev` integration branch from `main` and applies branch
#       protection to both (needs `gh` authenticated with admin on the repo);
#   (b) removes the template's own release automation, which must NOT live in a module
#       (the Release Please automation + the template's SemVer release
#       announcement + the template CHANGELOG), using a deterministic,
#       reversible `git rm` with a NEVER-protect list. This script and
#       docs/recipes/first-run-setup.md are NOT removed — they are on the NEVER
#       list, because a created module's docs link to both;
#   (c) prints a post-bootstrap checklist (placeholders, Pages, secrets).
#
# Safety model:
#   - DRY-RUN by default: shows the branch commands and the exact removal list,
#     changes nothing. Pass --apply to perform the changes.
#   - Removals go through `git rm` (staged, reversible with `git restore`),
#     never a bare delete of tracked files.
#   - A NEVER-protect list hard-aborts if any removal target ever collides with
#     module content, build input, or PROPAGATED tooling — a safety net
#     against an edited list.
#   - The whole body is wrapped in main() so the `local` declarations below are
#     scoped, and so bash has parsed the entire script before any removal runs.
# Bash 3.2 compatible (no mapfile/associative arrays).
set -u

usage() {
  cat <<'EOF'
Usage: scripts/first-run-bootstrap.sh [--apply] [--main-reviews N] [--dev-reviews N]

  (no flags)        DRY-RUN: print what would happen, change nothing.
  --apply           perform the branch setup and the file removals.
  --main-reviews N   required approvals on main   (default 1).
  --dev-reviews N    required approvals on dev    (default 0, solo-friendly).
  -h, --help         show this help.
EOF
}

# Why each file is removed from a module. The rule: remove only what would
# actively CONFLICT with a module (two release systems on one repo), never
# something a doc points at. Everything else stays, so every reference in a
# created module still resolves.
why() {
  case "$1" in
    release-please-config.json|.release-please-manifest.json|.github/workflows/release-please.yml)
      echo "Release Please = SemVer automation for the TEMPLATE repo; a module releases via MII CalVer — two release systems on one repo corrupt the version history";;
    .github/workflows/notify-zulip.yml)
      echo "announces the TEMPLATE repo's SemVer releases; a module announces its own CalVer release via the module release workflow";;
    .github/workflows/release-demo.yml)
      echo "renders the TEMPLATE repo's Pages demo from a SemVer tag; a module has no demo — its Pages surface is the gated formal-publication output";;
    CHANGELOG.md)
      echo "the template's Release-Please-generated SemVer changelog; a module keeps its own release notes";;
    *) echo "conflicts with a module's own release process";;
  esac
}

print_branch_cmds() {
  local mrev="$1" drev="$2"
  cat <<EOF
   # create dev from main:
   gh api -X POST repos/:owner/:repo/git/refs -f ref=refs/heads/dev \\
     -f sha="\$(gh api repos/:owner/:repo/git/refs/heads/main --jq .object.sha)"
   # protect main (require PR + ${mrev} approval(s), no force-push/deletion) and
   # dev (require PR + ${drev} approval(s)); keep main the default branch.
   #   PUT repos/:owner/:repo/branches/{main,dev}/protection
   #   PATCH repos/:owner/:repo -f default_branch=main
EOF
}

# JSON body for the branch-protection PUT (reliable form of the A.7 one-liner;
# gh -f/-F does not build nested objects, so we pass an explicit body).
protection_body() {
  local reviews="$1"
  printf '{"required_status_checks":null,"enforce_admins":false,"required_pull_request_reviews":{"required_approving_review_count":%s},"restrictions":null,"allow_force_pushes":false,"allow_deletions":false}' "$reviews"
}

run_branch_setup() {
  local mrev="$1" drev="$2" main_sha
  command -v gh >/dev/null 2>&1 || { echo "   ERROR: 'gh' not found — install the GitHub CLI and authenticate (gh auth login)." >&2; return 1; }
  main_sha="$(gh api repos/:owner/:repo/git/refs/heads/main --jq .object.sha 2>/dev/null)" || { echo "   ERROR: cannot read main; is this the new module repo and are you authenticated?" >&2; return 1; }
  if gh api repos/:owner/:repo/git/refs/heads/dev >/dev/null 2>&1; then
    echo "   dev already exists — leaving it as is."
  else
    gh api -X POST repos/:owner/:repo/git/refs -f ref=refs/heads/dev -f sha="$main_sha" >/dev/null \
      && echo "   created dev from main ($main_sha)"
  fi
  protection_body "$mrev" | gh api -X PUT repos/:owner/:repo/branches/main/protection --input - >/dev/null \
    && echo "   protected main (reviews: $mrev)"
  protection_body "$drev" | gh api -X PUT repos/:owner/:repo/branches/dev/protection --input - >/dev/null \
    && echo "   protected dev (reviews: $drev)"
  gh api -X PATCH repos/:owner/:repo -f default_branch=main >/dev/null \
    && echo "   default branch = main"
}

print_checklist() {
  local applied="$1"
  cat <<'EOF'
== Post-bootstrap checklist (do these by hand) ==

1. Replace every {{PLACEHOLDER}} in the scaffold. Start here and follow the
   comments — the module does NOT build until they are all replaced:
     - sushi-config.yaml   ({{MODULE_SLUG}}, {{MODULE_NAME}}, {{MODULE_TITLE}},
                            {{MODULE_DESCRIPTION}}, {{CALVER_VERSION}}, dates, …)
     - ig.ini              (the {{MODULE_SLUG}} in the ig path; LEAVE the
                            `template =` line as it is — the repository-URL
                            default, with `#ig-template` as the vendored
                            offline fallback — until the MII template package
                            is published; see
                            docs/recipes/switch-template-to-published.md)
     - publication-request.json, .github/workflows/go-publish.yml
       ({{GITHUB_ORG}}, {{REPO_NAME}}, canonical, …)
     - qc/custom.rules.yaml, tests/, the pages and the FSH sources
   Run `node scripts/convention-check.mjs` — it must be green (parameterized
   fields are OK until you resolve them; a release branch requires them all set).

2. Enable GitHub Pages: Settings → Pages → Build and deployment → "GitHub
   Actions". Then set the repository variable PAGES_ACTIONS_ENABLED=true only
   once that is done (the publication workflow checks it).

3. Terminology (optional): to build against the MII SU-TermServ, add the
   repository secrets SU_TERMSERV_CLIENT_CERT / SU_TERMSERV_CLIENT_KEY /
   SU_TERMSERV_CLIENT_PASSWORD. Without them the build falls back to the
   public HL7 server https://tx.fhir.org (it does not hard-fail).

4. Release announcements (optional): add ZULIP_API_KEY to announce your
   module's CalVer releases to the MII Zulip.

5. CI pipeline toggles are ON by default. To require CI as a merge gate, add the
   relevant checks (e.g. convention-check, the IG preview build) as required
   status checks under Settings → Branches once they have run once.

6. Verify the branch model: `main` (stable, default) and `dev` (integration)
   both exist and are protected. Open your first change as a PR into `dev`.
EOF
  if [ "$applied" = 1 ]; then
    echo
    echo "The file removals are STAGED (git rm). Review with 'git status' and"
    echo "'git diff --cached', then commit them on a branch, e.g.:"
    echo "   git checkout -b chore/first-run-bootstrap"
    echo "   git commit -m 'chore: first-run bootstrap (remove the template's release automation)'"
    echo "To undo a removal before committing: git restore --staged --worktree <path>"
  fi
}

main() {
  cd "$(dirname "$0")/.." || return 1

  local APPLY=0 MAIN_REVIEWS=1 DEV_REVIEWS=0
  while [ $# -gt 0 ]; do
    case "$1" in
      --apply) APPLY=1;;
      --main-reviews) MAIN_REVIEWS="${2:-1}"; shift;;
      --dev-reviews) DEV_REVIEWS="${2:-0}"; shift;;
      -h|--help) usage; return 0;;
      *) echo "Unknown argument: $1" >&2; usage; return 2;;
    esac
    shift
  done

  # ── file categories (single source of truth) ──
  # REMOVE: the template's own release automation, which must NOT live in a module. The
  # Release Please quartet + the template SemVer announcement are the set listed
  # by the header of .github/workflows/release-please.yml — honor it.
  # release-demo.yml joins them: it renders the TEMPLATE's Pages demo from a
  # SemVer tag Release Please cut. A module has no such demo (its Pages surface
  # is the gated -go-publish output) and no SemVer tags, so the workflow would
  # never fire — and if it somehow did, it would write to the module's gh-pages.
  # Its own `endsWith(github.repository, …)` job guard is the second line of
  # defence; this removal is the first.
  local REMOVE=".github/workflows/release-please.yml .github/workflows/notify-zulip.yml .github/workflows/release-demo.yml release-please-config.json .release-please-manifest.json CHANGELOG.md"
  # NEVER: module content, build input, and PROPAGATED tooling that a
  # module keeps. A removal target colliding here is a bug → hard abort.
  local NEVER="input sushi-config.yaml ig.ini publication-request.json advisor.json qc scripts skills .claude .agents AGENTS.md LICENSE README.md CONTRIBUTING.md docs/recipes/first-run-setup.md .devcontainer .editorconfig .gitignore .github/dependabot.yml .github/CODEOWNERS .github/ISSUE_TEMPLATE .github/workflows/go-publish.yml .github/workflows/convention-check.yml .github/workflows/security-scan.yml .github/workflows/dependency-check.yml scripts/convention-check.mjs scripts/convention-check.test.mjs scripts/language-model-check.sh"

  git rev-parse --is-inside-work-tree >/dev/null 2>&1 || { echo "ERROR: not inside a git repository." >&2; return 1; }

  # guard: no REMOVE target may collide with a protected NEVER entry
  local t n
  for t in $REMOVE; do
    for n in $NEVER; do
      case "$t" in "$n"|"$n"/*) echo "ABORT: removal target '$t' collides with protected '$n' — refusing." >&2; return 3;; esac
    done
  done

  echo "== first-run-bootstrap (mode: $([ "$APPLY" = 1 ] && echo APPLY || echo DRY-RUN)) =="
  echo

  echo "-- Step 1: create 'dev' from 'main' and protect both branches --"
  print_branch_cmds "$MAIN_REVIEWS" "$DEV_REVIEWS"
  if [ "$APPLY" = 1 ]; then
    run_branch_setup "$MAIN_REVIEWS" "$DEV_REVIEWS" || echo "   (branch setup incomplete — see errors above; you can run the gh commands manually)"
  else
    echo "   (dry-run: the commands above are NOT executed)"
  fi
  echo

  echo "-- Step 2: remove the template's release automation (reversible git rm) --"
  local present="" tgt
  for tgt in $REMOVE; do
    if [ -e "$tgt" ] || git ls-files --error-unmatch "$tgt" >/dev/null 2>&1; then
      present="$present $tgt"
    fi
  done
  if [ -z "$present" ]; then
    echo "   (none present — already bootstrapped?)"
  else
    for tgt in $present; do echo "   remove: $tgt"; echo "           why: $(why "$tgt")"; done
  fi
  if [ "$APPLY" = 1 ] && [ -n "$present" ]; then
    for tgt in $present; do
      git rm -r --quiet "$tgt" 2>/dev/null || rm -rf "$tgt"
      echo "   removed: $tgt"
    done
  elif [ "$APPLY" = 0 ]; then
    echo "   (dry-run: nothing removed)"
  fi
  echo

  print_checklist "$APPLY"
}

main "$@"
