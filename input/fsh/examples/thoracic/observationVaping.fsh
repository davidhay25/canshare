Instance: observationVaping
InstanceOf: Observation

* status = #final
* code = $canshare#vap "Vaping Status"
* subject = Reference(patientLung)

* valueCodeableConcept = $canshare#current "Current Vaper"