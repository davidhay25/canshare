
Profile:        CsQuestionnaireResponse
Parent:         QuestionnaireResponse
Id:             cs-QuestionnaireResponse
Title:          "QuestionnaireResponse for canShare"
Description:    "Describes the profile on QuestionnaireResponse"

* ^url = "http://hl7.org.nz/fhir/StructureDefinition/cs-QuestionnaireResponse"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^text.status = #additional
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>csQuestionnaireResponse</div>"

//required items
* authored 1..1
* author 1..1
* subject 1..1 
* questionnaire 1..1
* subject only Reference(Patient)


//not supported items
* identifier 0..0
* basedOn 0..0
* partOf 0..0
* encounter 0..0
* source 0..0