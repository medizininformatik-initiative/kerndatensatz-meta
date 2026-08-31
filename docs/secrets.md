# Secrets & variables — enabling the gated features

A module built from this template builds and previews **without any secrets** (it
uses the public HL7 terminology server; announcements skip cleanly). This page
lists the optional secrets that turn on the human-gated features, with the exact
commands. The workflows are already wired — adding the secret is the only step.
Replace `<owner>/<module-repo>` with your module repository.

```sh
gh secret set NAME --repo <owner>/<module-repo> < value.txt
gh variable set NAME --repo <owner>/<module-repo> --body "value"
```

## SU-TermServ terminology server (optional)

The IG build/preview and `go-publish` resolve terminology against the public HL7
server `tx.fhir.org` by default. To use the **MII SU-TermServ**
(`ontoserver.mii-termserv.de`), which fully expands MII value sets (SNOMED CT,
ICD-10-GM, OPS, …), supply the client certificate. It is client-certificate-gated
and granted only to entities in Germany.

Store the certificate **once**, under `SU_TERMSERV_CLIENT_CERT`,
`SU_TERMSERV_CLIENT_KEY` and `SU_TERMSERV_CLIENT_PASSWORD`. The two files are
**base64-encoded** (the workflows decode them with `base64 -d`).

The preview build (`ig-publisher.yml`), the CalVer release build
(`module-release.yml`) and formal publication (`go-publish.yml`) read those
names directly. The fourth consumer, the MII reusable validation workflow,
declares its own `CDS_DEV_CLIENT_CERT` / `_KEY` / `_CERT_PASSWORD` inputs;
`validation.yml` maps this repo's names onto them at the call site (the
`secrets:` block of its `java-validation` job). So one set of secrets serves
all four — you never store the certificate twice.

### What kind of certificate is required

The build workflows pass `-fhir-settings .github/fhir-settings.json` to the
IG Publisher: it allowlists the proxy's plain-HTTP private-network address
(`http://127.0.0.1:8090/fhir`), which the publisher's SSRF hardening (2.3.1+)
would otherwise refuse. The file has no effect on the `tx.fhir.org` fallback.

SU-TermServ authenticates clients with **mutual TLS**. Verified against the live
server (`openssl s_client` to `ontoserver.mii-termserv.de:443`):

- The server **requests** a client certificate and advertises the CAs it accepts
  — the German academic PKI (DFN, GÉANT/HARICA) among them, and SU-TermServ's
  own CA. Ask the server itself if you need the current list.
- The certificate needs the **`TLS Web Client Authentication`** extended key
  usage.
- Without a client certificate the endpoint answers **HTTP 400**.

So a DFN/GÉANT institutional or function certificate works, as does one issued by
the SU-TermServ itself. Being issued by an accepted CA is necessary but not
automatically sufficient — the SU-TermServ still governs access; request it from
them (access is granted to entities in Germany).

> **Prefer a function/service certificate over a personal one.** A personal
> certificate identifies an individual and can usually also sign or encrypt their
> mail; its private key in CI secrets is an identity risk, and access breaks when
> that person leaves. Use a certificate issued for the service.

### Recommended: use the helper script

`scripts/set-su-termserv-secrets.sh` validates everything **before** uploading, and
can prove the certificate against the live server first.

```sh
D=/path/to/certificate
R=<owner>/<your-module-repo>

# 1. Prove it works — validates locally AND does a real mTLS call. Uploads nothing.
scripts/set-su-termserv-secrets.sh --p12 "$D/cert.p12" --password-file "$D/pw.txt" \
  --test --check-only

# 2. Upload
scripts/set-su-termserv-secrets.sh --p12 "$D/cert.p12" --password-file "$D/pw.txt" \
  --repo "$R"
```

It accepts either a **PKCS#12 bundle** (`--p12`, the usual delivery format) or
separate PEM files (`--cert` + `--key`, key encrypted). Omit `--password-file` to
be prompted instead, so the password never reaches your shell history. It checks:
certificate readable and not expired (warning under 30 days), `clientAuth` EKU
present, key decrypts, and **certificate and key match** — then, with `--test`,
that the live server returns HTTP 200.

A successful run looks like:

```text
== 1. Certificate ==   subject=… issuer=… notAfter=…
   Extended Key Usage: includes TLS Web Client Authentication (required for mTLS)
== 2. Private key ==   Key decrypts with the given password.
== 3. Certificate and key belong together ==   Modulus matches.
== 4. Live check ==    HTTP 200 — the server accepted the certificate …
```

### Or set the three secrets by hand

The two files are **base64-encoded, single-line**; the key must be the
**encrypted** PEM (the workflow decrypts it with
`openssl rsa -passin env:SU_TERMSERV_CLIENT_PASSWORD`).

From a PKCS#12 bundle:

