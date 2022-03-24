Instance: observationPreviousTx
InstanceOf: Observation

* status = #final
* code = $canshare#pres "Previous Treatment for this tumour"
* subject = Reference(patientLung)

//value can either be cc (no, unknown) or string

* valueCodeableConcept = http://terminology.hl7.org/CodeSystem/v2-0136#N "No"
//* valueCodeableConcept = http://terminology.hl7.org/CodeSystem/data-absent-reason#asked-unknown "Don't know"
//* valueString = "These are the symptoms"