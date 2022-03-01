//Alias: $snomed = http://snomed.org




Instance: an-review
InstanceOf: ActNowReviewComposition

Title: "ActNow review"
Description: """
An example composition for a review of the cancer and propose treatment
"""
Usage: #Example

* status = #final
* type = http://loinc.org#11503-0 "Medical Records"
* author = Reference(anr-practitioner)
* subject = Reference(anr-patient)

* date = "2020-04-21"

* section[cancerDetails].code = http://loinc.org#11348-0
* section[cancerDetails].text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Details about this cancer</div>"
* section[cancerDetails].text.status = #generated
* section[cancerDetails].entry = Reference(anr-cancer)    //defined below


Instance: anr-cancer
InstanceOf: Condition
Title: "The cancer being treated"
Usage: #example

* clinicalStatus = #active
* verificationStatus = #confirmed
* subject = Reference(anr-patient)

* code = http://loinc.org#11348-0       //code for type of cancer
* bodySite = $snomed#3341006
* stage.summary.text = "Advanced"

Instance: anr-patient
InstanceOf: Patient
Title: "John Doe"
Usage: #example

* name.text = "John Doe"

Instance: anr-practitioner
InstanceOf: Practitioner
Title: "Marcus Welby"
Usage: #example

* name.text = "Marcus Welby"