#!/usr/bin/env bash
# set-su-termserv-secrets.sh — install the SU-TermServ client certificate as
# repository secrets, validating it locally first.
#
# WHY THIS EXISTS
#   The build routes terminology to the MII terminology server (SU-TermServ) when
#   a client certificate is configured, and otherwise falls back to the public
#   HL7 server. A wrong encoding, the wrong key out of a bundle, or a bad password
#   surfaces as an opaque TLS failure deep inside a CI run — so this script checks
#   the material locally FIRST, can prove it against the live server, and only
#   then uploads.
#
#   The certificate never leaves your machine except as a GitHub secret: it is
#   base64-encoded and handed straight to the GitHub secrets API by `gh`.
#
# USAGE
#   # from a PKCS#12 bundle (.p12/.pfx — how certificates are usually delivered)
#   scripts/set-su-termserv-secrets.sh --p12 cert.p12 [--password-file pw.txt] [--repo owner/repo]
#
#   # from separate PEM files (key must be the ENCRYPTED PEM)
#   scripts/set-su-termserv-secrets.sh --cert cert.pem --key key-enc.pem [--repo owner/repo]
#
#   Options:
#     --check-only     validate locally, upload nothing
#     --test           additionally prove the certificate against the live
#                      SU-TermServ endpoint (mTLS handshake + /fhir/metadata)
#     --password-file  read the key/bundle password from a file's first line
#                      (otherwise you are prompted; never passed as an argument)
#
# WHAT IT SETS
#   SU_TERMSERV_CLIENT_CERT      base64 (single line) of the client certificate PEM
#   SU_TERMSERV_CLIENT_KEY       base64 (single line) of the ENCRYPTED private key PEM
#   SU_TERMSERV_CLIENT_PASSWORD  the key password, plain text
set -euo pipefail

CERT=""; KEY=""; P12=""; PWFILE=""; REPO=""; CHECK_ONLY="false"; DO_TEST="false"
ENDPOINT="${SU_TERMSERV_ENDPOINT:-https://ontoserver.mii-termserv.de/fhir}"
while [ $# -gt 0 ]; do
  case "$1" in
    --cert) CERT="${2:?}"; shift 2 ;;
    --key)  KEY="${2:?}";  shift 2 ;;
    --p12|--pkcs12) P12="${2:?}"; shift 2 ;;
    --password-file) PWFILE="${2:?}"; shift 2 ;;
    --repo) REPO="${2:?}"; shift 2 ;;
    --check-only) CHECK_ONLY="true"; shift ;;
    --test) DO_TEST="true"; shift ;;
    -h|--help) sed -n '2,34p' "$0"; exit 0 ;;
    *) echo "unknown argument: $1" >&2; exit 2 ;;
  esac
done

command -v openssl >/dev/null || { echo "ERROR: openssl not found." >&2; exit 1; }
WORK="$(mktemp -d)"; chmod 700 "$WORK"
trap 'rm -rf "${WORK}"' EXIT

# ---- password (never in argv, never echoed) ---------------------------------
if [ -n "${PWFILE}" ]; then
  [ -r "${PWFILE}" ] || { echo "ERROR: cannot read password file: ${PWFILE}" >&2; exit 1; }
  PWV="$(tr -d '\r\n' < "${PWFILE}")"
else
  printf 'SU-TermServ key password: ' >&2; read -rs PWV; echo >&2
fi
export PWV
[ -n "${PWV}" ] || { echo "ERROR: empty password." >&2; exit 1; }

# ---- obtain cert + encrypted key -------------------------------------------
if [ -n "${P12}" ]; then
  [ -r "${P12}" ] || { echo "ERROR: cannot read ${P12}" >&2; exit 1; }
  echo "== Extracting from the PKCS#12 bundle =="
  # -legacy is needed for bundles using older (RC2/3DES) algorithms under OpenSSL 3.
  { openssl pkcs12 -in "${P12}" -clcerts -nokeys -passin env:PWV 2>/dev/null \
      || openssl pkcs12 -legacy -in "${P12}" -clcerts -nokeys -passin env:PWV 2>/dev/null; } \
    | openssl x509 -out "${WORK}/cert.pem" 2>/dev/null \
    || { echo "ERROR: could not extract the certificate (wrong password?)." >&2; exit 1; }
  # NOTE: -passin and -passout must NOT both use `file:` on a one-line file —
  # OpenSSL reads the *next* line for the second one and fails. Use env: for both.
  openssl pkcs12 -in "${P12}" -nocerts -passin env:PWV -passout env:PWV -out "${WORK}/key.pem" 2>/dev/null \
    || openssl pkcs12 -legacy -in "${P12}" -nocerts -passin env:PWV -passout env:PWV -out "${WORK}/key.pem" 2>/dev/null \
    || { echo "ERROR: could not extract the private key." >&2; exit 1; }
  CERT="${WORK}/cert.pem"; KEY="${WORK}/key.pem"
  chmod 600 "${CERT}" "${KEY}"
