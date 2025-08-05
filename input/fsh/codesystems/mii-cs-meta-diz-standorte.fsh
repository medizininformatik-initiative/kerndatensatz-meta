RuleSet: AddAbbreviation(abbreviation)
* ^property[+].code = #abbreviation
* ^property[=].valueString = "{abbreviation}"

RuleSet: AddKonsortium(consortium)
* ^property[+].code = #consortium
* ^property[=].valueString = "{consortium}"

RuleSet: AddUri(uri)
* ^property[+].code = #uri
* ^property[=].valueString = "{uri}"

RuleSet: AddStatus(status)
* ^property[+].code = #status
* ^property[=].valueCode = #{status}

RuleSet: AddDeprecationDate(deprecationDate)
* ^property[+].code = #deprecationDate
* ^property[=].valueDateTime = "{deprecationDate}"

RuleSet: AddRetirementDate(retirementDate)
* ^property[+].code = #retirementDate
* ^property[=].valueDateTime = "{retirementDate}"

RuleSet: AddDatenmanagementstelle(dataManagement)
* ^property[+].code = #dataManagement
* ^property[=].valueBoolean = {dataManagement}

RuleSet: AddDiz(dic)
* ^property[+].code = #dic
* ^property[=].valueBoolean = {dic}

RuleSet: AddReplaces(replaces)
* ^property[+].code = #replaces
* ^property[=].valueCode = #{replaces}

RuleSet: AddReplacedBy(replacedBy)
* ^property[+].code = #replacedBy
* ^property[=].valueCode = #{replacedBy}

RuleSet: AddTRV(contract)
* ^property[+].code = #contract
* ^property[=].valueString = "{contract}"

