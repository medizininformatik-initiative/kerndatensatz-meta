#!/usr/bin/env node
// gen-cps-search-examples.mjs — writes example search queries into the
// CapabilityStatement, taken from the SearchParameter CI tests.
//
// Design rules:
// - The CI tests (.github/workflows/search-param-test/test-search.sh) are the
//   single source of the examples: every documented query is one that CI runs
//   against Blaze loaded with the MII test data and that returns at least one
//   resource. Tests expecting 0 results are not examples and are skipped.
// - The script owns every `searchParam[=].documentation` line of the
//   CapabilityStatement and nothing else; it rewrites them in place, directly
//   after the matching `searchParam[=].type` line.
// - An example attaches to every searchParam of the CapabilityStatement it
//   uses. Parameters the CapabilityStatement does not list (FHIR core ones such
//   as Condition `code`) get nothing. `_include=<Type>:<param>` attaches to
//   `<param>` on `<Type>`.
// - Zero npm dependencies; Node 22 built-ins only.
//
// Usage:  node scripts/gen-cps-search-examples.mjs           # rewrite the FSH
//         node scripts/gen-cps-search-examples.mjs --check   # exit 1 on drift
import { readFileSync, writeFileSync } from "node:fs";
import { fileURLToPath } from "node:url";
import path from "node:path";

const repository = fileURLToPath(new URL("../", import.meta.url));
export const TESTS_FILE = ".github/workflows/search-param-test/test-search.sh";
export const CPS_FILE = "input/fsh/capabilitystatements/mii-cps-meta-server-capabilities.fsh";

const DOC_LINE = /^\* rest\[0\]\.resource\[=\]\.searchParam\[=\]\.documentation = /;
const RESOURCE_LINE = /^\* rest\[0\]\.resource\[\+\]\.type = #(\w+)\s*$/;
const NAME_LINE = /^\* rest\[0\]\.resource\[=\]\.searchParam\[\+\]\.name = "([^"]+)"\s*$/;
const TYPE_LINE = /^\* rest\[0\]\.resource\[=\]\.searchParam\[=\]\.type = /;

/** Top-level `NAME="value"` assignments of the test script. */
export function parseShellVariables(script) {
  const variables = new Map();
  for (const match of script.matchAll(/^([A-Za-z_][A-Za-z0-9_]*)="([^"]*)"\s*$/gm)) {
    variables.set(match[1], match[2]);
  }
  return variables;
}

function expand(value, variables) {
  return value.replace(/\$\{?([A-Za-z_][A-Za-z0-9_]*)\}?/g, (whole, name) =>
    variables.has(name) ? variables.get(name) : whole,
  );
}

function decode(value) {
  return value.replace(/(%[0-9A-Fa-f]{2})+/g, (encoded) => {
    try {
      return decodeURIComponent(encoded);
    } catch {
      return encoded;
    }
  });
}

/**
 * The example queries of the test script, in file order, de-duplicated:
 * [{ resourceType, query }] with variables expanded and percent-encoding
 * decoded. Commented-out tests and tests expecting a count of 0 are skipped.
 */
export function parseExampleQueries(script) {
  const variables = parseShellVariables(script);
  const logicalLines = script.replace(/\\\r?\n/g, " ").split(/\r?\n/);
  const examples = [];
  const seen = new Set();
  const add = (resourceType, rawQuery) => {
    const query = decode(expand(rawQuery, variables));
    const key = `${resourceType}?${query}`;
    if (seen.has(key)) return;
    seen.add(key);
    examples.push({ resourceType, query });
  };

  for (const line of logicalLines) {
    const text = line.trim();
    let match;
    if ((match = text.match(/^test_at_least_one\s+"[^"]*"\s+"\$\(search "(\w+)" "([^"]*)"\)"/))) {
      add(match[1], match[2]);
    } else if ((match = text.match(/^test\s+"[^"]*"\s+"\$\(search "(\w+)" "([^"]*)"\)"\s+"([^"]*)"/))) {
      if (match[3] !== "0") add(match[1], match[2]);
    } else if ((match = text.match(/^test_includes_resource_type\s+"[^"]*"\s+"(\w+)"\s+"([^"]*)"\s+"\w+"/))) {
      add(match[1], match[2]);
    }
  }
  return examples;
}

