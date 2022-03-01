Alias: $clinfhircs = http://clinfhir.com/codesystem     //placeholder codesystem


Instance: an-completeBundle
InstanceOf: Bundle
* type = #document

* entry[+].resource = an-completeComposition
* entry[+].resource = an-patient
* entry[+].resource = an-practitioner

//Diagnosis
* entry[+].resource = an-cancer

//Clincial TNM
* entry[+].resource = cTNM
* entry[+].resource = cT
* entry[+].resource = cN
* entry[+].resource = cM

* entry[+].resource = cycle-summary1
* entry[+].resource = regimen-summary1
* entry[+].resource = medication1


Instance: an-completeComposition
InstanceOf: ActNowCompleteComposition
Title: "ActNow complete"
Description: """
An example composition containing all act-now data
"""
Usage: #Example
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Document metadata</div>"
* text.status = #generated
* status = #final
* type = http://loinc.org#11503-0 "Medical Records"
* author = Reference(an-practitioner)
* subject = Reference(an-patient)

* date = "2020-04-21"

//cancer details section
* section[cancerDetails].code = http://loinc.org#11348-0
* section[cancerDetails].text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Details about this cancer</div>"
* section[cancerDetails].text.status = #generated
* section[cancerDetails].entry = Reference(an-cancer)    

//clinical TNM section
* section[clinicalTNM].code = http://loinc.org#75620-5
* section[clinicalTNM].text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Clinical TNM</div>"
* section[clinicalTNM].text.status = #generated
* section[clinicalTNM].entry[0] = Reference(cTNM)    
//* section[clinicalTNM].entry[+] = Reference(cT)    
//* section[clinicalTNM].entry[+] = Reference(cN)    
//* section[clinicalTNM].entry[+] = Reference(cM)   

* section[regimen].code = http://loinc.org#1234-5
* section[regimen].text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Regimen summary</div>"
* section[regimen].text.status = #generated
* section[regimen].entry[0] = Reference(regimen-summary1) 



//------------- end of Composition




//Clinical TNM
//aligned with mCode
//todo - what is group & edition

Instance: cT
InstanceOf: Observation
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>T3</div>"
* text.status = #generated
* subject = Reference(an-patient)
* effectiveDateTime = "2020-01-01"
* status = #final
* code = $loinc#21905-5 "Primary tumor.clinical [Class] Cancer"
* valueCodeableConcept = http://cancerstaging.org#cT3 "T3"

Instance: cN
InstanceOf: Observation
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>N3</div>"
* text.status = #generated
* subject = Reference(an-patient)
* effectiveDateTime = "2020-01-01"
* status = #final
* code = $loinc#21906-3 "Regional lymph nodes.clinical [Class] Cancer"
* valueCodeableConcept = http://cancerstaging.org#cN3 "N3"

Instance: cM
InstanceOf: Observation
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>M0</div>"
* text.status = #generated
* subject = Reference(an-patient)
* effectiveDateTime = "2020-01-01"
* status = #final
* code = $loinc#21907-3 "Distant metastases.clinical [Class] Cancer"
* valueCodeableConcept = http://cancerstaging.org#cM0 "M0"

Instance: cTNM
InstanceOf: Observation
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Clinical TNM</div>"
* text.status = #generated
* subject = Reference(an-patient)
* status = #final
* code = http://loinc.org#21908-9 "Stage group.clinical Cancer"
* effectiveDateTime = "2020-01-01"
* valueCodeableConcept = http://cancerstaging.org#3C "IIIC"
* method = http://snomed.info/sct#897275008 "American Joint Commission on Cancer, Cancer Staging Manual, 8th edition neoplasm staging system (tumor staging)"
* hasMember[0] = Reference(cT)
* hasMember[+] = Reference(cN)
* hasMember[+] = Reference(cM)


// ------- pathological TNM
//todo: how is it different from Clinical TNM (not defined in mcode)
//todo - what is group & edition
//https://hl7.org/fhir/us/mcode/Observation-tnm-pathologic-stage-group-jenny-m.html

