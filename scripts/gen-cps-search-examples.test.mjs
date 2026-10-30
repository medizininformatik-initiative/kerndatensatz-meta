// Run with:  node --test scripts/gen-cps-search-examples.test.mjs
import { test } from "node:test";
import assert from "node:assert/strict";

import {
  applyExamples,
  documentationFor,
  generate,
  parametersOf,
  parseExampleQueries,
} from "./gen-cps-search-examples.mjs";

const SCRIPT = `
B05_3="http://fhir.de/CodeSystem/bfarm/icd-10-gm|B05.3"
A="https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_ICD_DIAGNOSESICHERHEIT|A"

test_at_least_one "Condition.code B05.3 count" \\
     "$(search "Condition" "code=$B05_3")"

test "Diagnosesicherheit A count" \\
     "$(search "Condition" "code=$B05_3&icd10gm-diagnosesicherheit=$A")" \\
     "0"

test "Patient with adresszusatz=Burg count" \\
     "$(search "Patient" "adresszusatz=Burg")" \\
     "1"

#test_at_least_one "commented out" \\
#     "$(search "Patient" "strasse=Nowhere")"

test_at_least_one "ImagingStudy body site" \\
                  "$(search "ImagingStudy" "modality-body-site=http://dicom.nema.org/resources/ontology/DCM%7CMR%24http://snomed.info/sct%7C76752008")"

test_includes_resource_type "Procedure with _include=Procedure:recorder" \\
                           "Procedure" "_include=Procedure:recorder" "Practitioner"

test_at_least_one "duplicate" \\
     "$(search "Patient" "adresszusatz=Burg")"
`;

const CPS = [
  "* rest[0].mode = #server",
  "* rest[0].resource[+].type = #Patient",
  '* rest[0].resource[=].searchParam[+].name = "adresszusatz"',
  '* rest[0].resource[=].searchParam[=].definition = "https://example.org/SearchParameter/a"',
  "* rest[0].resource[=].searchParam[=].type = #string",
  '* rest[0].resource[=].searchParam[+].name = "strasse"',
  '* rest[0].resource[=].searchParam[=].definition = "https://example.org/SearchParameter/b"',
  "* rest[0].resource[=].searchParam[=].type = #string",
  "* rest[0].resource[+].type = #Procedure",
  '* rest[0].resource[=].searchParam[+].name = "recorder"',
  '* rest[0].resource[=].searchParam[=].definition = "https://example.org/SearchParameter/c"',
  "* rest[0].resource[=].searchParam[=].type = #reference",
  "",
].join("\n");

test("parseExampleQueries keeps positive tests, expands variables and decodes", () => {
  assert.deepEqual(parseExampleQueries(SCRIPT), [
    { resourceType: "Condition", query: "code=http://fhir.de/CodeSystem/bfarm/icd-10-gm|B05.3" },
    { resourceType: "Patient", query: "adresszusatz=Burg" },
    {
      resourceType: "ImagingStudy",
      query: "modality-body-site=http://dicom.nema.org/resources/ontology/DCM|MR$http://snomed.info/sct|76752008",
    },
    { resourceType: "Procedure", query: "_include=Procedure:recorder" },
  ]);
});

test("parametersOf maps _include to the reference parameter and strips modifiers", () => {
  assert.deepEqual(parametersOf({ resourceType: "Procedure", query: "_include=Procedure:recorder" }), [
    ["Procedure", "recorder"],
  ]);
  assert.deepEqual(parametersOf({ resourceType: "Patient", query: "strasse:exact=X&hausnummer=9&_count=1" }), [
    ["Patient", "strasse"],
    ["Patient", "hausnummer"],
  ]);
});

test("documentationFor escapes quotes and uses a list for several queries", () => {
  assert.equal(
    documentationFor(['Patient?name="x"']),
    '* rest[0].resource[=].searchParam[=].documentation = "**Example** (tested in CI): `GET [base]/Patient?name=\\"x\\"`"',
  );
  assert.match(documentationFor(["Patient?a=1", "Patient?a=2"]), /\\n- `GET \[base\]\/Patient\?a=2`"$/);
});

test("applyExamples writes after the type line, skips undeclared parameters and is idempotent", () => {
  const examples = parseExampleQueries(SCRIPT);
  const first = applyExamples(CPS, examples);
  const lines = first.fsh.split("\n");
  const typeLine = lines.indexOf("* rest[0].resource[=].searchParam[=].type = #string");
  assert.match(lines[typeLine + 1], /documentation = .*Patient\?adresszusatz=Burg/);
  assert.equal(first.documented, 2);
  assert.deepEqual(first.unmatched, ["Condition.code", "ImagingStudy.modality-body-site"]);
  assert.equal(applyExamples(first.fsh, examples).fsh, first.fsh);
});

test("the CapabilityStatement is in step with the CI tests", () => {
  const { current, fsh } = generate();
  assert.equal(current, fsh, "Run: node scripts/gen-cps-search-examples.mjs");
});
