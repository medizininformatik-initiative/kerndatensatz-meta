# Recipe: add a profile

**Goal.** Write your first FHIR profile in FSH, build it, and read the QA report.

**Prerequisites.** A module created from this template that already builds (see
[create-a-new-module.md](create-a-new-module.md)).

## Steps

1. Look at the shipped example `input/fsh/profiles/example-patient.fsh` and its
   instance `input/fsh/instances/example-patient-instance.fsh` — copy their shape.
2. Create your profile file under `input/fsh/profiles/`. Name the **artifact**
   per the MII naming conventions (meta wiki, *Namenskonventionen für
   FHIR-Ressourcen in der MII*). For the **file** name this scaffold follows
   kerndatensatz-basis — `MII_PR_<Module>_<Name>.fsh`, e.g.
   `MII_PR_Person_Patient.fsh`; SUSHI does not care, but matching basis keeps
   MII modules navigable the same way (see `input/fsh/README.md`).
   The quickest correct start is to copy `example-patient.fsh`, rename it, and
   edit — it already carries the shared metadata block. The shape:
   ```fsh
   Profile: MII_PR_Person_Patient
   Parent: Patient
   Id: mii-pr-person-patient
   Title: "MII PR Person Patient"
   Description: "…"
   // Copy the shared MII metadata block (insert Translation, PR_CS_VS_Version,
   // Publisher, the licence and the CRMI rules) verbatim from
   // input/fsh/profiles/example-patient.fsh — every MII conformance resource
   // carries it. See input/fsh/rulesets/README.md.
   * name 1..* MS
   * birthDate 1..1 MS
   ```
   `Title` and `Description` are authored in **English**, the IG's default
   language; German goes in additively via the `Translation` RuleSet, as the
   starter shows.
   > **Why start terminology-light:** a profile that binds to external code systems
   > needs a terminology server to validate. Cardinality + Must-Support constraints
   > build cleanly on the `tx.fhir.org` fallback — add coded bindings once your
   > terminology is set up.
3. Add at least one example `Instance:` (use an obviously **synthetic** name, e.g.
   `Max Mustermann-Testpatient` — never real or realistic patient data).
4. Add the profile's page to the nav if you want it prominent (the `Profiles and
   Extensions` page auto-lists artifacts).
5. Build: `sushi .` (fast — catches FSH errors), then the IG Publisher for the full
   QA. Or push a `feature/*` branch for the CI preview.
6. **Read the QA report:** open `output/qa.html`. It lists errors (must fix),
   warnings (review), and information. Aim for **0 errors**.

## Expected result

Your profile appears on the IG's "Profiles and Extensions" page with a rendered
structure, and your example validates against it; `qa.html` shows 0 errors.

## Common errors & fixes

| Symptom | Cause | Fix |
| --- | --- | --- |
| SUSHI error "unknown parent" | Misspelled `Parent:` or a missing dependency | Check the resource/profile name and `sushi-config.yaml` dependencies |
| "Unable to resolve code system" | A coded binding needs a terminology server | Configure SU-TermServ, or drop the binding while prototyping |
| Example fails validation | The instance violates your own constraints | Fix the instance or relax the constraint |
| Profile not shown | Not compiled (wrong folder/extension) | It must be a `.fsh` file under `input/fsh/` |
