# Recipe: create a new module

**Goal.** Go from "Use this template" to a first green preview build of your module.

**Prerequisites.**

- A GitHub account with rights to create a repository in your organisation.
- [`git`](https://git-scm.com/) and the [GitHub CLI `gh`](https://cli.github.com/),
  logged in with `gh auth login`, on the machine where you run step 2. `gh` needs
  **admin** on the new repository to set branch protection — you have it if you
  created the repository.
- The [dev container](first-build-in-devcontainer.md) or a local toolchain for
  the build in step 7. The dev container does **not** ship `gh`, so run step 2 on
  your host.

## Steps

1. **Create the repo.** On this repository's GitHub page, click **"Use this
   template" → Create a new repository**. **Tick "Include all branches"** so you get
   `dev` too. Name it for your module (e.g. `mii-kds-modul-person`).
2. **Clone it and run the first-run bootstrap — always.**

   ```sh
   gh repo clone <your-org>/<your-module-repo>
   cd <your-module-repo>
   bash scripts/first-run-bootstrap.sh            # dry run — shows what it will do
   bash scripts/first-run-bootstrap.sh --apply
   ```

   It creates `dev`, applies branch protection, and **stages** the removal of the
   template's own release automation (the Release Please config and workflow, the
   release announcement, and the template `CHANGELOG`) with `git rm` — nothing is
   committed for you. The bootstrap and this recipe stay. If you ticked "Include
   all branches" it skips creating `dev`; the removals and the branch protection
   still have to happen. See [first-run-setup.md](first-run-setup.md).

   Commit the staged removals together with step 3 on one branch off `dev` — a
   bootstrap-only pull request comes up red on the `build` check, because SUSHI
   cannot compile a `sushi-config.yaml` that is still full of placeholders.
   Once committed, confirm all five removed paths are gone — this must print
   nothing:

   ```sh
   ls release-please-config.json .release-please-manifest.json CHANGELOG.md \
     .github/workflows/release-please.yml .github/workflows/notify-zulip.yml \
     2>/dev/null
   ```
3. **Fill the placeholders.** Open `sushi-config.yaml` and replace every `{{…}}`
   (each is documented inline). The key ones:
   - `{{MODULE_SLUG}}` — lowercase short name (`person`), drives packageId/id/canonical.
   - `{{MODULE_NAME}}` — CamelCase (`Person`) → `name: MII_IG_Person`.
   - `{{MODULE_TITLE}}` — the human-readable title part (`Person`), which becomes
     `title: MII Implementation Guide Person`.
   - `{{CALVER_VERSION}}` — `YYYY.n.n` (e.g. `2027.0.0`; drafts/pre-releases add a
     SemVer prerelease suffix such as `2027.0.0-draft.1`), and the related dates.
   `sushi-config.yaml` is where you start, not where you finish: its header lists
   all **19** placeholders (15 active, 4 optional) and the files each occurs in.
   Update `ig.ini`'s `ig =` line to match your `id`, then
   `publication-request.json`, `.github/workflows/go-publish.yml`,
   `qc/custom.rules.yaml`, `tests/`, the pages and the FSH sources.
4. **Rename the three placeholder-NAMED files.** Three file names carry a
   placeholder, and substituting the contents is not enough:

   ```sh
   # if your sushi-config.yaml says  id: mii-ig-person
   git mv 'input/translations/de/ImplementationGuide-mii-ig-{{MODULE_SLUG}}.po' \
          'input/translations/de/ImplementationGuide-mii-ig-person.po'
   git mv 'input/pagecontent/ImplementationGuide-mii-ig-{{MODULE_SLUG}}.md' \
          'input/pagecontent/ImplementationGuide-mii-ig-person.md'
   git mv 'input/translations/de/pagecontent/ImplementationGuide-mii-ig-{{MODULE_SLUG}}.md' \
          'input/translations/de/pagecontent/ImplementationGuide-mii-ig-person.md'
   ```

   The publisher matches the `.po` catalogue to your ImplementationGuide
   resource **by file name** — left unrenamed it is ignored without any
   warning, and the German rendering silently keeps English page titles,
   breadcrumbs and table of contents (details, and the `msgid` rules, in
   [add-translation.md](add-translation.md) §5). The two `.md` files are the
   intro of the ImplementationGuide resource page (dependency table,
   cross-version analysis, copyrights); their `pages:` entry in
   `sushi-config.yaml` references them by the substituted name, so an
   unrenamed file fails the build with "missing source file".
