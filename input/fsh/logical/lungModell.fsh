Logical:        LungModel
Title:          "Model for Lung cancer data"
Description:    "Model for Lung cancer data"
Parent:         Element

* ^url = "http://clinfhir.com/StructureDefinition/LungModel"

* patient 1..1 BackboneElement "Patient data"
  * ^comment = "The Patient resource"
  * NHI 1..1 identifier "NHI for the patient"
    * ^comment = "Will be in the Patient.identifier element"
  * familyName 0..1 string "Family name"
   // * ^mapping.map = "Patient.name.family"
  * givenName 0..* string "Given (first) names"
  * birthDate 0..1 date "Date of Birth"
  * gender 0..1 code "Gender"
  * birthSex 0..1 code "sex on birth certificate"
    * ^comment = "Patient.extension"
  * ethnicity 0..* CodeableConcept "Ethnicities (up to 6). Text element available if not coded"
    * ^comment = "An extension on the patient resource"
* administrative 1..1 BackboneElement "Administrative data"
  * identifier 0..1 Identifier "Client identifier for the request (not an integer)"
    * ^comment = "On the ServiceRequest. This is the identifier of the request - not the patient"
  * requestDate 1..1 dateTime "The date that the request was made"
    * ^comment = "ServiceRequest.date"
  * principalClinician 0..1 Identifier "The HPI of the main clinician looking after the patient" //todo
    * ^comment = "ServiceRequest.extension"
  * requestingClinician 1..1 Identifier "The physician or an organization HPI make the request"
    "The bundle will contain a Practitioner resource for the patient, so may include name, etc."
    * ^comment = "ServiceRequest.requester Actually a reference to a PractitionerRole resource, which will have the identifier."
  * requestingFacility  1..1 Identifier ""
    * ^comment = "From pracrole"
  * copyTo 0..* Identifier "People and Organizations to get a copy. HPI number"   //todo
    * ^comment = "ServiceRequest.extension"
* clinicalData 1..1 BackboneElement "Clinical information about the request"
  * smokingStatus 0..1 CodeableConcept "Smoking status"
    * ^comment = "Observation. code = ??"
  * smokingStatus from $ss-vs 
  * asbestos 0..1 CodeableConcept "Has there been asbestos exposure"
    * ^comment = "Observation. code = ??"
  * previousCytology 0..1 string "Details of previous cytology or biopsies for this tumour"
    "An Observation. needs to have coded yes / no / unknown and details"
    * ^comment = "Observation. code = ??"
  * previousTx 0..1 string "Details of previous treatment for this tumour"
    "An Observation. needs to have coded yes / no / unknown and details"
    * ^comment = "Observation. code = ??"
  * previousCancer 0..1 string "Any previous cancers"
    "An Observation. needs to have coded yes / no / unknown and details"
    * ^comment = "Observation. code = ??"
  * radiologyData 0..1 string "Any other relevant rediologic information"
    "Need 'unknown' as well as narrative"
    * ^comment = "Observation. code = ??"
  * otherClinicalData 0..1 string "Any other relevant information"
    * ^comment = "Observation. code = ??"
  * TNM 0..1 BackboneElement "Clinical TNM Classification"   //note http://hl7.org/fhir/us/mcode/StructureDefinition-mcode-tnm-clinical-stage-group.html 
    * T-stage 0..1 code "Clinical T (Tumour) stage" 
    * N-stage 0..1 code "Clinical N (Nodes) stage" 
    * M-stage 0..1 code "Clinical M (Metastasis) stage" 
    * group 1..1 code "Clinical group"
    * edition 1..1 code "Edition of TNM used"
    * date 1..1 date "Date evaluation done"
  * indication 0..1 CodeableConcept "Primary, recurrance, metastatic, other"
  * neoadjuvantTherapy 0..* BackboneElement "Information about therapies prior to procedure"
    * administered 0..1 boolean "Whether therapy was administered"
    * details 0..0 string "Details of therapy"
* procedure 0..* BackboneElement "Details of the procedure performed"
  * ^comment = "Procedure resource"
  * site 1..1 CodeableConcept "Where the procedure was performed"
  * type 1..1 CodeableConcept "Type of procedure - Bronchoscopic, Transthoracic, Frozed section, operative lung / pleura / mediastinum"
    * ^comment = "Procedure.category"
  * code 1..1 CodeableConcept "Specific procedure."
    * ^comment = "Procedure.code"
  * notes 0..1 string "Notes on procedure"
  * adjacentOrgans 0..1 BackboneElement "Are adjacent organs involved"
    * involved 0..1 boolean "Whether adjacent organs were involved"
    * details 0..1 string "Details of involvement"
  * surgicalOpinion 0..1 BackboneElement "Surgeon's opinion of local residual tumour post procedure"
    * residual 0..1 CodeableConcept "Whether residual is left behind"
    * notes 0..1 string "Notes on residual tumour"
* tumour 1..* BackboneElement "Data about the tumour."
  * site 1..1 CodeableConcept "Where the tumour is located"
  * notes 0..1 string "Notes on Tumour - eg expanding on site"
* specimen 1..* BackboneElement "Details about the specimen - including lymph nodes. can have reference to procedure & site & tumour"
  * ^comment = "Specimen"
  * identifier 0..1 Identifier "Specimen identifier"
  * type 0..1 CodeableConcept "eg lymph node, from tumour"
  * location 0..0 CodeableConcept "Where specimen was collected from"
  * specLabel 1..1 string "Specimen Label"
  * notes 0..1 string "General notes"
    * ^comment = "Specimen.container.extension (url=label)"
  * specReturn 0..1 boolean "Does the patient want the specimen returned"   
    * ^comment = "Specimen.extension (url = return)"  
  * image 0..* BackboneElement "Associated images with this specimen"
    * identifier 0..1 identifier "Image identifier"
    * image 1..1 Attachment "An image - photographic / hand drawn"
    * notes 0..1 string "Notes about the image"


/* Notes

TNM staging http://hl7.org/fhir/us/mcode/StructureDefinition-mcode-tnm-clinical-stage-group.html 

*/

/*
Mapping:  LMToBundle
Source:   http://clinfhir.com/StructureDefinition/LungModel
Target:   "http://clinfhir.com/Bundle"

* patient -> "Patient"

*/