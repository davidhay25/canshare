Instance: observationIndication
InstanceOf: Observation

* status = #final
* code = $canshare#ind "Indication"
* subject = Reference(patientLung)

//value can either be cc (new primary, regional recurrance, distant metastasis) or string for other

//* valueCodeableConcept = 
* valueString = "other indication"