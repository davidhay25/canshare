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

Instance: QLungCancer
InstanceOf: Questionnaire
Description: "Questionnaire for Lung Cancer histology request"

* url = "http://clinfhir.com/Questionnaire/lungcancer"
* status = #draft
* name = "LungCancerHistologyRequest"
* title = "A form to capture data to accompany a histology request for lung cancer"



//-----  clinical information


* item[+].linkId = "clinicalinfo"
* item[=].text = "Clinical Information"
* item[=].type = #group



* item[=].item[+].linkId = "ss"
* item[=].item[=].text = "Smoking Status"
* item[=].item[=].type = #choice
* item[=].item[=].code = $loinc#272166-2
* item[=].item[=].code.display = "Smoking Status" 

* item[=].item[=].answerOption[+].valueCoding = $ss-cs#current "current"
* item[=].item[=].answerOption[+].valueCoding  = $ss-cs#ex "ex"
* item[=].item[=].answerOption[+].valueCoding  = $ss-cs#never "never"

* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-observationExtract"
* item[=].item[=].extension[=].valueBoolean = true


* item[=].item[+].linkId = "absestos"
* item[=].item[=].text = "Asbestos exposure"
* item[=].item[=].type = #boolean

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


* item[+].linkId = "tumour"
* item[=].text = "Tumour Information"
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

* item[=].item[+].linkId = "tumournotes"
* item[=].item[=].text = "Notes"
* item[=].item[=].type = #text

//--------- specimen
* item[+].linkId = "specimen"
* item[=].text = "Specimen Information"
* item[=].type = #group

* item[=].item[+].linkId = "specLabel"
* item[=].item[=].text = "Specimen Label"
* item[=].item[=].type = #string

* item[=].item[+].linkId = "specReturn"
* item[=].item[=].text = "Patient requests specimen return"
* item[=].item[=].type = #boolean


* item[+].linkId = "admin"
* item[=].text = "Administration"
* item[=].type = #group

* item[=].item[+].linkId = "mdmreferral"
* item[=].item[=].text = "Refer for MDM assessment"
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