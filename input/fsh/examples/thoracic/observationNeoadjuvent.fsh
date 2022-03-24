Instance: observationNeoadjuvent
InstanceOf: Observation

* status = #final
* code = $canshare#neo "Neoadjuvent therapy"
* subject = Reference(patientLung)

//value can either be cc or string

* valueCodeableConcept = $canshare#notadmin "Not administered"
//* valueString = "details of therapy"
