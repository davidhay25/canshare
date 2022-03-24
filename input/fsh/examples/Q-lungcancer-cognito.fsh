Alias: $egfr = http://canshare.com/CodeSystem/egfr

Instance: QLungCancerCognito
InstanceOf: Questionnaire
Description: "Questionnaire for Lung Cancer from cognito"

* url = "http://canshare.com/Questionnaire/QLungCancerCognito"
* status = #draft
* name = "QLungCancerCognito"
* title = "Lung cancer form from Cognito"
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Lung cancer form from Cognito</div>"
* text.status = #generated


//-----  administrative information

* item[+].linkId = "adminInfo"
* item[=].text = "Administrative Information"
* item[=].type = #group

* item[=].item[+].linkId = "test"
* item[=].item[=].text = "test"
* item[=].item[=].type = #string

* item[=].item[+].linkId = "cc"
* item[=].item[=].text = "Copy to"

* item[=].item[=].type = #reference
* item[=].item[=].code = $canshare#cc "CopyTo"
* item[=].item[=].code.display = "Copy to" 
* item[=].item[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-referenceResource"
* item[=].item[=].extension[=].valueCode = #Practitioner

//this is a new section
* item[+].linkId = "clinicalInfo"
* item[=].text = "Clinical Information"
* item[=].type = #group

//propcedure code
* item[=].item[+].linkId = "procCode"
* item[=].item[=].text = "Procedure code"
* item[=].item[=].type = #choice
* item[=].item[=].answerValueSet = "http://hl7.org/fhir/ValueSet/procedure-code"


//-------------  this starts a new group off the section
* item[=].item[+].linkId = "previousCytoGroup"
* item[=].item[=].text = "Previous cyto"
* item[=].item[=].type = #group

//the first question - the answer will trigger the conditional
* item[=].item[=].item[+].linkId = "previousCyto"
* item[=].item[=].item[=].text = "Result of any previous cytological investigations or biopsies"
* item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].answerOption[+].valueCoding = $yesnosystem#Y "Yes"
* item[=].item[=].item[=].answerOption[+].valueCoding = $yesnosystem#N "No"
* item[=].item[=].item[=].answerOption[+].valueCoding = $yesnosystem#asked-unknown "Unknown"

//specify rendering as radio...
//* item[=].item[=].item[=].extension[0].url = $control-radio
//* item[=].item[=].item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button


* item[=].item[=].item[+].linkId = "previousCytoDetails"
* item[=].item[=].item[=].text = "Details"
* item[=].item[=].item[=].type = #text

* item[=].item[=].item[=].enableWhen[0].question = "previousCyto"
* item[=].item[=].item[=].enableWhen[=].operator = #=
* item[=].item[=].item[=].enableWhen[=].answerCoding = $yesnosystem#Y


//---------- previous treatment ------------

* item[=].item[+].linkId = "previousTreatmentGroup"
* item[=].item[=].text = "Previous treatment"
* item[=].item[=].type = #group

//the first question - the answer will trigger the conditional
* item[=].item[=].item[+].linkId = "previousTreatment"
* item[=].item[=].item[=].text = "Result of any previous treatment"
* item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].answerOption[+].valueCoding = $yesnosystem#Y "Yes"
* item[=].item[=].item[=].answerOption[+].valueCoding = $yesnosystem#N "No"
* item[=].item[=].item[=].answerOption[+].valueCoding = $yesnosystem#asked-unknown "Unknown"

//specify rendering as radio...
* item[=].item[=].item[=].extension[0].url = $control-radio
* item[=].item[=].item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button


* item[=].item[=].item[+].linkId = "previousTreatmantDetails"
* item[=].item[=].item[=].text = "Details"
* item[=].item[=].item[=].type = #text

* item[=].item[=].item[=].enableWhen[0].question = "previousTreatment"
* item[=].item[=].item[=].enableWhen[=].operator = #=
* item[=].item[=].item[=].enableWhen[=].answerCoding = $yesnosystem#Y



Instance: QLungCancerCognitoResponse
InstanceOf: QuestionnaireResponse
Description: "A QR instance corresponding to the QLungCancerCognito Q"

* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>A sample Lung cancer form from Cognito</div>"
* text.status = #generated

* status = #completed
* questionnaire = "http://canshare.com/Questionnaire/QLungCancerCognito"
* subject = Reference(Patient/patient1)
* authored = 2022-01-18T12:00:00Z

* item[+].linkId = "clinicalInfo"
//* item[=].text = "Clinical Information"

//the previous cyto group
* item[=].item[+].linkId = "previousCytoGroup"
* item[=].item[=].text = "Previous cyto"

//the answer to the first question
* item[=].item[=].item[+].linkId = "previousCyto"
* item[=].item[=].item[=].answer.valueCoding = $yesnosystem#Y

* item[=].item[=].item[+].linkId = "previousCytoDetails"
* item[=].item[=].item[=].answer.valueString = "These are the details of the previous cytology"




/*
//place the 

* item[=].item[+].linkId = "egfr"
* item[=].item[=].text = "EGFR"
* item[=].item[=].type = #choice

* item[=].item[=].answerOption[+].valueCoding = $egfr#np "Not Performed"
* item[=].item[=].answerOption[+].valueCoding  =  $egfr#tf "Test failed"
* item[=].item[=].answerOption[+].valueCoding  =  $egfr#ind "Indeterminate"
* item[=].item[=].answerOption[+].valueCoding  =  $egfr#present "Mutation present"
* item[=].item[=].answerOption[+].valueCoding  =  $egfr#ansent "Mutation absent"


* item[=].item[+].linkId = "test-egfr"
* item[=].item[=].type = #string
* item[=].item[=].text = "test child"
* item[=].item[=].enableWhen[0].question = "egfr"
* item[=].item[=].enableWhen[=].operator = #=
* item[=].item[=].enableWhen[=].answerCoding = $egfr#np 

*/

/*

//this is a child item of the egfr that has conditional display rules. It is a gropu
* item[=].item[=].item[+].linkId = "egfr-np"
* item[=].item[=].item[=].type = #group
* item[=].item[=].item[=].enableWhen[0].question = "egfr"
* item[=].item[=].item[=].enableWhen[=].operator = #=
* item[=].item[=].item[=].enableWhen[=].answerCoding = $egfr#np 

//these are the items that will be displayed if the condition is met. They are child nodes of the conditional
* item[=].item[=].item[=].item[+].linkId = "test-egfr"
* item[=].item[=].item[=].item[=].type = #string
* item[=].item[=].item[=].item[=].text = "test child"

*/


/*


Here are the thoracic request pre-vis forms:
Lung - https://www.cognitoforms.com/TeAhoOTeKahu/LUNGTUMOURREQUESTFORM
Pleural/Pericardial - https://www.cognitoforms.com/TeAhoOTeKahu/PLEURALPERICARDIALTUMOURREQUESTFORM
Thymic/Mediastinal - https://www.cognitoforms.com/TeAhoOTeKahu/THYMICMEDIASTINALTUMOURREQUESTFORM


Here are the corresponding thoracic report pre-vis forms:
Lung - https://www.cognitoforms.com/TeAhoOTeKahu/LUNGCARCINOMAPROFORMAResectionsAndSmallDiagnosticSamples
Pleural/Pericardial - https://www.cognitoforms.com/TeAhoOTeKahu/PLEURALPERICARDIALCARCINOMAPROFORMA
Thymic/Mediastinal - https://www.cognitoforms.com/TeAhoOTeKahu/THYMICMEDIASTINALPROFORMA

*/