
//general
Alias: $snomed = http://snomed.info/sct
Alias: $loinc = http://loinc.org
Alias: $ucum = http://unitsofmeasure.org
Alias: $canshare = http://canshare.com/cs
Alias: $canshareReview = http://canshare.com/cs/review

Alias: $extractNotes = http://canshare.com/fhir/StructureDefinition/questionnaire-extractNotes
Alias: $usageNotes = http://canshare.com/fhir/StructureDefinition/questionnaire-usageNotes
Alias: $sourceStandard = http://canshare.com/fhir/StructureDefinition/questionnaire-sourceStandard
Alias: $column = http://canshare.com/fhir/StructureDefinition/questionnaire-column 
Alias: $column-count = http://canshare.com/fhir/StructureDefinition/questionnaire-column-count
// todo - fsh doesn't seem to recognize valueExpression
Alias: $initialValue = http://canshare.com/fhir/StructureDefinition/sdc-questionnaire-initialExpression



Instance: QCervicalCancer
InstanceOf: Questionnaire
Description: "Questionnaire for Cervical Cancer histology request"

* url = "http://clinfhir.com/Questionnaire/cervicalcancer"
* status = #draft
* name = "CervicalCancerHistologyRequest"
* title = "A form to capture data to accompany a histology request for cervical cancer"


//========= demographics section
* item[+].linkId = "demog"
* item[=].text = "Demographics"
* item[=].type = #group

* item[=].extension[0].url = $extractNotes
* item[=].extension[=].valueString = """
Patient resource. Use conditional create.
"""

* item[=].item[+].linkId = "NHI"
* item[=].item[=].text = "NHI"
* item[=].item[=].type = #string
* item[=].item[=].extension[+].url = $extractNotes
* item[=].item[=].extension[=].valueString = """
Patient.identifier field. System is https://standards.digital.health.nz/ns/nhi-id
"""
* item[=].item[=].extension[0].url = $initialValue
* item[=].item[=].extension[=].valueString = "%patient.identifier"

* item[=].item[+].linkId = "patient-family"
* item[=].item[=].text = "Family name"
* item[=].item[=].type = #string

* item[=].item[=].extension[0].url = $initialValue
* item[=].item[=].extension[=].valueString = "%patient.family"

* item[=].item[=].extension[+].url = $extractNotes
* item[=].item[=].extension[=].valueString = """
Patient.name.family
"""


* item[=].item[+].linkId = "patient-given"
* item[=].item[=].text = "Given name"
* item[=].item[=].type = #string
* item[=].item[=].repeats = true

* item[=].item[=].extension[+].url = $extractNotes
* item[=].item[=].extension[=].valueString = """
Patient.name.given
"""
* item[=].item[=].extension[+].url = $initialValue
* item[=].item[=].extension[=].valueString = "%patient.given"

//* item[=].item[=].extension[+].url = $row
//* item[=].item[=].extension[=].valueCode = #right

//---

* item[=].item[+].linkId = "patient-dob"
* item[=].item[=].text = "Date of Birth"
* item[=].item[=].type = #string

* item[=].item[=].extension[0].url = $initialValue
* item[=].item[=].extension[=].valueString = "%patient.birthDate"


* item[=].item[=].extension[+].url = $extractNotes
* item[=].item[=].extension[=].valueString = """
Patient.birthDate
"""



* item[=].item[+].linkId = "patient-gender"
* item[=].item[=].text = "Gender"
* item[=].item[=].type = #choice
* item[=].item[=].answerOption[+].valueCoding = http://hl7.org/fhir/administrative-gender#male "Male"
* item[=].item[=].answerOption[+].valueCoding = http://hl7.org/fhir/administrative-gender#female "Female"
* item[=].item[=].answerOption[+].valueCoding = http://hl7.org/fhir/administrative-gender#other "Other"
* item[=].item[=].answerOption[+].valueCoding = http://hl7.org/fhir/administrative-gender#unknown "Unknown"

* item[=].item[=].extension[0].url = $extractNotes
* item[=].item[=].extension[=].valueString = """
Patient.gender
"""

* item[=].item[=].extension[+].url = $initialValue
* item[=].item[=].extension[=].valueString = "%patient.gender"

* item[=].item[=].extension[+].url = $control-radio
* item[=].item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button


* item[=].item[+].linkId = "patient-ethnicity"
* item[=].item[=].text = "Ethnicity"
* item[=].item[=].type = #choice
* item[=].item[=].answerValueSet = "https://nzhts.digital.health.nz/fhir/ValueSet/ethnic-group-level-4-code"

* item[=].item[=].extension[+].url = $extractNotes
* item[=].item[=].extension[=].valueString = """
Patient.extension - url = http://hl7.org.nz/fhir/StructureDefinition/nz-ethnicity
"""
* item[=].item[=].extension[+].url = $extractNotes
* item[=].item[=].extension[=].valueString = """
Patient.extension
"""

//========= administrative section
* item[+].linkId = "admin"
* item[=].text = "Administration"
* item[=].type = #group