else
  [ -n "${CERT}" ] && [ -n "${KEY}" ] || { echo "ERROR: give --p12, or both --cert and --key. See --help." >&2; exit 2; }
  [ -r "${CERT}" ] && [ -r "${KEY}" ] || { echo "ERROR: cannot read the certificate or key file." >&2; exit 1; }
fi

# ---- validate ---------------------------------------------------------------
echo
echo "== 1. Certificate =="
openssl x509 -in "${CERT}" -noout -subject -issuer -dates | sed 's/^/   /'
openssl x509 -in "${CERT}" -noout -checkend 0 >/dev/null || { echo "ERROR: certificate has EXPIRED." >&2; exit 1; }
openssl x509 -in "${CERT}" -noout -checkend 2592000 >/dev/null || echo "   WARNING: expires within 30 days."
if openssl x509 -in "${CERT}" -noout -ext extendedKeyUsage 2>/dev/null | grep -qi 'TLS Web Client Authentication'; then
  echo "   Extended Key Usage: includes TLS Web Client Authentication (required for mTLS)"
else
  echo "   WARNING: no 'TLS Web Client Authentication' EKU — the server may reject this certificate."
fi

echo
echo "== 2. Private key =="
if openssl rsa -in "${KEY}" -passin env:PWV -noout 2>/dev/null; then
  echo "   Key decrypts with the given password."
elif openssl rsa -in "${KEY}" -noout 2>/dev/null; then
  echo "ERROR: the key is NOT encrypted. The workflow runs" >&2
  echo "       'openssl rsa -passin env:SU_TERMSERV_CLIENT_PASSWORD', which needs an encrypted PEM." >&2
  echo "       Encrypt it: openssl rsa -aes256 -in key.pem -out key-enc.pem" >&2
  exit 1
else
  echo "ERROR: the key could not be read/decrypted — wrong password or unsupported format." >&2; exit 1
fi

echo
echo "== 3. Certificate and key belong together =="
# A PKCS#12 may hold several key bags (e.g. separate signing and encryption keys);
# this catches the case where the wrong one was extracted.
if [ "$(openssl x509 -in "${CERT}" -noout -modulus | openssl md5)" \
   = "$(openssl rsa -in "${KEY}" -passin env:PWV -noout -modulus 2>/dev/null | openssl md5)" ]; then
  echo "   Modulus matches."
else
  echo "ERROR: certificate and key do NOT match (different modulus)." >&2
  echo "       If this came from a multi-key PKCS#12, extract the key belonging to THIS certificate." >&2
  exit 1
fi

# ---- optional live proof ----------------------------------------------------
if [ "${DO_TEST}" = "true" ]; then
  echo
  echo "== 4. Live check against ${ENDPOINT} =="
  command -v curl >/dev/null || { echo "ERROR: curl not found." >&2; exit 1; }
  openssl rsa -in "${KEY}" -passin env:PWV -out "${WORK}/key-plain.pem" 2>/dev/null
  chmod 600 "${WORK}/key-plain.pem"
  code="$(curl -sS --max-time 45 -o "${WORK}/meta.json" -w '%{http_code}' \
          --cert "${CERT}" --key "${WORK}/key-plain.pem" \
          "${ENDPOINT}/metadata?_summary=true" 2>"${WORK}/curl.err" || true)"
  if [ "${code}" = "200" ]; then
    echo "   HTTP 200 — the server accepted the certificate and returned its CapabilityStatement."
  else
    echo "   HTTP ${code:-<none>} — NOT accepted." >&2
    head -3 "${WORK}/curl.err" | sed 's/^/   curl: /' >&2 || true
    echo "   The certificate must be issued by a CA the server accepts AND be authorised by the SU-TermServ." >&2
    exit 1
  fi
fi

if [ "${CHECK_ONLY}" = "true" ]; then
  echo; echo "All checks passed. Re-run without --check-only to upload the secrets."; exit 0
fi

command -v gh >/dev/null || { echo "ERROR: the GitHub CLI (gh) is required to set secrets." >&2; exit 1; }
REPO_ARGS=(); [ -n "${REPO}" ] && REPO_ARGS=(--repo "${REPO}")

echo
echo "== Uploading the secrets${REPO:+ to ${REPO}} =="
# base64 MUST be single-line: the workflow runs `echo "$SECRET" | base64 -d`,
# and macOS `base64` wraps at 76 characters by default.
base64 < "${CERT}" | tr -d '\n' | gh secret set SU_TERMSERV_CLIENT_CERT "${REPO_ARGS[@]}"
base64 < "${KEY}"  | tr -d '\n' | gh secret set SU_TERMSERV_CLIENT_KEY  "${REPO_ARGS[@]}"
printf '%s' "${PWV}" | gh secret set SU_TERMSERV_CLIENT_PASSWORD "${REPO_ARGS[@]}"

echo
echo "Done — the SU-TermServ credential is configured."
echo "Verify in CI: push any branch and read the terminology step's log."
echo "  enabled  -> 'SU-TermServ client certificate present — starting a local client-cert nginx proxy'"
echo "  fallback -> 'No SU-TermServ credential — falling back to the public HL7 terminology server'"
