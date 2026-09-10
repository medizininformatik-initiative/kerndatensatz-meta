import assert from "node:assert/strict";
import {
  mkdtempSync,
  mkdirSync,
  readFileSync,
  rmSync,
  symlinkSync,
  writeFileSync,
} from "node:fs";
import { tmpdir } from "node:os";
import { join } from "node:path";
import test from "node:test";

import {
  snapshotPreviewDeployments,
  verifyPreviewDeployments,
} from "./verify-preview-preservation.mjs";

function fixture() {
  const root = mkdtempSync(join(tmpdir(), "preview-preservation-"));
  const site = join(root, "site");
  const manifest = join(root, "preview-manifest.json");
  mkdirSync(site);
  return { manifest, root, site };
}

function write(path, content = "") {
  mkdirSync(join(path, ".."), { recursive: true });
  writeFileSync(path, content);
}

test("snapshots and verifies exactly the marker-backed previews", () => {
  const { manifest, site } = fixture();
  write(join(site, ".branch-name"), "main\n");
  write(join(site, "index.html"), "legacy Pages root");
  write(join(site, "2026.0.0", ".branch-name"), "2026.0.0\n");
  write(join(site, "2026.0.0", "index.html"), "historical deployment");
  write(join(site, "z-preview", ".branch-name"), "z-preview\n");
  write(join(site, "z-preview", "empty-directory", ".keep"), "");
  write(join(site, "z-preview", "resource.json"), '{"id":"z"}\n');
  write(join(site, "branches", "develop", ".branch-name"), "develop\n");
  write(join(site, "branches", "develop", "index.html"), "develop preview");

  const snapshot = snapshotPreviewDeployments({
    siteDirectory: site,
    manifestFile: manifest,
    excludedDirectories: ["./2026.0.0", "2026.0.0"],
  });

  assert.deepEqual(snapshot.excludedDirectories, ["2026.0.0"]);
  assert.deepEqual(
    snapshot.previews.map(({ branch, directory }) => ({ branch, directory })),
    [
      { branch: "develop", directory: "branches/develop" },
      { branch: "z-preview", directory: "z-preview" },
    ],
  );
  for (const preview of snapshot.previews) {
    assert.match(preview.digest, /^sha256:[0-9a-f]{64}$/);
    assert.ok(preview.files >= 2);
    assert.ok(preview.bytes > 0);
  }

  assert.deepEqual(verifyPreviewDeployments({
    siteDirectory: site,
    manifestFile: manifest,
  }), snapshot.previews);

  const serialized = readFileSync(manifest, "utf8");
  snapshotPreviewDeployments({
    siteDirectory: site,
    manifestFile: `${manifest}.second`,
    excludedDirectories: ["2026.0.0"],
  });
  assert.equal(readFileSync(`${manifest}.second`, "utf8"), serialized);
});

test("verification rejects changed bytes and marker branch values", () => {
  const { manifest, site } = fixture();
  write(join(site, "develop", ".branch-name"), "develop\n");
  write(join(site, "develop", "index.html"), "before");

  snapshotPreviewDeployments({
    siteDirectory: site,
    manifestFile: manifest,
  });
  write(join(site, "develop", "index.html"), "after");
  assert.throws(
    () => verifyPreviewDeployments({
      siteDirectory: site,
      manifestFile: manifest,
    }),
    /Preview develop changed \(digest:/,
  );

  write(join(site, "develop", "index.html"), "before");
  write(join(site, "develop", ".branch-name"), "renamed\n");
  assert.throws(
    () => verifyPreviewDeployments({
      siteDirectory: site,
      manifestFile: manifest,
    }),
    /Preview develop changed \(branch:/,
  );
});

test("verification rejects added and removed preview deployments", () => {
  const { manifest, site } = fixture();
  write(join(site, "develop", ".branch-name"), "develop\n");
  write(join(site, "develop", "index.html"), "develop");
  snapshotPreviewDeployments({
    siteDirectory: site,
    manifestFile: manifest,
  });

  write(join(site, "feature", ".branch-name"), "feature\n");
  write(join(site, "feature", "index.html"), "feature");
  assert.throws(
    () => verifyPreviewDeployments({
      siteDirectory: site,
      manifestFile: manifest,
    }),
    /Preview deployment set changed/,
  );

  rmSync(join(site, "feature"), { recursive: true });
  rmSync(join(site, "develop"), { recursive: true });
  assert.throws(
    () => verifyPreviewDeployments({
      siteDirectory: site,
      manifestFile: manifest,
    }),
    /Preview deployment set changed/,
  );
});

test("snapshot rejects empty and nested branch markers", () => {
  const empty = fixture();
  write(join(empty.site, "develop", ".branch-name"), " \n");
  assert.throws(
    () => snapshotPreviewDeployments({
      siteDirectory: empty.site,
      manifestFile: empty.manifest,
    }),
    /Empty branch marker/,
  );

  const nested = fixture();
  write(join(nested.site, "branches", ".branch-name"), "branches\n");
  write(join(nested.site, "branches", "develop", ".branch-name"), "develop\n");
  assert.throws(
    () => snapshotPreviewDeployments({
      siteDirectory: nested.site,
      manifestFile: nested.manifest,
    }),
    /Nested branch deployments are ambiguous/,
  );
});

test("snapshot and verification reject symbolic links", () => {
  const first = fixture();
  write(join(first.site, "develop", ".branch-name"), "develop\n");
  write(join(first.site, "outside.txt"), "outside");
  symlinkSync(
    join(first.site, "outside.txt"),
    join(first.site, "develop", "linked.txt"),
  );
  assert.throws(
    () => snapshotPreviewDeployments({
      siteDirectory: first.site,
      manifestFile: first.manifest,
    }),
    /Symbolic links are not allowed/,
  );

  const second = fixture();
  write(join(second.site, "develop", ".branch-name"), "develop\n");
  write(join(second.site, "develop", "index.html"), "develop");
  snapshotPreviewDeployments({
    siteDirectory: second.site,
    manifestFile: second.manifest,
  });
  symlinkSync(
    join(second.site, "develop", "index.html"),
    join(second.site, "develop", "linked.html"),
  );
  assert.throws(
    () => verifyPreviewDeployments({
      siteDirectory: second.site,
      manifestFile: second.manifest,
    }),
    /Symbolic links are not allowed/,
  );
});
