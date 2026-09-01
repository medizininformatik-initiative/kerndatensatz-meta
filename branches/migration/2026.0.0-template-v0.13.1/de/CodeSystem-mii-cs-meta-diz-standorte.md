# MII CS Meta DIZ Standorte - MII IG Meta v2027.0.0-ballot.rc1

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **MII CS Meta DIZ Standorte**

## CodeSystem: MII CS Meta DIZ Standorte 

| | |
| :--- | :--- |
| *Offizielle URL*:https://www.medizininformatik-initiative.de/fhir/core/CodeSystem/core-location-identifier | *Version*:2027.0.0-ballot.rc1 |
| Active Stand: 2026-09-01 | *Maschinenlesbarer Name*:MII_CS_Meta_DIZ_Standorte |
| **Copyright/Rechtliches**: Medizininformatik-Initiative | |

 
Medizininformatik-Initiative Standorte 

Dieses vollständige, aktive CodeSystem identifiziert 52 Standorte der Medizininformatik-Initiative. Seine kanonische URL verbleibt absichtlich im MII-Core-Namensraum. Die nachfolgenden erzeugten Artefaktabschnitte stellen die Konzeptliste sowie die JSON- und XML-Darstellungen bereit.

Dieses CodeSystem wird in der Definition der folgenden ValueSets referenziert:

* This CodeSystem is not used here; it may be used elsewhere (e.g. specifications and/or implementations that use this content)

