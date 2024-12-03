---
parent: 
topic: ProfileSearchParameter
subject: https://www.medizininformatik-initiative.de/fhir/modul-meta/StructureDefinition/mii-pr-meta-searchparameter
---

## MII PR Meta SearchParameter

Das Profil legt die Mindestanforderungen fest, die SearchParameter-Ressourcen im Kerndatensatz erfüllen müssen.

@```
from 
    StructureDefinition 
where 
    url = 'https://www.medizininformatik-initiative.de/fhir/modul-meta/StructureDefinition/mii-pr-meta-searchparameter' 
select 
    Name: name, Status: status, Version: version, Lizenz: extension.where(url='https://www.medizininformatik-initiative.de/fhir/modul-meta/StructureDefinition/mii-ex-meta-license-codeable').value.coding.code, Canonical: url, Basis: baseDefinition
```

---

Folgende Invariante MUSS bei der Erstellung von Custom SearchParameter-Ressourcen berücksichtigt werden.

@```
from StructureDefinition 
where url = 'https://www.medizininformatik-initiative.de/fhir/modul-meta/StructureDefinition/mii-pr-meta-searchparameter'
for differential.element.where(id='SearchParameter.code').constraint select
    key,
    severity,
    human,
    expression
```

---

### Inhalt

<tabs>
  <tab title="Darstellung">{{tree, buttons}}</tab>
  <tab title="Beschreibung"> 
        @```
        from
	        StructureDefinition
        where
	        url = 'https://www.medizininformatik-initiative.de/fhir/modul-meta/StructureDefinition/mii-pr-meta-searchparameter'
        select
	        Beschreibung: description
        with
            no header
        ```
        @```
        from 
            StructureDefinition 
        where 
            url = 'https://www.medizininformatik-initiative.de/fhir/modul-meta/StructureDefinition/mii-pr-meta-searchparameter' 
        for 
            differential.element 
            where 
                mustSupport = true 
            select Feldname: id, Kurzbeschreibung: short, Hinweise: comment
        ```
  </tab>
  <tab title="XML">{{xml}}</tab>
  <tab title="JSON">{{json}}</tab>
  <tab title="Link">{{link}}</tab>
</tabs>

--- 