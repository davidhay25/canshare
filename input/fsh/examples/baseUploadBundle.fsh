Instance: baseData
InstanceOf: Bundle
Description: "A Bundle containing all the base resources for the canshare db after clearing"
* type = #collection

//base resources
* entry[+].resource = patient1
* entry[+].resource = patient2
* entry[+].resource = practitioner1

//Questionnaires
* entry[+].resource = QLungCancer

//SearchParameters
* entry[+].resource = supporting-info
* entry[+].resource = ma-basedOn

Instance: patient1
InstanceOf: Patient

* identifier.system = "https://standards.digital.health.nz/ns/nhi-id"
* identifier.value = "AAA2134"
* name.given = "John"
* name.family = "Doe"
* name.text = "John Doe"
* birthDate = "1989-01-01"
* gender = #male

Instance: patient2
InstanceOf: Patient

* identifier.system = "https://standards.digital.health.nz/ns/nhi-id"
* identifier.value = "BBBB5678"
* name.given = "Jane"
* name.family = "Doe"
* name.text = "Jane Doe"
* birthDate = "2010-05-04"
* gender = #female

Instance: practitioner1
InstanceOf: Practitioner


* name.given = "Marcus"
* name.family = "Welby"
* name.text = "Marcus Welby"

* gender = #male