* item[=].item[+].linkId = "reviewer"
* item[=].item[=].text = "Reviewer"
* item[=].item[=].type = #string
* item[=].item[=].code = $canshareReview#reviewer "Reviewer"

* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-observationExtract"
* item[=].item[=].extension[=].valueBoolean = true

* item[=].item[=].extension[+].url = $usageNotes
* item[=].item[=].extension[=].valueString = """
The name of the person reviewing this form. Only used during the review process on identifier.
"""


//-------- completed by
* item[=].item[+].linkId = "completedby"
* item[=].item[=].text = "Completed by"
* item[=].item[=].type = #reference

* item[=].item[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-referenceResource"
* item[=].item[=].extension[=].valueCode = #Practitioner

* item[=].item[=].extension[+].url = $extractNotes
* item[=].item[=].extension[=].valueString = """
Reference from extension on ServiceRequest to practitioner. Practitioner should have conditional create on identifier.
"""

//-------- approved by
* item[=].item[+].linkId = "approvedby"
* item[=].item[=].text = "Approved by"
* item[=].item[=].type = #reference

* item[=].item[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-referenceResource"
* item[=].item[=].extension[=].valueCode = #Practitioner

* item[=].item[=].extension[+].url = $extractNotes
* item[=].item[=].extension[=].valueString = """
Reference from extension on ServiceRequest to practitioner. Practitioner should have conditional create on identifier.
"""


//-------- principal
* item[=].item[+].linkId = "principalclinician"
* item[=].item[=].text = "Principal clinician caring for patient"
* item[=].item[=].type = #reference
//* item[=].item[=].code = $canshare#principalclinician "Principal clinician"
* item[=].item[=].code.display = "Principal clinician" 
* item[=].item[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-referenceResource"
* item[=].item[=].extension[=].valueCode = #Practitioner

* item[=].item[=].extension[+].url = $extractNotes
* item[=].item[=].extension[=].valueString = """
Reference from extension on ServiceRequest. Practitioner should have conditional create on identifier.
"""


//-------- requesting clinician
* item[=].item[+].linkId = "requestingclinician"
* item[=].item[=].text = "Requesting clinician"
* item[=].item[=].type = #reference
//* item[=].item[=].code = $canshare#requestingclinician "Requesting clinician"
* item[=].item[=].code.display = "Requesting clinician" 
* item[=].item[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-referenceResource"
* item[=].item[=].extension[=].valueCode = #Practitioner

* item[=].item[=].extension[+].url = $extractNotes
* item[=].item[=].extension[=].valueString = """
Reference from ServiceRequest.requester. Practitioner should have conditional create on identifier.
"""

//-------- copy to
* item[=].item[+].linkId = "cc"
* item[=].item[=].text = "Copy to"
* item[=].item[=].type = #reference
* item[=].item[=].repeats = true
//* item[=].item[=].code = $canshare#cc "CopyTo"
* item[=].item[=].code.display = "Copy to" 
* item[=].item[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-referenceResource"
* item[=].item[=].extension[=].valueCode = #Practitioner
* item[=].item[=].extension[+].url = $extractNotes
* item[=].item[=].extension[=].valueString = """
Reference from extension on ServiceRequest. Practitioner should have conditional create on identifier.
"""



//-------- requesting facility
* item[=].item[+].linkId = "requestingfacility"
* item[=].item[=].text = "Requesting facility"
* item[=].item[=].type = #reference
//* item[=].item[=].code = $canshare#requestingfacility "Requesting facility"
//* item[=].item[=].code.display = "Requesting facility" 
* item[=].item[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-referenceResource"
* item[=].item[=].extension[=].valueCode = #Organization
* item[=].item[=].extension[+].url = $extractNotes
* item[=].item[=].extension[=].valueString = """
Reference from extension on ServiceRequest. Organization should have conditional create on identifier.
"""


//-------- laboratory facility
* item[=].item[+].linkId = "laboratoryfacility"
* item[=].item[=].text = "Laboratory facility"
* item[=].item[=].type = #reference
//* item[=].item[=].code = $canshare#laboratoryfacility "Laboratory facility"
//* item[=].item[=].code.display = "Laboratory facility" 
* item[=].item[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-referenceResource"
* item[=].item[=].extension[=].valueCode = #Organization
* item[=].item[=].extension[+].url = $extractNotes
* item[=].item[=].extension[=].valueString = """
Reference from extension on ServiceRequest. Organisation should have conditional create on identifier.
"""

//-------- copy to facility
* item[=].item[+].linkId = "ccfacility"
* item[=].item[=].text = "Copy to facility"
* item[=].item[=].type = #reference
//* item[=].item[=].code = $canshare#ccfacility "CopyTo facility"
//* item[=].item[=].code.display = "Copy to" 
* item[=].item[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-referenceResource"
* item[=].item[=].extension[=].valueCode = #Organization

* item[=].item[=].extension[+].url = $extractNotes
* item[=].item[=].extension[=].valueString = """
Reference from extension on ServiceRequest. Organisation should have conditional create on identifier.
"""

* item[=].item[+].linkId = "returntissue"
* item[=].item[=].text = "Patient has requested return of body tissue"
* item[=].item[=].type = #boolean

* item[=].item[=].extension[+].url = $extractNotes
* item[=].item[=].extension[=].valueString = """
Extension on ServiceRequest
"""

* item[=].item[+].linkId = "admincomments"
* item[=].item[=].text = "Reviewer comments on admin"
* item[=].item[=].type = #text
* item[=].item[=].code = $canshareReview#admincomments "Admin comments"

* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-observationExtract"
* item[=].item[=].extension[=].valueBoolean = true

* item[=].item[=].extension[+].url = $usageNotes
* item[=].item[=].extension[=].valueString = """
Only used for reviewing a form
"""


/*
* item[=].item[+].linkId = "mdmreferral"
* item[=].item[=].text = "Refer for MDM assessment"
* item[=].item[=].type = #boolean

* item[=].item[+].linkId = "mdmreferraldisplay"
* item[=].item[=].text = "If checked, the system will generate a ServiceRequest for an MDM review"
* item[=].item[=].type = #display

*/
//==================  clinical information section

* item[+].linkId = "clinicalinfo"
* item[=].text = "Clinical Information"
* item[=].type = #group

// -------- smoking status 
* item[=].item[+].linkId = "ss"
* item[=].item[=].text = "Smoking Status"
* item[=].item[=].type = #choice
* item[=].item[=].code = $loinc#272166-2 "Smoking Status" 
* item[=].item[=].code.display = "Smoking Status" 

* item[=].item[=].answerOption[+].valueCoding = $ss-cs#current "Current smoker"
* item[=].item[=].answerOption[+].valueCoding  = $ss-cs#exlt1yr "Ex smoker less than 1 year"
* item[=].item[=].answerOption[+].valueCoding  = $ss-cs#exgt1yr "Ex smoker greater than 1 year"
* item[=].item[=].answerOption[+].valueCoding  = $ss-cs#never "Never smoked"




* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-observationExtract"
* item[=].item[=].extension[=].valueBoolean = true

* item[=].item[=].extension[+].url = $usageNotes
* item[=].item[=].extension[=].valueString = """
Refer to MOH guidelines
"""

// -------- vaping status
* item[=].item[+].linkId = "vs"
* item[=].item[=].text = "Vaping Status"
* item[=].item[=].type = #choice
* item[=].item[=].code = $loinc#272166-2 "Smoking Status" 
* item[=].item[=].code.display = "Vaping Status" 

* item[=].item[=].answerOption[+].valueCoding = $vs-cs#currentnic "Currently vaping with nicotine"
* item[=].item[=].answerOption[+].valueCoding = $vs-cs#currentnonic "Currently vaping without nicotine"
* item[=].item[=].answerOption[+].valueCoding = $vs-cs#current  "Currently vaping"
* item[=].item[=].answerOption[+].valueCoding = $vs-cs#exlt1yr "Ex vaping less than 1 year"
* item[=].item[=].answerOption[+].valueCoding = $vs-cs#exgt1yr "Ex vaping more than 1 year"
* item[=].item[=].answerOption[+].valueCoding = $vs-cs#trying  "Trying to give up vaping"
* item[=].item[=].answerOption[+].valueCoding = $vs-cs#never  "Never vaped"
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-observationExtract"
* item[=].item[=].extension[=].valueBoolean = true


//clincial presentation group - 4 column
* item[=].item[+].linkId = "clinpreso"
* item[=].item[=].text = "Clinical Presentation"
* item[=].item[=].type = #group

* item[=].item[=].extension[0].url = $column-count
* item[=].item[=].extension[=].valueInteger = 4


* item[=].item[=].item[+].linkId = "asymp"
* item[=].item[=].item[=].text = "Asymptomatic"
* item[=].item[=].item[=].code = $canshare#asymp "Asymptomatic presentation"
* item[=].item[=].item[=].type = #boolean
* item[=].item[=].item[=].extension[0].url = $column
* item[=].item[=].item[=].extension[=].valueInteger = 1

* item[=].item[=].item[+].linkId = "ppain"
* item[=].item[=].item[=].text = "Pelvic pain"
* item[=].item[=].item[=].type = #boolean
* item[=].item[=].item[=].code = $canshare#pp "Pelvic pain presentation"
* item[=].item[=].item[=].extension[0].url = $column
* item[=].item[=].item[=].extension[=].valueInteger = 2

* item[=].item[=].item[+].linkId = "bleed"
* item[=].item[=].item[=].text = "Abnormal bleeding"
* item[=].item[=].item[=].type = #boolean
* item[=].item[=].item[=].code = $canshare#abn "Abnormal bleeding presentation"

* item[=].item[=].item[=].extension[0].url = $column
* item[=].item[=].item[=].extension[=].valueInteger = 3

* item[=].item[=].item[+].linkId = "disch"
* item[=].item[=].item[=].text = "Persistant or abnormal discharge"
* item[=].item[=].item[=].type = #boolean
* item[=].item[=].item[=].code = $canshare#disch "Persistant or abnormal discharge"

* item[=].item[=].item[=].extension[0].url = $column
* item[=].item[=].item[=].extension[=].valueInteger = 4