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


* name.given = "John"
* name.family = "Doe"
* name.text = "John Doe"

* gender = #male

Instance: patient2
InstanceOf: Patient


* name.given = "Jane"
* name.family = "Doe"
* name.text = "Jane Doe"

* gender = #female

Instance: practitioner1
InstanceOf: Practitioner


* name.given = "Marcus"
* name.family = "Welby"
* name.text = "Marcus Welby"

* gender = #male