-------

 [Beschreibung der obigen Tabelle(n)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "mii-cs-meta-diz-standorte",
  "meta" : {
    "extension" : [{
      "url" : "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-license",
      "valueCode" : "CC-BY-4.0"
    },
    {
      "extension" : [{
        "url" : "packageId",
        "valueId" : "de.medizininformatikinitiative.kerndatensatz.meta"
      },
      {
        "url" : "version",
        "valueString" : "2027.0.0-ballot.rc1"
      },
      {
        "url" : "uri",
        "valueUri" : "https://www.medizininformatik-initiative.de/fhir/modul-meta"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/package-source"
    }],
    "profile" : ["http://hl7.org/fhir/StructureDefinition/shareablecodesystem",
    "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablecodesystem",
    "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablecodesystem"]
  },
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-versionAlgorithm",
    "valueCoding" : {
      "system" : "http://hl7.org/fhir/version-algorithm",
      "code" : "semver",
      "display" : "SemVer"
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/cqf-knowledgeCapability",
    "valueCode" : "shareable"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/cqf-knowledgeCapability",
    "valueCode" : "publishable"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-versionPolicy",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/artifact-version-policy-codes",
        "version" : "3.0.0",
        "code" : "package",
        "display" : "Package"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/resource-approvalDate",
    "valueDate" : "2026-08-31"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/resource-effectivePeriod",
    "valuePeriod" : {
      "start" : "2027"
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-topic",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl",
        "code" : "C80260"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-author",
    "valueContactDetail" : {
      "telecom" : [{
        "system" : "email",
        "value" : "julian.sass@charite.de"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-editor",
    "valueContactDetail" : {
      "name" : "Taskforce Core Data Set"
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-reviewer",
    "valueContactDetail" : {
      "name" : "Interoperability Working Group",
      "telecom" : [{
        "system" : "url",
        "value" : "https://www.medizininformatik-initiative.de/en/collaboration/interoperability-working-group"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-reviewer",
    "valueContactDetail" : {
      "name" : "National Steering Committee",
      "telecom" : [{
        "system" : "url",
        "value" : "https://www.medizininformatik-initiative.de/en/collaboration/national-steering-committee"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-endorser",
    "valueContactDetail" : {
      "name" : "Interoperability Working Group",
      "telecom" : [{
        "system" : "url",
        "value" : "https://www.medizininformatik-initiative.de/en/collaboration/interoperability-working-group"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-endorser",
    "valueContactDetail" : {
      "name" : "National Steering Committee",
      "telecom" : [{
        "system" : "url",
        "value" : "https://www.medizininformatik-initiative.de/en/collaboration/national-steering-committee"
      }]
    }
  }],
  "url" : "https://www.medizininformatik-initiative.de/fhir/core/CodeSystem/core-location-identifier",
  "version" : "2027.0.0-ballot.rc1",
  "name" : "MII_CS_Meta_DIZ_Standorte",
  "title" : "MII CS Meta DIZ Standorte",
  "status" : "active",
  "experimental" : false,
  "date" : "2026-09-01",
  "publisher" : "NUM-DIZ",
  "_publisher" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "de"
      },
      {
        "url" : "content",
        "valueString" : "NUM-DIZ"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    }]
  },
  "contact" : [{
    "name" : "NUM-DIZ",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.netzwerk-universitaetsmedizin.de"
    }]
  }],
  "description" : "Medizininformatik-Initiative Standorte",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "copyright" : "Medizininformatik-Initiative",
  "caseSensitive" : true,
  "valueSet" : "https://www.medizininformatik-initiative.de/fhir/core/ValueSet/core-location-identifier",
  "compositional" : false,
  "content" : "complete",
  "count" : 52,
  "property" : [{
    "code" : "consortium",
    "uri" : "https://www.medizininformatik-initiative.de/de/konsortien",
    "type" : "string"
  },
  {
    "code" : "uri",
    "uri" : "https://www.medizininformatik-initiative.de/de/konsortien/datenintegrationszentren",
    "type" : "string"
  },
  {
    "code" : "status",
    "uri" : "http://hl7.org/fhir/concept-properties#status",
    "type" : "code"
  },
  {
    "code" : "deprecationDate",
    "uri" : "http://hl7.org/fhir/concept-properties#deprecationDate",
    "type" : "dateTime"
  },
  {
    "code" : "retirementDate",
    "uri" : "http://hl7.org/fhir/concept-properties#retirementDate",
    "type" : "dateTime"
  },
  {
    "code" : "dataManagement",
    "description" : "Datenmanagementstelle (true / false)",
    "type" : "boolean"
  },
  {
    "code" : "contract",
    "description" : "Teilnahmerahmenvertrag (Version)",
    "type" : "string"
  },
  {
    "code" : "dic",
    "description" : "Datenintegrationszentrum (true / false)",
    "type" : "boolean"
  },
  {
    "code" : "abbreviation",
    "description" : "Abkürzung (Kürzel)",
    "type" : "string"
  },
  {
    "code" : "replaces",
    "description" : "ersetzt (alter Code)",
    "type" : "code"
  },
  {
    "code" : "replacedBy",
    "description" : "ersetzt durch (neuer Code)",
    "type" : "code"
  }],
  "concept" : [{
    "code" : "UKA",
    "display" : "Uniklinik RWTH Aachen",
    "definition" : "Aachen",
    "property" : [{
      "code" : "consortium",
      "valueString" : "SMITH"
    },
    {
      "code" : "uri",
      "valueString" : "ukaachen.de"
    },
    {
      "code" : "status",
      "valueCode" : "active"
    },
    {
      "code" : "contract",
      "valueString" : "V6.15"
    },
    {
      "code" : "abbreviation",
      "valueString" : "UKA"
    },
    {
      "code" : "dic",
      "valueBoolean" : true
    }]
  },
  {
    "code" : "UKAU",
    "display" : "Universitätsklinikum Augsburg",
    "definition" : "Augsburg",
    "property" : [{
      "code" : "consortium",
      "valueString" : "DIFUTURE"
    },
    {
      "code" : "uri",
      "valueString" : "uk-augsburg.de"
    },
    {
      "code" : "status",
      "valueCode" : "active"
    },
    {
      "code" : "contract",
      "valueString" : "V6.15"
    },
    {
      "code" : "abbreviation",
      "valueString" : "UKAU"
    },
    {
      "code" : "dic",
      "valueBoolean" : true
    }]
  },
  {
    "code" : "Charité",
    "display" : "Charité - Universitätsmedizin Berlin",
    "definition" : "Berlin",
    "property" : [{
      "code" : "consortium",
      "valueString" : "HiGHmed"
    },
    {
      "code" : "uri",
      "valueString" : "charite.de"
    },
    {
      "code" : "status",
      "valueCode" : "active"
    },
    {
      "code" : "dataManagement",
      "valueBoolean" : true
    },
    {
      "code" : "contract",
      "valueString" : "V6.15"
    },
    {
      "code" : "abbreviation",
      "valueString" : "Charité"
    },
    {
      "code" : "dic",
      "valueBoolean" : true
    }]
  },
  {
    "code" : "VIV",
    "display" : "Vivantes Netzwerk für Gesundheit GmbH",
    "definition" : "Berlin",
    "property" : [{
      "code" : "consortium",
      "valueString" : "HiGHmed"
    },
    {
      "code" : "uri",
      "valueString" : "vivantes.de"
    },
    {
      "code" : "status",
      "valueCode" : "active"
    },
    {
      "code" : "contract",
      "valueString" : "V6.15"
    },
    {
      "code" : "abbreviation",
      "valueString" : "VIV"
    },
    {
      "code" : "dic",
      "valueBoolean" : true
    }]
  },
  {
    "code" : "UKOWL",
    "display" : "Universität Bielefeld / Universitätsklinikum OWL",
    "definition" : "Bielefeld",
    "property" : [{
      "code" : "consortium",
      "valueString" : "HiGHmed"
    },
    {
      "code" : "uri",
      "valueString" : "ukowl.de"
    },
    {
      "code" : "status",
      "valueCode" : "active"
    },
    {
      "code" : "contract",
      "valueString" : "V6.14"
    },
    {
      "code" : "abbreviation",
      "valueString" : "UKOWL"
    },
    {
      "code" : "dic",
      "valueBoolean" : true
    }]
  },
  {
    "code" : "UKRUB",
    "display" : "Universitätsklinikum der Ruhr-Universität Bochum",
    "definition" : "Bochum",
    "property" : [{
      "code" : "consortium",
      "valueString" : "SMITH"
    },
    {
      "code" : "uri",
      "valueString" : "rub.de"
    },
    {
      "code" : "status",
      "valueCode" : "active"
    },
    {
      "code" : "contract",
      "valueString" : "V6.15"
    },
    {
      "code" : "abbreviation",
      "valueString" : "UKRUB"
    },
    {
      "code" : "dic",
      "valueBoolean" : true
    }]
  },
  {
    "code" : "UKB",
    "display" : "Universitätsklinikum Bonn",
    "definition" : "Bonn",
    "property" : [{
      "code" : "consortium",
      "valueString" : "SMITH"
    },
    {
      "code" : "uri",
      "valueString" : "ukbonn.de"
    },
    {
      "code" : "status",
      "valueCode" : "active"
    },
    {
      "code" : "contract",
      "valueString" : "V6.15"
    },
    {
      "code" : "abbreviation",
      "valueString" : "UKB"
    },
    {
      "code" : "dic",
      "valueBoolean" : true
    }]
  },
  {
    "code" : "KC",
    "display" : "Klinikum Chemnitz",
    "definition" : "Chemnitz",
    "property" : [{
      "code" : "consortium",
      "valueString" : "MIRACUM"
    },
    {
      "code" : "uri",
      "valueString" : "klinikumchemnitz.de"
    },
    {
      "code" : "status",
      "valueCode" : "deprecated"
    },
    {
      "code" : "replacedBy",
      "valueCode" : "KCH"
    },
    {
      "code" : "deprecationDate",
      "valueDateTime" : "2024-03-01"
    }]
  },
  {
    "code" : "KCH",
    "display" : "Klinikum Chemnitz",
    "definition" : "Chemnitz",
    "property" : [{
      "code" : "consortium",
      "valueString" : "MIRACUM"
    },
    {
      "code" : "uri",
      "valueString" : "klinikumchemnitz.de"
    },
    {
      "code" : "status",
      "valueCode" : "active"
    },
    {
      "code" : "contract",
      "valueString" : "V6.14"
    },
    {
      "code" : "replaces",
      "valueCode" : "KC"
    },
    {
      "code" : "abbreviation",
      "valueString" : "KCH"
    },
    {
      "code" : "dic",
      "valueBoolean" : true
    }]
  },
  {
    "code" : "CTK",
    "display" : "Carl-Thiem-Klinikum Cottbus",
    "definition" : "Cottbus",
    "property" : [{
      "code" : "consortium",
      "valueString" : "HiGHmed"
    },
    {
      "code" : "uri",
      "valueString" : "ctk.de"
    },
    {
      "code" : "status",
      "valueCode" : "deprecated"
    },
    {
      "code" : "replacedBy",
      "valueCode" : "MUL-CT"
    },
    {
      "code" : "deprecationDate",
      "valueDateTime" : "2024-07-03"
    }]
  },
  {
    "code" : "MUL-CT",
    "display" : "Medizinische Universität Lausitz - Carl Thiem",
    "definition" : "Cottbus",
    "property" : [{
      "code" : "consortium",
      "valueString" : "HiGHmed"
    },
    {
      "code" : "uri",
      "valueString" : "mul-ct.de"
    },
    {
      "code" : "status",
      "valueCode" : "active"
    },
    {
      "code" : "contract",
      "valueString" : "V6.15"
    },
    {
      "code" : "replaces",
      "valueCode" : "CTK"
    },
    {
      "code" : "abbreviation",
      "valueString" : "MUL-CT"
    },
    {
      "code" : "dic",
      "valueBoolean" : true
    }]
  },
  {
    "code" : "UKDD",
    "display" : "Universitätsklinikum Carl Gustav Carus Dresden",
    "definition" : "Dresden",
    "property" : [{
      "code" : "consortium",
      "valueString" : "MIRACUM"
    },
    {
      "code" : "uri",
      "valueString" : "ukdd.de"
    },
    {
      "code" : "status",
      "valueCode" : "active"
    },
    {
      "code" : "dataManagement",
      "valueBoolean" : true
    },
    {
      "code" : "contract",
      "valueString" : "V6.15"
    },
    {
      "code" : "abbreviation",
      "valueString" : "UKDD"
    },
    {
      "code" : "dic",
      "valueBoolean" : true
    }]
  },
  {
    "code" : "UKD",
    "display" : "Universitätsklinikum Düsseldorf",
    "definition" : "Düsseldorf",
    "property" : [{
      "code" : "consortium",
      "valueString" : "SMITH"
    },
    {
      "code" : "uri",
      "valueString" : "uniklinik-duesseldorf.de"
    },
    {
      "code" : "status",
      "valueCode" : "active"
    },
    {
      "code" : "contract",
      "valueString" : "V6.15"
    },
    {
      "code" : "abbreviation",
      "valueString" : "UKD"
    },
    {
      "code" : "dic",
      "valueBoolean" : true
    }]
  },
  {
    "code" : "UKEr",
    "display" : "Universitätsklinikum Erlangen",
    "definition" : "Erlangen",
    "property" : [{
      "code" : "consortium",
      "valueString" : "MIRACUM"
    },
    {
      "code" : "uri",
      "valueString" : "www.uk-erlangen.de"
    },
    {
      "code" : "status",
      "valueCode" : "active"
    },
    {
      "code" : "contract",
      "valueString" : "V6.15"
    },
    {
      "code" : "abbreviation",
      "valueString" : "UKEr"
    },
    {
      "code" : "dic",
      "valueBoolean" : true
    }]
  },
  {
    "code" : "UME",
    "display" : "Universitätsklinikum Essen",
    "definition" : "Essen",
    "property" : [{
      "code" : "consortium",
      "valueString" : "SMITH"
    },
    {
      "code" : "uri",
      "valueString" : "uk-essen.de"
    },
    {
      "code" : "status",
      "valueCode" : "active"
    },
    {
      "code" : "contract",
      "valueString" : "V6.15"
    },
    {
      "code" : "abbreviation",
      "valueString" : "UME"
    },
    {
      "code" : "dic",
      "valueBoolean" : true
    }]
  },
  {
    "code" : "UKF",
    "display" : "Universitätsklinikum Frankfurt",
    "definition" : "Frankfurt",
    "property" : [{
      "code" : "consortium",
      "valueString" : "MIRACUM"
    },
    {
      "code" : "uri",
      "valueString" : "unimedizin-ffm.de"
    },
    {
      "code" : "status",
      "valueCode" : "active"
    },
    {
      "code" : "contract",
      "valueString" : "V6.14"
    },
    {
      "code" : "abbreviation",
      "valueString" : "UKF"
    },
    {
      "code" : "dic",
      "valueBoolean" : true
    }]
  },
  {
    "code" : "UKFR",
    "display" : "Universitätsklinikum Freiburg",
    "definition" : "Freiburg",
    "property" : [{
      "code" : "consortium",
      "valueString" : "MIRACUM"
    },
    {
      "code" : "uri",
      "valueString" : "uniklinik-freiburg.de"
    },
    {
      "code" : "status",
      "valueCode" : "active"
    },
    {
      "code" : "contract",
      "valueString" : "V6.14"
    },
    {
      "code" : "abbreviation",
      "valueString" : "UKFR"
    },
    {
      "code" : "dic",
      "valueBoolean" : true
    }]
  },
  {
    "code" : "UKGI",
    "display" : "Universitätsklinikum Gießen",
    "definition" : "Gießen",
    "property" : [{
      "code" : "consortium",
      "valueString" : "MIRACUM"
    },
    {
      "code" : "uri",
      "valueString" : "uni-giessen.de"
    },
    {
      "code" : "status",
      "valueCode" : "active"
    },
    {
      "code" : "dataManagement",
      "valueBoolean" : true
    },
    {
      "code" : "contract",
      "valueString" : "V6.15"
    },
    {
      "code" : "abbreviation",
      "valueString" : "UKGI"
    },
    {
      "code" : "dic",
      "valueBoolean" : true
    }]
  },
  {
    "code" : "UMG",
    "display" : "Universitätsmedizin Göttingen",
    "definition" : "Göttingen",
    "property" : [{
      "code" : "consortium",
      "valueString" : "HiGHmed"
    },
    {
      "code" : "uri",
      "valueString" : "umg.eu"
    },
    {
      "code" : "status",
      "valueCode" : "active"
    },
    {
      "code" : "contract",
      "valueString" : "V6.15"
    },
    {
      "code" : "abbreviation",
      "valueString" : "UMG"
    },
    {
      "code" : "dic",
      "valueBoolean" : true
    }]
  },
  {
    "code" : "UMG-DMS",
    "display" : "Universitätsmedizin Göttingen - DMS",
    "definition" : "Göttingen",
    "property" : [{
      "code" : "consortium",
      "valueString" : "HiGHmed"
    },
    {
      "code" : "uri",
      "valueString" : "dms.umg.eu"
    },
    {
      "code" : "status",
      "valueCode" : "active"
    },
    {
      "code" : "dataManagement",
      "valueBoolean" : true
    },
    {
      "code" : "contract",
      "valueString" : "V6.15"
    },
    {
      "code" : "abbreviation",
      "valueString" : "UMG-DMS"
    }]
  },
  {
    "code" : "UKG",
    "display" : "Universitätsmedizin Greifswald",
    "definition" : "Greifswald",
    "property" : [{
      "code" : "consortium",
      "valueString" : "MIRACUM"
    },
    {
      "code" : "uri",
      "valueString" : "www.medizin.uni-greifswald.de"
    },
    {
      "code" : "status",
      "valueCode" : "active"
    },
    {
      "code" : "contract",
      "valueString" : "V6.14"
    },
    {
      "code" : "abbreviation",
      "valueString" : "UKG"
    },
    {
      "code" : "dic",
      "valueBoolean" : true
    }]
  },
  {
    "code" : "UKH",
    "display" : "Universitätsklinikum Halle (Saale)",
    "definition" : "Halle (Saale)",
    "property" : [{
      "code" : "consortium",
      "valueString" : "SMITH"
    },
    {
      "code" : "uri",
      "valueString" : "uk-halle.de"
    },
    {
      "code" : "status",
      "valueCode" : "active"
    },
    {
      "code" : "dataManagement",
      "valueBoolean" : true
    },
    {
      "code" : "contract",
      "valueString" : "V6.15"
    },
    {
      "code" : "abbreviation",
      "valueString" : "UKH"
    },
    {
      "code" : "dic",
      "valueBoolean" : true
    }]
  },
  {
    "code" : "UKE",
    "display" : "Universitätsklinikum Hamburg-Eppendorf",
    "definition" : "Hamburg",
    "property" : [{
      "code" : "consortium",
      "valueString" : "SMITH"
    },
    {
      "code" : "uri",
      "valueString" : "uke.de"
    },
    {
      "code" : "status",
      "valueCode" : "active"
    },
    {
      "code" : "contract",
      "valueString" : "V6.15"
    },
    {
      "code" : "abbreviation",
      "valueString" : "UKE"
    },
    {
      "code" : "dic",
      "valueBoolean" : true
    }]
  },
  {
    "code" : "MHH",
    "display" : "Medizinische Hochschule Hannover",
    "definition" : "Hannover",
    "property" : [{
      "code" : "consortium",
      "valueString" : "HiGHmed"
    },
    {
      "code" : "uri",
      "valueString" : "mh-hannover.de"
    },
    {
      "code" : "status",
      "valueCode" : "active"
    },
    {
      "code" : "contract",
      "valueString" : "V6.15"
    },
    {
      "code" : "abbreviation",
      "valueString" : "MHH"
    },
    {
      "code" : "dic",
      "valueBoolean" : true
    }]
  },
  {
    "code" : "UKHD",
    "display" : "Universitätsklinikum Heidelberg",
    "definition" : "Heidelberg",
    "property" : [{
      "code" : "consortium",
      "valueString" : "HiGHmed"
    },
    {
      "code" : "uri",
      "valueString" : "ukhd.de"
    },
    {
      "code" : "status",
      "valueCode" : "active"
    },
    {
      "code" : "dataManagement",
      "valueBoolean" : true
    },
    {
      "code" : "contract",
      "valueString" : "V6.15"
    },
    {
      "code" : "abbreviation",
      "valueString" : "UKHD"
    },
    {
      "code" : "dic",
      "valueBoolean" : true
    }]
  },
  {
    "code" : "UKJ",
    "display" : "Universitätsklinikum Jena",
    "definition" : "Jena",
    "property" : [{
      "code" : "consortium",
      "valueString" : "SMITH"
    },
    {
      "code" : "uri",
      "valueString" : "uniklinikum-jena.de"
    },
    {
      "code" : "status",
      "valueCode" : "active"
    },
    {
      "code" : "contract",
      "valueString" : "V6.14"
    },
    {
      "code" : "abbreviation",
      "valueString" : "UKJ"
    },
    {
      "code" : "dic",
      "valueBoolean" : true
    }]
  },
  {
    "code" : "UKK",
    "display" : "Universitätsklinikum Köln",
    "definition" : "Köln",
    "property" : [{
      "code" : "consortium",
      "valueString" : "HiGHmed"
    },
    {
      "code" : "uri",
      "valueString" : "uk-koeln.de"
    },
    {
      "code" : "status",
      "valueCode" : "active"
    },
    {
      "code" : "dataManagement",
      "valueBoolean" : true
    },
    {
      "code" : "contract",
      "valueString" : "V6.15"
    },
    {
      "code" : "abbreviation",
      "valueString" : "UKK"
    },
    {
      "code" : "dic",
      "valueBoolean" : true
    }]
  },
  {
    "code" : "UKL",
    "display" : "Universitätsklinikum Leipzig",
    "definition" : "Leipzig",
    "property" : [{
      "code" : "consortium",
      "valueString" : "SMITH"
    },
    {
      "code" : "uri",
      "valueString" : "uniklinikum-leipzig.de"
    },
    {
      "code" : "status",
      "valueCode" : "active"
    },
    {
      "code" : "dataManagement",
      "valueBoolean" : true
    },
    {
      "code" : "contract",
      "valueString" : "V6.15"
    },
    {
      "code" : "abbreviation",
      "valueString" : "UKL"
    },
    {
      "code" : "dic",
      "valueBoolean" : true
    }]
  },
  {
    "code" : "UL",
    "display" : "Universität Leipzig",
    "definition" : "Leipzig",
    "property" : [{
      "code" : "consortium",
      "valueString" : "SMITH"
    },
    {
      "code" : "uri",
      "valueString" : "uniklinikum-leipzig.de"
    },
    {
      "code" : "status",
      "valueCode" : "active"
    },
    {
      "code" : "contract",
      "valueString" : "V6.15"
    },
    {
      "code" : "abbreviation",
      "valueString" : "UL"
    }]
  },
  {
    "code" : "UMMD",
    "display" : "Universitätsklinikum Magdeburg",
    "definition" : "Magdeburg",
    "property" : [{
      "code" : "consortium",
      "valueString" : "MIRACUM"
    },
    {
      "code" : "uri",
      "valueString" : "www.med.uni-magdeburg.de"
    },
    {
      "code" : "status",
      "valueCode" : "active"
    },
    {
      "code" : "contract",
      "valueString" : "V6.14"
    },
    {
      "code" : "abbreviation",
      "valueString" : "UMMD"
    },
    {
      "code" : "dic",
      "valueBoolean" : true
    }]
  },
  {
    "code" : "UM",
    "display" : "Universitätsmedizin der Johannes Gutenberg-Universität Mainz",
    "definition" : "Mainz",
    "property" : [{
      "code" : "consortium",
      "valueString" : "MIRACUM"
    },
    {
      "code" : "uri",
      "valueString" : "unimedizin-mainz.de"
    },
    {
      "code" : "status",
      "valueCode" : "active"
    },
    {
      "code" : "contract",
      "valueString" : "V6.14"
    },
    {
      "code" : "abbreviation",
      "valueString" : "UM"
    },
    {
      "code" : "dic",
      "valueBoolean" : true
    }]
  },
  {
    "code" : "UMM",
    "display" : "Universitätsklinikum Mannheim",
    "definition" : "Mannheim",
    "property" : [{
      "code" : "consortium",
      "valueString" : "MIRACUM"
    },
    {
      "code" : "uri",
      "valueString" : "umm.de"
    },
    {
      "code" : "status",
      "valueCode" : "active"
    },
    {
      "code" : "contract",
      "valueString" : "V6.15"
    },
    {
      "code" : "abbreviation",
      "valueString" : "UMM"
    },
    {
      "code" : "dic",
      "valueBoolean" : true
    }]
  },
  {
    "code" : "UKMR",
    "display" : "Universitätsklinikum Marburg",
    "definition" : "Marburg",
    "property" : [{
      "code" : "consortium",
      "valueString" : "MIRACUM"
    },
    {
      "code" : "uri",
      "valueString" : "uni-marburg.de"
    },
    {
      "code" : "status",
      "valueCode" : "active"
    },
    {
      "code" : "contract",
      "valueString" : "V6.15"
    },
    {
      "code" : "abbreviation",
      "valueString" : "UKMR"
    },
    {
      "code" : "dic",
      "valueBoolean" : true
    }]
  },
  {
    "code" : "KUM",
    "display" : "Klinikum der Universität München (LMU)",
    "definition" : "München",
    "property" : [{
      "code" : "consortium",
      "valueString" : "DIFUTURE"
    },
    {
      "code" : "uri",
      "valueString" : "lmu-klinikum.de"
    },
    {
      "code" : "status",
      "valueCode" : "active"
    },
    {
      "code" : "contract",
      "valueString" : "V6.15"
    },
    {
      "code" : "abbreviation",
      "valueString" : "KUM"
    },
    {
      "code" : "dic",
      "valueBoolean" : true
    }]
  },
  {
    "code" : "MRI",
    "display" : "Klinikum rechts der Isar (TUM)",
    "definition" : "München",
    "property" : [{
      "code" : "consortium",
      "valueString" : "DIFUTURE"
    },
    {
      "code" : "uri",
      "valueString" : "mri.tum.de"
    },
    {
      "code" : "status",
      "valueCode" : "active"
    },
    {
      "code" : "contract",
      "valueString" : "V6.15"
    },
    {
      "code" : "abbreviation",
      "valueString" : "MRI"
    },
    {
      "code" : "dic",
      "valueBoolean" : true
    }]
  },
  {
    "code" : "UKM",
    "display" : "Universitätsklinikum Münster",
    "definition" : "Münster",
    "property" : [{
      "code" : "consortium",
      "valueString" : "HiGHmed"
    },
    {
      "code" : "uri",
      "valueString" : "ukm.de"
    },
    {
      "code" : "status",
      "valueCode" : "active"
    },
    {
      "code" : "contract",
      "valueString" : "V6.15"
    },
    {
      "code" : "abbreviation",
      "valueString" : "UKM"
    },
    {
      "code" : "dic",
      "valueBoolean" : true
    }]
  },
  {
    "code" : "UOL",
    "display" : "Carl von Ossietzky Universität Oldenburg",
    "definition" : "Oldenburg",
    "property" : [{
      "code" : "consortium",
      "valueString" : "HiGHmed"
    },
    {
      "code" : "status",
      "valueCode" : "deprecated"
    },
    {
      "code" : "replacedBy",
      "valueCode" : "UMO"
    },
    {
      "code" : "deprecationDate",
      "valueDateTime" : "2024-10-23"
    }]
  },
  {
    "code" : "UMO",
    "display" : "Carl von Ossietzky Universität Oldenburg",
    "definition" : "Oldenburg",
    "property" : [{
      "code" : "consortium",
      "valueString" : "HiGHmed"
    },
    {
      "code" : "uri",
      "valueString" : "uol.de"
    },
    {
      "code" : "status",
      "valueCode" : "active"
    },
    {
      "code" : "contract",
      "valueString" : "V6.14"
    },
    {
      "code" : "replaces",
      "valueCode" : "UOL"
    },
    {
      "code" : "abbreviation",
      "valueString" : "UMO"
    },
    {
      "code" : "dic",
      "valueBoolean" : true
    }]
  },
  {
    "code" : "UKR",
    "display" : "Universitätsklinikum Regensburg",
    "definition" : "Regensburg",
    "property" : [{
      "code" : "consortium",
      "valueString" : "DIFUTURE"
    },
    {
      "code" : "uri",
      "valueString" : "ukr.de"
    },
    {
      "code" : "status",
      "valueCode" : "active"
    },
    {
      "code" : "contract",
      "valueString" : "V6.15"
    },
    {
      "code" : "abbreviation",
      "valueString" : "UKR"
    },
    {
      "code" : "dic",
      "valueBoolean" : true
    }]
  },
  {
    "code" : "UMR",
    "display" : "Universitätsmedizin Rostock",
    "definition" : "Rostock",
    "property" : [{
      "code" : "consortium",
      "valueString" : "SMITH"
    },
    {
      "code" : "uri",
      "valueString" : "med.uni-rostock.de"
    },
    {
      "code" : "status",
      "valueCode" : "active"
    },
    {
      "code" : "contract",
      "valueString" : "V6.15"
    },
    {
      "code" : "abbreviation",
      "valueString" : "UMR"
    },
    {
      "code" : "dic",
      "valueBoolean" : true
    }]
  },
  {
    "code" : "UKS",
    "display" : "Universitätsklinikum des Saarlandes",
    "definition" : "Saarbrücken / Homburg",
    "property" : [{
      "code" : "consortium",
      "valueString" : "DIFUTURE"
    },
    {
      "code" : "uri",
      "valueString" : "uks.eu"
    },
    {
      "code" : "status",
      "valueCode" : "deprecated"
    },
    {
      "code" : "replacedBy",
      "valueCode" : "UdS"
    },
    {
      "code" : "deprecationDate",
      "valueDateTime" : "2024-10-15"
    }]
  },
  {
    "code" : "UdS",
    "display" : "Universität des Saarlandes, Medizinische Fakultät",
    "definition" : "Saarbrücken / Homburg",
    "property" : [{
      "code" : "consortium",
      "valueString" : "DIFUTURE"
    },
    {
      "code" : "uri",
      "valueString" : "med.uni-saarland.de"
    },
    {
      "code" : "status",
      "valueCode" : "active"
    },
    {
      "code" : "contract",
      "valueString" : "V6.14"
    },
    {
      "code" : "replaces",
      "valueCode" : "UKS"
    },
    {
      "code" : "abbreviation",
      "valueString" : "UdS"
    },
    {
      "code" : "dic",
      "valueBoolean" : true
    }]
  },
  {
    "code" : "UKSH",
    "display" : "Universitätsklinikum Schleswig-Holstein",
    "definition" : "Schleswig-Holstein",
    "property" : [{
      "code" : "consortium",
      "valueString" : "HiGHmed"
    },
    {
      "code" : "uri",
      "valueString" : "uksh.de"
    },
    {
      "code" : "status",
      "valueCode" : "active"
    },
    {
      "code" : "contract",
      "valueString" : "V6.15"
    },
    {
      "code" : "abbreviation",
      "valueString" : "UKSH"
    },
    {
      "code" : "dic",
      "valueBoolean" : true
    }]
  },
  {
    "code" : "BHC",
    "display" : "Bosch Health Campus",
    "definition" : "Stuttgart",
    "property" : [{
      "code" : "consortium",
      "valueString" : "HiGHmed"
    },
    {
      "code" : "uri",
      "valueString" : "rbk.de"
    },
    {
      "code" : "status",
      "valueCode" : "active"
    },
    {
      "code" : "contract",
      "valueString" : "V6.15"
    },
    {
      "code" : "abbreviation",
      "valueString" : "BHC"
    },
    {
      "code" : "dic",
      "valueBoolean" : true
    }]
  },
  {
    "code" : "UKT",
    "display" : "Universitätsklinikum Tübingen",
    "definition" : "Tübingen",
    "property" : [{
      "code" : "consortium",
      "valueString" : "DIFUTURE"
    },
    {
      "code" : "uri",
      "valueString" : "medizin.uni-tuebingen.de"
    },
    {
      "code" : "status",
      "valueCode" : "active"
    },
    {
      "code" : "contract",
      "valueString" : "V6.15"
    },
    {
      "code" : "abbreviation",
      "valueString" : "UKT"
    },
    {
      "code" : "dic",
      "valueBoolean" : true
    }]
  },
  {
    "code" : "UKU",
    "display" : "Universitätsklinikum Ulm",
    "definition" : "Ulm",
    "property" : [{
      "code" : "consortium",
      "valueString" : "DIFUTURE"
    },
    {
      "code" : "uri",
      "valueString" : "uniklinik-ulm.de"
    },
    {
      "code" : "status",
      "valueCode" : "active"
    },
    {
      "code" : "contract",
      "valueString" : "V6.15"
    },
    {
      "code" : "abbreviation",
      "valueString" : "UKU"
    },
    {
      "code" : "dic",
      "valueBoolean" : true
    }]
  },
  {
    "code" : "UKW",
    "display" : "Universitätsklinikum Würzburg",
    "definition" : "Würzburg",
    "property" : [{
      "code" : "consortium",
      "valueString" : "HiGHmed"
    },
    {
      "code" : "uri",
      "valueString" : "ukw.de"
    },
    {
      "code" : "status",
      "valueCode" : "active"
    },
    {
      "code" : "dataManagement",
      "valueBoolean" : true
    },
    {
      "code" : "contract",
      "valueString" : "V6.15"
    },
    {
      "code" : "abbreviation",
      "valueString" : "UKW"
    },
    {
      "code" : "dic",
      "valueBoolean" : true
    }]
  },
  {
    "code" : "HUKW",
    "display" : "Universität Witten/Herdecke",
    "definition" : "Witten / Herdecke",
    "property" : [{
      "code" : "consortium",
      "valueString" : "NA"
    },
    {
      "code" : "status",
      "valueCode" : "deprecated"
    },
    {
      "code" : "deprecationDate",
      "valueDateTime" : "2024-07-09"
    }]
  },
  {
    "code" : "FDPG",
    "display" : "Forschungsdatenportal für Gesundheit",
    "property" : [{
      "code" : "consortium",
      "valueString" : "MII"
    },
    {
      "code" : "uri",
      "valueString" : "forschen-fuer-gesundheit.de"
    },
    {
      "code" : "status",
      "valueCode" : "active"
    },
    {
      "code" : "dataManagement",
      "valueBoolean" : true
    },
    {
      "code" : "contract",
      "valueString" : "V6.14"
    },
    {
      "code" : "abbreviation",
      "valueString" : "FDPG"
    }]
  },
  {
    "code" : "HiGHmed",
    "display" : "HiGHmed e.V.",
    "definition" : "Heidelberg",
    "property" : [{
      "code" : "consortium",
      "valueString" : "MII"
    },
    {
      "code" : "uri",
      "valueString" : "highmed.org"
    },
    {
      "code" : "status",
      "valueCode" : "active"
    },
    {
      "code" : "dataManagement",
      "valueBoolean" : true
    },
    {
      "code" : "contract",
      "valueString" : "V6.15"
    },
    {
      "code" : "abbreviation",
      "valueString" : "HiGHmed"
    }]
  },
  {
    "code" : "HHN",
    "display" : "Hochschule Heilbronn",
    "definition" : "Heilbronn",
    "property" : [{
      "code" : "consortium",
      "valueString" : "MII"
    },
    {
      "code" : "uri",
      "valueString" : "hs-heilbronn.de"
    },
    {
      "code" : "status",
      "valueCode" : "active"
    },
    {
      "code" : "contract",
      "valueString" : "V6.14"
    },
    {
      "code" : "abbreviation",
      "valueString" : "HHN"
    }]
  },
  {
    "code" : "CRR",
    "display" : "Zentrale Plattform NUM",
    "property" : [{
      "code" : "consortium",
      "valueString" : "NUM"
    },
    {
      "code" : "uri",
      "valueString" : "num-codex.de"
    },
    {
      "code" : "status",
      "valueCode" : "active"
    },
    {
      "code" : "abbreviation",
      "valueString" : "CRR"
    }]
  }]
}

```
