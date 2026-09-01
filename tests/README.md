# `tests/` — FHIR validation test cases

<!-- Ported from kerndatensatz-basis (main): tests/profiles/ + the
     `profile-test-cases` parameter in its sushi-config.yaml. -->

A profile is only as good as the instances it accepts and rejects. The IG
Publisher can run a set of **validation test cases** as part of the build: each
case names a fixture, the profile it must be validated against, and whether the
fixture is expected to be valid. A profile change that silently starts accepting
bad data — or rejecting good data — then fails the build instead of shipping.

This is the same harness
[kerndatensatz-basis](https://github.com/medizininformatik-initiative/kerndatensatz-basis)
uses (`tests/profiles/`, wired via the `profile-test-cases` parameter).

## Layout

```
tests/profiles/
├── profiles.json                       # the test manifest
├── valid/                              # fixtures that MUST validate
│   └── example-patient-valid.json
└── invalid/                            # fixtures that MUST NOT validate
```

`profiles.json` groups the cases by profile canonical:

```json
{
  "profiles": [
    {
      "url": "<profile canonical, unversioned>",
      "tests": [
        { "source": "valid/<file>.json",   "description": "why this is valid",   "valid": true  },
        { "source": "invalid/<file>.json", "description": "which rule it breaks", "valid": false,
          "outcome": { "resourceType": "OperationOutcome", "issue": [ /* expected messages */ ] } }
      ]
    }
  ]
}
```

- `source` is relative to `tests/profiles/`.
- `description` states *which constraint* the case exercises — write it so a
  reviewer can tell what broke without opening the fixture.
- `outcome` (invalid cases) holds the OperationOutcome the validator is expected
  to produce. Those message strings are produced by a specific IG Publisher
  version; author them by running the build once and copying the actual output
  from the generated `tests/profiles/profiles.out.json`, never by hand.
- `profiles.out.json` is the publisher's **generated** actual-output file. basis
  commits it; treat it as a build artifact you refresh, not as a source file.

Fixtures are synthetic data with obviously artificial names and carry the
`v3-ActReason#HTEST "test health data"` security label, the same tag
`input/fsh/rulesets/test-data-label.fsh` puts on the shipped examples. Never put
real or realistic patient data here.

## Activating the harness

The wiring is one line in `sushi-config.yaml`, under `parameters:`:

```yaml
  profile-test-cases: tests/profiles/profiles.json
```

**It ships COMMENTED OUT.** Uncomment it when you create a module — after
replacing `meta` in `profiles.json` and in the fixtures' `meta.profile`
with your module slug. Two reasons it is not active in the template repo:

1. The template's canonical still contains `meta`. The template repo's
   CI self-check substitutes placeholders only into `sushi-config.yaml`, `ig.ini`
   and the narrative pages — not into `tests/` — so an active
   `profile-test-cases` would make the self-check build validate against a
   canonical that resolves to nothing.
2. Validation test cases run in the **IG Publisher**, not in SUSHI. `sushi .`
   ignores the parameter entirely, so a SUSHI-only check cannot prove the harness
   is green.

## Adding a case

1. Drop the fixture in `valid/` or `invalid/`, named
   `<artifact>-<valid|invalid>-<what-it-exercises>.json` (basis convention, e.g.
   `patient-invalid-mii-pat-1.json` names the invariant it violates).
2. Add an entry under the profile's `url` in `profiles.json`.
3. For an invalid case, build once and copy the produced OperationOutcome from
   `profiles.out.json` into the `outcome` field.
4. Rebuild — the case now guards that rule.
