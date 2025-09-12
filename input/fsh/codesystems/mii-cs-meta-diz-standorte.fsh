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
* #UKA insert AddStatus(active)
* #UKA insert AddTRV(V6.15)
* #UKA insert AddAbbreviation(UKA)
* #UKA insert AddDiz(true)
* #UKAU "Universitätsklinikum Augsburg" "Augsburg"
* #UKAU insert AddKonsortium(DIFUTURE)
* #UKAU insert AddUri(uk-augsburg.de)
* #UKAU insert AddStatus(active)
* #UKAU insert AddTRV(V6.15)
* #UKAU insert AddAbbreviation(UKAU)
* #UKAU insert AddDiz(true)
* #Charité "Charité - Universitätsmedizin Berlin" "Berlin"
* #Charité insert AddKonsortium(HiGHmed)
* #Charité insert AddUri(charite.de)
* #Charité insert AddStatus(active)
* #Charité insert AddDatenmanagementstelle(true)
* #Charité insert AddTRV(V6.15)
* #Charité insert AddAbbreviation(Charité)
* #Charité insert AddDiz(true)
* #VIV "Vivantes Netzwerk für Gesundheit GmbH" "Berlin"
* #VIV insert AddKonsortium(HiGHmed)
* #VIV insert AddUri(vivantes.de)
* #VIV insert AddStatus(active)
* #VIV insert AddTRV(V6.15)
* #VIV insert AddAbbreviation(VIV)
* #VIV insert AddDiz(true)
* #UKOWL "Universität Bielefeld / Universitätsklinikum OWL" "Bielefeld"
* #UKOWL insert AddKonsortium(HiGHmed)
* #UKOWL insert AddUri(ukowl.de)
* #UKOWL insert AddStatus(active)
* #UKOWL insert AddTRV(V6.14)
* #UKOWL insert AddAbbreviation(UKOWL)
* #UKOWL insert AddDiz(true)
* #UKRUB "Universitätsklinikum der Ruhr-Universität Bochum" "Bochum"
* #UKRUB insert AddKonsortium(SMITH)
* #UKRUB insert AddUri(rub.de)
* #UKRUB insert AddStatus(active)
* #UKRUB insert AddTRV(V6.15)
* #UKRUB insert AddAbbreviation(UKRUB)
* #UKRUB insert AddDiz(true)
* #UKB "Universitätsklinikum Bonn" "Bonn"
* #UKB insert AddKonsortium(SMITH)
* #UKB insert AddUri(ukbonn.de)
* #UKB insert AddStatus(active)
* #UKB insert AddTRV(V6.15)
* #UKB insert AddAbbreviation(UKB)
* #UKB insert AddDiz(true)
* #KCH "Klinikum Chemnitz" "Chemnitz"
* #KCH insert AddKonsortium(MIRACUM)
* #KCH insert AddUri(klinikumchemnitz.de)
* #KCH insert AddStatus(active)
* #KCH insert AddTRV(V6.14)
* #KCH insert AddAbbreviation(KCH)
* #KCH insert AddDiz(true)
* #CTK "Carl-Thiem-Klinikum Cottbus" "Cottbus"
* #CTK insert AddKonsortium(HiGHmed)
* #CTK insert AddUri(ctk.de)
* #CTK insert AddStatus(deprecated)
* #CTK insert AddReplacedBy(MUL-CT)
* #CTK insert AddDeprecationDate(2024-07-03)
* #MUL-CT "Medizinische Universität Lausitz - Carl Thiem" "Cottbus"
* #MUL-CT insert AddKonsortium(HiGHmed)
* #MUL-CT insert AddUri(mul-ct.de)
* #MUL-CT insert AddStatus(active)
* #MUL-CT insert AddTRV(V6.15)
* #MUL-CT insert AddReplaces(CTK)
* #MUL-CT insert AddAbbreviation(MUL-CT)
* #MUL-CT insert AddDiz(true)
* #UKDD "Universitätsklinikum Carl Gustav Carus Dresden" "Dresden"
* #UKDD insert AddKonsortium(MIRACUM)
* #UKDD insert AddUri(ukdd.de)
* #UKDD insert AddStatus(active)
* #UKDD insert AddDatenmanagementstelle(true)
* #UKDD insert AddTRV(V6.15)
* #UKDD insert AddAbbreviation(UKDD)
* #UKDD insert AddDiz(true)
* #UKD "Universitätsklinikum Düsseldorf" "Düsseldorf"
* #UKD insert AddKonsortium(SMITH)
* #UKD insert AddUri(uniklinik-duesseldorf.de)
* #UKD insert AddStatus(active)
* #UKD insert AddTRV(V6.15)
* #UKD insert AddAbbreviation(UKD)
* #UKD insert AddDiz(true)
* #UKEr "Universitätsklinikum Erlangen" "Erlangen"
* #UKEr insert AddKonsortium(MIRACUM)
* #UKEr insert AddUri(www.uk-erlangen.de)
* #UKEr insert AddStatus(active)
* #UKEr insert AddTRV(V6.15)
* #UKEr insert AddAbbreviation(UKEr)
* #UKEr insert AddDiz(true)
* #UME "Universitätsklinikum Essen" "Essen"
* #UME insert AddKonsortium(SMITH)
* #UME insert AddUri(uk-essen.de)
* #UME insert AddStatus(active)
* #UME insert AddTRV(V6.15)
* #UME insert AddAbbreviation(UME)
* #UME insert AddDiz(true)
* #UKF "Universitätsklinikum Frankfurt" "Frankfurt"
* #UKF insert AddKonsortium(MIRACUM)
* #UKF insert AddUri(unimedizin-ffm.de)
* #UKF insert AddStatus(active)
* #UKF insert AddTRV(V6.14)
* #UKF insert AddAbbreviation(UKF)
* #UKF insert AddDiz(true)
* #UKFR "Universitätsklinikum Freiburg" "Freiburg"
* #UKFR insert AddKonsortium(MIRACUM)
* #UKFR insert AddUri(uniklinik-freiburg.de)
* #UKFR insert AddStatus(active)
* #UKFR insert AddTRV(V6.14)
* #UKFR insert AddAbbreviation(UKFR)
* #UKFR insert AddDiz(true)
* #UKGI "Universitätsklinikum Gießen" "Gießen"
* #UKGI insert AddKonsortium(MIRACUM)
* #UKGI insert AddUri(uni-giessen.de)
* #UKGI insert AddStatus(active)
* #UKGI insert AddTRV(V6.15)
* #UKGI insert AddAbbreviation(UKGI)
* #UKGI insert AddDiz(true)
* #UMG "Universitätsmedizin Göttingen" "Göttingen"
* #UMG insert AddKonsortium(HiGHmed)
* #UMG insert AddUri(umg.eu)
* #UMG insert AddStatus(active)
* #UMG insert AddDatenmanagementstelle(true)
* #UMG insert AddTRV(V6.15)
* #UMG insert AddAbbreviation(UMG)
* #UMG insert AddDiz(true)
* #UKG "Universitätsmedizin Greifswald" "Greifswald"
* #UKG insert AddKonsortium(MIRACUM)
* #UKG insert AddUri(www.medizin.uni-greifswald.de)
* #UKG insert AddStatus(active)
* #UKG insert AddTRV(V6.14)
* #UKG insert AddAbbreviation(UKG)
* #UKG insert AddDiz(true)
* #UKH "Universitätsklinikum Halle (Saale)" "Halle (Saale)"
* #UKH insert AddKonsortium(SMITH)
* #UKH insert AddUri(uk-halle.de)
* #UKH insert AddStatus(active)
* #UKH insert AddDatenmanagementstelle(true)
* #UKH insert AddTRV(V6.15)
* #UKH insert AddAbbreviation(UKH)
* #UKH insert AddDiz(true)
* #UKE "Universitätsklinikum Hamburg-Eppendorf" "Hamburg"
* #UKE insert AddKonsortium(SMITH)
* #UKE insert AddUri(uke.de)
* #UKE insert AddStatus(active)
* #UKE insert AddTRV(V6.15)
* #UKE insert AddAbbreviation(UKE)
* #UKE insert AddDiz(true)
* #MHH "Medizinische Hochschule Hannover" "Hannover"
* #MHH insert AddKonsortium(HiGHmed)
* #MHH insert AddUri(mh-hannover.de)
* #MHH insert AddStatus(active)
* #MHH insert AddTRV(V6.15)
* #MHH insert AddAbbreviation(MHH)
* #MHH insert AddDiz(true)
* #UKHD "Universitätsklinikum Heidelberg" "Heidelberg"
* #UKHD insert AddKonsortium(HiGHmed)
* #UKHD insert AddUri(ukhd.de)
* #UKHD insert AddStatus(active)
* #UKHD insert AddDatenmanagementstelle(true)
* #UKHD insert AddTRV(V6.15)
* #UKHD insert AddAbbreviation(UKHD)
* #UKHD insert AddDiz(true)
* #UKJ "Universitätsklinikum Jena" "Jena"
* #UKJ insert AddKonsortium(SMITH)
* #UKJ insert AddUri(uniklinikum-jena.de)
* #UKJ insert AddStatus(active)
* #UKJ insert AddTRV(V6.14)
* #UKJ insert AddAbbreviation(UKJ)
* #UKJ insert AddDiz(true)
* #UKK "Universitätsklinikum Köln" "Köln"
* #UKK insert AddKonsortium(HiGHmed)
* #UKK insert AddUri(uk-koeln.de)
* #UKK insert AddStatus(active)
* #UKK insert AddDatenmanagementstelle(true)
* #UKK insert AddTRV(V6.15)
* #UKK insert AddAbbreviation(UKK)
* #UKK insert AddDiz(true)
* #UKL "Universitätsklinikum Leipzig" "Leipzig"
* #UKL insert AddKonsortium(SMITH)
* #UKL insert AddUri(uniklinikum-leipzig.de)
* #UKL insert AddStatus(active)
* #UKL insert AddDatenmanagementstelle(true)
* #UKL insert AddTRV(V6.15)
* #UKL insert AddAbbreviation(UKL)
* #UKL insert AddDiz(true)
* #UL "Universität Leipzig" "Leipzig"
* #UL insert AddKonsortium(SMITH)
* #UL insert AddUri(uniklinikum-leipzig.de)
* #UL insert AddStatus(active)
* #UL insert AddTRV(V6.15)
* #UL insert AddAbbreviation(UL)
* #UL insert AddDiz(true)
* #UMMD "Universitätsklinikum Magdeburg" "Magdeburg"
* #UMMD insert AddKonsortium(MIRACUM)
* #UMMD insert AddUri(www.med.uni-magdeburg.de)
* #UMMD insert AddStatus(active)
* #UMMD insert AddTRV(V6.14)
* #UMMD insert AddAbbreviation(UMMD)
* #UMMD insert AddDiz(true)
* #UM "Universitätsmedizin der Johannes Gutenberg-Universität Mainz" "Mainz"
* #UM insert AddKonsortium(MIRACUM)
* #UM insert AddUri(unimedizin-mainz.de)
* #UM insert AddStatus(active)
* #UM insert AddTRV(V6.14)
* #UM insert AddAbbreviation(UM)
* #UM insert AddDiz(true)
* #UMM "Universitätsklinikum Mannheim" "Mannheim"
* #UMM insert AddKonsortium(MIRACUM)
* #UMM insert AddUri(umm.de)
* #UMM insert AddStatus(active)
* #UMM insert AddTRV(V6.15)
* #UMM insert AddAbbreviation(UMM)
* #UMM insert AddDiz(true)
* #UKMR "Universitätsklinikum Marburg" "Marburg"
* #UKMR insert AddKonsortium(MIRACUM)
* #UKMR insert AddUri(uni-marburg.de)
* #UKMR insert AddStatus(active)
* #UKMR insert AddTRV(V6.15)
* #UKMR insert AddAbbreviation(UKMR)
* #UKMR insert AddDiz(true)
* #KUM "Klinikum der Universität München (LMU)" "München"
* #KUM insert AddKonsortium(DIFUTURE)
* #KUM insert AddUri(lmu-klinikum.de)
* #KUM insert AddStatus(active)
* #KUM insert AddTRV(V6.15)
* #KUM insert AddAbbreviation(KUM)
* #KUM insert AddDiz(true)
* #MRI "Klinikum rechts der Isar (TUM)" "München"
* #MRI insert AddKonsortium(DIFUTURE)
* #MRI insert AddUri(mri.tum.de)
* #MRI insert AddStatus(active)
* #MRI insert AddTRV(V6.15)
* #MRI insert AddAbbreviation(MRI)
* #MRI insert AddDiz(true)
* #UKM "Universitätsklinikum Münster" "Münster"
* #UKM insert AddKonsortium(HiGHmed)
* #UKM insert AddUri(ukm.de)
* #UKM insert AddStatus(active)
* #UKM insert AddTRV(V6.15)
* #UKM insert AddAbbreviation(UKM)
* #UKM insert AddDiz(true)
* #UOL "Carl von Ossietzky Universität Oldenburg" "Oldenburg"
* #UOL insert AddKonsortium(HiGHmed)
* #UOL insert AddStatus(deprecated)
* #UOL insert AddReplacedBy(UMO)
* #UOL insert AddDeprecationDate(2024-10-23)
* #UMO "Carl von Ossietzky Universität Oldenburg" "Oldenburg"
* #UMO insert AddKonsortium(HiGHmed)
* #UMO insert AddUri(uol.de)
* #UMO insert AddStatus(active)
* #UMO insert AddTRV(V6.14)
* #UMO insert AddReplaces(UOL)
* #UMO insert AddAbbreviation(UMO)
* #UMO insert AddDiz(true)
* #UKR "Universitätsklinikum Regensburg" "Regensburg"
* #UKR insert AddKonsortium(DIFUTURE)
* #UKR insert AddUri(ukr.de)
* #UKR insert AddStatus(active)
* #UKR insert AddTRV(V6.15)
* #UKR insert AddAbbreviation(UKR)
* #UKR insert AddDiz(true)
* #UMR "Universitätsmedizin Rostock" "Rostock"
* #UMR insert AddKonsortium(SMITH)
* #UMR insert AddUri(med.uni-rostock.de)
* #UMR insert AddStatus(active)
* #UMR insert AddTRV(V6.15)
* #UMR insert AddAbbreviation(UMR)
* #UMR insert AddDiz(true)
* #UKS "Universitätsklinikum des Saarlandes" "Saarbrücken / Homburg"
* #UKS insert AddKonsortium(DIFUTURE)
* #UKS insert AddUri(uks.eu)
* #UKS insert AddStatus(deprecated)
* #UKS insert AddReplacedBy(UdS)
* #UKS insert AddDeprecationDate(2024-10-15)
* #UdS "Universität des Saarlandes, Medizinische Fakultät" "Saarbrücken / Homburg"
* #UdS insert AddKonsortium(DIFUTURE)
* #UdS insert AddUri(med.uni-saarland.de)
* #UdS insert AddStatus(active)
* #UdS insert AddTRV(V6.14)
* #UdS insert AddReplaces(UKS)
* #UdS insert AddAbbreviation(UdS)
* #UdS insert AddDiz(true)
* #UKSH "Universitätsklinikum Schleswig-Holstein" "Schleswig-Holstein"
* #UKSH insert AddKonsortium(HiGHmed)
* #UKSH insert AddUri(uksh.de)
* #UKSH insert AddStatus(active)
* #UKSH insert AddTRV(V6.15)
* #UKSH insert AddAbbreviation(UKSH)
* #UKSH insert AddDiz(true)
* #BHC "Bosch Health Campus" "Stuttgart"
* #BHC insert AddKonsortium(HiGHmed)
* #BHC insert AddUri(rbk.de)
* #BHC insert AddStatus(active)
* #BHC insert AddTRV(V6.15)
* #BHC insert AddAbbreviation(BHC)
* #BHC insert AddDiz(true)
* #UKT "Universitätsklinikum Tübingen" "Tübingen"
* #UKT insert AddKonsortium(DIFUTURE)
* #UKT insert AddUri(medizin.uni-tuebingen.de)
* #UKT insert AddStatus(active)
* #UKT insert AddTRV(V6.15)
* #UKT insert AddAbbreviation(UKT)
* #UKT insert AddDiz(true)
* #UKU "Universitätsklinikum Ulm" "Ulm"
* #UKU insert AddKonsortium(DIFUTURE)
* #UKU insert AddUri(uniklinik-ulm.de)
* #UKU insert AddStatus(active)
* #UKU insert AddTRV(V6.15)
* #UKU insert AddAbbreviation(UKU)
* #UKU insert AddDiz(true)
* #UKW "Universitätsklinikum Würzburg" "Würzburg"
* #UKW insert AddKonsortium(HiGHmed)
* #UKW insert AddUri(ukw.de)
* #UKW insert AddStatus(active)
* #UKW insert AddDatenmanagementstelle(true)
* #UKW insert AddTRV(V6.15)
* #UKW insert AddAbbreviation(UKW)
* #UKW insert AddDiz(true)
* #HUKW "Universität Witten/Herdecke" "Witten / Herdecke"
* #HUKW insert AddKonsortium(NA)
* #HUKW insert AddStatus(deprecated)
* #HUKW insert AddDeprecationDate(2024-07-09)