CodeSystem: MII_CS_Meta_DIZ_Standorte
Id: mii-cs-meta-diz-standorte
Title: "MII CS Meta DIZ Standorte"
Description: "Medizininformatik-Initiative Standorte"
* ^meta.profile = "http://hl7.org/fhir/StructureDefinition/shareablecodesystem"
* ^url = "https://www.medizininformatik-initiative.de/fhir/core/CodeSystem/core-location-identifier"
* ^valueSet = "https://www.medizininformatik-initiative.de/fhir/core/ValueSet/core-location-identifier"
* ^experimental = false
* insert Publisher
* insert PR_CS_VS_Version
* insert LicenseCodeableCCBY40
* ^date = "2025-08-01"
* ^status = #active
* ^caseSensitive = true
* ^compositional = false
* ^content = #complete
* ^copyright = "Medizininformatik-Initiative"
* ^property[0].code = #consortium
* ^property[0].uri = "https://www.medizininformatik-initiative.de/de/konsortien"
* ^property[0].type = #string
* ^property[1].code = #uri
* ^property[1].uri = "https://www.medizininformatik-initiative.de/de/konsortien/datenintegrationszentren"
* ^property[1].type = #string
* ^property[2].code = #status
* ^property[2].uri = "http://hl7.org/fhir/concept-properties#status"
* ^property[2].type = #code
* ^property[3].code = #deprecationDate
* ^property[3].uri = "http://hl7.org/fhir/concept-properties#deprecationDate"
* ^property[3].type = #dateTime
* ^property[4].code = #retirementDate
* ^property[4].uri = "http://hl7.org/fhir/concept-properties#retirementDate"
* ^property[4].type = #dateTime
* ^property[5].code = #dataManagement
* ^property[5].type = #boolean
* ^property[5].description = "Datenmanagementstelle (true / false)"
* ^property[6].code = #contract
* ^property[6].type = #string
* ^property[6].description = "Teilnahmerahmenvertrag (Version)"
* ^property[7].code = #dic
* ^property[7].type = #boolean
* ^property[7].description = "Datenintegrationszentrum (true / false)"
* ^property[8].code = #abbreviation
* ^property[8].type = #string
* ^property[8].description = "Abkürzung (Kürzel)"
* ^property[9].code = #replaces
* ^property[9].type = #code
* ^property[9].description = "ersetzt (alter Code)"
* ^property[10].code = #replacedBy
* ^property[10].type = #code
* ^property[10].description = "ersetzt durch (neuer Code)"
* #UKA "Uniklinik RWTH Aachen" "Aachen"
* #UKA insert AddKonsortium(SMITH)
* #UKA insert AddUri(ukaachen.de)
* #UKA insert AddStatus(deprecated)
* #UKA insert AddTRV(V6.15)
* #UKA insert AddReplacedBy(bb62-2e3a)
* #UKA insert AddDeprecationDate(2025-07-31)
* #bb62-2e3a "Uniklinik RWTH Aachen" "Aachen"
* #bb62-2e3a insert AddKonsortium(SMITH)
* #bb62-2e3a insert AddUri(ukaachen.de)
* #bb62-2e3a insert AddStatus(active)
* #bb62-2e3a insert AddTRV(V6.15)
* #bb62-2e3a insert AddAbbreviation(UKA)
* #bb62-2e3a insert AddDiz(true)
* #bb62-2e3a insert AddReplaces(UKA)
* #UKAU "Universitätsklinikum Augsburg" "Augsburg"
* #UKAU insert AddKonsortium(DIFUTURE)
* #UKAU insert AddUri(uk-augsburg.de)
* #UKAU insert AddStatus(deprecated)
* #UKAU insert AddTRV(V6.15)
* #UKAU insert AddReplacedBy(81c7-7b5d)
* #UKAU insert AddDeprecationDate(2025-07-31)
* #81c7-7b5d "Universitätsklinikum Augsburg" "Augsburg"
* #81c7-7b5d insert AddKonsortium(DIFUTURE)
* #81c7-7b5d insert AddUri(uk-augsburg.de)
* #81c7-7b5d insert AddStatus(active)
* #81c7-7b5d insert AddTRV(V6.15)
* #81c7-7b5d insert AddAbbreviation(UKAU)
* #81c7-7b5d insert AddDiz(true)
* #81c7-7b5d insert AddReplaces(UKAU)
* #Charité "Charité - Universitätsmedizin Berlin" "Berlin"
* #Charité insert AddKonsortium(HiGHmed)
* #Charité insert AddUri(charite.de)
* #Charité insert AddStatus(deprecated)
* #Charité insert AddDatenmanagementstelle(true)
* #Charité insert AddTRV(V6.15)
* #Charité insert AddReplacedBy(90e6-38f4)
* #Charité insert AddDeprecationDate(2025-07-31)
* #90e6-38f4 "Charité - Universitätsmedizin Berlin" "Berlin"
* #90e6-38f4 insert AddKonsortium(HiGHmed)
* #90e6-38f4 insert AddUri(charite.de)
* #90e6-38f4 insert AddStatus(active)
* #90e6-38f4 insert AddDatenmanagementstelle(true)
* #90e6-38f4 insert AddTRV(V6.15)
* #90e6-38f4 insert AddAbbreviation(Charité)
* #90e6-38f4 insert AddDiz(true)
* #90e6-38f4 insert AddReplaces(Charité)
* #VIV "Vivantes Netzwerk für Gesundheit GmbH" "Berlin"
* #VIV insert AddKonsortium(HiGHmed)
* #VIV insert AddUri(vivantes.de)
* #VIV insert AddStatus(deprecated)
* #VIV insert AddTRV(V6.15)
* #VIV insert AddReplacedBy(f0bf-65e8)
* #VIV insert AddDeprecationDate(2025-07-31)
* #f0bf-65e8 "Vivantes Netzwerk für Gesundheit GmbH" "Berlin"
* #f0bf-65e8 insert AddKonsortium(HiGHmed)
* #f0bf-65e8 insert AddUri(vivantes.de)
* #f0bf-65e8 insert AddStatus(active)
* #f0bf-65e8 insert AddTRV(V6.15)
* #f0bf-65e8 insert AddAbbreviation(VIV)
* #f0bf-65e8 insert AddDiz(true)
* #f0bf-65e8 insert AddReplaces(VIV)
* #UKOWL "Universität Bielefeld / Universitätsklinikum OWL" "Bielefeld"
* #UKOWL insert AddKonsortium(HiGHmed)
* #UKOWL insert AddUri(ukowl.de)
* #UKOWL insert AddStatus(deprecated)
* #UKOWL insert AddTRV(V6.14)
* #UKOWL insert AddReplacedBy(780a-265a)
* #UKOWL insert AddDeprecationDate(2025-07-31)
* #780a-265a "Universität Bielefeld / Universitätsklinikum OWL" "Bielefeld"
* #780a-265a insert AddKonsortium(HiGHmed)
* #780a-265a insert AddUri(ukowl.de)
* #780a-265a insert AddStatus(active)
* #780a-265a insert AddTRV(V6.14)
* #780a-265a insert AddAbbreviation(UKOWL)
* #780a-265a insert AddDiz(true)
* #780a-265a insert AddReplaces(UKOWL)
* #UKRUB "Universitätsklinikum der Ruhr-Universität Bochum" "Bochum"
* #UKRUB insert AddKonsortium(SMITH)
* #UKRUB insert AddUri(rub.de)
* #UKRUB insert AddStatus(deprecated)
* #UKRUB insert AddTRV(V6.15)
* #UKRUB insert AddReplacedBy(c7f6-8e10)
* #UKRUB insert AddDeprecationDate(2025-07-31)
* #c7f6-8e10 "Universitätsklinikum der Ruhr-Universität Bochum" "Bochum"
* #c7f6-8e10 insert AddKonsortium(SMITH)
* #c7f6-8e10 insert AddUri(rub.de)
* #c7f6-8e10 insert AddStatus(active)
* #c7f6-8e10 insert AddTRV(V6.15)
* #c7f6-8e10 insert AddAbbreviation(UKRUB)
* #c7f6-8e10 insert AddDiz(true)
* #c7f6-8e10 insert AddReplaces(UKRUB)
* #UKB "Universitätsklinikum Bonn" "Bonn"
* #UKB insert AddKonsortium(SMITH)
* #UKB insert AddUri(ukbonn.de)
* #UKB insert AddStatus(deprecated)
* #UKB insert AddTRV(V6.15)
* #UKB insert AddReplacedBy(6ef6-1948)
* #UKB insert AddDeprecationDate(2025-07-31)
* #6ef6-1948 "Universitätsklinikum Bonn" "Bonn"
* #6ef6-1948 insert AddKonsortium(SMITH)
* #6ef6-1948 insert AddUri(ukbonn.de)
* #6ef6-1948 insert AddStatus(active)
* #6ef6-1948 insert AddTRV(V6.15)
* #6ef6-1948 insert AddAbbreviation(UKB)
* #6ef6-1948 insert AddDiz(true)
* #6ef6-1948 insert AddReplaces(UKB)
* #KCH "Klinikum Chemnitz" "Chemnitz"
* #KCH insert AddKonsortium(MIRACUM)
* #KCH insert AddUri(klinikumchemnitz.de)
* #KCH insert AddStatus(deprecated)
* #KCH insert AddTRV(V6.14)
* #KCH insert AddReplacedBy(4756-3ac4)
* #KCH insert AddDeprecationDate(2025-07-31)
* #4756-3ac4 "Klinikum Chemnitz" "Chemnitz"
* #4756-3ac4 insert AddKonsortium(MIRACUM)
* #4756-3ac4 insert AddUri(klinikumchemnitz.de)
* #4756-3ac4 insert AddStatus(active)
* #4756-3ac4 insert AddTRV(V6.14)
* #4756-3ac4 insert AddAbbreviation(KCH)
* #4756-3ac4 insert AddDiz(true)
* #4756-3ac4 insert AddReplaces(KCH)
* #CTK "Carl-Thiem-Klinikum Cottbus" "Cottbus"
* #CTK insert AddKonsortium(HiGHmed)
* #CTK insert AddUri(ctk.de)
* #CTK insert AddStatus(deprecated)
* #CTK insert AddReplacedBy(MUL-CT)
* #CTK insert AddDeprecationDate(2024-07-03)
* #MUL-CT "Medizinische Universität Lausitz - Carl Thiem" "Cottbus"
* #MUL-CT insert AddKonsortium(HiGHmed)
* #MUL-CT insert AddUri(mul-ct.de)
* #MUL-CT insert AddStatus(deprecated)
* #MUL-CT insert AddTRV(V6.15)
* #MUL-CT insert AddReplaces(CTK)
* #MUL-CT insert AddReplacedBy(1ace-5987)
* #MUL-CT insert AddDeprecationDate(2025-07-31)
* #1ace-5987 "Medizinische Universität Lausitz - Carl Thiem" "Cottbus"
* #1ace-5987 insert AddKonsortium(HiGHmed)
* #1ace-5987 insert AddUri(mul-ct.de)
* #1ace-5987 insert AddStatus(active)
* #1ace-5987 insert AddTRV(V6.15)
* #1ace-5987 insert AddAbbreviation(MUL-CT)
* #1ace-5987 insert AddDiz(true)
* #1ace-5987 insert AddReplaces(MUL-CT)
* #UKDD "Universitätsklinikum Carl Gustav Carus Dresden" "Dresden"
* #UKDD insert AddKonsortium(MIRACUM)
* #UKDD insert AddUri(ukdd.de)
* #UKDD insert AddStatus(deprecated)
* #UKDD insert AddDatenmanagementstelle(true)
* #UKDD insert AddTRV(V6.15)
* #UKDD insert AddReplacedBy(d37d-5e6f)
* #UKDD insert AddDeprecationDate(2025-07-31)
* #d37d-5e6f "Universitätsklinikum Carl Gustav Carus Dresden" "Dresden"
* #d37d-5e6f insert AddKonsortium(MIRACUM)
* #d37d-5e6f insert AddUri(ukdd.de)
* #d37d-5e6f insert AddStatus(active)
* #d37d-5e6f insert AddDatenmanagementstelle(true)
* #d37d-5e6f insert AddTRV(V6.15)
* #d37d-5e6f insert AddAbbreviation(UKDD)
* #d37d-5e6f insert AddDiz(true)
* #d37d-5e6f insert AddReplaces(UKDD)
* #UKD "Universitätsklinikum Düsseldorf" "Düsseldorf"
* #UKD insert AddKonsortium(SMITH)
* #UKD insert AddUri(uniklinik-duesseldorf.de)
* #UKD insert AddStatus(deprecated)
* #UKD insert AddTRV(V6.15)
* #UKD insert AddReplacedBy(e5b7-1562)
* #UKD insert AddDeprecationDate(2025-07-31)
* #e5b7-1562 "Universitätsklinikum Düsseldorf" "Düsseldorf"
* #e5b7-1562 insert AddKonsortium(SMITH)
* #e5b7-1562 insert AddUri(uniklinik-duesseldorf.de)
* #e5b7-1562 insert AddStatus(active)
* #e5b7-1562 insert AddTRV(V6.15)
* #e5b7-1562 insert AddAbbreviation(UKD)
* #e5b7-1562 insert AddDiz(true)
* #e5b7-1562 insert AddReplaces(UKD)
* #UKEr "Universitätsklinikum Erlangen" "Erlangen"
* #UKEr insert AddKonsortium(MIRACUM)
* #UKEr insert AddUri(www.uk-erlangen.de)
* #UKEr insert AddStatus(deprecated)
* #UKEr insert AddTRV(V6.15)
* #UKEr insert AddReplacedBy(c1b2-db4a)
* #UKEr insert AddDeprecationDate(2025-07-31)
* #c1b2-db4a "Universitätsklinikum Erlangen" "Erlangen"
* #c1b2-db4a insert AddKonsortium(MIRACUM)
* #c1b2-db4a insert AddUri(www.uk-erlangen.de)
* #c1b2-db4a insert AddStatus(active)
* #c1b2-db4a insert AddTRV(V6.15)
* #c1b2-db4a insert AddAbbreviation(UKEr)
* #c1b2-db4a insert AddDiz(true)
* #c1b2-db4a insert AddReplaces(UKEr)
* #UME "Universitätsklinikum Essen" "Essen"
* #UME insert AddKonsortium(SMITH)
* #UME insert AddUri(uk-essen.de)
* #UME insert AddStatus(deprecated)
* #UME insert AddTRV(V6.15)
* #UME insert AddReplacedBy(26e4-c833)
* #UME insert AddDeprecationDate(2025-07-31)
* #26e4-c833 "Universitätsklinikum Essen" "Essen"
* #26e4-c833 insert AddKonsortium(SMITH)
* #26e4-c833 insert AddUri(uk-essen.de)
* #26e4-c833 insert AddStatus(active)
* #26e4-c833 insert AddTRV(V6.15)
* #26e4-c833 insert AddAbbreviation(UME)
* #26e4-c833 insert AddDiz(true)
* #26e4-c833 insert AddReplaces(UME)
* #UKF "Universitätsklinikum Frankfurt" "Frankfurt"
* #UKF insert AddKonsortium(MIRACUM)
* #UKF insert AddUri(unimedizin-ffm.de)
* #UKF insert AddStatus(deprecated)
* #UKF insert AddTRV(V6.14)
* #UKF insert AddReplacedBy(995c-987c)
* #UKF insert AddDeprecationDate(2025-07-31)
* #995c-987c "Universitätsklinikum Frankfurt" "Frankfurt"
* #995c-987c insert AddKonsortium(MIRACUM)
* #995c-987c insert AddUri(unimedizin-ffm.de)
* #995c-987c insert AddStatus(active)
* #995c-987c insert AddTRV(V6.14)
* #995c-987c insert AddAbbreviation(UKF)
* #995c-987c insert AddDiz(true)
* #995c-987c insert AddReplaces(UKF)
* #UKFR "Universitätsklinikum Freiburg" "Freiburg"
* #UKFR insert AddKonsortium(MIRACUM)
* #UKFR insert AddUri(uniklinik-freiburg.de)
* #UKFR insert AddStatus(deprecated)
* #UKFR insert AddTRV(V6.14)
* #UKFR insert AddReplacedBy(9ced-f8c1)
* #UKFR insert AddDeprecationDate(2025-07-31)
* #9ced-f8c1 "Universitätsklinikum Freiburg" "Freiburg"
* #9ced-f8c1 insert AddKonsortium(MIRACUM)
* #9ced-f8c1 insert AddUri(uniklinik-freiburg.de)
* #9ced-f8c1 insert AddStatus(active)
* #9ced-f8c1 insert AddTRV(V6.14)
* #9ced-f8c1 insert AddAbbreviation(UKFR)
* #9ced-f8c1 insert AddDiz(true)
* #9ced-f8c1 insert AddReplaces(UKFR)
* #UKGI "Universitätsklinikum Gießen" "Gießen"
* #UKGI insert AddKonsortium(MIRACUM)
* #UKGI insert AddUri(uni-giessen.de)
* #UKGI insert AddStatus(deprecated)
* #UKGI insert AddTRV(V6.15)
* #UKGI insert AddReplacedBy(fd89-ff99)
* #UKGI insert AddDeprecationDate(2025-07-31)
* #fd89-ff99 "Universitätsklinikum Gießen" "Gießen"
* #fd89-ff99 insert AddKonsortium(MIRACUM)
* #fd89-ff99 insert AddUri(uni-giessen.de)
* #fd89-ff99 insert AddStatus(active)
* #fd89-ff99 insert AddTRV(V6.15)
* #fd89-ff99 insert AddAbbreviation(UKGI)
* #fd89-ff99 insert AddDiz(true)
* #fd89-ff99 insert AddReplaces(UKGI)
* #UMG "Universitätsmedizin Göttingen" "Göttingen"
* #UMG insert AddKonsortium(HiGHmed)
* #UMG insert AddUri(umg.eu)
* #UMG insert AddStatus(deprecated)
* #UMG insert AddDatenmanagementstelle(true)
* #UMG insert AddTRV(V6.15)
* #UMG insert AddReplacedBy(0635-f7c4)
* #UMG insert AddDeprecationDate(2025-07-31)
* #0635-f7c4 "Universitätsmedizin Göttingen" "Göttingen"
* #0635-f7c4 insert AddKonsortium(HiGHmed)
* #0635-f7c4 insert AddUri(umg.eu)
* #0635-f7c4 insert AddStatus(active)
* #0635-f7c4 insert AddDatenmanagementstelle(true)
* #0635-f7c4 insert AddTRV(V6.15)
* #0635-f7c4 insert AddAbbreviation(UMG)
* #0635-f7c4 insert AddDiz(true)
* #0635-f7c4 insert AddReplaces(UMG)
* #UKG "Universitätsmedizin Greifswald" "Greifswald"
* #UKG insert AddKonsortium(MIRACUM)
* #UKG insert AddUri(www.medizin.uni-greifswald.de)
* #UKG insert AddStatus(deprecated)
* #UKG insert AddTRV(V6.14)
* #UKG insert AddReplacedBy(abb0-e8e9)
* #UKG insert AddDeprecationDate(2025-07-31)
* #abb0-e8e9 "Universitätsmedizin Greifswald" "Greifswald"
* #abb0-e8e9 insert AddKonsortium(MIRACUM)
* #abb0-e8e9 insert AddUri(www.medizin.uni-greifswald.de)
* #abb0-e8e9 insert AddStatus(active)
* #abb0-e8e9 insert AddTRV(V6.14)
* #abb0-e8e9 insert AddAbbreviation(UKG)
* #abb0-e8e9 insert AddDiz(true)
* #abb0-e8e9 insert AddReplaces(UKG)
* #UKH "Universitätsklinikum Halle (Saale)" "Halle (Saale)"
* #UKH insert AddKonsortium(SMITH)
* #UKH insert AddUri(uk-halle.de)
* #UKH insert AddStatus(deprecated)
* #UKH insert AddDatenmanagementstelle(true)
* #UKH insert AddTRV(V6.15)
* #UKH insert AddReplacedBy(915e-05a2)
* #UKH insert AddDeprecationDate(2025-07-31)
* #915e-05a2 "Universitätsklinikum Halle (Saale)" "Halle (Saale)"
* #915e-05a2 insert AddKonsortium(SMITH)
* #915e-05a2 insert AddUri(uk-halle.de)
* #915e-05a2 insert AddStatus(active)
* #915e-05a2 insert AddDatenmanagementstelle(true)
* #915e-05a2 insert AddTRV(V6.15)
* #915e-05a2 insert AddAbbreviation(UKH)
* #915e-05a2 insert AddDiz(true)
* #915e-05a2 insert AddReplaces(UKH)
* #UKE "Universitätsklinikum Hamburg-Eppendorf" "Hamburg"
* #UKE insert AddKonsortium(SMITH)
* #UKE insert AddUri(uke.de)
* #UKE insert AddStatus(deprecated)
* #UKE insert AddTRV(V6.15)
* #UKE insert AddReplacedBy(720b-e698)
* #UKE insert AddDeprecationDate(2025-07-31)
* #720b-e698 "Universitätsklinikum Hamburg-Eppendorf" "Hamburg"
* #720b-e698 insert AddKonsortium(SMITH)
* #720b-e698 insert AddUri(uke.de)
* #720b-e698 insert AddStatus(active)
* #720b-e698 insert AddTRV(V6.15)
* #720b-e698 insert AddAbbreviation(UKE)
* #720b-e698 insert AddDiz(true)
* #720b-e698 insert AddReplaces(UKE)
* #MHH "Medizinische Hochschule Hannover" "Hannover"
* #MHH insert AddKonsortium(HiGHmed)
* #MHH insert AddUri(mh-hannover.de)
* #MHH insert AddStatus(deprecated)
* #MHH insert AddTRV(V6.15)
* #MHH insert AddReplacedBy(0d7e-b6f3)
* #MHH insert AddDeprecationDate(2025-07-31)
* #0d7e-b6f3 "Medizinische Hochschule Hannover" "Hannover"
* #0d7e-b6f3 insert AddKonsortium(HiGHmed)
* #0d7e-b6f3 insert AddUri(mh-hannover.de)
* #0d7e-b6f3 insert AddStatus(active)
* #0d7e-b6f3 insert AddTRV(V6.15)
* #0d7e-b6f3 insert AddAbbreviation(MHH)
* #0d7e-b6f3 insert AddDiz(true)
* #0d7e-b6f3 insert AddReplaces(MHH)
* #UKHD "Universitätsklinikum Heidelberg" "Heidelberg"
* #UKHD insert AddKonsortium(HiGHmed)
* #UKHD insert AddUri(ukhd.de)
* #UKHD insert AddStatus(deprecated)
* #UKHD insert AddDatenmanagementstelle(true)
* #UKHD insert AddTRV(V6.15)
* #UKHD insert AddReplacedBy(396b-a5c5)
* #UKHD insert AddDeprecationDate(2025-07-31)
* #396b-a5c5 "Universitätsklinikum Heidelberg" "Heidelberg"
* #396b-a5c5 insert AddKonsortium(HiGHmed)
* #396b-a5c5 insert AddUri(ukhd.de)
* #396b-a5c5 insert AddStatus(active)
* #396b-a5c5 insert AddDatenmanagementstelle(true)
* #396b-a5c5 insert AddTRV(V6.15)
* #396b-a5c5 insert AddAbbreviation(UKHD)
* #396b-a5c5 insert AddDiz(true)
* #396b-a5c5 insert AddReplaces(UKHD)
* #UKJ "Universitätsklinikum Jena" "Jena"
* #UKJ insert AddKonsortium(SMITH)
* #UKJ insert AddUri(uniklinikum-jena.de)
* #UKJ insert AddStatus(deprecated)
* #UKJ insert AddTRV(V6.14)
* #UKJ insert AddReplacedBy(6172-e156)
* #UKJ insert AddDeprecationDate(2025-07-31)
* #6172-e156 "Universitätsklinikum Jena" "Jena"
* #6172-e156 insert AddKonsortium(SMITH)
* #6172-e156 insert AddUri(uniklinikum-jena.de)
* #6172-e156 insert AddStatus(active)
* #6172-e156 insert AddTRV(V6.14)
* #6172-e156 insert AddAbbreviation(UKJ)
* #6172-e156 insert AddDiz(true)
* #6172-e156 insert AddReplaces(UKJ)
* #UKK "Universitätsklinikum Köln" "Köln"
* #UKK insert AddKonsortium(HiGHmed)
* #UKK insert AddUri(uk-koeln.de)
* #UKK insert AddStatus(deprecated)
* #UKK insert AddDatenmanagementstelle(true)
* #UKK insert AddTRV(V6.15)
* #UKK insert AddReplacedBy(be8e-5d04)
* #UKK insert AddDeprecationDate(2025-07-31)
* #be8e-5d04 "Universitätsklinikum Köln" "Köln"
* #be8e-5d04 insert AddKonsortium(HiGHmed)
* #be8e-5d04 insert AddUri(uk-koeln.de)
* #be8e-5d04 insert AddStatus(active)
* #be8e-5d04 insert AddDatenmanagementstelle(true)
* #be8e-5d04 insert AddTRV(V6.15)
* #be8e-5d04 insert AddAbbreviation(UKK)
* #be8e-5d04 insert AddDiz(true)
* #be8e-5d04 insert AddReplaces(UKK)
* #UKL "Universitätsklinikum Leipzig" "Leipzig"
* #UKL insert AddKonsortium(SMITH)
* #UKL insert AddUri(uniklinikum-leipzig.de)
* #UKL insert AddStatus(deprecated)
* #UKL insert AddDatenmanagementstelle(true)
* #UKL insert AddTRV(V6.15)
* #UKL insert AddReplacedBy(60c6-880a)
* #UKL insert AddDeprecationDate(2025-07-31)
* #60c6-880a "Universitätsklinikum Leipzig" "Leipzig"
* #60c6-880a insert AddKonsortium(SMITH)
* #60c6-880a insert AddUri(uniklinikum-leipzig.de)
* #60c6-880a insert AddStatus(active)
* #60c6-880a insert AddDatenmanagementstelle(true)
* #60c6-880a insert AddTRV(V6.15)
* #60c6-880a insert AddAbbreviation(UKL)
* #60c6-880a insert AddDiz(true)
* #60c6-880a insert AddReplaces(UKL)
* #UL "Universität Leipzig" "Leipzig"
* #UL insert AddKonsortium(SMITH)
* #UL insert AddUri(uniklinikum-leipzig.de)
* #UL insert AddStatus(deprecated)
* #UL insert AddTRV(V6.15)
* #UL insert AddReplacedBy(cf8e-ae01)
* #UL insert AddDeprecationDate(2025-07-31)
* #cf8e-ae01 "Universität Leipzig" "Leipzig"
* #cf8e-ae01 insert AddKonsortium(SMITH)
* #cf8e-ae01 insert AddUri(uniklinikum-leipzig.de)
* #cf8e-ae01 insert AddStatus(active)
* #cf8e-ae01 insert AddTRV(V6.15)
* #cf8e-ae01 insert AddAbbreviation(UL)
* #cf8e-ae01 insert AddDiz(true)
* #cf8e-ae01 insert AddReplaces(UL)
* #UMMD "Universitätsklinikum Magdeburg" "Magdeburg"
* #UMMD insert AddKonsortium(MIRACUM)
* #UMMD insert AddUri(www.med.uni-magdeburg.de)
* #UMMD insert AddStatus(deprecated)
* #UMMD insert AddTRV(V6.14)
* #UMMD insert AddReplacedBy(7714-8cf2)
* #UMMD insert AddDeprecationDate(2025-07-31)
* #7714-8cf2 "Universitätsklinikum Magdeburg" "Magdeburg"
* #7714-8cf2 insert AddKonsortium(MIRACUM)
* #7714-8cf2 insert AddUri(www.med.uni-magdeburg.de)
* #7714-8cf2 insert AddStatus(active)
* #7714-8cf2 insert AddTRV(V6.14)
* #7714-8cf2 insert AddAbbreviation(UMMD)
* #7714-8cf2 insert AddDiz(true)
* #7714-8cf2 insert AddReplaces(UMMD)
* #UM "Universitätsmedizin der Johannes Gutenberg-Universität Mainz" "Mainz"
* #UM insert AddKonsortium(MIRACUM)
* #UM insert AddUri(unimedizin-mainz.de)
* #UM insert AddStatus(deprecated)
* #UM insert AddTRV(V6.14)
* #UM insert AddReplacedBy(61ae-15d9)
* #UM insert AddDeprecationDate(2025-07-31)
* #61ae-15d9 "Universitätsmedizin der Johannes Gutenberg-Universität Mainz" "Mainz"
* #61ae-15d9 insert AddKonsortium(MIRACUM)
* #61ae-15d9 insert AddUri(unimedizin-mainz.de)
* #61ae-15d9 insert AddStatus(active)
* #61ae-15d9 insert AddTRV(V6.14)
* #61ae-15d9 insert AddAbbreviation(UM)
* #61ae-15d9 insert AddDiz(true)
* #61ae-15d9 insert AddReplaces(UM)
* #UMM "Universitätsklinikum Mannheim" "Mannheim"
* #UMM insert AddKonsortium(MIRACUM)
* #UMM insert AddUri(umm.de)
* #UMM insert AddStatus(deprecated)
* #UMM insert AddTRV(V6.15)
* #UMM insert AddReplacedBy(7b53-7320)
* #UMM insert AddDeprecationDate(2025-07-31)
* #7b53-7320 "Universitätsklinikum Mannheim" "Mannheim"
* #7b53-7320 insert AddKonsortium(MIRACUM)
* #7b53-7320 insert AddUri(umm.de)
* #7b53-7320 insert AddStatus(active)
* #7b53-7320 insert AddTRV(V6.15)
* #7b53-7320 insert AddAbbreviation(UMM)
* #7b53-7320 insert AddDiz(true)
* #7b53-7320 insert AddReplaces(UMM)
* #UKMR "Universitätsklinikum Marburg" "Marburg"
* #UKMR insert AddKonsortium(MIRACUM)
* #UKMR insert AddUri(uni-marburg.de)
* #UKMR insert AddStatus(deprecated)
* #UKMR insert AddTRV(V6.15)
* #UKMR insert AddReplacedBy(ed03-02f0)
* #UKMR insert AddDeprecationDate(2025-07-31)
* #ed03-02f0 "Universitätsklinikum Marburg" "Marburg"
* #ed03-02f0 insert AddKonsortium(MIRACUM)
* #ed03-02f0 insert AddUri(uni-marburg.de)
* #ed03-02f0 insert AddStatus(active)
* #ed03-02f0 insert AddTRV(V6.15)
* #ed03-02f0 insert AddAbbreviation(UKMR)
* #ed03-02f0 insert AddDiz(true)
* #ed03-02f0 insert AddReplaces(UKMR)
* #KUM "Klinikum der Universität München (LMU)" "München"
* #KUM insert AddKonsortium(DIFUTURE)
* #KUM insert AddUri(lmu-klinikum.de)
* #KUM insert AddStatus(deprecated)
* #KUM insert AddTRV(V6.15)
* #KUM insert AddReplacedBy(45f5-d5d1)
* #KUM insert AddDeprecationDate(2025-07-31)
* #45f5-d5d1 "Klinikum der Universität München (LMU)" "München"
* #45f5-d5d1 insert AddKonsortium(DIFUTURE)
* #45f5-d5d1 insert AddUri(lmu-klinikum.de)
* #45f5-d5d1 insert AddStatus(active)
* #45f5-d5d1 insert AddTRV(V6.15)
* #45f5-d5d1 insert AddAbbreviation(KUM)
* #45f5-d5d1 insert AddDiz(true)
* #45f5-d5d1 insert AddReplaces(KUM)
* #MRI "Klinikum rechts der Isar (TUM)" "München"
* #MRI insert AddKonsortium(DIFUTURE)
* #MRI insert AddUri(mri.tum.de)
* #MRI insert AddStatus(deprecated)
* #MRI insert AddTRV(V6.15)
* #MRI insert AddReplacedBy(47c9-3a8d)
* #MRI insert AddDeprecationDate(2025-07-31)
* #47c9-3a8d "Klinikum rechts der Isar (TUM)" "München"
* #47c9-3a8d insert AddKonsortium(DIFUTURE)
* #47c9-3a8d insert AddUri(mri.tum.de)
* #47c9-3a8d insert AddStatus(active)
* #47c9-3a8d insert AddTRV(V6.15)
* #47c9-3a8d insert AddAbbreviation(MRI)
* #47c9-3a8d insert AddDiz(true)
* #47c9-3a8d insert AddReplaces(MRI)
* #UKM "Universitätsklinikum Münster" "Münster"
* #UKM insert AddKonsortium(HiGHmed)
* #UKM insert AddUri(ukm.de)
* #UKM insert AddStatus(deprecated)
* #UKM insert AddTRV(V6.15)
* #UKM insert AddReplacedBy(de0c-101c)
* #UKM insert AddDeprecationDate(2025-07-31)
* #de0c-101c "Universitätsklinikum Münster" "Münster"
* #de0c-101c insert AddKonsortium(HiGHmed)
* #de0c-101c insert AddUri(ukm.de)
* #de0c-101c insert AddStatus(active)
* #de0c-101c insert AddTRV(V6.15)
* #de0c-101c insert AddAbbreviation(UKM)
* #de0c-101c insert AddDiz(true)
* #de0c-101c insert AddReplaces(UKM)
* #UOL "Carl von Ossietzky Universität Oldenburg" "Oldenburg"
* #UOL insert AddKonsortium(HiGHmed)
* #UOL insert AddStatus(deprecated)
* #UOL insert AddReplacedBy(UMO)
* #UOL insert AddDeprecationDate(2024-10-23)
* #UMO "Carl von Ossietzky Universität Oldenburg" "Oldenburg"
* #UMO insert AddKonsortium(HiGHmed)
* #UMO insert AddUri(uol.de)
* #UMO insert AddStatus(deprecated)
* #UMO insert AddTRV(V6.14)
* #UMO insert AddReplaces(UOL)
* #UMO insert AddReplacedBy(4b1d-1441)
* #UMO insert AddDeprecationDate(2025-07-31)
* #4b1d-1441 "Carl von Ossietzky Universität Oldenburg" "Oldenburg"
* #4b1d-1441 insert AddKonsortium(HiGHmed)
* #4b1d-1441 insert AddUri(uol.de)
* #4b1d-1441 insert AddStatus(active)
* #4b1d-1441 insert AddTRV(V6.14)
* #4b1d-1441 insert AddAbbreviation(UMO)
* #4b1d-1441 insert AddDiz(true)
* #4b1d-1441 insert AddReplaces(UMO)
* #UKR "Universitätsklinikum Regensburg" "Regensburg"
* #UKR insert AddKonsortium(DIFUTURE)
* #UKR insert AddUri(ukr.de)
* #UKR insert AddStatus(deprecated)
* #UKR insert AddTRV(V6.15)
* #UKR insert AddReplacedBy(b809-1db5)
* #UKR insert AddDeprecationDate(2025-07-31)
* #b809-1db5 "Universitätsklinikum Regensburg" "Regensburg"
* #b809-1db5 insert AddKonsortium(DIFUTURE)
* #b809-1db5 insert AddUri(ukr.de)
* #b809-1db5 insert AddStatus(active)
* #b809-1db5 insert AddTRV(V6.15)
* #b809-1db5 insert AddAbbreviation(UKR)
* #b809-1db5 insert AddDiz(true)
* #b809-1db5 insert AddReplaces(UKR)
* #UMR "Universitätsmedizin Rostock" "Rostock"
* #UMR insert AddKonsortium(SMITH)
* #UMR insert AddUri(med.uni-rostock.de)
* #UMR insert AddStatus(deprecated)
* #UMR insert AddTRV(V6.15)
* #UMR insert AddReplacedBy(d6de-77c1)
* #UMR insert AddDeprecationDate(2025-07-31)
* #d6de-77c1 "Universitätsmedizin Rostock" "Rostock"
* #d6de-77c1 insert AddKonsortium(SMITH)
* #d6de-77c1 insert AddUri(med.uni-rostock.de)
* #d6de-77c1 insert AddStatus(active)
* #d6de-77c1 insert AddTRV(V6.15)
* #d6de-77c1 insert AddAbbreviation(UMR)
* #d6de-77c1 insert AddDiz(true)
* #d6de-77c1 insert AddReplaces(UMR)
* #UKS "Universitätsklinikum des Saarlandes" "Saarbrücken / Homburg"
* #UKS insert AddKonsortium(DIFUTURE)
* #UKS insert AddUri(uks.eu)
* #UKS insert AddStatus(deprecated)
* #UKS insert AddReplacedBy(UdS)
* #UKS insert AddDeprecationDate(2024-10-15)
* #UdS "Universität des Saarlandes, Medizinische Fakultät" "Saarbrücken / Homburg"
* #UdS insert AddKonsortium(DIFUTURE)
* #UdS insert AddUri(med.uni-saarland.de)
* #UdS insert AddStatus(deprecated)
* #UdS insert AddTRV(V6.14)
* #UdS insert AddReplaces(UKS)
* #UdS insert AddReplacedBy(9363-c68f)
* #UdS insert AddDeprecationDate(2025-07-31)
* #9363-c68f "Universität des Saarlandes, Medizinische Fakultät" "Saarbrücken / Homburg"
* #9363-c68f insert AddKonsortium(DIFUTURE)
* #9363-c68f insert AddUri(med.uni-saarland.de)
* #9363-c68f insert AddStatus(active)
* #9363-c68f insert AddTRV(V6.14)
* #9363-c68f insert AddAbbreviation(UdS)
* #9363-c68f insert AddDiz(true)
* #9363-c68f insert AddReplaces(UdS)
* #UKSH "Universitätsklinikum Schleswig-Holstein" "Schleswig-Holstein"
* #UKSH insert AddKonsortium(HiGHmed)
* #UKSH insert AddUri(uksh.de)
* #UKSH insert AddStatus(deprecated)
* #UKSH insert AddTRV(V6.15)
* #UKSH insert AddReplacedBy(aa48-9639)
* #UKSH insert AddDeprecationDate(2025-07-31)
* #aa48-9639 "Universitätsklinikum Schleswig-Holstein" "Schleswig-Holstein"
* #aa48-9639 insert AddKonsortium(HiGHmed)
* #aa48-9639 insert AddUri(uksh.de)
* #aa48-9639 insert AddStatus(active)
* #aa48-9639 insert AddTRV(V6.15)
* #aa48-9639 insert AddAbbreviation(UKSH)
* #aa48-9639 insert AddDiz(true)
* #aa48-9639 insert AddReplaces(UKSH)
* #BHC "Bosch Health Campus" "Stuttgart"
* #BHC insert AddKonsortium(HiGHmed)
* #BHC insert AddUri(rbk.de)
* #BHC insert AddStatus(deprecated)
* #BHC insert AddTRV(V6.15)
* #BHC insert AddReplacedBy(0b92-9a71)
* #BHC insert AddDeprecationDate(2025-07-31)
* #0b92-9a71 "Bosch Health Campus" "Stuttgart"
* #0b92-9a71 insert AddKonsortium(HiGHmed)
* #0b92-9a71 insert AddUri(rbk.de)
* #0b92-9a71 insert AddStatus(active)
* #0b92-9a71 insert AddTRV(V6.15)
* #0b92-9a71 insert AddAbbreviation(BHC)
* #0b92-9a71 insert AddDiz(true)
* #0b92-9a71 insert AddReplaces(BHC)
* #UKT "Universitätsklinikum Tübingen" "Tübingen"
* #UKT insert AddKonsortium(DIFUTURE)
* #UKT insert AddUri(medizin.uni-tuebingen.de)
* #UKT insert AddStatus(deprecated)
* #UKT insert AddTRV(V6.15)
* #UKT insert AddReplacedBy(ccb1-2f84)
* #UKT insert AddDeprecationDate(2025-07-31)
* #ccb1-2f84 "Universitätsklinikum Tübingen" "Tübingen"
* #ccb1-2f84 insert AddKonsortium(DIFUTURE)
* #ccb1-2f84 insert AddUri(medizin.uni-tuebingen.de)
* #ccb1-2f84 insert AddStatus(active)
* #ccb1-2f84 insert AddTRV(V6.15)
* #ccb1-2f84 insert AddAbbreviation(UKT)
* #ccb1-2f84 insert AddDiz(true)
* #ccb1-2f84 insert AddReplaces(UKT)
* #UKU "Universitätsklinikum Ulm" "Ulm"
* #UKU insert AddKonsortium(DIFUTURE)
* #UKU insert AddUri(uniklinik-ulm.de)
* #UKU insert AddStatus(deprecated)
* #UKU insert AddTRV(V6.15)
* #UKU insert AddReplacedBy(9d08-a31d)
* #UKU insert AddDeprecationDate(2025-07-31)
* #9d08-a31d "Universitätsklinikum Ulm" "Ulm"
* #9d08-a31d insert AddKonsortium(DIFUTURE)
* #9d08-a31d insert AddUri(uniklinik-ulm.de)
* #9d08-a31d insert AddStatus(active)
* #9d08-a31d insert AddTRV(V6.15)
* #9d08-a31d insert AddAbbreviation(UKU)
* #9d08-a31d insert AddDiz(true)
* #9d08-a31d insert AddReplaces(UKU)
* #UKW "Universitätsklinikum Würzburg" "Würzburg"
* #UKW insert AddKonsortium(HiGHmed)
* #UKW insert AddUri(ukw.de)
* #UKW insert AddStatus(deprecated)
* #UKW insert AddDatenmanagementstelle(true)
* #UKW insert AddTRV(V6.15)
* #UKW insert AddReplacedBy(2d10-fc36)
* #UKW insert AddDeprecationDate(2025-07-31)
* #2d10-fc36 "Universitätsklinikum Würzburg" "Würzburg"
* #2d10-fc36 insert AddKonsortium(HiGHmed)
* #2d10-fc36 insert AddUri(ukw.de)
* #2d10-fc36 insert AddStatus(active)
* #2d10-fc36 insert AddDatenmanagementstelle(true)
* #2d10-fc36 insert AddTRV(V6.15)
* #2d10-fc36 insert AddAbbreviation(UKW)
* #2d10-fc36 insert AddDiz(true)
* #2d10-fc36 insert AddReplaces(UKW)
* #HUKW "Universität Witten/Herdecke" "Witten / Herdecke"
* #HUKW insert AddKonsortium(NA)
* #HUKW insert AddStatus(deprecated)
* #HUKW insert AddDeprecationDate(2024-07-09)

