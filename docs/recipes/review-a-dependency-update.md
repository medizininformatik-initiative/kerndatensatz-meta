# Recipe: review a dependency update

**Goal.** Take a proposed dependency bump from "a bump is proposed" to
"merged — or consciously not".

**Prerequisites.** A Dependabot PR, a checker PR, or a row in the
`dependencies` tracking issue.

This recipe applies unchanged in a module created from this template.

> **Updates are proposals, never automatic**
> ([`docs/maintenance.md`](../maintenance.md)). The human in the loop is you.

## Steps

### 1. Read the proposal

- **Dependabot PR:** the artifact and versions are in the PR title; release
  notes are quoted in the PR body.
- **Tracking issue:** each `update available` row names the artifact, the
  pinned and the latest version, and links the changelog / release notes.

### 2. Check the changelog

Open the linked release notes and answer two questions:

1. Is it a **breaking change** (major bump, changed defaults, removed flags)?
2. Does anything in the notes affect **how this IG builds** (template
   parameters, profile/terminology behavior, Jekyll/liquid behavior,
   publisher CLI flags)?

If unsure, prefer bumping in a working branch and letting the preview build
answer.

### 3. Apply the bump in the pin's real location

Create a working branch off `dev` (e.g. `chore/bump-<artifact>`). Bump exactly
one artifact per PR (keep diffs reviewable) — in every place that artifact is
pinned. Every pin's location is listed in [`docs/maintenance.md` → Where each
pin lives](../maintenance.md#where-each-pin-lives-single-source-of-truth); look
it up there, because several artifacts are pinned in more than one file.

The two that catch reviewers out (excerpt — the full list is in
`maintenance.md`):

| Artifact | Edit here |
|---|---|
| IG Publisher | `PUBLISHER_VERSION` **and** the jar SHA-256 (step 4) in all build workflows — `ig-publisher.yml`, `module-release.yml`, `go-publish.yml` and (template repo only) `release-demo.yml`; the `env:` blocks must stay identical. Also update the copy-paste download block in `docs/recipes/first-build-in-devcontainer.md` (URL + SHA + prose date) |
| SUSHI / Jekyll | `SUSHI_VERSION` / `JEKYLL_VERSION` in the same `env:` blocks — plus, for SUSHI only, the reusable-validation input in `validation.yml`, the dev-container `postCreateCommand` and the recipe's expected `sushi --version` output. For Jekyll only: recompute `JEKYLL_GEM_SHA256` in `go-publish.yml` (`gem fetch jekyll -v <version> && sha256sum jekyll-<version>.gem`) — no test covers that checksum |

`scripts/toolchain-pins.test.mjs` fails the build when the `env:` blocks
(all four on the template repo; or `validation.yml`'s SUSHI fallback) stop
agreeing, so a half-applied bump does not reach `dev`.

### 4. IG Publisher only: recompute the jar SHA-256

The version pin and the checksum move **together** — never bump one without
the other. Download the release jar and hash it:

```sh
curl -L https://github.com/HL7/fhir-ig-publisher/releases/download/<version>/publisher.jar \
  -o publisher.jar && shasum -a 256 publisher.jar
```

(macOS: `shasum -a 256`; on Linux `sha256sum publisher.jar` is equivalent.
The release tag is the plain version, e.g. `2.3.0` — no `v` prefix.)

Paste the printed hash next to the new version wherever the checksum is
pinned. A mismatch later means the downloaded artifact changed — exactly what
the checksum is there to catch.

### 5. Build and verify

Run the IG build (the PR CI does the same). The bump is only good if the
build is clean:

- lint/tests for the touched tooling (`node --test scripts/check-updates.test.mjs`
  if you touched the checker),
- the IG build must succeed with QA errors = 0.

### 6. Merge — or document why not

- Open a PR to `dev`, reference the tracking issue row / Dependabot PR, get a
  review, merge. **Never auto-merge.**
- If you decide **against** the bump (e.g. a breaking change with no benefit),
  say so briefly in the tracking issue so the next reader does not re-do your
  analysis. The row will reappear weekly — that is by design.

## Expected result

The pin is updated everywhere it appears (including any checksum), the build is
green with QA errors = 0, and the decision is recorded — whether you merged or
declined.

## Common errors & fixes

| Symptom | Cause | Fix |
| --- | --- | --- |
| The bump reappears next week after you rejected it | The checker reports drift every run by design | Record the decision in the tracking issue so the next reader does not redo the analysis |
| The build fails only after the bump | A breaking change in the dependency | Read the linked changelog; either adapt the repo or keep the old pin and note why |
| The IG Publisher jar hash no longer matches | The version was bumped without recomputing the SHA-256 | Recompute it and update the pin in the same commit — never bump one without the other |
