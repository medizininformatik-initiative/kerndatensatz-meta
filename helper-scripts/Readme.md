# Fix Simplifier Links

Dieses Skript korrigiert typische fehlerhafte Links in HTML-Dateien eines SIMPLIFIER-Exports.

Datei:

```text
scripts/fix-simplifier-links.mjs
```

## Zweck

Das Skript durchsucht rekursiv alle `.html`-Dateien eines Export-Verzeichnisses und wendet folgende Korrekturen an:

1. Ersetzt Links auf SIMPLIFIER-Artefakte:

```text
artifacts/package/
```

durch standardmäßig:

```text
artifacts/fsh-generated/resources/
```

2. Ersetzt SIMPLIFIER-Resolve-Links:

```html
href="/resolve?..."
```

durch:

```html
href="https://simplifier.net/resolve?..."
```

3. Ersetzt nicht-lokale `.html`-Links durch FHIR-R4-Links:

```html
href="patient.html"
```

durch:

```html
href="https://hl7.org/fhir/R4/patient.html"
```

Lokale HTML-Dateien, die im Export vorhanden sind, bleiben unverändert.

## Voraussetzungen

Node.js muss installiert sein.

Prüfen mit:

```bash
node -v
```

## Verwendung

```bash
node scripts/fix-simplifier-links.mjs [rootDir] [options]
```

Wenn kein `rootDir` angegeben wird, wird das aktuelle Verzeichnis verwendet.

## Beispiele

### Export im aktuellen Verzeichnis korrigieren

```bash
node scripts/fix-simplifier-links.mjs
```

### Bestimmtes Export-Verzeichnis korrigieren

```bash
node scripts/fix-simplifier-links.mjs ./output
```

### Änderungen nur simulieren

```bash
node scripts/fix-simplifier-links.mjs ./output --dry-run
```

### Detaillierte Ausgabe pro Datei

```bash
node scripts/fix-simplifier-links.mjs ./output --verbose
```

### Dry-Run mit detaillierter Ausgabe

```bash
node scripts/fix-simplifier-links.mjs ./output --dry-run --verbose
```

### Alternatives Artefakt-Ziel setzen

```bash
node scripts/fix-simplifier-links.mjs ./output --artifact-target artifacts/generated/resources/
```

oder:

```bash
node scripts/fix-simplifier-links.mjs ./output --artifact-target=artifacts/generated/resources/
```

## Optionen

| Option | Beschreibung |
|---|---|
| `--dry-run` | Zeigt an, was geändert würde, schreibt aber keine Dateien |
| `--verbose` | Gibt Ersetzungsstatistiken pro Datei aus |
| `--artifact-target <path>` | Zielpfad für `artifacts/package/` |
| `--artifact-target=<path>` | Alternative Schreibweise für `--artifact-target` |
| `--help` | Zeigt die Hilfe an |

## Ausgabe

Nach dem Lauf gibt das Skript eine Zusammenfassung aus:

```text
Scanned HTML files: 123
Changed files: 12
Replacements:
  artifacts/package -> artifacts/fsh-generated/resources/: 20
  href='/resolve?...' -> href='https://simplifier.net/resolve?...': 5
  non-local .html links -> https://hl7.org/fhir/R4/: 42
```

## Hinweise

- Es werden nur `.html`-Dateien verarbeitet.
- Die Verzeichnisse `.git` und `node_modules` werden übersprungen.
- Nur `href`-Attribute mit Anführungszeichen werden verarbeitet.
- Externe Links, absolute Links und reine Ankerlinks bleiben unverändert.
- Lokale `.html`-Links bleiben erhalten, wenn die Zieldatei im Export existiert.
- Vor produktiver Ausführung empfiehlt sich ein `--dry-run`.

## Empfohlener Workflow

```bash
node scripts/fix-simplifier-links.mjs ./output --dry-run --verbose
node scripts/fix-simplifier-links.mjs ./output
```
