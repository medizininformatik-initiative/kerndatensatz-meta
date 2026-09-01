# mii-sp-meta-researchstudy-rekrutierungsstand-datum - MII IG Meta v2027.0.0-ballot.rc3

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **mii-sp-meta-researchstudy-rekrutierungsstand-datum**

## SearchParameter: mii-sp-meta-researchstudy-rekrutierungsstand-datum 

| | |
| :--- | :--- |
| *Offizielle URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-researchstudy-rekrutierungsstand-datum | *Version*:2027.0.0-ballot.rc3 |
| Active Stand: 2026-09-01 | *Maschinenlesbarer Name*:MII_SP_Meta_ResearchStudy_RekrutierungsstandDatum |

 
Suchparameter für ResearchStudy.extension:Rekrutierung.extension:rekrutierungsstand-datum 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "mii-sp-meta-researchstudy-rekrutierungsstand-datum",
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
        "valueString" : "2027.0.0-ballot.rc3"
      },
      {
        "url" : "uri",
        "valueUri" : "https://www.medizininformatik-initiative.de/fhir/modul-meta"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/package-source"
    }],
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/modul-meta/StructureDefinition/mii-pr-meta-searchparameter"]
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
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-versionPolicy",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/artifact-version-policy-codes",
        "version" : "3.0.0",
        "code" : "package",
        "display" : "Package"
      }]
    }
  }],
  "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-researchstudy-rekrutierungsstand-datum",
  "version" : "2027.0.0-ballot.rc3",
  "name" : "MII_SP_Meta_ResearchStudy_RekrutierungsstandDatum",
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
  "description" : "Suchparameter für ResearchStudy.extension:Rekrutierung.extension:rekrutierungsstand-datum",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "code" : "rekrutierungsstand-datum",
  "base" : ["ResearchStudy"],
  "type" : "date",
  "expression" : "ResearchStudy.extension.where(url='https://www.medizininformatik-initiative.de/fhir/modul-studie/StructureDefinition/mii-ex-studie-rekrutierung').extension.where(url='rekrutierungsstand-datum').value"
}

```
