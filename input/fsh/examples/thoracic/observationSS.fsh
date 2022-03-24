Instance: observationSS
InstanceOf: ObservationSS

* status = #final
* code = $canshare#ss "Smoking Status"
* subject = Reference(patientLung)

* valueCodeableConcept = $canshare#currents "Current Smoker"
//* valueString = "test"