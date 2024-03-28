RuleSet: AddKonsortium(Konsortium)
* ^property[+].code = #Konsortium
* ^property[=].valueString = "{Konsortium}"

RuleSet: AddUri(uri)
* ^property[+].code = #uri
* ^property[=].valueString = "{uri}"

RuleSet: AddStatus(status)
* ^property[+].code = #status
* ^property[=].valueCode = #{status}

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
* ^date = "2024-03-11"
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
* #UKA "Uniklinik RWTH Aachen" "Aachen"
* #UKA insert AddKonsortium(SMITH)
* #UKA insert AddUri(ukaachen.de)
* #UKA insert AddStatus(active)
* #UKAU "Universitätsklinikum Augsburg" "Augsburg"
* #UKAU insert AddKonsortium(DIFUTURE)
* #UKAU insert AddUri(uk-augsburg.de)
* #UKAU insert AddStatus(active)
* #Charité "Charité - Universitätsmedizin Berlin" "Berlin"
* #Charité insert AddKonsortium(HiGHmed)
* #Charité insert AddUri(charite.de)
* #Charité insert AddStatus(active)
* #UKOWL "Universitätsklinikum OWL" "Bielefeld"
* #UKOWL insert AddKonsortium(NA)
* #UKOWL insert AddStatus(active)
* #"UK RUB" "Universitätsklinikum der Ruhr-Universität Bochum" "Bochum"
* #"UK RUB" insert AddKonsortium(SMITH)
* #"UK RUB" insert AddStatus(active)
* #UKB "Universitätsklinikum Bonn" "Bonn"
* #UKB insert AddKonsortium(SMITH)
* #UKB insert AddUri(ukbonn.de)
* #UKB insert AddStatus(active)
* #KCH "Klinikum Chemnitz" "Chemnitz"
* #KCH insert AddKonsortium(MIRACUM)
* #KCH insert AddUri(klinikumchemnitz.de)
* #KCH insert AddStatus(active)
* #CTK "Carl-Thiem-Klinikum Cottbus" "Cottbus"
* #CTK insert AddKonsortium(HiGHmed)
* #CTK insert AddStatus(active)
* #UKDD "Universitätsklinikum Carl Gustav Carus Dresden" "Dresden"
* #UKDD insert AddKonsortium(MIRACUM)
* #UKDD insert AddUri(ukdd.de)
* #UKDD insert AddStatus(active)
* #UKD "Universitätsklinikum Düsseldorf" "Düsseldorf"
* #UKD insert AddKonsortium(SMITH)
* #UKD insert AddUri(uniklinik-duesseldorf.de)
* #UKD insert AddStatus(active)
* #UKEr "Universitätsklinikum Erlangen" "Erlangen"
* #UKEr insert AddKonsortium(MIRACUM)
* #UKEr insert AddUri(www.uk-erlangen.de)
* #UKEr insert AddStatus(active)
* #UME "Universitätsklinikum Essen" "Essen"
* #UME insert AddKonsortium(SMITH)
* #UME insert AddUri(uk-essen.de)
* #UME insert AddStatus(active)
* #UKF "Universitätsklinikum Frankfurt" "Frankfurt"
* #UKF insert AddKonsortium(MIRACUM)
* #UKF insert AddUri(kgu.de)
* #UKF insert AddStatus(active)
* #UKFR "Universitätsklinikum Freiburg" "MIRACUM"
* #UKFR insert AddKonsortium(MIRACUM)
* #UKFR insert AddUri(uniklinik-freiburg.de)
* #UKFR insert AddStatus(active)
* #UKGI "Universitätsklinikum Gießen" "Gießen"
* #UKGI insert AddKonsortium(MIRACUM)
* #UKGI insert AddUri(uni-giessen.de)
* #UKGI insert AddStatus(active)
* #UMG "Universitätsmedizin Göttingen" "Göttingen"
* #UMG insert AddKonsortium(HiGHmed)
* #UMG insert AddUri(umg.eu)
* #UMG insert AddStatus(active)
* #UKG "Universitätsmedizin Greifswald" "Greifswald"
* #UKG insert AddKonsortium(MIRACUM)
* #UKG insert AddUri(www.medizin.uni-greifswald.de)
* #UKG insert AddStatus(active)
* #UKH "Universitätsklinikum Halle (Saale)" "Halle (Saale)"
* #UKH insert AddKonsortium(SMITH)
* #UKH insert AddUri(uk-halle.de)
* #UKH insert AddStatus(active)
* #UKE "Universitätsklinikum Hamburg-Eppendorf" "Hamburg"
* #UKE insert AddKonsortium(SMITH)
* #UKE insert AddUri(uke.de)
* #UKE insert AddStatus(active)
* #MHH "Medizinische Hochschule Hannover" "Hannover"
* #MHH insert AddKonsortium(HiGHmed)
* #MHH insert AddUri(mh-hannover.de)
* #MHH insert AddStatus(active)
* #UKHD "Universitätsklinikum Heidelberg" "Heidelberg"
* #UKHD insert AddKonsortium(HiGHmed)
* #UKHD insert AddUri(ukhd.de)
* #UKHD insert AddStatus(active)
* #UKJ "Universitätsklinikum Jena" "Jena"
* #UKJ insert AddKonsortium(SMITH)
* #UKJ insert AddUri(uniklinikum-jena.de)
* #UKJ insert AddStatus(active)
* #UKK "Universitätsklinikum Köln" "Köln"
* #UKK insert AddKonsortium(HiGHmed)
* #UKK insert AddUri(uk-koeln.de)
* #UKK insert AddStatus(active)
* #UKL "Universitätsklinikum Leipzig" "Leipzig"
* #UKL insert AddKonsortium(SMITH)
* #UKL insert AddUri(uniklinikum-leipzig.de)
* #UKL insert AddStatus(active)
* #UMMD "Universitätsklinikum Magdeburg" "Magdeburg"
* #UMMD insert AddKonsortium(MIRACUM)
* #UMMD insert AddUri(www.med.uni-magdeburg.de)
* #UMMD insert AddStatus(active)
* #UM "Universitätsmedizin der Johannes Gutenberg-Universität Mainz" "Mainz"
* #UM insert AddKonsortium(MIRACUM)
* #UM insert AddUri(unimedizin-mainz.de)
* #UM insert AddStatus(active)
* #UMM "Universitätsklinikum Mannheim" "Mannheim"
* #UMM insert AddKonsortium(MIRACUM)
* #UMM insert AddUri(umm.de)
* #UMM insert AddStatus(active)
* #UKMR "Universitätsklinikum Marburg" "Marburg"
* #UKMR insert AddKonsortium(MIRACUM)
* #UKMR insert AddUri(uni-marburg.de)
* #UKMR insert AddStatus(active)
* #KUM "Klinikum der Universität München" "München / LMU"
* #KUM insert AddKonsortium(DIFUTURE)
* #KUM insert AddUri(lmu-klinikum.de)
* #KUM insert AddStatus(active)
* #MRI "Klinikum rechts der Isar" "München / TUM"
* #MRI insert AddKonsortium(DIFUTURE)
* #MRI insert AddUri(mri.tum.de)
* #MRI insert AddStatus(active)
* #UKM "Universitätsklinikum Münster" "Münster"
* #UKM insert AddKonsortium(HiGHmed)
* #UKM insert AddUri(ukm.de)
* #UKM insert AddStatus(active)
* #UOL "Carl von Ossietzky Universität Oldenburg" "Oldenburg"
* #UOL insert AddKonsortium(HiGHmed)
* #UOL insert AddStatus(active)
* #UKR "Universitätsklinikum Regensburg" "Regensburg"
* #UKR insert AddKonsortium(DIFUTURE)
* #UKR insert AddUri(ukr.de)
* #UKR insert AddStatus(active)
* #UMR "Universitätsmedizin Rostock" "Rostock"
* #UMR insert AddKonsortium(SMITH)
* #UMR insert AddUri(med.uni-rostock.de)
* #UMR insert AddStatus(active)
* #UKS "Universitätsklinikum des Saarlandes" "Saarbrücken / Homburg"
* #UKS insert AddKonsortium(DIFUTURE)
* #UKS insert AddUri(uks.eu)
* #UKS insert AddStatus(active)
* #UKSH "Universitätsklinikum Schleswig-Holstein" "Schleswig-Holstein"
* #UKSH insert AddKonsortium(HiGHmed)
* #UKSH insert AddUri(uksh.de)
* #UKSH insert AddStatus(active)
* #UKT "Universitätsklinikum Tübingen" "DIFUTURE"
* #UKT insert AddKonsortium(DIFUTURE)
* #UKT insert AddUri(medizin.uni-tuebingen.de)
* #UKT insert AddStatus(active)
* #UKU "Universitätsklinikum Ulm" "Ulm"
* #UKU insert AddKonsortium(DIFUTURE)
* #UKU insert AddUri(uniklinik-ulm.de)
* #UKU insert AddStatus(active)
* #UKW "Universitätsklinikum Würzburg" "Würzburg"
* #UKW insert AddKonsortium(HiGHmed)
* #UKW insert AddUri(ukw.de)
* #UKW insert AddStatus(active)
* #HUKW "Universität Witten/Herdecke" "Witten / Herdecke"
* #HUKW insert AddKonsortium(NA)
* #HUKW insert AddStatus(active)
* #RBK "Robert-Bosch-Krankenhaus" "Stuttgart"
* #RBK insert AddKonsortium(HiGHmed)
* #RBK insert AddStatus(active)
* #FDPG "Forschungsdatenplattform"
* #FDPG insert AddKonsortium(MII)
* #FDPG insert AddUri(forschen-fuer-gesundheit.de)
* #FDPG insert AddStatus(active)
* #HiGHmed "Konsortium"
* #HiGHmed insert AddKonsortium(MII)
* #HiGHmed insert AddUri(highmed.org)
* #HiGHmed insert AddStatus(active)
* #HHN "Hochschule Heilbronn" "Heilbronn"
* #HHN insert AddKonsortium(MII)
* #HHN insert AddUri(hs-heilbronn.de)
* #HHN insert AddStatus(active)
* #CRR "Zentrale Plattform NUM"
* #CRR insert AddKonsortium(NUM)
* #CRR insert AddUri(num-codex.de)
* #CRR insert AddStatus(active)