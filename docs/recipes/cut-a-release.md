# Recipe: cut a release (module — CalVer)

**Goal.** Release a version of your **module** using the MII **CalVer** Module
Release Workflow. This is **not** Release Please — modules never use Release Please.

**Prerequisites.** Your module builds green on `main`. See [release.md](../release.md)
for the step-by-step mapping to the MII wiki's Module Release Workflow.

## Steps

0. **From your second formal publication: point `version-comparison` in
   `sushi-config.yaml` at the version you are superseding** — the build
   publishes the technical delta at `comparison-v<previous>/index.html`;
   link it from the new version's changelog section. (Needs the canonical to
   serve `package-list.json`; the first formal publication provides it — the
   commented block in `sushi-config.yaml` has the details.)
1. **Pick the CalVer version** `YYYY.n.n` per the MII scheme (e.g. `2027.0.0`; the
   first number is the release-sequence year). Confirm against the
   [Module Release Workflow wiki page](https://github.com/medizininformatik-initiative/kerndatensatz-meta/wiki/Module-Release-Workflow).
2. **Bump the version and the dates everywhere they appear** — the full file
   list is in [release.md § 2](../release.md#2-update-the-version--human):
   `sushi-config.yaml` (`version:`, `date:`, the `package-source` version, the
   sequence year, the approval date), `publication-request.json`, the three
   `input/fsh/rulesets/` files, the `CRMIApprovalDate` call sites, and the
   narrative pages plus their German mirrors. Do this on a
   `release/vYYYY.n.n` branch (e.g. `release/v2027.0.0`) → PR → `dev` — the
   `release/**` name is what makes the convention check run in strict release
   mode (unresolved placeholders and the scaffold's demonstration page fail
   there, not on a `feature/*` branch). While you are in the pages, sweep
   both trees for unresolved
   authoring prompts — `grep -rn '\[TODO' input/pagecontent input/translations`
   must come back empty; the German pages render at `/de/` and ship whatever
   is left in them.
3. **Promote `dev → main`** with a merge commit.
4. **Tag** the release on `main`: `git tag v2027.0.0 && git push origin v2027.0.0`
   (the tag pattern the `module-release.yml` workflow listens for).
5. `module-release.yml` then **builds** and creates a **draft GitHub
   Release** with the package attached. **A human reviews and publishes the
   draft** — publishing is what fires the MII Zulip announcement (topic
   *Releases*) — and then the gated `go-publish` takes over.
6. **Production publication is a separate, human step:** run `go-publish.yml`
   manually via *workflow_dispatch*. It defaults to `publish:false` (a full dry run);
   only a human sets `publish:true` for the real publication.

## Expected result

A `v2027.0.0` tag + a **draft** GitHub Release to publish by hand — the Zulip
announcement (if the key is set) fires on publishing — and a dry-run
publication ready for a human to promote. **No SemVer tag, no Release Please.**

## Common errors & fixes

| Symptom | Cause | Fix |
| --- | --- | --- |
| Workflow did not trigger | Tag does not match `vYYYY.n.n` | Use the CalVer tag pattern |
| `convention-check` red on the release branch: M8 | The scaffold's demonstration page is still present | Remove it — the check's message lists every file; the list is also in [render existing artifacts](render-existing-artifacts.md) step 4 |
| `convention-check` red on the release branch: M9 | Optional (0..1) pages still carry their `OPTIONAL-PAGE` banner | Decide each one — keep (delete the banner in both languages) or remove per [optional-pages.md](../optional-pages.md) |
| `convention-check` red on the release branch: M11 | A scaffold `ILLUSTRATIVE-EXAMPLE` block is still present (the *Person* example on `security-and-privacy.md`) | Delete the example box + its marker comment in both languages; write the module's own aspects or adopt the section's default text |
| A SemVer release PR appeared | Release Please was not removed | Run the first-run bootstrap; `release-please-config.json` and `.github/workflows/release-please.yml` must be gone |
| `go-publish` published for real unexpectedly | `publish:true` was set | Keep it `false`; only a human sets it true, once, deliberately |
| Zulip not posted | `ZULIP_API_KEY` absent | Expected — the job skips with a notice; add the secret to enable |

> **Why CalVer and not SemVer here:** the module and the template tooling have
> different release authorities. The MII CalVer process is the module's single source
> of release truth; adding Release Please would produce conflicting tags. See
> [workflows.md](../workflows.md) and [release.md](../release.md).
