# Home - MII IG Meta v2026.0.0

* [**Table of Contents**](toc.md)
* **Home**

## Home

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/modul-meta/ImplementationGuide/mii-ig-meta | *Version*:2026.0.0 |
| Active as of 2026-07-23 | *Computable Name*:MII_IG_Meta |

# MII IG Modul Meta

Feel free to modify this index page with your own awesome content!



## Resource Content

```json
{
  "resourceType" : "ImplementationGuide",
  "id" : "mii-ig-meta",
  "extension" : [{
    "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/StructureDefinition/mii-ex-meta-license-codeable",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://spdx.org/licenses/",
        "code" : "CC-BY-4.0",
        "display" : "Creative Commons Attribution 4.0 International License"
      }]
    }
  }],
  "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/ImplementationGuide/mii-ig-meta",
  "version" : "2026.0.0",
  "name" : "MII_IG_Meta",
  "title" : "MII IG Meta",
  "status" : "active",
  "date" : "2026-07-23T12:41:43+00:00",
  "publisher" : "Medizininformatik Initiative",
  "contact" : [{
    "name" : "Medizininformatik Initiative",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.medizininformatik-initiative.de/"
    }]
  }],
  "description" : "Das Modul Meta enthält Basisartefakte für alle weiteren MII-IGs.",
  "packageId" : "de.medizininformatikinitiative.kerndatensatz.meta",
  "license" : "CC-BY-4.0",
  "fhirVersion" : ["4.0.1"],
  "dependsOn" : [{
    "id" : "hl7tx",
    "extension" : [{
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/implementationguide-dependency-comment",
      "valueMarkdown" : "Automatically added as a dependency - all IGs depend on HL7 Terminology"
    }],
    "uri" : "http://terminology.hl7.org/ImplementationGuide/hl7.terminology",
    "packageId" : "hl7.terminology.r4",
    "version" : "7.2.0"
  },
  {
    "id" : "hl7ext",
    "extension" : [{
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/implementationguide-dependency-comment",
      "valueMarkdown" : "Automatically added as a dependency - all IGs depend on the HL7 Extension Pack"
    }],
    "uri" : "http://hl7.org/fhir/extensions/ImplementationGuide/hl7.fhir.uv.extensions",
    "packageId" : "hl7.fhir.uv.extensions.r4",
    "version" : "5.3.0"
  }],
  "definition" : {
    "extension" : [{
      "extension" : [{
        "url" : "code",
        "valueString" : "copyrightyear"
      },
      {
        "url" : "value",
        "valueString" : "2019+"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "releaselabel"
      },
      {
        "url" : "value",
        "valueString" : "ci-build"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "autoload-resources"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-liquid"
      },
      {
        "url" : "value",
        "valueString" : "template/liquid"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-liquid"
      },
      {
        "url" : "value",
        "valueString" : "input/liquid"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-qa"
      },
      {
        "url" : "value",
        "valueString" : "temp/qa"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-temp"
      },
      {
        "url" : "value",
        "valueString" : "temp/pages"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-output"
      },
      {
        "url" : "value",
        "valueString" : "output"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-suppressed-warnings"
      },
      {
        "url" : "value",
        "valueString" : "input/ignoreWarnings.txt"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-history"
      },
      {
        "url" : "value",
        "valueString" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/history.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "template-html"
      },
      {
        "url" : "value",
        "valueString" : "template-page.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "template-md"
      },
      {
        "url" : "value",
        "valueString" : "template-page-md.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-contact"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-context"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-copyright"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-jurisdiction"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-license"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-publisher"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-version"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-wg"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "active-tables"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "fmm-definition"
      },
      {
        "url" : "value",
        "valueString" : "http://hl7.org/fhir/versions.html#maturity"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "propagate-status"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "excludelogbinaryformat"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "tabbed-snapshots"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-internal-dependency",
      "valueCode" : "hl7.fhir.uv.tools.r4#1.1.2"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "copyrightyear"
      },
      {
        "url" : "value",
        "valueString" : "2019+"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "releaselabel"
      },
      {
        "url" : "value",
        "valueString" : "ci-build"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "autoload-resources"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-liquid"
      },
      {
        "url" : "value",
        "valueString" : "template/liquid"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-liquid"
      },
      {
        "url" : "value",
        "valueString" : "input/liquid"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-qa"
      },
      {
        "url" : "value",
        "valueString" : "temp/qa"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-temp"
      },
      {
        "url" : "value",
        "valueString" : "temp/pages"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-output"
      },
      {
        "url" : "value",
        "valueString" : "output"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-suppressed-warnings"
      },
      {
        "url" : "value",
        "valueString" : "input/ignoreWarnings.txt"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-history"
      },
      {
        "url" : "value",
        "valueString" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/history.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "template-html"
      },
      {
        "url" : "value",
        "valueString" : "template-page.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "template-md"
      },
      {
        "url" : "value",
        "valueString" : "template-page-md.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-contact"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-context"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-copyright"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-jurisdiction"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-license"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-publisher"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-version"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-wg"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "active-tables"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "fmm-definition"
      },
      {
        "url" : "value",
        "valueString" : "http://hl7.org/fhir/versions.html#maturity"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "propagate-status"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "excludelogbinaryformat"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "tabbed-snapshots"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    }],
    "resource" : [{
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "CodeSystem-mii-cs-meta-diz-standorte.html"
      }],
      "reference" : {
        "reference" : "CodeSystem/mii-cs-meta-diz-standorte"
      },
      "name" : "MII CS Meta DIZ Standorte",
      "description" : "Medizininformatik-Initiative Standorte",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-mii-ex-meta-license-codeable.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/mii-ex-meta-license-codeable"
      },
      "name" : "MII EX Meta License Codeable",
      "description" : "This extension may be used to provide machine-processable license information about the set of data described by this resource.\nThe extension is a R4-compatible version of the FHIR for FAIR R4B IG Licence Terms as CodeableConcept extension.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-mii-pr-meta-searchparameter.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/mii-pr-meta-searchparameter"
      },
      "name" : "MII PR Meta SearchParameter",
      "description" : "Das Profil legt die Mindestanforderungen fest, die SearchParameter-Ressourcen im Kerndatensatz erfüllen müssen.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Bundle"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Bundle-mii-exa-meta-searchparam-collection-bundle.html"
      }],
      "reference" : {
        "reference" : "Bundle/mii-exa-meta-searchparam-collection-bundle"
      },
      "name" : "mii-exa-meta-searchparam-collection-bundle",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Bundle"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Bundle-mii-exa-meta-searchparam-transaction-bundle.html"
      }],
      "reference" : {
        "reference" : "Bundle/mii-exa-meta-searchparam-transaction-bundle"
      },
      "name" : "mii-exa-meta-searchparam-transaction-bundle",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-adverseevent-encounter.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-adverseevent-encounter"
      },
      "name" : "mii-sp-meta-adverseevent-encounter",
      "description" : "SearchParameter for AdverseEvent.encounter",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-adverseevent-suspectentity-instance.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-adverseevent-suspectentity-instance"
      },
      "name" : "mii-sp-meta-adverseevent-suspectentity-instance",
      "description" : "SearchParameter for AdverseEvent.suspectEntity.instance",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-body-structure-location-qualifier.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-body-structure-location-qualifier"
      },
      "name" : "mii-sp-meta-body-structure-location-qualifier",
      "description" : "Suchparameter für BodyStructure.locationQualifier",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-careplan-addresses.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-careplan-addresses"
      },
      "name" : "mii-sp-meta-careplan-addresses",
      "description" : "SearchParameter for CarePlan.addresses",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-careplan-contributor.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-careplan-contributor"
      },
      "name" : "mii-sp-meta-careplan-contributor",
      "description" : "SearchParameter for CarePlan.contributor",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-careplan-created.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-careplan-created"
      },
      "name" : "mii-sp-meta-careplan-created",
      "description" : "SearchParameter for CarePlan.created",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-composition-attester-mode.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-composition-attester-mode"
      },
      "name" : "mii-sp-meta-composition-attester-mode",
      "description" : "SearchParameter for Composition.attester.mode",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-composition-custodian.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-composition-custodian"
      },
      "name" : "mii-sp-meta-composition-custodian",
      "description" : "SearchParameter for Composition.custodian",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-composition-relatesto-code.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-composition-relatesto-code"
      },
      "name" : "mii-sp-meta-composition-relatesto-code",
      "description" : "SearchParameter for Composition.relatesTo.code",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-composition-section-author.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-composition-section-author"
      },
      "name" : "mii-sp-meta-composition-section-author",
      "description" : "Suchparameter für Composition.section.author",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-composition-section-title.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-composition-section-title"
      },
      "name" : "mii-sp-meta-composition-section-title",
      "description" : "Suchparameter für Composition.section.title",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-condition-evidence-detail.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-condition-evidence-detail"
      },
      "name" : "mii-sp-meta-condition-evidence-detail",
      "description" : "SearchParameter for Condition.evidence.detail",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-condition-icd10gm-diagnosesicherheit.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-condition-icd10gm-diagnosesicherheit"
      },
      "name" : "mii-sp-meta-condition-icd10gm-diagnosesicherheit",
      "description" : "Suchparameter für Condition.code.coding:icd10-gm.extension:Diagnosesicherheit",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-condition-icd10gm-mehrfachcodierung.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-condition-icd10gm-mehrfachcodierung"
      },
      "name" : "mii-sp-meta-condition-icd10gm-mehrfachcodierung",
      "description" : "Suchparameter für Condition.code.coding:icd10-gm.extension:Mehrfachcodierungs-Kennzeichen",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-condition-icd10gm-seitenlokalisation.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-condition-icd10gm-seitenlokalisation"
      },
      "name" : "mii-sp-meta-condition-icd10gm-seitenlokalisation",
      "description" : "Suchparameter für Condition.code.coding:icd10-gm.extension:Seitenlokalisation",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-condition-verification-status.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-condition-verification-status"
      },
      "name" : "mii-sp-meta-condition-verification-status",
      "description" : "SearchParameter for Condition.verificationStatus",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-consent-policyuri.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-consent-policyuri"
      },
      "name" : "mii-sp-meta-consent-policyuri",
      "description" : "Suche in der Policy URI (versionsspezifische Policy / Broad Consent)",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-consent-provisioncode.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-consent-provisioncode"
      },
      "name" : "mii-sp-meta-consent-provisioncode",
      "description" : "Suche im Code der Provison",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-consent-provisioncodeperiod.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-consent-provisioncodeperiod"
      },
      "name" : "mii-sp-meta-consent-provisioncodeperiod",
      "description" : "Composite-Suche nach Zeitraum (period) einer bestimmten, durch einen Code definierten, Provision.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-consent-provisioncodetype.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-consent-provisioncodetype"
      },
      "name" : "mii-sp-meta-consent-provisioncodetype",
      "description" : "Composite-Suche nach Typ (type) einer bestimmten, durch einen Code definierten, Provision.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-consent-provisionperiod.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-consent-provisionperiod"
      },
      "name" : "mii-sp-meta-consent-provisionperiod",
      "description" : "Suche im Zeitraum der Provision. Dieser Suchparameter bezieht sich explizit auf die zweite Verschachtelungsebene von provison.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-consent-provisiontype.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-consent-provisiontype"
      },
      "name" : "mii-sp-meta-consent-provisiontype",
      "description" : "Suche im Typ der Provison (permit, deny).",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-description.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-description"
      },
      "name" : "mii-sp-meta-description",
      "description" : "Suchparameter für CarePlan.description | ImagingStudy.description | ImagingStudy.series.description",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-device-property-type.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-device-property-type"
      },
      "name" : "mii-sp-meta-device-property-type",
      "description" : "Suchparameter für Device.property.type",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-devicemetric-source.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-devicemetric-source"
      },
      "name" : "mii-sp-meta-devicemetric-source",
      "description" : "Suchparameter für DeviceMetric.source",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-diagnostic-report-conclusion.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-diagnostic-report-conclusion"
      },
      "name" : "mii-sp-meta-diagnostic-report-conclusion",
      "description" : "Suchparameter für DiagnosticReport.conclusion",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-diagnosticreport-imagingstudy.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-diagnosticreport-imagingstudy"
      },
      "name" : "mii-sp-meta-diagnosticreport-imagingstudy",
      "description" : "SearchParameter for DiagnosticReport.imagingStudy",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-documentreference-attachment-size.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-documentreference-attachment-size"
      },
      "name" : "mii-sp-meta-documentreference-attachment-size",
      "description" : "Suchparameter für DocumentReference.content.attachment.size",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-documentreference-attachment-title.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-documentreference-attachment-title"
      },
      "name" : "mii-sp-meta-documentreference-attachment-title",
      "description" : "Suchparameter für DocumentReference.content.attachment.title",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-dokument-documentreference-attachment-creation.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-dokument-documentreference-attachment-creation"
      },
      "name" : "mii-sp-meta-dokument-documentreference-attachment-creation",
      "description" : "Suchparameter für DocumentReference.content.attachment.creation",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-dokument-documentreference-doc-status.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-dokument-documentreference-doc-status"
      },
      "name" : "mii-sp-meta-dokument-documentreference-doc-status",
      "description" : "Suchparameter für DocumentReference.docStatus",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-dokument-documentreference-nlp-processing-status.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-dokument-documentreference-nlp-processing-status"
      },
      "name" : "mii-sp-meta-dokument-documentreference-nlp-processing-status",
      "description" : "Suchparameter für DocumentReference.extension[nlp-processing-status].valueCodeableConcept",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-encounter-aufnahmegrund-drittestelle.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-encounter-aufnahmegrund-drittestelle"
      },
      "name" : "mii-sp-meta-encounter-aufnahmegrund-drittestelle",
      "description" : "Suchparameter für Encounter.extension:Aufnahmegrund.extension:DritteStelle",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-encounter-aufnahmegrund-ersteundzweitestelle.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-encounter-aufnahmegrund-ersteundzweitestelle"
      },
      "name" : "mii-sp-meta-encounter-aufnahmegrund-ersteundzweitestelle",
      "description" : "Suchparameter für Encounter.extension:Aufnahmegrund.extension:ErsteUndZweiteStelle",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-encounter-aufnahmegrund-viertestelle.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-encounter-aufnahmegrund-viertestelle"
      },
      "name" : "mii-sp-meta-encounter-aufnahmegrund-viertestelle",
      "description" : "Suchparameter für Encounter.extension:Aufnahmegrund.extension:VierteStelle",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-encounter-diagnosis-use.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-encounter-diagnosis-use"
      },
      "name" : "mii-sp-meta-encounter-diagnosis-use",
      "description" : "Suchparameter für Encounter.diagnosis.use",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-encounter-entlassungsgrund-drittestelle.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-encounter-entlassungsgrund-drittestelle"
      },
      "name" : "mii-sp-meta-encounter-entlassungsgrund-drittestelle",
      "description" : "Suchparameter für Encounter.hospitalization.dischargeDisposition.extension:Entlassungsgrund.extension:DritteStelle",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-encounter-entlassungsgrund-ersteundzweitestelle.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-encounter-entlassungsgrund-ersteundzweitestelle"
      },
      "name" : "mii-sp-meta-encounter-entlassungsgrund-ersteundzweitestelle",
      "description" : "Suchparameter für Encounter.hospitalization.dischargeDisposition.extension:Entlassungsgrund.extension:ErsteUndZweiteStelle",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-encounter-hospitalization-admitsource.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-encounter-hospitalization-admitsource"
      },
      "name" : "mii-sp-meta-encounter-hospitalization-admitsource",
      "description" : "Suchparameter für Encounter.hospitalization.admitSource",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-encounter-location-physical-type.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-encounter-location-physical-type"
      },
      "name" : "mii-sp-meta-encounter-location-physical-type",
      "description" : "Suchparameter für Encounter.location.physicalType",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-encounter-servicetype.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-encounter-servicetype"
      },
      "name" : "mii-sp-meta-encounter-servicetype",
      "description" : "Suchparameter für Encounter.serviceType",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-evidencevariable-characteristic-description.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-evidencevariable-characteristic-description"
      },
      "name" : "mii-sp-meta-evidencevariable-characteristic-description",
      "description" : "Suchparameter für EvidenceVariable.characteristic.description",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-familymemberhistory-reasoncode.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-familymemberhistory-reasoncode"
      },
      "name" : "mii-sp-meta-familymemberhistory-reasoncode",
      "description" : "Suchparameter für FamilyMemberHistory.reasonCode",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-familymemberhistory-reasonreference.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-familymemberhistory-reasonreference"
      },
      "name" : "mii-sp-meta-familymemberhistory-reasonreference",
      "description" : "Suchparameter für FamilyMemberHistory.reasonReference",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-imaging-study-bildgebungsgrund.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-imaging-study-bildgebungsgrund"
      },
      "name" : "mii-sp-meta-imaging-study-bildgebungsgrund",
      "description" : "Suchparameter für ImagingStudy.Extension.Bildgebungsgrund",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-imaging-study-instance-burned-in-annotation.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-imaging-study-instance-burned-in-annotation"
      },
      "name" : "mii-sp-meta-imaging-study-instance-burned-in-annotation",
      "description" : "Suchparameter für ImagingStudy.series.instance.extension.burnedInAnnotation",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-imaging-study-instance-image-type.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-imaging-study-instance-image-type"
      },
      "name" : "mii-sp-meta-imaging-study-instance-image-type",
      "description" : "Suchparameter für ImagingStudy.series.instance.extension.imageType",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-imaging-study-instance-number.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-imaging-study-instance-number"
      },
      "name" : "mii-sp-meta-imaging-study-instance-number",
      "description" : "Suchparameter für ImagingStudy.series.instance.number",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-imaging-study-instance-pixel-x.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-imaging-study-instance-pixel-x"
      },
      "name" : "mii-sp-meta-imaging-study-instance-pixel-x",
      "description" : "Suchparameter für ImagingStudy.series.instance.extension.pixelSpacingX",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-imaging-study-instance-pixel-y.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-imaging-study-instance-pixel-y"
      },
      "name" : "mii-sp-meta-imaging-study-instance-pixel-y",
      "description" : "Suchparameter für ImagingStudy.series.instance.extension.pixelSpacingY",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-imaging-study-instance-slice-thickness.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-imaging-study-instance-slice-thickness"
      },
      "name" : "mii-sp-meta-imaging-study-instance-slice-thickness",
      "description" : "Suchparameter für ImagingStudy.series.instance.extension.sliceThickness",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-imaging-study-modality.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-imaging-study-modality"
      },
      "name" : "mii-sp-meta-imaging-study-modality",
      "description" : "Suchparameter für ImagingStudy.modality",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-imaging-study-modality-body-site.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-imaging-study-modality-body-site"
      },
      "name" : "mii-sp-meta-imaging-study-modality-body-site",
      "description" : "Suchparameter für ImagingStudy.series.modality and ImagingStudy.series.bodySite",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-imaging-study-number-instances.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-imaging-study-number-instances"
      },
      "name" : "mii-sp-meta-imaging-study-number-instances",
      "description" : "Suchparameter für ImagingStudy.numberOfSeries",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-imaging-study-number-series.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-imaging-study-number-series"
      },
      "name" : "mii-sp-meta-imaging-study-number-series",
      "description" : "Suchparameter für ImagingStudy.numberOfSeries",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-imaging-study-procedure-reference.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-imaging-study-procedure-reference"
      },
      "name" : "mii-sp-meta-imaging-study-procedure-reference",
      "description" : "Suchparameter für ImagingStudy.procedureReference",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-imaging-study-series-contrast-bolus.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-imaging-study-series-contrast-bolus"
      },
      "name" : "mii-sp-meta-imaging-study-series-contrast-bolus",
      "description" : "Suchparameter für ImagingStudy.series.extension.contrastBolus",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-imaging-study-series-contrast-bolus-details.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-imaging-study-series-contrast-bolus-details"
      },
      "name" : "mii-sp-meta-imaging-study-series-contrast-bolus-details",
      "description" : "Suchparameter für ImagingStudy.series.extension.contrastBolusDetails",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-imaging-study-series-convolutional-kernel.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-imaging-study-series-convolutional-kernel"
      },
      "name" : "mii-sp-meta-imaging-study-series-convolutional-kernel",
      "description" : "Suchparameter für ImagingStudy.series.extension.convolutionalKernel",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-imaging-study-series-ctdi-volume.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-imaging-study-series-ctdi-volume"
      },
      "name" : "mii-sp-meta-imaging-study-series-ctdi-volume",
      "description" : "Suchparameter für ImagingStudy.series.extension.CTDIvolume",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-imaging-study-series-echo-time.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-imaging-study-series-echo-time"
      },
      "name" : "mii-sp-meta-imaging-study-series-echo-time",
      "description" : "Suchparameter für ImagingStudy.series.extension.echoTime",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-imaging-study-series-exposure.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-imaging-study-series-exposure"
      },
      "name" : "mii-sp-meta-imaging-study-series-exposure",
      "description" : "Suchparameter für ImagingStudy.series.extension.exposure",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-imaging-study-series-exposure-time.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-imaging-study-series-exposure-time"
      },
      "name" : "mii-sp-meta-imaging-study-series-exposure-time",
      "description" : "Suchparameter für ImagingStudy.series.extension.exposureTime",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-imaging-study-series-flip-angle.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-imaging-study-series-flip-angle"
      },
      "name" : "mii-sp-meta-imaging-study-series-flip-angle",
      "description" : "Suchparameter für ImagingStudy.series.extension.flipAngle",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-imaging-study-series-inversion-time.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-imaging-study-series-inversion-time"
      },
      "name" : "mii-sp-meta-imaging-study-series-inversion-time",
      "description" : "Suchparameter für ImagingStudy.series.extension.inversionTime",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-imaging-study-series-kvp.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-imaging-study-series-kvp"
      },
      "name" : "mii-sp-meta-imaging-study-series-kvp",
      "description" : "Suchparameter für ImagingStudy.series.extension.kvp",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-imaging-study-series-laterality.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-imaging-study-series-laterality"
      },
      "name" : "mii-sp-meta-imaging-study-series-laterality",
      "description" : "Suchparameter für ImagingStudy.series.laterality",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-imaging-study-series-magnetic-field-strength.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-imaging-study-series-magnetic-field-strength"
      },
      "name" : "mii-sp-meta-imaging-study-series-magnetic-field-strength",
      "description" : "Suchparameter für ImagingStudy.series.extension.magneticFieldStrength",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-imaging-study-series-number.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-imaging-study-series-number"
      },
      "name" : "mii-sp-meta-imaging-study-series-number",
      "description" : "Suchparameter für ImagingStudy.series.number",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-imaging-study-series-pulse-frequency.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-imaging-study-series-pulse-frequency"
      },
      "name" : "mii-sp-meta-imaging-study-series-pulse-frequency",
      "description" : "Suchparameter für ImagingStudy.series.extension.pulseRepetitionFrequency",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-imaging-study-series-radionuclide.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-imaging-study-series-radionuclide"
      },
      "name" : "mii-sp-meta-imaging-study-series-radionuclide",
      "description" : "Suchparameter für ImagingStudy.series.extension.radionuclide",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-imaging-study-series-radionuclide-half-life.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-imaging-study-series-radionuclide-half-life"
      },
      "name" : "mii-sp-meta-imaging-study-series-radionuclide-half-life",
      "description" : "Suchparameter für ImagingStudy.series.extension.radionuclideHalfLife",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-imaging-study-series-radionuclide-total-dose.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-imaging-study-series-radionuclide-total-dose"
      },
      "name" : "mii-sp-meta-imaging-study-series-radionuclide-total-dose",
      "description" : "Suchparameter für ImagingStudy.series.extension.radionuclideTotalDose",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-imaging-study-series-radiopharmaceutical.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-imaging-study-series-radiopharmaceutical"
      },
      "name" : "mii-sp-meta-imaging-study-series-radiopharmaceutical",
      "description" : "Suchparameter für ImagingStudy.series.extension.radiopharmaceutical",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-imaging-study-series-repetition-time.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-imaging-study-series-repetition-time"
      },
      "name" : "mii-sp-meta-imaging-study-series-repetition-time",
      "description" : "Suchparameter für ImagingStudy.series.extension.repetitionTime",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-imaging-study-series-scanning-sequence.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-imaging-study-series-scanning-sequence"
      },
      "name" : "mii-sp-meta-imaging-study-series-scanning-sequence",
      "description" : "Suchparameter für ImagingStudy.series.extension.scanningSequence",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-imaging-study-series-scanning-sequence-variant.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-imaging-study-series-scanning-sequence-variant"
      },
      "name" : "mii-sp-meta-imaging-study-series-scanning-sequence-variant",
      "description" : "Suchparameter für ImagingStudy.series.extension.scanningSequenceVariant",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-imaging-study-series-series-type.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-imaging-study-series-series-type"
      },
      "name" : "mii-sp-meta-imaging-study-series-series-type",
      "description" : "ImagingStudy.series.extension.seriesType",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-imaging-study-series-slice-thickness.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-imaging-study-series-slice-thickness"
      },
      "name" : "mii-sp-meta-imaging-study-series-slice-thickness",
      "description" : "Suchparameter für ImagingStudy.series.extension.sliceThickness",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-imaging-study-series-started.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-imaging-study-series-started"
      },
      "name" : "mii-sp-meta-imaging-study-series-started",
      "description" : "Suchparameter für ImagingStudy.series.started",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-imaging-study-series-tracer-exposure-time.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-imaging-study-series-tracer-exposure-time"
      },
      "name" : "mii-sp-meta-imaging-study-series-tracer-exposure-time",
      "description" : "Suchparameter für ImagingStudy.series.tracerExposureTime",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-imaging-study-series-transducer-frequency.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-imaging-study-series-transducer-frequency"
      },
      "name" : "mii-sp-meta-imaging-study-series-transducer-frequency",
      "description" : "Suchparameter für ImagingStudy.series.extension.transducerFrequency",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-imaging-study-series-transducer-type.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-imaging-study-series-transducer-type"
      },
      "name" : "mii-sp-meta-imaging-study-series-transducer-type",
      "description" : "ImagingStudy.series.extension.transducerType",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-imaging-study-series-ultrasound-color.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-imaging-study-series-ultrasound-color"
      },
      "name" : "mii-sp-meta-imaging-study-series-ultrasound-color",
      "description" : "ImagingStudy.series.extension.ultrasoundPresent",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-imaging-study-series-units.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-imaging-study-series-units"
      },
      "name" : "mii-sp-meta-imaging-study-series-units",
      "description" : "Suchparameter für ImagingStudy.series.extension.units",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-imaging-study-series-view-position.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-imaging-study-series-view-position"
      },
      "name" : "mii-sp-meta-imaging-study-series-view-position",
      "description" : "Suchparameter für ImagingStudy.series.extension.viewPosition",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-imaging-study-series-xray-tube-current.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-imaging-study-series-xray-tube-current"
      },
      "name" : "mii-sp-meta-imaging-study-series-xray-tube-current",
      "description" : "Suchparameter für ImagingStudy.series.extension.xRayTubeCurrent",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-library-quellregister.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-library-quellregister"
      },
      "name" : "mii-sp-meta-library-quellregister",
      "description" : "Suchparameter für Library.extension:QuellRegister",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-library-relatedartifact-url.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-library-relatedartifact-url"
      },
      "name" : "mii-sp-meta-library-relatedartifact-url",
      "description" : "Suchparameter für Library.relatedArtifact.document.url",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-media-partof.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-media-partof"
      },
      "name" : "mii-sp-meta-media-partof",
      "description" : "SearchParameter for Media.partOf",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-medication-dosage-dosequantity.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-medication-dosage-dosequantity"
      },
      "name" : "mii-sp-meta-medication-dosage-dosequantity",
      "description" : "Suchparameter für MedicationStatement.dosage.doseAndRate.doseQuantity | MedicationRequest.dosageInstruction.doseAndRate.doseQuantity | MedicationAdministration.dosage.dose",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-medication-dosage-doserange.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-medication-dosage-doserange"
      },
      "name" : "mii-sp-meta-medication-dosage-doserange",
      "description" : "Suchparameter für MedicationStatement.dosage.doseAndRate.doseRange | MedicationRequest.dosageInstruction.doseAndRate.doseRange",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-medication-dosage-doserange-high.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-medication-dosage-doserange-high"
      },
      "name" : "mii-sp-meta-medication-dosage-doserange-high",
      "description" : "Suchparameter für MedicationStatement.dosage.doseAndRate.doseRange.high | MedicationRequest.dosageInstruction.doseAndRate.doseRange.high",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-medication-dosage-doserange-low.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-medication-dosage-doserange-low"
      },
      "name" : "mii-sp-meta-medication-dosage-doserange-low",
      "description" : "Suchparameter für MedicationStatement.dosage.doseAndRate.doseRange.low | MedicationRequest.dosageInstruction.doseAndRate.doseRange.low",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-medication-dosage-ratequantity.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-medication-dosage-ratequantity"
      },
      "name" : "mii-sp-meta-medication-dosage-ratequantity",
      "description" : "Suchparameter für MedicationStatement.dosage.doseAndRate.rateQuantity | MedicationAdministration.dosage.rateQuantity | MedicationRequest.dosageInstruction.doseAndRate.rateQuantity",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-medication-dosage-raterange.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-medication-dosage-raterange"
      },
      "name" : "mii-sp-meta-medication-dosage-raterange",
      "description" : "Suchparameter für MedicationStatement.dosage.doseAndRate.rateRange | MedicationRequest.dosageInstruction.doseAndRate.rateRange",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-medication-dosage-raterange-high.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-medication-dosage-raterange-high"
      },
      "name" : "mii-sp-meta-medication-dosage-raterange-high",
      "description" : "Suchparameter für MedicationStatement.dosage.doseAndRate.rateRange.high | MedicationRequest.dosageInstruction.doseAndRate.rateRange.high",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-medication-dosage-raterange-low.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-medication-dosage-raterange-low"
      },
      "name" : "mii-sp-meta-medication-dosage-raterange-low",
      "description" : "Suchparameter für MedicationStatement.dosage.doseAndRate.rateRange.low | MedicationRequest.dosageInstruction.doseAndRate.rateRange.low",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-medication-dosage-rateratio.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-medication-dosage-rateratio"
      },
      "name" : "mii-sp-meta-medication-dosage-rateratio",
      "description" : "MedicationStatement.dosage.doseAndRate.rate.ofType(Ratio) | MedicationAdministration.dosage.rate.ofType(Ratio) | MedicationRequest.dosageInstruction.doseAndRate.rate.ofType(Ratio)",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-medication-dosage-rateratio-denominator.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-medication-dosage-rateratio-denominator"
      },
      "name" : "mii-sp-meta-medication-dosage-rateratio-denominator",
      "description" : "Suchparameter für MedicationStatement.dosage.doseAndRate.rateRatio.denominator | MedicationAdministration.dosage.rate.ofType(Ratio).denominator | MedicationRequest.dosageInstruction.doseAndRate.rate.ofType(Ratio).denominator",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-medication-dosage-rateratio-numerator.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-medication-dosage-rateratio-numerator"
      },
      "name" : "mii-sp-meta-medication-dosage-rateratio-numerator",
      "description" : "Suchparameter für MedicationStatement.dosage.doseAndRate.rateRatio.numerator | MedicationAdministration.dosage.rate.ofType(Ratio).numerator | MedicationRequest.dosageInstruction.doseAndRate.rate.ofType(Ratio).numerator",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-medication-dosage-route.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-medication-dosage-route"
      },
      "name" : "mii-sp-meta-medication-dosage-route",
      "description" : "Suchparameter für (MedicationAdministration|MedicationStatement).dosage.route | MedicationRequest.dosageInstruction.route",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-medication-dosage-site.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-medication-dosage-site"
      },
      "name" : "mii-sp-meta-medication-dosage-site",
      "description" : "Suchparameter für (MedicationAdministration|MedicationStatement).dosage.site | MedicationRequest.dosageInstruction.site",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-medication-ingredient-strength.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-medication-ingredient-strength"
      },
      "name" : "mii-sp-meta-medication-ingredient-strength",
      "description" : "Suchparameter für Medication.ingredient.strength",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-medication-ingredient-strength-denominator.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-medication-ingredient-strength-denominator"
      },
      "name" : "mii-sp-meta-medication-ingredient-strength-denominator",
      "description" : "Suchparameter für Medication.ingredient.strength.denominator",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-medication-ingredient-strength-numerator.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-medication-ingredient-strength-numerator"
      },
      "name" : "mii-sp-meta-medication-ingredient-strength-numerator",
      "description" : "Suchparameter für Medication.ingredient.strength.numerator",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-medication-list-mode.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-medication-list-mode"
      },
      "name" : "mii-sp-meta-medication-list-mode",
      "description" : "Suchparameter für List.mode",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-medication-partof.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-medication-partof"
      },
      "name" : "mii-sp-meta-medication-partof",
      "description" : "Suchparameter für (MedicationAdministration|MedicationStatement).partOf",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-medication-reasonreference.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-medication-reasonreference"
      },
      "name" : "mii-sp-meta-medication-reasonreference",
      "description" : "Suchparameter für (MedicationAdministration|MedicationStatement).reasonReference",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-observation-body-structure.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-observation-body-structure"
      },
      "name" : "mii-sp-meta-observation-body-structure",
      "description" : "Suchparameter für Observation.bodyStructure",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-observation-bodysite.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-observation-bodysite"
      },
      "name" : "mii-sp-meta-observation-bodysite",
      "description" : "SearchParameter for Observation.bodySite",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-observation-component-interpretation.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-observation-component-interpretation"
      },
      "name" : "mii-sp-meta-observation-component-interpretation",
      "description" : "Suchparameter für Observation.component.interpretation",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-observation-encounter.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-observation-encounter"
      },
      "name" : "mii-sp-meta-observation-encounter",
      "description" : "SearchParameter for Observation.encounter",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-observation-focus.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-observation-focus"
      },
      "name" : "mii-sp-meta-observation-focus",
      "description" : "SearchParameter for Observation.focus",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-observation-hasmember.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-observation-hasmember"
      },
      "name" : "mii-sp-meta-observation-hasmember",
      "description" : "SearchParameter for Observation.hasMember",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-observation-interpretation.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-observation-interpretation"
      },
      "name" : "mii-sp-meta-observation-interpretation",
      "description" : "Suchparameter für Observation.interpretation",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-observation-issued.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-observation-issued"
      },
      "name" : "mii-sp-meta-observation-issued",
      "description" : "Suchparameter für Observation.issued",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-observation-referencerange.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-observation-referencerange"
      },
      "name" : "mii-sp-meta-observation-referencerange",
      "description" : "Suchparameter für Observation.referenceRange",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-observation-referencerange-high.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-observation-referencerange-high"
      },
      "name" : "mii-sp-meta-observation-referencerange-high",
      "description" : "Suchparameter für Observation.referenceRange.high",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-observation-referencerange-low.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-observation-referencerange-low"
      },
      "name" : "mii-sp-meta-observation-referencerange-low",
      "description" : "Suchparameter für Observation.referenceRange.low",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-observation-series-uid.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-observation-series-uid"
      },
      "name" : "mii-sp-meta-observation-series-uid",
      "description" : "Suchparameter für Observation.extension.seriesUID",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-observation-sop-instance-uid.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-observation-sop-instance-uid"
      },
      "name" : "mii-sp-meta-observation-sop-instance-uid",
      "description" : "Suchparameter für Observation.sopInstanceUID",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-observation-value-ratio.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-observation-value-ratio"
      },
      "name" : "mii-sp-meta-observation-value-ratio",
      "description" : "SearchParameter for Observation.valueRatio",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-observation-value-ratio-denominator.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-observation-value-ratio-denominator"
      },
      "name" : "mii-sp-meta-observation-value-ratio-denominator",
      "description" : "SearchParameter for Observation.valueRatio.denominator",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-observation-value-ratio-numerator.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-observation-value-ratio-numerator"
      },
      "name" : "mii-sp-meta-observation-value-ratio-numerator",
      "description" : "SearchParameter for Observation.valueRatio.numerator",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-patient-adresszusatz.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-patient-adresszusatz"
      },
      "name" : "mii-sp-meta-patient-adresszusatz",
      "description" : "Suchparameter für Patient.address.line.extension:Adresszusatz",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-patient-assignerpid.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-patient-assignerpid"
      },
      "name" : "mii-sp-meta-patient-assignerpid",
      "description" : "Suchparameter für Patient.identifier.assigner.identifier",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-patient-gemeindeschluessel.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-patient-gemeindeschluessel"
      },
      "name" : "mii-sp-meta-patient-gemeindeschluessel",
      "description" : "Suchparameter für Patient.address.city.extension:gemeindeschluessel",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-patient-hausnummer.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-patient-hausnummer"
      },
      "name" : "mii-sp-meta-patient-hausnummer",
      "description" : "Suchparameter für Patient.address.line.extension:Hausnummer",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-patient-otheramtlich.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-patient-otheramtlich"
      },
      "name" : "mii-sp-meta-patient-otheramtlich",
      "description" : "Suchparameter für Patient.gender.extension:other-amtlich",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-patient-postfach.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-patient-postfach"
      },
      "name" : "mii-sp-meta-patient-postfach",
      "description" : "Suchparameter für Patient.address.line.extension:Postfach",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-patient-prefix.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-patient-prefix"
      },
      "name" : "mii-sp-meta-patient-prefix",
      "description" : "Suchparameter für Patient.name.prefix",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-patient-prefixqualifier.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-patient-prefixqualifier"
      },
      "name" : "mii-sp-meta-patient-prefixqualifier",
      "description" : "Suchparameter für Patient.name.prefix.extension:prefix-qualifier",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-patient-stadtteil.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-patient-stadtteil"
      },
      "name" : "mii-sp-meta-patient-stadtteil",
      "description" : "Suchparameter für Patient.address.extension:Stadtteil",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-patient-strasse.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-patient-strasse"
      },
      "name" : "mii-sp-meta-patient-strasse",
      "description" : "Suchparameter für Patient.address.line.extension:Strasse",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-procedure-bodysite.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-procedure-bodysite"
      },
      "name" : "mii-sp-meta-procedure-bodysite",
      "description" : "Suchparameter für Procedure.bodySite",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-procedure-complication.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-procedure-complication"
      },
      "name" : "mii-sp-meta-procedure-complication",
      "description" : "SearchParameter for Procedure.complication",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-procedure-dokumentationsdatum.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-procedure-dokumentationsdatum"
      },
      "name" : "mii-sp-meta-procedure-dokumentationsdatum",
      "description" : "Suchparameter für Procedure.extension:Dokumentationsdatum",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-procedure-durchfuehrungsabsicht.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-procedure-durchfuehrungsabsicht"
      },
      "name" : "mii-sp-meta-procedure-durchfuehrungsabsicht",
      "description" : "Suchparameter für Procedure.extension:Durchfuehrungsabsicht",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-procedure-ops-seitenlokalisation.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-procedure-ops-seitenlokalisation"
      },
      "name" : "mii-sp-meta-procedure-ops-seitenlokalisation",
      "description" : "Suchparameter für Procedure.code.coding:ops.extension:Seitenlokalisation",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-procedure-outcome.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-procedure-outcome"
      },
      "name" : "mii-sp-meta-procedure-outcome",
      "description" : "SearchParameter for Procedure.outcome",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-procedure-recorder.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-procedure-recorder"
      },
      "name" : "mii-sp-meta-procedure-recorder",
      "description" : "Suchparameter für Procedure.recorder",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-read-proc-report.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-read-proc-report"
      },
      "name" : "mii-sp-meta-read-proc-report",
      "description" : "Suchparameter für ReadProcedure.report",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-reason-reference.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-reason-reference"
      },
      "name" : "mii-sp-meta-reason-reference",
      "description" : "Suchparameter für ImagingStudy.reasonReference",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-researchstudy-akronym.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-researchstudy-akronym"
      },
      "name" : "mii-sp-meta-researchstudy-akronym",
      "description" : "Suchparameter für ResearchStudy.extension:Akronym",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-researchstudy-arm-name.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-researchstudy-arm-name"
      },
      "name" : "mii-sp-meta-researchstudy-arm-name",
      "description" : "Suchparameter für ResearchStudy.arm.name",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-researchstudy-finanzierung.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-researchstudy-finanzierung"
      },
      "name" : "mii-sp-meta-researchstudy-finanzierung",
      "description" : "Suchparameter für ResearchStudy.extension:Finanzierung",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-researchstudy-label.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-researchstudy-label"
      },
      "name" : "mii-sp-meta-researchstudy-label",
      "description" : "Suchparameter für ResearchStudy.extension:label",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-researchstudy-rekrutierungsstand.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-researchstudy-rekrutierungsstand"
      },
      "name" : "mii-sp-meta-researchstudy-rekrutierungsstand",
      "description" : "Suchparameter für ResearchStudy.extension:Rekrutierung.extension:rekrutierungsstand",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-researchstudy-rekrutierungsstand-datum.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-researchstudy-rekrutierungsstand-datum"
      },
      "name" : "mii-sp-meta-researchstudy-rekrutierungsstand-datum",
      "description" : "Suchparameter für ResearchStudy.extension:Rekrutierung.extension:rekrutierungsstand-datum",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-researchstudy-rekrutierungsstand-genauigkeit.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-researchstudy-rekrutierungsstand-genauigkeit"
      },
      "name" : "mii-sp-meta-researchstudy-rekrutierungsstand-genauigkeit",
      "description" : "Suchparameter für ResearchStudy.extension:Rekrutierung.extension:rekrutierungsstand-genauigkeit",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-researchstudy-rekrutierungsstart.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-researchstudy-rekrutierungsstart"
      },
      "name" : "mii-sp-meta-researchstudy-rekrutierungsstart",
      "description" : "Suchparameter für ResearchStudy.extension:Rekrutierung.extension:rekrutierungsstart",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-researchstudy-rekrutierungsziel.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-researchstudy-rekrutierungsziel"
      },
      "name" : "mii-sp-meta-researchstudy-rekrutierungsziel",
      "description" : "Suchparameter für ResearchStudy.extension:Rekrutierung.extension:rekrutierungsziel",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-researchstudy-studienregister.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-researchstudy-studienregister"
      },
      "name" : "mii-sp-meta-researchstudy-studienregister",
      "description" : "Suchparameter für ResearchStudy.extension:Studienregister",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-researchsubject-consent.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-researchsubject-consent"
      },
      "name" : "mii-sp-meta-researchsubject-consent",
      "description" : "Suchparameter für ResearchSubject.consent",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-servicerequest-reasoncode.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-servicerequest-reasoncode"
      },
      "name" : "mii-sp-meta-servicerequest-reasoncode",
      "description" : "Suchparameter für ServiceRequest.reasonCode",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-servicerequest-reasonreference.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-servicerequest-reasonreference"
      },
      "name" : "mii-sp-meta-servicerequest-reasonreference",
      "description" : "Suchparameter für ServiceRequest.reasonReference",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-servicerequest-supportinginfo.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-servicerequest-supportinginfo"
      },
      "name" : "mii-sp-meta-servicerequest-supportinginfo",
      "description" : "SearchParameter for ServiceRequest.supportingInfo",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-specimen-collection-body-site.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-specimen-collection-body-site"
      },
      "name" : "mii-sp-meta-specimen-collection-body-site",
      "description" : "SearchParameter for Specimen.collection.bodySite",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-specimen-collection-method.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-specimen-collection-method"
      },
      "name" : "mii-sp-meta-specimen-collection-method",
      "description" : "SearchParameter for Specimen.collection.method",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-specimen-container-additive.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-specimen-container-additive"
      },
      "name" : "mii-sp-meta-specimen-container-additive",
      "description" : "SearchParameter for Specimen.container.additive",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-specimen-diagnose.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-specimen-diagnose"
      },
      "name" : "mii-sp-meta-specimen-diagnose",
      "description" : "Suchparameter für die Extension Diagnose am Profil Bioprobe",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-specimen-processing-additive.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-specimen-processing-additive"
      },
      "name" : "mii-sp-meta-specimen-processing-additive",
      "description" : "SearchParameter for Specimen.processing.additive",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-specimen-processing-date.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-specimen-processing-date"
      },
      "name" : "mii-sp-meta-specimen-processing-date",
      "description" : "SearchParameter for Specimen.processing.time",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-specimen-processing-procedure.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-specimen-processing-procedure"
      },
      "name" : "mii-sp-meta-specimen-processing-procedure",
      "description" : "SearchParameter for Specimen.processing.procedure",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-specimen-request.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-specimen-request"
      },
      "name" : "mii-sp-meta-specimen-request",
      "description" : "SearchParameter for Specimen.request",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-supporting-info.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-supporting-info"
      },
      "name" : "mii-sp-meta-supporting-info",
      "description" : "Suchparameter für CarePlan.supportingInfo | DiagnosticReport.extension.supportingInfo",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-task-for.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-task-for"
      },
      "name" : "mii-sp-meta-task-for",
      "description" : "Suchparameter für Task.for",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-task-reasoncode.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-task-reasoncode"
      },
      "name" : "mii-sp-meta-task-reasoncode",
      "description" : "Suchparameter für Task.reasonCode",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-meta-task-reasonreference.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-meta-task-reasonreference"
      },
      "name" : "mii-sp-meta-task-reasonreference",
      "description" : "Suchparameter für Task.reasonReference",
      "exampleBoolean" : false
    }],
    "page" : {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
        "valueUrl" : "toc.html"
      }],
      "nameUrl" : "toc.html",
      "title" : "Table of Contents",
      "generation" : "html",
      "page" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "index.html"
        }],
        "nameUrl" : "index.html",
        "title" : "Home",
        "generation" : "markdown"
      }]
    },
    "parameter" : [{
      "code" : "path-resource",
      "value" : "input/capabilities"
    },
    {
      "code" : "path-resource",
      "value" : "input/examples"
    },
    {
      "code" : "path-resource",
      "value" : "input/extensions"
    },
    {
      "code" : "path-resource",
      "value" : "input/models"
    },
    {
      "code" : "path-resource",
      "value" : "input/operations"
    },
    {
      "code" : "path-resource",
      "value" : "input/profiles"
    },
    {
      "code" : "path-resource",
      "value" : "input/resources"
    },
    {
      "code" : "path-resource",
      "value" : "input/vocabulary"
    },
    {
      "code" : "path-resource",
      "value" : "input/maps"
    },
    {
      "code" : "path-resource",
      "value" : "input/testing"
    },
    {
      "code" : "path-resource",
      "value" : "input/history"
    },
    {
      "code" : "path-resource",
      "value" : "fsh-generated/resources"
    },
    {
      "code" : "path-pages",
      "value" : "template/config"
    },
    {
      "code" : "path-pages",
      "value" : "input/images"
    },
    {
      "code" : "path-tx-cache",
      "value" : "input-cache/txcache"
    }]
  }
}

```