/** The [resourceType, parameterName] pairs a query uses. */
export function parametersOf({ resourceType, query }) {
  const used = [];
  for (const part of query.split("&")) {
    const key = part.split("=", 1)[0];
    const value = part.slice(key.length + 1);
    if (key === "_include" || key === "_revinclude") {
      const [type, name] = value.split(":");
      if (type && name) used.push([type, name]);
    } else if (!key.startsWith("_")) {
      used.push([resourceType, key.split(/[:.]/, 1)[0]]);
    }
  }
  return used;
}

function fshString(value) {
  return value.replaceAll("\\", "\\\\").replaceAll('"', '\\"');
}

export function documentationFor(queries) {
  const calls = queries.map((query) => `\`GET [base]/${query}\``);
  const text =
    calls.length === 1
      ? `**Example** (tested in CI): ${calls[0]}`
      : `**Examples** (tested in CI):\n\n${calls.map((call) => `- ${call}`).join("\n")}`;
  return `* rest[0].resource[=].searchParam[=].documentation = "${fshString(text).replaceAll("\n", "\\n")}"`;
}

/**
 * Rewrites the documentation lines of the CapabilityStatement source.
 * Returns { fsh, documented, unmatched } — `unmatched` lists the query
 * parameters the CapabilityStatement does not declare.
 */
export function applyExamples(cpsSource, examples) {
  const queriesByParameter = new Map();
  const declared = new Set();
  let resourceType = null;
  for (const line of cpsSource.split("\n")) {
    let match;
    if ((match = line.match(RESOURCE_LINE))) resourceType = match[1];
    else if ((match = line.match(NAME_LINE))) declared.add(`${resourceType}.${match[1]}`);
  }

  const unmatched = new Set();
  for (const example of examples) {
    const query = `${example.resourceType}?${example.query}`;
    for (const [type, name] of parametersOf(example)) {
      const key = `${type}.${name}`;
      if (!declared.has(key)) {
        unmatched.add(key);
        continue;
      }
      if (!queriesByParameter.has(key)) queriesByParameter.set(key, []);
      if (!queriesByParameter.get(key).includes(query)) queriesByParameter.get(key).push(query);
    }
  }

  const output = [];
  resourceType = null;
  let current = null;
  for (const line of cpsSource.split("\n")) {
    if (DOC_LINE.test(line)) continue;
    output.push(line);
    let match;
    if ((match = line.match(RESOURCE_LINE))) resourceType = match[1];
    else if ((match = line.match(NAME_LINE))) current = `${resourceType}.${match[1]}`;
    else if (TYPE_LINE.test(line) && current && queriesByParameter.has(current)) {
      output.push(documentationFor(queriesByParameter.get(current)));
    }
  }

  return { fsh: output.join("\n"), documented: queriesByParameter.size, unmatched: [...unmatched].sort() };
}

export function generate(root = repository) {
  const script = readFileSync(path.join(root, TESTS_FILE), "utf8");
  const cps = readFileSync(path.join(root, CPS_FILE), "utf8");
  const examples = parseExampleQueries(script);
  return { current: cps, examples, ...applyExamples(cps, examples) };
}

if (process.argv[1] && path.resolve(process.argv[1]) === fileURLToPath(import.meta.url)) {
  const check = process.argv.includes("--check");
  const { current, fsh, examples, documented, unmatched } = generate();
  if (check) {
    if (current !== fsh) {
      console.error(
        `${CPS_FILE} is out of step with ${TESTS_FILE}.\n` +
          "Run: node scripts/gen-cps-search-examples.mjs",
      );
      process.exit(1);
    }
    console.log(`${CPS_FILE}: examples in step with the CI tests (${documented} parameters).`);
  } else {
    writeFileSync(path.join(repository, CPS_FILE), fsh);
    console.log(`${examples.length} example queries → ${documented} documented parameters in ${CPS_FILE}.`);
    if (unmatched.length) {
      console.log(`Not declared in the CapabilityStatement (no example written): ${unmatched.join(", ")}`);
    }
  }
}
