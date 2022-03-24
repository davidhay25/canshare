/*

//Smoking status
Alias: $ss-vs = http://clinfhir.com/ValueSet/ss
Alias: $ss-cs = http://clinfhir.com/CodeSystem/ss

//site
Alias: $site-vs = http://clinfhir.com/ValueSet/site
Alias: $site-cs = http://clinfhir.com/CodeSystem/site

//resection
Alias: $resection-vs = http://clinfhir.com/ValueSet/resection
Alias: $resection-cs = http://clinfhir.com/CodeSystem/resection

*/
//general
Alias: $snomed = http://snomed.info/sct
Alias: $loinc = http://loinc.org
Alias: $ucum = http://unitsofmeasure.org
Alias: $canshare = http://canshare.com

Instance: QLungCancer
InstanceOf: Questionnaire
Description: "Questionnaire for Lung Cancer histology request"

* url = "http://clinfhir.com/Questionnaire/lungcancer"
* status = #draft
* name = "LungCancerHistologyRequest"
* title = "A form to capture data to accompany a histology request for lung cancer"


//========= administrative section
* item[+].linkId = "admin"
* item[=].text = "Administration"
* item[=].type = #group

//-------- principal
* item[=].item[+].linkId = "principalclinician"
* item[=].item[=].text = "Principal clinician caring for patient"
* item[=].item[=].type = #reference
* item[=].item[=].code = $canshare#principalclinician "Principal clinician"
* item[=].item[=].code.display = "Copy to" 
* item[=].item[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-referenceResource"
* item[=].item[=].extension[=].valueCode = #Practitioner

//-------- requesting clinician
* item[=].item[+].linkId = "requestingclinician"
* item[=].item[=].text = "Requesting clinician"
* item[=].item[=].type = #reference
* item[=].item[=].code = $canshare#requestingclinician "Requesting clinician"
* item[=].item[=].code.display = "Requesting clinician" 
* item[=].item[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-referenceResource"
* item[=].item[=].extension[=].valueCode = #Practitioner


//-------- copy to
* item[=].item[+].linkId = "cc"
* item[=].item[=].text = "Copy to"
* item[=].item[=].type = #reference
* item[=].item[=].code = $canshare#cc "CopyTo"
* item[=].item[=].code.display = "Copy to" 
* item[=].item[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-referenceResource"
* item[=].item[=].extension[=].valueCode = #Practitioner

//-------- requesting facility
* item[=].item[+].linkId = "requestingfacility"
* item[=].item[=].text = "Requesting facility"
* item[=].item[=].type = #reference
* item[=].item[=].code = $canshare#requestingfacility "Requesting facility"
* item[=].item[=].code.display = "Requesting facility" 
* item[=].item[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-referenceResource"
* item[=].item[=].extension[=].valueCode = #Organization

//-------- laboratory facility
* item[=].item[+].linkId = "laboratoryfacility"
* item[=].item[=].text = "Laboratory facility"
* item[=].item[=].type = #reference
* item[=].item[=].code = $canshare#laboratoryfacility "Laboratory facility"
* item[=].item[=].code.display = "Laboratory facility" 
* item[=].item[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-referenceResource"
* item[=].item[=].extension[=].valueCode = #Organization

//-------- copy to facility
* item[=].item[+].linkId = "ccfacility"
* item[=].item[=].text = "Copy to facility"
* item[=].item[=].type = #reference
* item[=].item[=].code = $canshare#ccfacility "CopyTo facility"
* item[=].item[=].code.display = "Copy to" 
* item[=].item[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-referenceResource"
* item[=].item[=].extension[=].valueCode = #Organization

* item[=].item[+].linkId = "mdmreferral"
* item[=].item[=].text = "Refer for MDM assessment"
* item[=].item[=].type = #boolean

* item[=].item[+].linkId = "mdmreferraldisplay"
* item[=].item[=].text = "If checked, the system will generate a ServiceRequest for an MDM review"
* item[=].item[=].type = #display


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


//asbestos

* item[=].item[+].linkId = "absestos"
* item[=].item[=].text = "Asbestos exposure"
* item[=].item[=].type = #choice

* item[=].item[=].answerOption[+].valueCoding = $yesnosystem#Y "Yes"
* item[=].item[=].answerOption[+].valueCoding = $yesnosystem#N "No"
//specify rendering as radio...
* item[=].item[=].extension[0].url = $control-radio
* item[=].item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button



/*

* item[=].item[+].linkId = "dx"
* item[=].item[=].text = "Diagnosis"
* item[=].item[=].type = #choice

* item[=].item[=].answerValueSet = "http://hl7.org/fhir/ValueSet/condition-code"
*/

//---------- presenting symptoms ------------

* item[=].item[+].linkId = "symptomsGroup"
* item[=].item[=].text = "Presenting symptomatology"
* item[=].item[=].type = #group

//the first question - the answer will trigger the conditional
* item[=].item[=].item[+].linkId = "symptoms"
* item[=].item[=].item[=].text = "Presenting symptoms"
* item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].answerOption[+].valueCoding = $yesnosystem#Y "Yes"
* item[=].item[=].item[=].answerOption[+].valueCoding = $yesnosystem#N "No"
* item[=].item[=].item[=].answerOption[+].valueCoding = $yesnosystem#asked-unknown "Unknown"

//specify rendering as radio...
* item[=].item[=].item[=].extension[0].url = $control-radio
* item[=].item[=].item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button

* item[=].item[=].item[+].linkId = "symptomsDetails"
* item[=].item[=].item[=].text = "Details"
* item[=].item[=].item[=].type = #text

* item[=].item[=].item[=].enableWhen[0].question = "symptoms"
* item[=].item[=].item[=].enableWhen[=].operator = #=
* item[=].item[=].item[=].enableWhen[=].answerCoding = $yesnosystem#Y


//-------------  previous cyto

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
* item[=].item[=].item[=].extension[0].url = $control-radio
* item[=].item[=].item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button


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


//---------- previous diagnosis ------------

* item[=].item[+].linkId = "previousDiagnosistGroup"
* item[=].item[=].text = "Previous diagnosis"
* item[=].item[=].type = #group

//the first question - the answer will trigger the conditional
* item[=].item[=].item[+].linkId = "previousDiagnosis"
* item[=].item[=].item[=].text = "Details of any previous diagnosis"
* item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].answerOption[+].valueCoding = $yesnosystem#Y "Yes"
* item[=].item[=].item[=].answerOption[+].valueCoding = $yesnosystem#N "No"
* item[=].item[=].item[=].answerOption[+].valueCoding = $yesnosystem#asked-unknown "Unknown"

//specify rendering as radio...
* item[=].item[=].item[=].extension[0].url = $control-radio
* item[=].item[=].item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button


* item[=].item[=].item[+].linkId = "previousDiagnosisDetails"
* item[=].item[=].item[=].text = "Details"
* item[=].item[=].item[=].type = #text

* item[=].item[=].item[=].enableWhen[0].question = "previousDiagnosis"
* item[=].item[=].item[=].enableWhen[=].operator = #=
* item[=].item[=].item[=].enableWhen[=].answerCoding = $yesnosystem#Y



//---------- relevant radiology ------------

* item[=].item[+].linkId = "radiologyGroup"
* item[=].item[=].text = "Relevant radiology"
* item[=].item[=].type = #group

//the first question - the answer will trigger the conditional
* item[=].item[=].item[+].linkId = "radiology"
* item[=].item[=].item[=].text = "Details of any relevant radiology"
* item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].answerOption[+].valueCoding = $snomed#unk "Unknown"
* item[=].item[=].item[=].answerOption[+].valueCoding = $snomed#tnm "Clinical TNM"
* item[=].item[=].item[=].answerOption[+].valueCoding = $snomed#other "Other"

//specify rendering as radio...
//* item[=].item[=].item[=].extension[0].url = $control-radio
//* item[=].item[=].item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button



* item[=].item[=].item[+].linkId = "radiologyOther"
* item[=].item[=].item[=].text = "Other relevant details"
* item[=].item[=].item[=].type = #text

* item[=].item[=].item[=].enableWhen[0].question = "radiology"
* item[=].item[=].item[=].enableWhen[=].operator = #=
* item[=].item[=].item[=].enableWhen[=].answerCoding = $snomed#other


* item[=].item[=].item[+].linkId = "clinicalT"
* item[=].item[=].item[=].text = "Clinical T "
* item[=].item[=].item[=].type = #string
* item[=].item[=].item[=].enableWhen[0].question = "radiology"
* item[=].item[=].item[=].enableWhen[=].operator = #=
* item[=].item[=].item[=].enableWhen[=].answerCoding = $snomed#tnm

* item[=].item[=].item[+].linkId = "clinicalN"
* item[=].item[=].item[=].text = "Clinical N"
* item[=].item[=].item[=].type = #string
* item[=].item[=].item[=].enableWhen[0].question = "radiology"
* item[=].item[=].item[=].enableWhen[=].operator = #=
* item[=].item[=].item[=].enableWhen[=].answerCoding = $snomed#tnm

* item[=].item[=].item[+].linkId = "clinicalM"
* item[=].item[=].item[=].text = "Clinical M"
* item[=].item[=].item[=].type = #string
* item[=].item[=].item[=].enableWhen[0].question = "radiology"
* item[=].item[=].item[=].enableWhen[=].operator = #=
* item[=].item[=].item[=].enableWhen[=].answerCoding = $snomed#tnm

* item[=].item[=].item[+].linkId = "clinicalGroupStage"
* item[=].item[=].item[=].text = "Clinical Group Stage"
* item[=].item[=].item[=].type = #string
* item[=].item[=].item[=].enableWhen[0].question = "radiology"
* item[=].item[=].item[=].enableWhen[=].operator = #=
* item[=].item[=].item[=].enableWhen[=].answerCoding = $snomed#tnm

* item[=].item[=].item[+].linkId = "clinicalTNMEdition"
* item[=].item[=].item[=].text = "Clinical TNM edition"
* item[=].item[=].item[=].type = #string
* item[=].item[=].item[=].enableWhen[0].question = "radiology"
* item[=].item[=].item[=].enableWhen[=].operator = #=
* item[=].item[=].item[=].enableWhen[=].answerCoding = $snomed#tnm

* item[=].item[=].item[+].linkId = "clinicalStageDate"
* item[=].item[=].item[=].text = "Clinical Stage date"
* item[=].item[=].item[=].type = #date
* item[=].item[=].item[=].enableWhen[0].question = "radiology"
* item[=].item[=].item[=].enableWhen[=].operator = #=
* item[=].item[=].item[=].enableWhen[=].answerCoding = $snomed#tnm

//---------- neoadjuvant ------------

* item[=].item[+].linkId = "neoadjuvantGroup"
* item[=].item[=].text = "Relevant neoadjuvant"
* item[=].item[=].type = #group

//the first question - the answer will trigger the conditional
* item[=].item[=].item[+].linkId = "neoadjuvant"
* item[=].item[=].item[=].text = "Details of any relevant neoadjuvant therapy"
* item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].answerOption[+].valueCoding = $yesnosystem#Y "Yes"
* item[=].item[=].item[=].answerOption[+].valueCoding = $yesnosystem#N "No"
* item[=].item[=].item[=].answerOption[+].valueCoding = $yesnosystem#asked-unknown "Unknown"

//specify rendering as radio...
* item[=].item[=].item[=].extension[0].url = $control-radio
* item[=].item[=].item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button


* item[=].item[=].item[+].linkId = "neoadjuvantDetails"
* item[=].item[=].item[=].text = "Details"
* item[=].item[=].item[=].type = #text

* item[=].item[=].item[=].enableWhen[0].question = "neoadjuvant"
* item[=].item[=].item[=].enableWhen[=].operator = #=
* item[=].item[=].item[=].enableWhen[=].answerCoding = $yesnosystem#Y

//Other clinical
* item[=].item[+].linkId = "otherclinical"
* item[=].item[=].text = "Other Clinical data "
* item[=].item[=].type = #text

//--------------- end of clinical section


//============== tumour clinical

* item[+].linkId = "tumourclinical"
* item[=].text = "Tumour Clinical"
* item[=].type = #group

* item[=].item[+].linkId = "tumourprocedure"
* item[=].item[=].text = "Procedure"
* item[=].item[=].type = #choice

* item[=].item[=].answerOption[+].valueCoding = #diag "Diagnostic (biopsy / cytology)"
* item[=].item[=].answerOption[+].valueCoding = #resec "Resection specimen (operative)"
* item[=].item[=].answerOption[+].valueCoding = #frozen "Frozen section"


* item[=].item[+].linkId = "tumourindication"
* item[=].item[=].text = "Clinical Indication"
* item[=].item[=].type = #choice

* item[=].item[=].answerOption[+].valueCoding = #new "New primary cancer"
* item[=].item[=].answerOption[+].valueCoding = #regional "Regional recurrance"
* item[=].item[=].answerOption[+].valueCoding = #distant "distant metastasis"
* item[=].item[=].answerOption[+].valueCoding = #other "Other"


//================ Tumour site section

* item[+].linkId = "tumoursitegroup"
* item[=].text = "Tumour Site"
* item[=].type = #group

* item[=].item[+].linkId = "tumoursite"
* item[=].item[=].text = "Tumour site"
* item[=].item[=].type = #choice
* item[=].item[=].answerOption[+].valueCoding = $site-cs#rul "Right Upper Lobe"
* item[=].item[=].answerOption[+].valueCoding = $site-cs#rml "Right Middle Lobe"
* item[=].item[=].answerOption[+].valueCoding = $site-cs#rll "Right Lower Lobe"
* item[=].item[=].answerOption[+].valueCoding = $site-cs#lul "Left Upper Lobe"
* item[=].item[=].answerOption[+].valueCoding = $site-cs#lll "Left Lower Lobe"
* item[=].item[=].answerOption[+].valueCoding = $site-cs#mb "Main Bronchus"


/*
* item[=].item[+].linkId = "tumournotes"
* item[=].item[=].text = "Notes"
* item[=].item[=].type = #text

* item[=].item[+].linkId = "newotes"
* item[=].item[=].text = "Notes"
* item[=].item[=].type = #text
*/

//=============== procedure

* item[+].linkId = "proc"
* item[=].text = "Procedure"
* item[=].type = #group



* item[=].item[+].linkId = "site"
* item[=].item[=].text = "Site and laterality"
* item[=].item[=].type = #choice


* item[=].item[=].answerOption[+].valueCoding = $site-cs#rul "Right Upper Lobe"
* item[=].item[=].answerOption[+].valueCoding = $site-cs#rml "Right Middle Lobe"
* item[=].item[=].answerOption[+].valueCoding = $site-cs#rll "Right Lower Lobe"
* item[=].item[=].answerOption[+].valueCoding = $site-cs#lul "Left Upper Lobe"
* item[=].item[=].answerOption[+].valueCoding = $site-cs#lll "Left Lower Lobe"
* item[=].item[=].answerOption[+].valueCoding = $site-cs#mb "Main Bronchus"

* item[=].item[+].linkId = "type"
* item[=].item[=].text = "Nature of procedure"
* item[=].item[=].type = #choice
* item[=].item[=].answerOption[+].valueCoding = $resection-cs#wedge "wedge"
* item[=].item[=].answerOption[+].valueCoding = $resection-cs#segmentectomy "segmentectomy"
* item[=].item[=].answerOption[+].valueCoding = $resection-cs#bilobectomy "bilobectomy"
* item[=].item[=].answerOption[+].valueCoding = $resection-cs#lobectomy "lobectomy"
* item[=].item[=].answerOption[+].valueCoding = $resection-cs#pneumonectomy "pneumonectomy"
* item[=].item[=].answerOption[+].valueCoding = $resection-cs#other "Other"

* item[=].item[+].linkId = "procCode"
* item[=].item[=].text = "Procedure code"
* item[=].item[=].type = #choice

* item[=].item[=].answerValueSet = "http://hl7.org/fhir/ValueSet/procedure-code"


* item[=].item[+].linkId = "procNotes"
* item[=].item[=].text = "Procedure notes"
* item[=].item[=].type = #text

* item[=].item[+].linkId = "adjOrgansInv"
* item[=].item[=].text = "Adjacent Organs involved"
* item[=].item[=].type = #boolean

* item[=].item[+].linkId = "adjOrgansDetails"
* item[=].item[=].text = "Details of adjacent Organs involvement"
* item[=].item[=].type = #text



//=============== specimen
* item[+].linkId = "specimen"
* item[=].text = "Specimen Information"
* item[=].type = #group

* item[=].item[+].linkId = "specLabel"
* item[=].item[=].text = "Specimen Label"
* item[=].item[=].type = #string

* item[=].item[+].linkId = "specReturn"
* item[=].item[=].text = "Patient requests specimen return"
* item[=].item[=].type = #boolean




/*

// Resection
CodeSystem:  Resection
Id: resection
Title: "Nature of the resection"

* ^url = $resection-cs

* #wedge "wedge"
* #segmentectomy "segmentectomy"
* #bilobectomy "bilobectomy"
* #lobectomy "lobectomy"
* #pneumonectomy "pneumonectomy"
* #other "Other"

ValueSet : Resection
Id: resection
Title: "Nature of the resection"

* ^url = $resection-vs
* codes from system $resection-cs

//site
CodeSystem:  Site
Id: site
Title: "Smoking Status"

* ^url = $site-cs

* #rul "Right Upper Lobe"
* #rml "Right Middle Lobe"
* #rll "Right Lower Lobe"
* #lul "Left Upper Lobe"
* #lll "Left Lower Lobe"
* #mb "Main Bronchus"

ValueSet : Site
Id: site
Title: "Site and laterality"

* ^url = $site-vs
* codes from system $site-cs

//smoking status
CodeSystem:  SmokingStatus
Id: smoking-status
Title: "Smoking Status"

* ^url = $ss-cs

* #current "current" "The person is currently a smoker"
* #ex "ex" "The person is an ex smoker."
* #never "never" "The person has never smoked."


ValueSet : AliasTypeSmokingStatus
Id: smoking-status
Title: "Smoking Status"

* ^url = $ss-vs
* codes from system $ss-cs

*/


/*



* item[=].item[+].linkId = "previousCx"
* item[=].item[=].text = "Details of any previous cytology or biopsies for this tumour"
* item[=].item[=].type = #text

* item[=].item[+].linkId = "previousTx"
* item[=].item[=].text = "Details of any previous treatment for this tumour"
* item[=].item[=].type = #text

* item[=].item[+].linkId = "previousCancer"
* item[=].item[=].text = "Details of any previous cancer diagnosis"
* item[=].item[=].type = #text

* item[=].item[+].linkId = "radiology"
* item[=].item[=].text = "Radiology info"
* item[=].item[=].type = #text

* item[=].item[+].linkId = "otherclinical"
* item[=].item[=].text = "Other clincial data of relevance"
* item[=].item[=].type = #text

* item[=].item[+].linkId = "egfr"
* item[=].item[=].text = "EGFR"
* item[=].item[=].type = #text




* item[+].linkId = "tnm"
* item[=].text = "Clinical TNM staging"
* item[=].type = #group

* item[=].item[+].linkId = "tstage"
* item[=].item[=].text = "T-stage"
* item[=].item[=].type = #string

* item[=].item[+].linkId = "nstage"
* item[=].item[=].text = "N-stage"
* item[=].item[=].type = #string

* item[=].item[+].linkId = "mstage"
* item[=].item[=].text = "M-stage"
* item[=].item[=].type = #string

* item[=].item[+].linkId = "tnmgroup"
* item[=].item[=].text = "TNM Group"
* item[=].item[=].type = #string

* item[=].item[+].linkId = "tnmedition"
* item[=].item[=].text = "TNM Edition"
* item[=].item[=].type = #string

* item[=].item[+].linkId = "tnmdate"
* item[=].item[=].text = "TNM Date"
* item[=].item[=].type = #date


*/