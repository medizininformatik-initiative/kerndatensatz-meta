# Recipe: add and describe examples

**Goal.** Ship examples that show a reader how your profiles are actually used —
and that validate.

**Prerequisites.** A profile to exemplify ([add a profile](add-a-profile.md)).

## One hard rule, and two strong recommendations

- **Hard rule — synthetic data only.** Never real, and never realistic-looking
  patient data — not even "anonymised" data. This one follows from data
  protection, not from this repository. Use obviously artificial names, e.g.
  `Max Mustermann-Testpatient`.
- **Recommended — tag examples as test data.** kerndatensatz-basis marks its
  examples with the test-data label `v3-ActReason#HTEST`, and this scaffold
  copies that via `input/fsh/rulesets/test-data-label.fsh`; it marks the
  instance as test health data wherever it travels.
- **Recommended — do not declare `meta.profile`** unless implementers are
  genuinely expected to populate it in production (HL7's IG best-practice
  guidance). The publisher validates the example against the profile anyway (via
  `Usage: #example` and the `profile-test-cases` harness).

## Steps

1. Create the instance under `input/fsh/instances/`, named after what it shows:

   ```fsh
   Instance: ExamplePatientMinimal
   InstanceOf: MII_PR_{{MODULE_NAME}}_Patient
   Usage: #example
   Title: "Example: minimal conformant patient"
   Description: "Kleinstes konformes Beispiel …"
   * insert TestDataLabel
   * name.family = "Mustermann-Testpatient"
   ```

2. Give it a `Title:` that says what the example *demonstrates*, not just what it
   is — the title is what readers see in the artifact list.
3. Cover the interesting cases, not just the happy path: at minimum one example
   per profile, and ideally one that exercises **every** Must Support element and
   every extension your module defines.
4. Explain the example where it needs explaining — either in its `Description:`
   or in the profile's notes file (see [render profiles](render-profiles.md)).
5. Build and open the profile page: your example is listed under **Examples**.

## Expected result

Each profile has at least one example, examples appear on the profile page and in
the artifact index, and the build reports 0 errors.

## Common errors & fixes

| Symptom | Cause | Fix |
| --- | --- | --- |
| The example fails validation | It violates your own profile | Fix the instance, or relax the constraint if the constraint was wrong |
| The example does not appear as an example | Missing `Usage: #example` | Add it — without it the instance is treated as a conformance resource |
| "Unable to resolve reference" | The referenced instance does not exist in the IG | Add the referenced example too, or use a `Reference` with only a `display` |
| Terminology errors on a coded element | The code is not in the bound ValueSet | Use a valid code, or configure SU-TermServ ([secrets](../secrets.md)) if the ValueSet needs the MII server to expand |
