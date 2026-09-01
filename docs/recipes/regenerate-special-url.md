# Recipe: regenerate the `special-url` list for a module

**Goal.** Produce the correct `special-url` parameter value in `sushi-config.yaml` for
YOUR module — the list of canonical URLs **defined by this IG** that do not
start with the module's own canonical
(`https://www.medizininformatik-initiative.de/fhir/modul-<slug>`).

> **Why this is a placeholder in the template:** `special-url` is inherently
> module-specific. kerndatensatz-basis's list (legacy
> `.../fhir/core/modul-<x>/...` canonicals kept for backward compatibility,
> plus locally defined R5 cross-version extension URLs) is meaningless for any
> other module, so the template deliberately does **not** copy it. A brand-new
> module whose resources all live under its own canonical needs **no**
> `special-url` entries at all — leave the parameter commented out.

Background: the IG Publisher rejects a resource whose canonical URL lies
outside the IG's canonical base, because that usually indicates a typo.
`special-url` is the explicit allow-list for the deliberate exceptions.

**Prerequisites.**

- The module builds with SUSHI (`sushi .` succeeds), so `fsh-generated/` is
  populated.
- `jq` and a shell (the dev container has both).
- Every `{{...}}` placeholder in `sushi-config.yaml` is already replaced —
  the module canonical must be final before you derive exceptions from it.

## When you need this

- Your module keeps **legacy canonicals** (e.g. the pre-consolidation
  `.../fhir/core/modul-<x>/...` URLs) for backward compatibility.
- Your module defines **cross-version extensions** with `hl7.org/fhir/5.0/...`
  URLs (basis: `extension-Encounter.plannedStartDate`).
- Your module defines any other resource whose `url` intentionally does not
  start with the module canonical (e.g. a `CapabilityStatement/metadata`
  instance under a legacy base).

## Steps

1. Compile the FSH sources so the resource JSON exists:

   ```bash
   sushi .
   ```

2. List every locally defined canonical that falls outside the module
   canonical (replace `<slug>` with your module slug):

   ```bash
   CANONICAL="https://www.medizininformatik-initiative.de/fhir/modul-<slug>"
   jq -r --arg canonical "$CANONICAL" \
     'select(.url != null) | .url | select(startswith($canonical) | not)' \
     fsh-generated/resources/*.json | sort -u
   ```

   Every URL this prints is a candidate. Review each one: is the foreign
   canonical **intentional** (legacy compatibility, cross-version extension)?
   If not, fix the resource instead of allow-listing it.

3. Add the reviewed URLs to `sushi-config.yaml` under `parameters:` —
   uncomment the placeholder block and list one URL per line:

   ```yaml
   parameters:
     special-url:
       - https://www.medizininformatik-initiative.de/fhir/core/modul-<x>/StructureDefinition/Example
       - http://hl7.org/fhir/5.0/StructureDefinition/extension-Example.element
   ```

4. Rebuild with the IG Publisher and confirm the QA report:

   ```bash
   java -Xmx6g -jar publisher.jar -ig ig.ini
   ```

5. Repeat step 2 after content changes (new profiles, renamed URLs) and on
   every release — the contract is: `special-url` equals exactly the set of
   intentional foreign canonicals, no more, no less.

## Expected result

- The Publisher build finishes without errors complaining that a resource URL
  does not match the IG canonical.
- `special-url` contains only reviewed, intentional exceptions (an empty /
  commented-out parameter is the normal state for a new module).
- The QA report (`output/qa.html`) shows no URL-consistency errors for the
  listed resources.

## Common errors & fixes

| Symptom | Cause | Fix |
|---|---|---|
| Publisher error naming a resource URL and the IG canonical (URL outside the canonical base) | A locally defined resource's `url` is not under the module canonical and not in `special-url` | Run step 2; either fix the resource's URL or add it to `special-url` after review |
| The jq command prints nothing but the build still fails on a URL | The resource is not in `fsh-generated/` (hand-authored JSON under `input/resources/` or predefined resources) | Run the same jq filter over `input/resources/*.json` as well |
| Entries copied from kerndatensatz-basis appear in your list | The basis list was hard-copied instead of regenerated | Delete them; regenerate from YOUR module's build output (this recipe) |
| A URL is listed but the Publisher still errors | Typo — `special-url` entries must match the resource `url` **exactly** (scheme, case, no trailing slash) | Copy the URL verbatim from the jq output |
| Legacy `CapabilityStatement/metadata` instance keeps erroring | Instance `url`s count too, not only StructureDefinitions/ValueSets | Include the instance URL (basis lists its four legacy `CapabilityStatement/metadata` URLs) |