// ------ treatment, regimen
Instance: regimen-summary1
InstanceOf: Observation
Title: "A summary of a regimen"
Usage: #example
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Regimen summary</div>"
* text.status = #generated
* subject = Reference(an-patient)
* effectiveDateTime = "2020-01-01"
* status = #final
* code = $clinfhircs#regimensummary "Summary of regimen"

//reference to a cycle summary
* extension[+].url = "http://clinfhir.com/StructureDefinition/cyclesummary"
* extension[=].valueReference = Reference(cycle-summary1)

//the regimen was discontinued
* extension[+].url = "http://clinfhir.com/StructureDefinition/regimen-discontinued"
* extension[=].extension[+].url = "date"
* extension[=].extension[=].valueDateTime = "2020-02-02T12:00:00Z"
* extension[=].extension[+].url = "reason"
* extension[=].extension[=].valueCodeableConcept.text = "Not tolerated by patient"
* extension[=].extension[+].url = "patientfactors"
* extension[=].extension[=].valueCodeableConcept.text = "Nausea"
* extension[=].extension[+].url = "toxicity"
* extension[=].extension[=].valueCodeableConcept.text = "low WCC"


//---- cycle summary
//Summary of a single cycle of treatment - ie multiple medication administrations
//This implies that the summary resource is submitted after the cycle is completed - not during 
//(though could be updated I guess).
Instance: cycle-summary1
InstanceOf: Observation
Title: "A summary of a single cycle of treatment"
Usage: #example
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Cycle summary</div>"
* text.status = #generated
* subject = Reference(an-patient)
* effectiveDateTime = "2020-01-01"
* status = #final
* code = $clinfhircs#cyclesummary "Summary of a cycle of treatment"

//if we keep these, then the extension definitions will be created separately
* extension[+].url = "http://clinfhir.com/StructureDefinition/regimen"
* extension[=].extension[+].url = "uri"
* extension[=].extension[=].valueUri = "http://cannonical/regimen/url"
* extension[=].extension[+].url = "name"
* extension[=].extension[=].valueString = "Excellent cancer regimen"

* extension[+].url = "http://clinfhir.com/StructureDefinition/medicationadministration"
* extension[=].valueReference = Reference(medication1)

//------- medication administration
Instance: medication1
InstanceOf: MedicationAdministration
Title: "A summary of a single cycle of treatment"
Usage: #example
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Methotrexate</div>"
* text.status = #generated
* subject = Reference(an-patient)
* status = #completed
* effectivePeriod.start = "2020-01-10T10:00:00Z"
* effectivePeriod.end = "2020-01-10T11:00:00Z"
* medicationCodeableConcept = http://nzulm.co.nz#1234
* dosage.text = "10 ml over 1 hour"

* extension[0].url = "http://clinfhir.com/StructureDefinition/cycleday"
* extension[=].valueInteger = 1

* extension[+].url = "http://clinfhir.com/StructureDefinition/creatinineclearance"
* extension[=].extension[+].url = "value"
* extension[=].extension[=].valueQuantity.value = 70
* extension[=].extension[=].valueQuantity.unit = "uMol/L"
* extension[=].extension[+].url = "date"
* extension[=].extension[=].valueDateTime = "2020-01-01"

* extension[+].url = "http://clinfhir.com/StructureDefinition/prescribeddose"
* extension[=].valueDosage.text = "10 ml over 1 hour"

* extension[+].url = "http://clinfhir.com/StructureDefinition/adjustmentreason"
* extension[=].valueCodeableConcept.text = "Nausea on previous administrations"

//------------------------  Cancer diagnosis
Instance: an-cancer
InstanceOf: Condition
Title: "The cancer being treated"
Usage: #example

//todo recurrance
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Small cell carcinoma</div>"
* text.status = #generated

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
* text.status = #generated
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>John Doe</div>"
* birthDate = "1989-02-02"
* name.given = "John"
* name.family = "Doe"
* name.text = "John Doe"

Instance: an-practitioner
InstanceOf: Practitioner
Title: "Marcus Welby"
Usage: #example
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Marcus Welby</div>"
* text.status = #generated
* name.given = "Marcus"
* name.family = "Welby"
* name.text = "Marcus Welby"