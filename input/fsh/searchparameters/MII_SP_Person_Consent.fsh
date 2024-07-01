Instance: mii-sp-person-consent
InstanceOf: SearchParameter
Usage: #definition
* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-person/SearchParameter/ResearchSubject-Consent"
* insert Version
* insert SP_Publisher
* name = "MII_SP_Person_Consent"
* status = #active
* experimental = false
* date = "2022-02-21"
* description = "Suchparameter für ResearchSubject.consent"
* code = #consent
* base = #ResearchSubject
* type = #reference
* expression = "ResearchSubject.consent"
* target = #Consent