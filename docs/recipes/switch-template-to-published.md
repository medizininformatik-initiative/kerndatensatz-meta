# Recipe: switch to the published template package

**Goal.** Move your module's `ig.ini` from the **interim** template reference
(the repository URL, or the vendored `ig-template/` fallback referenced as
`template = #ig-template`) to the **pinned published** MII template package
(`template = de.medizininformatikinitiative.template#x.y.z`), and delete the
`ig-template/` folder — proving with a rebuild that the switch changed nothing
visible.

> **Why the module starts on the interim form:** the IG Publisher needs a template to
> build, and while the template package has no registry entry a module cannot
> reference one — see [concepts.md § 2](../concepts.md#2-how-it-references-the-mii-template--url-now-published-package-later)
> and [org-move.md](../org-move.md) for whether it is published yet.
> After this cleanup your module tracks a versioned dependency like every other
> package, and the scheduled dependency checker proposes upgrades for you.

**Prerequisites.** The template repository has cut a release **and** that release
resolves for the IG Publisher (see below). Your module must build green before
you start, so you can tell the switch apart from an unrelated breakage.

## When you do this

Do this **once**, as soon as the template repository
[`medizininformatik-initiative/ig-template-mii-kds`](https://github.com/medizininformatik-initiative/ig-template-mii-kds)
has cut its first release **and** that release is resolvable by the IG Publisher
(see the prerequisite below). Before that point, keep the interim reference — a
published reference that cannot be resolved makes the build fail.

## Where the published version number comes from

The template repo releases with **SemVer** (`vMAJOR.MINOR.PATCH`) via Release
Please — *not* CalVer (only modules use CalVer). Find the exact number to pin,
in order of preference:

1. **The template repo's Releases page** —
   <https://github.com/medizininformatik-initiative/ig-template-mii-kds/releases>.
   Use the latest non-prerelease tag, e.g. `0.1.0` (drop the leading `v` in
   `ig.ini`; the reference is `de.medizininformatikinitiative.template#0.1.0`).
2. **The template's `package-list.json`** (in that repo) — only once a formal
   publication has added a released entry; today it holds a single `ci-build`
   row, so this source answers nothing until then.
3. **The FHIR package registry** —
   `https://packages.fhir.org/de.medizininformatikinitiative.template` lists the
   published versions once the template is registered there.

> **Why pin an exact `x.y.z` and never `#current`:** fixed versions keep a 2029
> rebuild byte-stable. The convention check rejects a template
> pinned to `current`/`latest`/`dev`, and the dependency checker
> (`scripts/check-updates.mjs`, which already watches
> `de.medizininformatikinitiative.template`) surfaces newer template releases
> in the continuously-updated dependencies tracking issue — you never need a
> floating pin to stay current.

- The published template is **resolvable by the IG Publisher**. For a
  version pin (`template = de.medizininformatikinitiative.template#x.y.z`) the
  Publisher resolves **only** through the FHIR package server — the package
  must exist on `packages.fhir.org`; registration in
  [`FHIR/ig-registry`](https://github.com/FHIR/ig-registry)'s `templates.json`
  is a directory listing, **not** an alternative resolution path
  (`TemplateManager.loadPackage`: `#folder` → local directory, `id`/`id#ver` →
  package server, GitHub URL → zip; nothing reads `templates.json`). Quick
  check: the registry URL above returns the version you intend to pin
  (HTTP 200, not 404). Until the package is on the package server, the
  supported alternatives are the vendored folder you already have, or a GitHub
  URL reference.
- Your module already builds green today against the current template reference (so you
  have a clean baseline to compare against).
- `sushi` (`3.20.0`), the IG Publisher jar (`2.3.0`), and `jq` are available —
  the dev container has all three. Or push the branch and let the
  `IG build and preview` workflow build it for you.

## Steps

1. **Capture the baseline QA** from the current build, so you can
   prove the switch changes nothing. Build once, then save the QA summary:

   ```bash
   sushi .
   java -Xmx6g -jar publisher.jar -ig ig.ini
   cp output/qa.json /tmp/qa-before.json
   jq '{errs, warnings, hints}' output/qa.json   # note these counts
   ```

2. **Edit `ig.ini`** — replace the current reference with the pinned
   published package. Change:

   ```ini
   template = https://github.com/medizininformatik-initiative/ig-template-mii-kds
   ```

   (or `template = #ig-template`, if your module still uses the vendored
   fallback)

   to (use the real version from the section above):

   ```ini
   template = de.medizininformatikinitiative.template#0.1.0
   ```

   Remove the now-stale bring-up comment block above the `template =` line while
   you are there.

   > **Why drop the `#`:** the leading `#` is what told the IG Publisher
   > "this is a local folder." Without it, the value is a package reference
   > (`id#version`) the Publisher resolves from the registry.

3. **Delete the vendored template folder, if your module carries one** — it is no longer referenced:

   ```bash
   git rm -r ig-template
   ```

   This also removes `ig-template/README.md`. Nothing else references the folder
   (the only pointer was `ig.ini`, which you just changed).

4. **Rebuild** against the published template:

   ```bash
   sushi .
   java -Xmx6g -jar publisher.jar -ig ig.ini
   ```

   The Publisher now downloads `de.medizininformatikinitiative.template#0.1.0`
   (and its pinned base `fhir2.base.template`) from the registry instead of
   reading `ig-template/`.

5. **QA compare** — confirm the switch is behaviour-neutral. The error/warning
   counts must not increase, and the branding (header logo, footer imprint
   links, colours) must look identical:

   ```bash
   jq '{errs, warnings, hints}' output/qa.json          # compare to step 1
   diff <(jq -S 'del(.date)' /tmp/qa-before.json) \
        <(jq -S 'del(.date)' output/qa.json) || true    # only the date should differ
   ```

   Open `output/index.html` (or the branch preview the CI publishes) and eyeball
   the header/footer against the baseline build.

6. **Open a PR to `dev`** with the `ig.ini` change and the `ig-template/`
   deletion. The `IG build and preview` workflow rebuilds and posts the preview
   URL; the convention check confirms `template = de.medizininformatikinitiative.template#0.1.0`
   is a valid pinned reference. Merge once green.

## Expected result

- `ig.ini` references `de.medizininformatikinitiative.template#x.y.z`; the
  `ig-template/` folder is gone.
- The rebuilt IG looks identical to the baseline build (same branding, same
  pages), and the QA error/warning counts did not increase.
- The convention check passes (`M7 no floating pins` shows the pinned template
  reference), and future template releases arrive as dependency-checker PRs.

## Common errors & fixes

| Symptom | Cause | Fix |
|---|---|---|
| Publisher aborts: `Unable to resolve template de.medizininformatikinitiative.template#x.y.z` | The template is not yet published/registered, or the version does not exist | Confirm the registry URL returns that version (prerequisite); if it 404s, the template repo has not published it yet — revert to the vendored `#ig-template` and wait |
| Build fails with `Unable to load template source from #ig-template` | You deleted `ig-template/` but `ig.ini` still says `template = #ig-template` (now a dangling local folder) | Make sure step 2 (edit) happened before/with step 3 (delete) — the Publisher fails loudly on a missing `#folder`, so this is caught at the next build |
| Convention check fails on the template line | You pinned `#current` / `#latest` / left a `TODO` | Pin an exact SemVer `x.y.z` from the template repo's release |
| QA error count jumped after the switch | The published release differs from the vendored commit (a newer template version, or the vendored copy had local edits) | Expected if you jumped versions — read the template repo's CHANGELOG for the delta; if you had edited `ig-template/` locally (you should not have), reconcile those edits upstream first |
| `git rm -r ig-template` says "did not match any files" | Already deleted, or you are not at the repo root | Run from the module root; confirm with `ls ig-template` |
