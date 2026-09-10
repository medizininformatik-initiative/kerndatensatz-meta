#!/usr/bin/env bash
#
# hapi-smoketest.sh — Release-Gate: lädt das gebaute FHIR-Package in einen frischen
# HAPI FHIR und prüft, ob der Server sauber startet.
#
# Fängt genau die Fehlerklasse, die 2026.4.0–2026.5.1 unbrauchbar machte:
#   HAPI-0838 (ConceptMap ohne group.source) → HAPI-1286 → "Application run failed".
#
# Nutzung:
#   scripts/hapi-smoketest.sh [PFAD_ZUM_TGZ]
#     Ohne Argument wird der Tarball aus package.json (name-version.tgz) abgeleitet.
#
# Env-Overrides:
#   HAPI_IMAGE   (default hapiproject/hapi:v7.6.0)
#   SERVE_PORT   (default 8899)   Host-Port des temporären HTTP-Servers
#   HAPI_PORT    (default 8080)   Host-Port des HAPI-Containers
#   TIMEOUT_SEC  (default 240)    Max. Wartezeit auf Serverstart
#
# Exit 0 = HAPI startet sauber; Exit 1 = Crash/Timeout (Release blockieren).

set -euo pipefail

HAPI_IMAGE="${HAPI_IMAGE:-hapiproject/hapi:v7.6.0}"
SERVE_PORT="${SERVE_PORT:-8899}"
HAPI_PORT="${HAPI_PORT:-8080}"
TIMEOUT_SEC="${TIMEOUT_SEC:-240}"

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

# Name/Version aus package.json, per Env überschreibbar (z.B. Test gegen ein altes Package)
PKG_NAME="${PKG_NAME:-$(node -p "require('./package.json').name")}"
PKG_VERSION="${PKG_VERSION:-$(node -p "require('./package.json').version")}"
TARBALL="${1:-${PKG_NAME}-${PKG_VERSION}.tgz}"

if [ ! -f "$TARBALL" ]; then
  echo "❌ Tarball nicht gefunden: $TARBALL"
  echo "   Erst bauen (z.B. /mii-build-package) oder Pfad als Argument übergeben."
  exit 1
fi

# Freien Port ab $1 finden — verhindert False-Negatives durch belegte Ports
# (z.B. verwaister http.server einer früheren Runde → HAPI kann Package nicht laden).
pick_free_port() {
  local p="$1"
  while (exec 3<>"/dev/tcp/127.0.0.1/$p") 2>/dev/null; do
    exec 3>&- 3<&- 2>/dev/null || true
    p=$((p + 1))
  done
  echo "$p"
}
SERVE_PORT="$(pick_free_port "$SERVE_PORT")"
HAPI_PORT="$(pick_free_port "$HAPI_PORT")"

CID=""
SERVE_PID=""
SERVE_DIR="$(mktemp -d)"
CNAME="hapi-smoketest-$$"

cleanup() {
  [ -n "$CID" ] && docker rm -f "$CNAME" >/dev/null 2>&1 || true
  [ -n "$SERVE_PID" ] && kill "$SERVE_PID" >/dev/null 2>&1 || true
  rm -rf "$SERVE_DIR" >/dev/null 2>&1 || true
}
trap cleanup EXIT

echo "▶ HAPI Smoke-Test"
echo "  Package : $PKG_NAME#$PKG_VERSION"
echo "  Tarball : $TARBALL"
echo "  HAPI    : $HAPI_IMAGE"
echo "  Ports   : serve=$SERVE_PORT hapi=$HAPI_PORT"

cp "$TARBALL" "$SERVE_DIR/package.tgz"

# 1) Package per HTTP servieren (HAPI packageUrl braucht eine URL)
( cd "$SERVE_DIR" && python3 -m http.server "$SERVE_PORT" >/dev/null 2>&1 ) &
SERVE_PID=$!

# 2) HAPI-Konfiguration schreiben
cat > "$SERVE_DIR/application.yaml" <<YAML
hapi:
  fhir:
    fhir_version: R4
    implementationguides:
      smoketest:
        name: ${PKG_NAME}
        version: ${PKG_VERSION}
        packageUrl: http://host.docker.internal:${SERVE_PORT}/package.tgz
        installMode: STORE_AND_INSTALL
YAML

# 3) HAPI starten (host-gateway für Linux/CI; auf macOS ohnehin vorhanden)
CID="$(docker run -d --name "$CNAME" \
  --add-host=host.docker.internal:host-gateway \
  -p "${HAPI_PORT}:8080" \
  -v "$SERVE_DIR/application.yaml:/data/application.yaml" \
  -e SPRING_CONFIG_ADDITIONAL_LOCATION=file:///data/application.yaml \
  "$HAPI_IMAGE")"

echo "  Container: ${CID:0:12} — warte auf Start (max ${TIMEOUT_SEC}s)…"

# 4) Logs pollen
deadline=$((SECONDS + TIMEOUT_SEC))
result="TIMEOUT"
while [ $SECONDS -lt $deadline ]; do
  logs="$(docker logs "$CNAME" 2>&1 || true)"
  # Here-Strings statt echo|grep: grep -q beendet sich beim Treffer sofort,
  # echo stirbt dann mit SIGPIPE und pipefail macht die Bedingung trotz
  # Treffer falsch (False-Negative TIMEOUT bei großen Logs, gemessen auf macOS).
  if grep -qE "Started Application|Tomcat started on port" <<< "$logs"; then result="OK"; break; fi
  if grep -qiE "HAPI-0838|HAPI-1286|Error installing IG|Application run failed|Unable to start web server" <<< "$logs"; then result="CRASH"; break; fi
  if [ "$(docker inspect -f '{{.State.Running}}' "$CNAME" 2>/dev/null || echo false)" != "true" ]; then result="EXITED"; break; fi
  sleep 3
done

echo ""
if [ "$result" = "OK" ]; then
  echo "✅ PASS — HAPI startet mit $PKG_NAME#$PKG_VERSION sauber."
  exit 0
fi

echo "❌ FAIL ($result) — HAPI startet NICHT. Relevante Logzeilen:"
docker logs "$CNAME" 2>&1 | grep -iE "HAPI-0838|HAPI-1286|Error installing IG|Failed to upload resource|Application run failed|Unable to start" | grep -v Indexing | head -15 || true
exit 1