5. **Sweep for leftovers.** Two checks — one for file *contents*, one for file
   *names*:

   ```sh
   # contents
   grep -rnE --exclude=README.md '\{\{[A-Z0-9_]+\}\}' \
     sushi-config.yaml ig.ini publication-request.json qc input tests \
     .github/workflows/go-publish.yml \
   | grep -vE '\.(yaml|yml|ini|fsh):[0-9]+:[[:space:]]*(#|//|;)'

   # file names
   find input -name '*{{*}}*'
   ```

   Both must come back empty. The filters on the first command are deliberate.
   The scope is narrow because `{{ }}` is also Liquid syntax in `ig-template/`
   and `${{ }}` is GitHub-Actions syntax in every other workflow — do not grep
   the whole tree. The second `grep` drops comment lines, because inside this
   scope the `README.md` files and the comments that merely *name* a placeholder
   — the `sushi-config.yaml` header (your reference list, leave it intact),
   `ig.ini`'s `;` notes, `qc/custom.rules.yaml`, `go-publish.yml` and the FSH
   ruleset notes — are documentation, not values. They stay. The digit in
   `[A-Z0-9_]` matters: without it `{{SPECIAL_URL_1}}` is invisible to the sweep.
6. **Template reference.** Leave `ig.ini`'s `template =` line at its default —
   the template repository URL, which the publisher fetches at build time;
   `template = #ig-template` (the vendored copy) is the offline/reproducibility
   fallback — until the MII template package is published; then follow
   [switch-template-to-published.md](switch-template-to-published.md).
7. **Add content.** Replace the example profile in `input/fsh/` with your own
   ([add-a-profile.md](add-a-profile.md)) and the English starter pages in
   `input/pagecontent/` with your module's pages. Keep the German translations in
   `input/translations/de/` in step with them. **Decide the optional (0..1)
   pages** — keep or remove each one per
   [../optional-pages.md](../optional-pages.md); the convention check reports
   the undecided ones and fails a release while any remain. When you add,
   rename or remove a page, update all four places that name it: the `pages:`
   tree in `sushi-config.yaml`, both `menu.xml` files, and the IG-level
   catalogue from step 4.
8. **Build.** Locally, from the repository root:

   ```sh
   sushi .
   curl -L -o publisher.jar \
     https://github.com/HL7/fhir-ig-publisher/releases/download/2.3.2/publisher.jar
   java -Xmx6g -jar publisher.jar -ig ig.ini
   ```

   then read `output/qa.html`. The dev container brings SUSHI, Java and Jekyll —
   see [first-build-in-devcontainer.md](first-build-in-devcontainer.md), which
   also carries the current publisher pin and its checksum.

   Or push a `feature/*` branch and open the **CI preview URL** posted on the
   pull request. One-time prerequisite: enable GitHub Pages in one of the two
   supported pairings, because `ig-publisher.yml` serves the preview either way:

   - Settings → Pages → **Deploy from a branch → `gh-pages`**, with
     `PAGES_ACTIONS_ENABLED` unset — the default. The workflow git-pushes the
     build to `gh-pages/branches/<branch>/` and Pages serves it from there.
   - Settings → Pages → **GitHub Actions**, with the repository variable
     `PAGES_ACTIONS_ENABLED=true`. The workflow additionally uploads the
     `gh-pages` tree as a Pages artifact and runs the deploy job.

   The variable must match the Pages setting — set to `true` while Pages still
   deploys from a branch, or unset while Pages is in Actions mode, nothing
   serves the preview and the URL 404s. Formal publication
   (`go-publish.yml` with `publish: true`) requires the second pairing. See
   [first-run-setup.md](first-run-setup.md) checklist item 2.
9. **Iterate** until `qa.html` shows 0 errors (a terminology-fallback notice is fine
   when SU-TermServ is not configured).

## Expected result

Your module IG builds green and renders a bilingual (English-default, German translation) preview with
your profile, examples and pages. No Release Please anywhere.

## Common errors & fixes

| Symptom | Cause | Fix |
| --- | --- | --- |
| Only `main` exists, no `dev` | Did not tick "Include all branches" | Run the first-run bootstrap (step 2) |
| The bootstrap PR's `build` check is red | Placeholders are still in `sushi-config.yaml`; SUSHI cannot compile them | Commit steps 2 and 3 on the same branch (step 2) |
| Build fails on `{{…}}` | A placeholder was left unreplaced | Run both sweeps in step 5 and fill each hit |
| German pages render with English titles, breadcrumbs and ToC | The IG-level translation catalogue was not renamed | Rename it to `ImplementationGuide-<your-ig-id>.po` (step 4) |
| "template not found" | Published package not available yet | Keep the default repository-URL form (or the vendored `template = #ig-template` fallback for offline builds) |
| Convention check fails | id/name/canonical/version pattern wrong | Match the MII naming convention (the check message names the field) |
| The preview URL on the PR 404s | GitHub Pages is not enabled, or the Pages setting and `PAGES_ACTIONS_ENABLED` do not match | Enable Pages and pair it with the variable (step 8) |
