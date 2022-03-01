//Alias: $snomed = http://snomed.org




Instance: an-complete
InstanceOf: ActNowCompleteComposition

Title: "ActNow complete"
Description: """
An example composition containing all act-now data
"""
Usage: #Example

* status = #final
* type = http://loinc.org#11503-0 "Medical Records"
* author = Reference(an-practitioner)
* subject = Reference(an-patient)

* date = "2020-04-21"

//cancer details section
* section[cancerDetails].code = http://loinc.org#11348-0
* section[cancerDetails].text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Details about this cancer</div>"
* section[cancerDetails].text.status = #generated
* section[cancerDetails].entry = Reference(an-cancer)    //defined below

//clinical TNM section
* section[clinicalTNM].code = http://loinc.org#75620-5
* section[clinicalTNM].text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Clinical TNM</div>"
* section[clinicalTNM].text.status = #generated
* section[clinicalTNM].entry = Reference(cTNM)    //defined below


//Clinical TNM

Instance: cT
InstanceOf: Observation
* subject = Reference(an-patient)
* effectiveDateTime = "2020-01-01"
* status = #final
* code = $loinc#21905-5 "Primary tumor.clinical [Class] Cancer"
* valueCodeableConcept = http://cancerstaging.org#cT3 "T3"

Instance: cN
InstanceOf: Observation
* subject = Reference(an-patient)
* effectiveDateTime = "2020-01-01"
* status = #final
* code = $loinc#21906-3 "Regional lymph nodes.clinical [Class] Cancer"
* valueCodeableConcept = http://cancerstaging.org#cN3 "N3"

Instance: cM
InstanceOf: Observation
* subject = Reference(an-patient)
* effectiveDateTime = "2020-01-01"
* status = #final
* code = $loinc#21907-3 "Distant metastases.clinical [Class] Cancer"
* valueCodeableConcept = http://cancerstaging.org#cM0 "M0"

Instance: cTNM
InstanceOf: Observation
* subject = Reference(an-patient)
* status = #final
* code = http://loinc.org#21908-9 "Stage group.clinical Cancer"
* subject = Reference(cancer-patient-john-anyperson)
* effectiveDateTime = "2020-01-01"
* valueCodeableConcept = http://cancerstaging.org#3C "IIIC"
* method = http://snomed.info/sct#897275008 "American Joint Commission on Cancer, Cancer Staging Manual, 8th edition neoplasm staging system (tumor staging)"
* hasMember[0] = Reference(cT)
* hasMember[+] = Reference(cN)
* hasMember[+] = Reference(cM)



//------------------------  Cancer diagnosis
Instance: an-cancer
InstanceOf: Condition
Title: "The cancer being treated"
Usage: #example

//todo recurrance

* extension[+].url = "http://hl7.org/fhir/us/mcode/StructureDefinition/mcode-laterality-qualifier"
* extension[=].valueCodeableConcept = $snomed#7771000 "Left (qualifier value)"

* extension[+].url = "http://hl7.org/fhir/StructureDefinition/condition-assertedDate"
* extension[=].valueDate = "2020-01-01"

* clinicalStatus = #active
* verificationStatus = #confirmed
* subject = Reference(an-patient)

* code = $snomed#254632001 "Small cell carcinoma of lung"
* bodySite = $snomed#3341006
* stage.summary = $snomed#786005 "Clinical stage I B"        //?equivalent to grade

Instance: an-patient
InstanceOf: Patient
Title: "John Doe"
Usage: #example

* birthDate = "1989-02-02"
* name.given = "John"
* name.family = "Doe"
* name.text = "John Doe"

Instance: an-practitioner
InstanceOf: Practitioner
Title: "Marcus Welby"
Usage: #example

* name.given = "Marcus"
* name.family = "Welby"
* name.text = "Marcus Welby"