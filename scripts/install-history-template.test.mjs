import assert from "node:assert/strict";
import {
  existsSync,
  mkdtempSync,
  mkdirSync,
  readFileSync,
  symlinkSync,
  writeFileSync,
} from "node:fs";
import { tmpdir } from "node:os";
import { join } from "node:path";
import test from "node:test";

import { installHistoryTemplate } from "./install-history-template.mjs";

function write(path, content = "") {
  mkdirSync(join(path, ".."), { recursive: true });
  writeFileSync(path, content);
}

function fixture(manifest) {
  const root = mkdtempSync(join(tmpdir(), "history-template-"));
  const template = join(root, "template");
  const webroot = join(root, "webroot");
  write(join(template, "manifest.ini"), manifest);
  mkdirSync(webroot);
  return { template, webroot };
}

test("installs overwrite entries and replaces existing content", () => {
  const { template, webroot } = fixture(`[files]
history.css=overwrite
assets-hist=overwrite
`);
  write(join(template, "history.css"), "new stylesheet");
  write(join(template, "assets-hist", "js", "history.js"), "new script");
  write(join(webroot, "history.css"), "old stylesheet");
  write(join(webroot, "assets-hist", "stale.txt"), "remove me");

  const result = installHistoryTemplate({
    templateDirectory: template,
    webrootDirectory: webroot,
  });

  assert.deepEqual(result.installed, ["history.css", "assets-hist"]);
  assert.deepEqual(result.preserved, []);
  assert.equal(
    readFileSync(join(webroot, "history.css"), "utf8"),
    "new stylesheet",
  );
  assert.equal(
    readFileSync(join(webroot, "assets-hist", "js", "history.js"), "utf8"),
    "new script",
  );
  assert.ok(!existsSync(join(webroot, "assets-hist", "stale.txt")));
});

test("if-missing preserves existing entries and installs absent entries", () => {
  const { template, webroot } = fixture(`[files]
fhir.css=if-missing
jquery-ui.js=if-missing
`);
  write(join(template, "fhir.css"), "template stylesheet");
  write(join(template, "jquery-ui.js"), "template script");
  write(join(webroot, "fhir.css"), "published stylesheet");

  const result = installHistoryTemplate({
    templateDirectory: template,
    webrootDirectory: webroot,
  });

  assert.deepEqual(result.installed, ["jquery-ui.js"]);
  assert.deepEqual(result.preserved, ["fhir.css"]);
  assert.equal(
    readFileSync(join(webroot, "fhir.css"), "utf8"),
    "published stylesheet",
  );
  assert.equal(
    readFileSync(join(webroot, "jquery-ui.js"), "utf8"),
    "template script",
  );
});

test("rejects unsafe paths, unknown modes, and duplicate entries", () => {
  for (const manifest of [
    "[files]\n../outside=overwrite\n",
    "[files]\n/absolute=overwrite\n",
    "[files]\nhistory.css=merge\n",
    "[files]\nhistory.css=overwrite\nhistory.css=if-missing\n",
  ]) {
    const { template, webroot } = fixture(manifest);
    assert.throws(() =>
      installHistoryTemplate({
        templateDirectory: template,
        webrootDirectory: webroot,
      }),
    );
  }
});

test("rejects missing sources and symbolic links", () => {
  {
    const { template, webroot } = fixture(
      "[files]\nmissing.css=overwrite\n",
    );
    assert.throws(
      () =>
        installHistoryTemplate({
          templateDirectory: template,
          webrootDirectory: webroot,
        }),
      /source does not exist/,
    );
  }

  {
    const { template, webroot } = fixture("[files]\nlinked.css=overwrite\n");
    write(join(template, "real.css"), "stylesheet");
    symlinkSync("real.css", join(template, "linked.css"));
    assert.throws(
      () =>
        installHistoryTemplate({
          templateDirectory: template,
          webrootDirectory: webroot,
        }),
      /symbolic link/,
    );
  }
});
