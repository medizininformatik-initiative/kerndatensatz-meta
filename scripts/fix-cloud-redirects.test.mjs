import assert from "node:assert/strict";
import { mkdtempSync, mkdirSync, readFileSync, writeFileSync } from "node:fs";
import { tmpdir } from "node:os";
import { join } from "node:path";
import test from "node:test";

import { fixCloudRedirects } from "./fix-cloud-redirects.mjs";

const publisherPhp = `<?php
function Redirect($url)
{
  header('Location: ' . $url, true, 302);
  exit();
}

$accept = $_SERVER['HTTP_ACCEPT'];
if (strpos($accept, 'application/json+fhir') !== false)
  Redirect('../StructureDefinition-example.json2');
elseif (strpos($accept, 'application/fhir+json') !== false)
  Redirect('../StructureDefinition-example.json1');
elseif (strpos($accept, 'json') !== false)
  Redirect('../StructureDefinition-example.json');
elseif (strpos($accept, 'application/xml+fhir') !== false)
  Redirect('../StructureDefinition-example.xml2');
elseif (strpos($accept, 'application/fhir+xml') !== false)
  Redirect('../StructureDefinition-example.xml1');
elseif (strpos($accept, 'html') !== false)
  Redirect('../StructureDefinition-example.html');
else
  Redirect('../StructureDefinition-example.xml');
?>

You should not be seeing this page. If you do, PHP has failed badly.
`;

test("converts Publisher index.php to a static index.html", () => {
  const root = mkdtempSync(join(tmpdir(), "cloud-redirect-"));
  const redirectDirectory = join(root, "StructureDefinition", "example");
  mkdirSync(redirectDirectory, { recursive: true });
  writeFileSync(join(redirectDirectory, "index.php"), publisherPhp);

  assert.equal(fixCloudRedirects(root), 1);
  const html = readFileSync(join(redirectDirectory, "index.html"), "utf8");
  assert.match(html, /window\.location\.replace\("\.\.\/StructureDefinition-example\.html"\)/);
  assert.match(html, /href="\.\.\/StructureDefinition-example\.json"/);
  assert.doesNotMatch(html, /<\?php/);
});

test("converts PHP accidentally emitted as index.html", () => {
  const root = mkdtempSync(join(tmpdir(), "cloud-redirect-html-"));
  mkdirSync(join(root, "ValueSet", "example"), { recursive: true });
  const filename = join(root, "ValueSet", "example", "index.html");
  writeFileSync(filename, publisherPhp);

  assert.equal(fixCloudRedirects(root), 1);
  assert.match(readFileSync(filename, "utf8"), /^<!DOCTYPE html>/);
});

test("does not touch unrelated PHP", () => {
  const root = mkdtempSync(join(tmpdir(), "cloud-redirect-unrelated-"));
  mkdirSync(join(root, "tool"), { recursive: true });
  const filename = join(root, "tool", "index.php");
  writeFileSync(filename, "<?php echo 'unrelated';");

  assert.equal(fixCloudRedirects(root), 0);
  assert.equal(readFileSync(filename, "utf8"), "<?php echo 'unrelated';");
});

test("does not inspect or change marker-backed preview deployments", () => {
  const root = mkdtempSync(join(tmpdir(), "cloud-redirect-preview-"));
  const preview = join(root, "branches", "develop");
  const redirectDirectory = join(preview, "StructureDefinition", "example");
  mkdirSync(redirectDirectory, { recursive: true });
  writeFileSync(join(preview, ".branch-name"), "develop\n");
  writeFileSync(join(redirectDirectory, "index.php"), publisherPhp);

  assert.equal(fixCloudRedirects(root), 0);
  assert.equal(
    readFileSync(join(redirectDirectory, "index.php"), "utf8"),
    publisherPhp,
  );
});