```sh
export PWV="$(tr -d '\r\n' < pw.txt)"          # never echoed
openssl pkcs12 -in cert.p12 -clcerts -nokeys -passin env:PWV | openssl x509 -out cert.pem
openssl pkcs12 -in cert.p12 -nocerts -passin env:PWV -passout env:PWV -out key-enc.pem

R=<owner>/<your-module-repo>
base64 < cert.pem    | tr -d '\n' | gh secret set SU_TERMSERV_CLIENT_CERT     --repo "$R"
base64 < key-enc.pem | tr -d '\n' | gh secret set SU_TERMSERV_CLIENT_KEY      --repo "$R"
printf '%s' "$PWV"                 | gh secret set SU_TERMSERV_CLIENT_PASSWORD --repo "$R"
rm -f cert.pem key-enc.pem; unset PWV
```

Three traps that each cost a failed CI run — all handled by the helper script:

| Trap | Symptom | Fix |
| --- | --- | --- |
| Multi-line base64 | The workflow's `echo "$SECRET" \| base64 -d` produces garbage | `tr -d '\n'` (GNU: `base64 -w0`) — macOS wraps at 76 chars |
| `-passin file:` **and** `-passout file:` on the same one-line file | `Error reading password from BIO` | Use `env:` for both — OpenSSL reads the *next* line for the second `file:` |
| A PKCS#12 with several key bags | Handshake fails with a key/cert mismatch | Extract the key whose **modulus matches the certificate** |

### Rotating or revoking

Re-run the helper with the new certificate — `gh secret set` overwrites. To turn
the integration off again, delete the three secrets; the preview and publish
builds fall back to `tx.fhir.org` on the next run with a `::notice`, and the
HL7 Java validator job **skips** (its upstream workflow has no fallback —
without the certificate it would fail, not fall back). Note the expiry date: an expired
certificate fails the handshake, so rotate before `notAfter`.

## Simplifier login (the .NET validation job)

`validation.yml` calls the MII reusable `ci_dotnet_validation.yml` with
`secrets: inherit`; its Simplifier Quality-Control step signs in to
[Simplifier](https://simplifier.net) with two repository secrets:

```sh
R=<owner>/<your-module-repo>
gh secret set SIMPLIFIER_USERNAME --repo "$R"   # value on stdin
gh secret set SIMPLIFIER_PASSWORD --repo "$R"
```

They have no local equivalent, so they are inherited rather than mapped. Note
that the .NET validator is configured to always pass — if the sign-in fails,
the job is still green and only its **log** says so.

## Zulip release announcement (optional)

Your module's release announcement is the `notify_zulip` job of
`module-release.yml`. It fires when a GitHub Release is **published** (not when
the tag is pushed) and posts to the MII Zulip organisation, stream
`MII-Kerndatensatz`, topic `Releases`, as the MII bot
`kds-github-bot@mii.zulipchat.com` — the sender is hard-coded in the job, not a
variable. One secret turns it on:

```sh
R=<owner>/<your-module-repo>
gh secret set ZULIP_API_KEY --repo "$R"   # value on stdin
```

The value is that bot account's Zulip API key, held by whoever administers the
MII bot — ask them for it rather than creating a second bot. Without the secret
the job **skips with a `::notice`; it never fails the release**. Setting the
`ENABLE_ZULIP_ANNOUNCE` variable to `false` turns the job off entirely. See
[release.md § 7](release.md#7-finalize-and-publish-the-github-release--human).

## Verifying a gate after you enable it

Both gates are *wired and fall back safely*, but until the credential exists the
"enabled" code path has never executed. Verify each once, right after enabling:

**SU-TermServ.** Push any branch (or re-run the IG build) and open the
log of the terminology step. Enabled and working looks like
`SU-TermServ client certificate present — starting a local client-cert nginx proxy`
followed by a green build; not configured looks like
`No SU-TermServ client certificate configured — falling back to the public HL7 terminology server https://tx.fhir.org`.
If the proxy fails to start, the step fails loudly rather than silently
mis-expanding value sets — re-check that the cert/key are **base64-encoded** and
that the key password is correct.

**Zulip.** The announcement runs on a published release. To verify
without waiting for the next one, cut a throw-away pre-release in a scratch repo,
or check the job log of the most recent release run — it prints either the
delivered message or the explicit skip notice naming what is missing.

## CI toggles

The variables live in one place: the
[toggle summary in workflows.md](workflows.md#the-toggle-summary), which lists
every pipeline switch in both layers with its default. Only one of them
interacts with a secret on this page — `ENABLE_ZULIP_ANNOUNCE=false` silences
the announcement even when `ZULIP_API_KEY` is set.

Production publication (`go-publish.yml`) always stays a **manual, gated**
`workflow_dispatch` with `publish:false` (dry run) by default — never automatic.