* #FDPG "Forschungsdatenportal für Gesundheit"
* #FDPG insert AddKonsortium(MII)
* #FDPG insert AddUri(forschen-fuer-gesundheit.de)
* #FDPG insert AddStatus(deprecated)
* #FDPG insert AddDatenmanagementstelle(true)
* #FDPG insert AddTRV(V6.14)
* #FDPG insert AddReplacedBy(d98f-27fd)
* #FDPG insert AddDeprecationDate(2025-07-31)
* #d98f-27fd "Forschungsdatenportal für Gesundheit"
* #d98f-27fd insert AddKonsortium(MII)
* #d98f-27fd insert AddUri(forschen-fuer-gesundheit.de)
* #d98f-27fd insert AddStatus(active)
* #d98f-27fd insert AddDatenmanagementstelle(true)
* #d98f-27fd insert AddTRV(V6.14)
* #d98f-27fd insert AddAbbreviation(FDPG)
* #d98f-27fd insert AddReplaces(FDPG)
* #HiGHmed "HiGHmed e.V." "Heidelberg"
* #HiGHmed insert AddKonsortium(MII)
* #HiGHmed insert AddUri(highmed.org)
* #HiGHmed insert AddStatus(deprecated)
* #HiGHmed insert AddDatenmanagementstelle(true)
* #HiGHmed insert AddTRV(V6.15)
* #HiGHmed insert AddReplacedBy(3970-4f51)
* #HiGHmed insert AddDeprecationDate(2025-07-31)
* #3970-4f51 "HiGHmed e.V." "Heidelberg"
* #3970-4f51 insert AddKonsortium(MII)
* #3970-4f51 insert AddUri(highmed.org)
* #3970-4f51 insert AddStatus(active)
* #3970-4f51 insert AddDatenmanagementstelle(true)
* #3970-4f51 insert AddTRV(V6.15)
* #3970-4f51 insert AddAbbreviation(HiGHmed)
* #3970-4f51 insert AddReplaces(HiGHmed)
* #HHN "Hochschule Heilbronn" "Heilbronn"
* #HHN insert AddKonsortium(MII)
* #HHN insert AddUri(hs-heilbronn.de)
* #HHN insert AddStatus(deprecated)
* #HHN insert AddTRV(V6.14)
* #HHN insert AddReplacedBy(de7a-319c)
* #HHN insert AddDeprecationDate(2025-07-31)
* #de7a-319c "Hochschule Heilbronn" "Heilbronn"
* #de7a-319c insert AddKonsortium(MII)
* #de7a-319c insert AddUri(hs-heilbronn.de)
* #de7a-319c insert AddStatus(active)
* #de7a-319c insert AddTRV(V6.14)
* #de7a-319c insert AddAbbreviation(HHN)
* #de7a-319c insert AddReplaces(HHN)
* #CRR "Zentrale Plattform NUM"
* #CRR insert AddKonsortium(NUM)
* #CRR insert AddUri(num-codex.de)
* #CRR insert AddStatus(deprecated)
* #CRR insert AddReplacedBy(a67c-8a6f)
* #CRR insert AddDeprecationDate(2025-07-31)
* #a67c-8a6f "Zentrale Plattform NUM"
* #a67c-8a6f insert AddKonsortium(NUM)
* #a67c-8a6f insert AddUri(num-codex.de)
* #a67c-8a6f insert AddStatus(active)
* #a67c-8a6f insert AddAbbreviation(CRR)
* #a67c-8a6f insert AddReplaces(CRR)
