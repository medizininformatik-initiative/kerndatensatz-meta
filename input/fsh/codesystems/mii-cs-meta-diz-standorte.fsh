RuleSet: AddKonsortium(Konsortium)
* ^property[+].code = #Konsortium
* ^property[=].valueString = "{Konsortium}"

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

RuleSet: AddDatenmanagementstelle(Datenmanagementstelle)
* ^property[+].code = #Datenmanagementstelle
* ^property[=].valueBoolean = {Datenmanagementstelle}

RuleSet: AddTRV(trv)
* ^property[+].code = #TRV
* ^property[=].valueString = "{trv}"

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
* ^date = "2025-02-26"
* ^status = #active
* ^caseSensitive = true
* ^compositional = false
* ^content = #complete
* ^copyright = "Medizininformatik-Initiative"
* ^property[0].code = #Konsortium
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
* ^property[5].code = #Datenmanagementstelle
* ^property[5].type = #boolean
* ^property[5].description = "Datenmanagementstelle (true / false)"
* ^property[6].code = #TRV
* ^property[6].type = #string
* ^property[6].description = "Teilnahmerahmenvertrag (Version)"
* #UKA "Uniklinik RWTH Aachen" "Aachen"
* #UKA insert AddKonsortium(SMITH)
* #UKA insert AddUri(ukaachen.de)
* #UKA insert AddStatus(active)
* #UKA insert AddTRV(V6.15)
* #UKAU "Universitätsklinikum Augsburg" "Augsburg"
* #UKAU insert AddKonsortium(DIFUTURE)
* #UKAU insert AddUri(uk-augsburg.de)
* #UKAU insert AddStatus(active)
* #UKAU insert AddTRV(V6.15)
* #Charité "Charité - Universitätsmedizin Berlin" "Berlin"
* #Charité insert AddKonsortium(HiGHmed)
* #Charité insert AddUri(charite.de)
* #Charité insert AddStatus(active)
* #Charité insert AddDatenmanagementstelle(true)
* #Charité insert AddTRV(V6.15)
* #VIV "Vivantes Netzwerk für Gesundheit GmbH" "Berlin"
* #VIV insert AddKonsortium(HiGHmed)
* #VIV insert AddUri(vivantes.de)
* #VIV insert AddStatus(active)
* #VIV insert AddTRV(V6.15)
* #UKOWL "Universitätsklinikum OWL" "Bielefeld"
* #UKOWL insert AddKonsortium(HiGHmed)
* #UKOWL insert AddUri(ukowl.de)
* #UKOWL insert AddStatus(active)
* #UKOWL insert AddTRV(V6.14)
* #UKRUB "Universitätsklinikum der Ruhr-Universität Bochum" "Bochum"
* #UKRUB insert AddKonsortium(SMITH)
* #UKRUB insert AddStatus(active)
* #UKRUB insert AddTRV(V6.15)
* #UKB "Universitätsklinikum Bonn" "Bonn"
* #UKB insert AddKonsortium(SMITH)
* #UKB insert AddUri(ukbonn.de)
* #UKB insert AddStatus(active)
* #UKB insert AddTRV(V6.15)
* #KCH "Klinikum Chemnitz" "Chemnitz"
* #KCH insert AddKonsortium(MIRACUM)
* #KCH insert AddUri(klinikumchemnitz.de)
* #KCH insert AddStatus(active)
* #KCH insert AddTRV(V6.14)
* #CTK "Carl-Thiem-Klinikum Cottbus" "Cottbus"
* #CTK insert AddKonsortium(HiGHmed)
* #CTK insert AddUri(ctk.de)
* #CTK insert AddStatus(deprecated)
* #CTK insert AddDeprecationDate(2024-07-03)
* #MUL-CT "Medizinische Universität Lausitz - Carl Thiem" "Cottbus"
* #MUL-CT insert AddKonsortium(HiGHmed)
* #MUL-CT insert AddUri(mul-ct.de)
* #MUL-CT insert AddStatus(active)
* #MUL-CT insert AddTRV(V6.15)
* #UKDD "Universitätsklinikum Carl Gustav Carus Dresden" "Dresden"
* #UKDD insert AddKonsortium(MIRACUM)
* #UKDD insert AddUri(ukdd.de)
* #UKDD insert AddStatus(active)
* #UKDD insert AddDatenmanagementstelle(true)
* #UKDD insert AddTRV(V6.15)
* #UKD "Universitätsklinikum Düsseldorf" "Düsseldorf"
* #UKD insert AddKonsortium(SMITH)
* #UKD insert AddUri(uniklinik-duesseldorf.de)
* #UKD insert AddStatus(active)
* #UKD insert AddTRV(V6.15)
* #UKEr "Universitätsklinikum Erlangen" "Erlangen"
* #UKEr insert AddKonsortium(MIRACUM)
* #UKEr insert AddUri(www.uk-erlangen.de)
* #UKEr insert AddStatus(active)
* #UKEr insert AddTRV(V6.15)
* #UME "Universitätsklinikum Essen" "Essen"
* #UME insert AddKonsortium(SMITH)
* #UME insert AddUri(uk-essen.de)
* #UME insert AddStatus(active)
* #UME insert AddTRV(V6.15)
* #UKF "Universitätsklinikum Frankfurt" "Frankfurt"
* #UKF insert AddKonsortium(MIRACUM)
* #UKF insert AddUri(kgu.de)
* #UKF insert AddStatus(active)
* #UKF insert AddTRV(V6.14)
* #UKFR "Universitätsklinikum Freiburg" "Freiburg"
* #UKFR insert AddKonsortium(MIRACUM)
* #UKFR insert AddUri(uniklinik-freiburg.de)
* #UKFR insert AddStatus(active)
* #UKFR insert AddTRV(V6.14)
* #UKGI "Universitätsklinikum Gießen" "Gießen"
* #UKGI insert AddKonsortium(MIRACUM)
* #UKGI insert AddUri(uni-giessen.de)
* #UKGI insert AddStatus(active)
* #UKGI insert AddTRV(V6.15)
* #UMG "Universitätsmedizin Göttingen" "Göttingen"
* #UMG insert AddKonsortium(HiGHmed)
* #UMG insert AddUri(umg.eu)
* #UMG insert AddStatus(active)
* #UMG insert AddDatenmanagementstelle(true)
* #UMG insert AddTRV(V6.15)
* #UKG "Universitätsmedizin Greifswald" "Greifswald"
* #UKG insert AddKonsortium(MIRACUM)
* #UKG insert AddUri(www.medizin.uni-greifswald.de)
* #UKG insert AddStatus(active)
* #UKG insert AddTRV(V6.14)
* #UKH "Universitätsklinikum Halle (Saale)" "Halle (Saale)"
* #UKH insert AddKonsortium(SMITH)
* #UKH insert AddUri(uk-halle.de)
* #UKH insert AddStatus(active)
* #UKH insert AddDatenmanagementstelle(true)
* #UKH insert AddTRV(V6.15)
* #UKE "Universitätsklinikum Hamburg-Eppendorf" "Hamburg"
* #UKE insert AddKonsortium(SMITH)
* #UKE insert AddUri(uke.de)
* #UKE insert AddStatus(active)
* #UKE insert AddTRV(V6.15)
* #MHH "Medizinische Hochschule Hannover" "Hannover"
* #MHH insert AddKonsortium(HiGHmed)
* #MHH insert AddUri(mh-hannover.de)
* #MHH insert AddStatus(active)
* #MHH insert AddTRV(V6.15)
* #UKHD "Universitätsklinikum Heidelberg" "Heidelberg"
* #UKHD insert AddKonsortium(HiGHmed)
* #UKHD insert AddUri(ukhd.de)
* #UKHD insert AddStatus(active)
* #UKHD insert AddDatenmanagementstelle(true)
* #UKHD insert AddTRV(V6.15)
* #UKJ "Universitätsklinikum Jena" "Jena"
* #UKJ insert AddKonsortium(SMITH)
* #UKJ insert AddUri(uniklinikum-jena.de)
* #UKJ insert AddStatus(active)
* #UKJ insert AddTRV(V6.14)
* #UKK "Universitätsklinikum Köln" "Köln"
* #UKK insert AddKonsortium(HiGHmed)
* #UKK insert AddUri(uk-koeln.de)
* #UKK insert AddStatus(active)
* #UKK insert AddDatenmanagementstelle(true)
* #UKK insert AddTRV(V6.15)
* #UKL "Universitätsklinikum Leipzig" "Leipzig"
* #UKL insert AddKonsortium(SMITH)
* #UKL insert AddUri(uniklinikum-leipzig.de)
* #UKL insert AddStatus(active)
* #UKL insert AddDatenmanagementstelle(true)
* #UKL insert AddTRV(V6.15)
* #UL "Universität Leipzig" "Leipzig"
* #UL insert AddKonsortium(SMITH)
* #UL insert AddUri(uniklinikum-leipzig.de)
* #UL insert AddStatus(active)
* #UL insert AddTRV(V6.15)
* #UMMD "Universitätsklinikum Magdeburg" "Magdeburg"
* #UMMD insert AddKonsortium(MIRACUM)
* #UMMD insert AddUri(www.med.uni-magdeburg.de)
* #UMMD insert AddStatus(active)
* #UMMD insert AddTRV(V6.14)
* #UM "Universitätsmedizin der Johannes Gutenberg-Universität Mainz" "Mainz"
* #UM insert AddKonsortium(MIRACUM)
* #UM insert AddUri(unimedizin-mainz.de)
* #UM insert AddStatus(active)
* #UM insert AddTRV(V6.14)
* #UMM "Universitätsklinikum Mannheim" "Mannheim"
* #UMM insert AddKonsortium(MIRACUM)
* #UMM insert AddUri(umm.de)
* #UMM insert AddStatus(active)
* #UMM insert AddTRV(V6.15)
* #UKMR "Universitätsklinikum Marburg" "Marburg"
* #UKMR insert AddKonsortium(MIRACUM)
* #UKMR insert AddUri(uni-marburg.de)
* #UKMR insert AddStatus(active)
* #UKMR insert AddTRV(V6.15)
* #KUM "Klinikum der Universität München (LMU)" "München"
* #KUM insert AddKonsortium(DIFUTURE)
* #KUM insert AddUri(lmu-klinikum.de)
* #KUM insert AddStatus(active)
* #KUM insert AddTRV(V6.15)
* #MRI "Klinikum rechts der Isar (TUM)" "München"
* #MRI insert AddKonsortium(DIFUTURE)
* #MRI insert AddUri(mri.tum.de)
* #MRI insert AddStatus(active)
* #MRI insert AddTRV(V6.15)
* #UKM "Universitätsklinikum Münster" "Münster"
* #UKM insert AddKonsortium(HiGHmed)
* #UKM insert AddUri(ukm.de)
* #UKM insert AddStatus(active)
* #UKM insert AddTRV(V6.15)
* #UMO "Carl von Ossietzky Universität Oldenburg" "Oldenburg"
* #UMO insert AddKonsortium(HiGHmed)
* #UMO insert AddUri(uol.de)
* #UMO insert AddStatus(active)
* #UMO insert AddTRV(V6.14)
* #UOL "Carl von Ossietzky Universität Oldenburg" "Oldenburg"
* #UOL insert AddKonsortium(HiGHmed)
* #UOL insert AddStatus(deprecated)
* #UOL insert AddDeprecationDate(2024-10-23)
* #UKR "Universitätsklinikum Regensburg" "Regensburg"
* #UKR insert AddKonsortium(DIFUTURE)
* #UKR insert AddUri(ukr.de)
* #UKR insert AddStatus(active)
* #UKR insert AddTRV(V6.15)
* #UMR "Universitätsmedizin Rostock" "Rostock"
* #UMR insert AddKonsortium(SMITH)
* #UMR insert AddUri(med.uni-rostock.de)
* #UMR insert AddStatus(active)
* #UMR insert AddTRV(V6.15)
* #UKS "Universitätsklinikum des Saarlandes" "Saarbrücken / Homburg"
* #UKS insert AddKonsortium(DIFUTURE)
* #UKS insert AddUri(uks.eu)
* #UKS insert AddStatus(deprecated)
* #UKS insert AddDeprecationDate(2024-10-15)
* #UdS "Universität des Saarlandes, Medizinische Fakultät" "Saarbrücken / Homburg"
* #UdS insert AddKonsortium(DIFUTURE)
* #UdS insert AddUri(med.uni-saarland.de)
* #UdS insert AddStatus(active)
* #UdS insert AddTRV(V6.14)
* #UKSH "Universitätsklinikum Schleswig-Holstein" "Schleswig-Holstein"
* #UKSH insert AddKonsortium(HiGHmed)
* #UKSH insert AddUri(uksh.de)
* #UKSH insert AddStatus(active)
* #UKSH insert AddTRV(V6.15)
* #UKT "Universitätsklinikum Tübingen" "Tübingen"
* #UKT insert AddKonsortium(DIFUTURE)
* #UKT insert AddUri(medizin.uni-tuebingen.de)
* #UKT insert AddStatus(active)
* #UKT insert AddTRV(V6.15)
* #UKU "Universitätsklinikum Ulm" "Ulm"
* #UKU insert AddKonsortium(DIFUTURE)
* #UKU insert AddUri(uniklinik-ulm.de)
* #UKU insert AddStatus(active)
* #UKU insert AddTRV(V6.15)
* #UKW "Universitätsklinikum Würzburg" "Würzburg"
* #UKW insert AddKonsortium(HiGHmed)
* #UKW insert AddUri(ukw.de)
* #UKW insert AddStatus(active)
* #UKW insert AddDatenmanagementstelle(true)
* #UKW insert AddTRV(V6.15)
* #HUKW "Universität Witten/Herdecke" "Witten / Herdecke"
* #HUKW insert AddKonsortium(NA)
* #HUKW insert AddStatus(deprecated)
* #HUKW insert AddDeprecationDate(2024-07-09)
* #BHC "Bosch Health Campus" "Stuttgart"
* #BHC insert AddKonsortium(HiGHmed)
* #BHC insert AddUri(rbk.de)
* #BHC insert AddStatus(active)
* #BHC insert AddTRV(V6.15)
* #FDPG "Forschungsdatenportal für Gesundheit"
* #FDPG insert AddKonsortium(MII)
* #FDPG insert AddUri(forschen-fuer-gesundheit.de)
* #FDPG insert AddStatus(active)
* #FDPG insert AddDatenmanagementstelle(true)
* #FDPG insert AddTRV(V6.14)
* #HiGHmed "Konsortium"
* #HiGHmed insert AddKonsortium(MII)
* #HiGHmed insert AddUri(highmed.org)
* #HiGHmed insert AddStatus(active)
* #HiGHmed insert AddTRV(V6.14)
* #HHN "Hochschule Heilbronn" "Heilbronn"
* #HHN insert AddKonsortium(MII)
* #HHN insert AddUri(hs-heilbronn.de)
* #HHN insert AddStatus(active)
* #HHN insert AddTRV(V6.14)
* #CRR "Zentrale Plattform NUM"
* #CRR insert AddKonsortium(NUM)
* #CRR insert AddUri(num-codex.de)
* #CRR insert AddStatus(active)
