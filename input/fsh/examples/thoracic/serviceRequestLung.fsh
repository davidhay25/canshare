Instance: serviceRequestLung
InstanceOf: ServiceRequest

* extension[0].url = "http://canshare.com/cc"
* extension[=].valueReference = Reference(practitionerCC)

* status = #active
* intent = #order
* subject = Reference(patientLung)
* requester = Reference(practitionerRequesting)


* supportingInfo[0] = Reference(observationSS)
* supportingInfo[+] = Reference(observationVaping)
* supportingInfo[+] = Reference(observationAsbestos)
* supportingInfo[+] = Reference(observationPresenting)
* supportingInfo[+] = Reference(observationCyto)
* supportingInfo[+] = Reference(observationPreviousTx)
* supportingInfo[+] = Reference(observationPreviousDx)
* supportingInfo[+] = Reference(observationRelevantRadiol)
* supportingInfo[+] = Reference(observationNeoadjuvent)
* supportingInfo[+] = Reference(observationOtherrelevant)
* supportingInfo[+] = Reference(procedurePerformed)
* supportingInfo[+] = Reference(observationIndication)
* supportingInfo[+] = Reference(bodyStructureTumour)
* supportingInfo[+] = Reference(specimen1)