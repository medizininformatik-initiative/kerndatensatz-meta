// ─────────────────────────────────────────────────────────────────────────────
// Ported from kerndatensatz-basis (main): input/fsh/rulesets/translation.fsh
//
// `Translation` attaches an http://hl7.org/fhir/StructureDefinition/translation
// extension to a translatable element, e.g.
//   * insert Translation(^title, de-DE, Vitalstatus)
//   * insert Translation(status ^short, de-DE, Status)
// This is the mechanism for translating the CONTENT of conformance resources
// (titles, descriptions, element short/definition). The narrative PAGES are
// translated differently — via input/translations/<lang>/ (see
// input/translations/README.md); do not mix the two.
//
// Escaping: a comma inside the translated text ends the RuleSet argument, so
// escape it as `\,` (basis does the same). PARENTHESES cannot be used in a
// RuleSet argument at all — the first `)` closes the insert and SUSHI then fails
// with "Using ',' to list items is no longer supported". Rephrase, or use an
// em dash, instead of "text (note)".
//
// DELIBERATE DEVIATION from basis in the Add…CodingTranslation helpers below:
// basis writes the German text into `^short`/`^definition` and adds de-DE + en-US
// translations. This template's default IG language is ENGLISH (see the
// `i18n-default-lang` parameter in sushi-config.yaml), so the base text is
// English here and German is supplied as the de-DE translation. The generic
// `Translation` RuleSet itself is language-agnostic and unchanged.
// ─────────────────────────────────────────────────────────────────────────────

RuleSet: Translation(path, language, translation)
* {path}.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* {path}.extension[=].extension[0].url = "lang"
* {path}.extension[=].extension[0].valueCode = #{language}
* {path}.extension[=].extension[1].url = "content"
* {path}.extension[=].extension[1].valueString = "{translation}"

// ── Ready-made wording for the code systems MII modules bind most often ──────
// Insert on the element that carries the coding, e.g.
//   * insert AddSnomedCodingTranslation(code.coding[snomed])

RuleSet: AddSnomedCodingTranslation(path)
* {path} ^short = "SNOMED CT code"
* insert Translation({path} ^short, de-DE, SNOMED CT Code)
* insert Translation({path} ^short, en-US, SNOMED CT code)
* {path} ^definition = "A reference to a code defined by SNOMED CT"
* insert Translation({path} ^definition, de-DE, Ein Verweis auf einen von SNOMED CT definierten Code)
* insert Translation({path} ^definition, en-US, A reference to a code defined by SNOMED CT)

RuleSet: AddIcd10CodingTranslation(path)
* {path} ^short = "ICD-10-GM code"
* insert Translation({path} ^short, de-DE, ICD-10-GM Code)
* insert Translation({path} ^short, en-US, ICD-10-GM code)
* {path} ^definition = "A reference to a code defined by the ICD-10-GM"
* insert Translation({path} ^definition, de-DE, Ein Verweis auf einen von der ICD-10-GM definierten Code)
* insert Translation({path} ^definition, en-US, A reference to a code defined by the ICD-10-GM)

RuleSet: AddAlphaIdCodingTranslation(path)
* {path} ^short = "Alpha-ID code"
* insert Translation({path} ^short, de-DE, Alpha-ID Code)
* insert Translation({path} ^short, en-US, Alpha-ID code)
* {path} ^definition = "A reference to a code defined by the Alpha-ID"
* insert Translation({path} ^definition, de-DE, Ein Verweis auf einen von der Alpha-ID definierten Code)
* insert Translation({path} ^definition, en-US, A reference to a code defined by the Alpha-ID)

RuleSet: AddOrphaCodingTranslation(path)
* {path} ^short = "ORPHAcode"
* insert Translation({path} ^short, de-DE, ORPHAcode)
* insert Translation({path} ^short, en-US, ORPHAcode)
* {path} ^definition = "A reference to a code defined by the Orphanet nomenclature of rare diseases"
* insert Translation({path} ^definition, de-DE, Ein Verweis auf einen von der Orphanet Nomenklatur der Seltenen Krankheiten definierten Code)
* insert Translation({path} ^definition, en-US, A reference to a code defined by the Orphanet nomenclature of rare diseases)

RuleSet: AddOpsCodingTranslation(path)
* {path} ^short = "German Procedure Classification (OPS) code"
* insert Translation({path} ^short, de-DE, OPS Code)
* insert Translation({path} ^short, en-US, OPS code)
* {path} ^definition = "A reference to a code defined by the German Procedure Classification OPS"
* insert Translation({path} ^definition, de-DE, Ein Verweis auf einen vom Operationen- und Prozedurenschlüssel definierten Code)
* insert Translation({path} ^definition, en-US, A reference to a code defined by the German Procedure Classification OPS)
