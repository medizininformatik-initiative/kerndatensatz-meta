Instance: mii-sp-meta-researchsubject-consent
InstanceOf: SearchParameter
Usage: #definition
// * url = "https://www.medizininformatik-initiative.de/fhir/core/modul-person/SearchParameter/ResearchSubject-Consent"
* insert Version
* insert SP_Publisher
* insert LicenseCodeableCCBY40Instance
* insert SP_Profile
* name = "MII_SP_Meta_ResearchSubject_Consent"
* status = #active
* experimental = false
* date = "2024-10-07"
* description = "Suchparameter für ResearchSubject.consent"
* code = #consent
* base = #ResearchSubject
* type = #reference
* expression = "ResearchSubject.consent"
* target = #Consent