* #FDPG "Forschungsdatenportal für Gesundheit"
* #FDPG insert AddKonsortium(MII)
* #FDPG insert AddUri(forschen-fuer-gesundheit.de)
* #FDPG insert AddStatus(active)
* #FDPG insert AddDatenmanagementstelle(true)
* #FDPG insert AddTRV(V6.14)
* #FDPG insert AddAbbreviation(FDPG)
* #HiGHmed "HiGHmed e.V." "Heidelberg"
* #HiGHmed insert AddKonsortium(MII)
* #HiGHmed insert AddUri(highmed.org)
* #HiGHmed insert AddStatus(active)
* #HiGHmed insert AddDatenmanagementstelle(true)
* #HiGHmed insert AddTRV(V6.15)
* #HiGHmed insert AddAbbreviation(HiGHmed)
* #HHN "Hochschule Heilbronn" "Heilbronn"
* #HHN insert AddKonsortium(MII)
* #HHN insert AddUri(hs-heilbronn.de)
* #HHN insert AddStatus(active)
* #HHN insert AddTRV(V6.14)
* #HHN insert AddAbbreviation(HHN)
* #CRR "Zentrale Plattform NUM"
* #CRR insert AddKonsortium(NUM)
* #CRR insert AddUri(num-codex.de)
* #CRR insert AddStatus(active)
* #CRR insert AddAbbreviation(CRR)
