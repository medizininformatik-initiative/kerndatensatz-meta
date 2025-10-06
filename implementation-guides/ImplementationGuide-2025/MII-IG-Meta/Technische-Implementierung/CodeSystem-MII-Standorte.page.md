---
parent: 
topic: CodeSystemMIIStandorte
subject: https://www.medizininformatik-initiative.de/fhir/core/CodeSystem/core-location-identifier
---

## MII CS Meta Standorte

<fql>
from
	CodeSystem
where
	url = 'https://www.medizininformatik-initiative.de/fhir/core/CodeSystem/core-location-identifier'
select
	Name: name, Status: status, Version: version, Beschreibung: description, URL: url
order by
	name
</fql>

{{render:https://www.medizininformatik-initiative.de/fhir/core/CodeSystem/core-location-identifier}}