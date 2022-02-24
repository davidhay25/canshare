//ask for examples

Logical:        ActNowReview
Title:          "Model for recording the review of the treatment plan"
Description:    "Records chemotherapy given "
Parent:         Element

* ^url = "http://clinfhir.com/StructureDefinition/actnowreview"

* patient 1..1 BackboneElement "Patient demographics"
  * nhi 1..1 Identifier "The patients NHI number"

    // use Composition to group elements. Profile on Composition with sliced section
* dxDate 1..1 date "The date the diagnosis was made"
* primarySite 1..1 CodeableConcept "The primary site of the cancer"
* histology 1..1 CodeableConcept "The histologic cancer type"
* laterality 0..1 CodeableConcept "Laterality of tumour ?is this needed - is it part of site"
* grade 0..1 CodeableConcept "Cancer grading. Includes system and version"
* recurrance 0..1 BackboneElement "Recurrance information"
  * type 0..1 CodeableConcept "Type of recurrance"
  * date 0..1 date "Date of recurrance"
* clinicalTNM 0..1 BackboneElement "Clinical TNM Classification"   //note http://hl7.org/fhir/us/mcode/StructureDefinition-mcode-tnm-clinical-stage-group.html 
  * T-stage 0..1 code "Clinical T (Tumour) stage" 
  * N-stage 0..1 code "Clinical N (Nodes) stage" 
  * M-stage 0..1 code "Clinical M (Metastasis) stage" 
  * group 1..1 code "Clinical group"
  * edition 1..1 code "Edition of TNM used"
  * date 1..1 date "Date evaluation done"
* pathologicalTNM 0..1 BackboneElement "Clinical TNM Classification"   //note http://hl7.org/fhir/us/mcode/StructureDefinition-mcode-tnm-clinical-stage-group.html 
  * T-stage 0..1 code "Clinical T (Tumour) stage" 
  * N-stage 0..1 code "Clinical N (Nodes) stage" 
  * M-stage 0..1 code "Clinical M (Metastasis) stage" 
  * group 1..1 code "Clinical group"
  * edition 1..1 code "Edition of TNM used"
  * date 1..1 date "Date evaluation done"
* otherStaging 0..1 BackboneElement "Other staging"  
  * groupStage 1..1 code "The cancer group stage, using a system other than TNM"
  * basis 1..1 code "The basis of the Other staging group stage"
  * system 1..1 date "The other staging system used to stage the cancer"
  * edition 1..1 code "The other staging system edition used to stage the cancer"
* prognosticScoring 0..* BackboneElement "Prognostic scoring"  
  * score 1..1 code "Prognostic score"
  * system 1..1 date "Scoring system"
  * edition 1..1 code "Edition of score"
* regimen 0..1 BackboneElement "Initial regimen to use"  
  * ECOG 0..1 integer "ECOG score at start of regimen"
  * url 1..1 string "Url of regimen"
  * intent 0..1 code "Intent of treatment"
  * clinicalTrial 0..1 boolean "Is this a clinical trial regimen"


Logical:        ActNowDeliver
Title:          "Model for recording the delivery of care"
Description:    "Records chemotherapy given - a MedicationAdministration resource "
Parent:         Element

* ^url = "http://clinfhir.com/StructureDefinition/actnowdeliver"

* patient 1..1 BackboneElement "Patient demographics"
  * nhi 1..1 Identifier "The patients NHI number"
* medication 1..* BackboneElement "details of medications administered - in MedicationAdministration resource"
  * startDate 1..1 dateTime "The date and time administration started"
  * endDate 1..1 dateTime "The date and time administration ended"
  * regimen 0..1 url "Url of the regimen that this medication was administered under"
  * cycleDay 1..1 integer "The day of the cycle that this administrato"
  * medication 1..1 CodeableConcept "The medication given"
  * prescribedDose 0..1 string "The prescribed dosage (Dosage datatype)"
  * administeredDose 0..1 string "The administered dosage (Dosage datatype)"
  * doseAdjustmentReason 0..1 CodeableConcept "The reason the dose was adjusted from prescribed"
  * route 1..1 CodeableConcept "The route of administration"
* creatinine 1..* BackboneElement "Creatinine clearance results"
  * value 1..1 Quantity  "Value of creatinine clearance"
  * date 1..1 dateTime "Date sample taken"



Logical:        ActNowUpdate
Title:          "Model for recording an update to the plan of care"
Description:    "Records chemotherapy given - a MedicationAdministration resource "
Parent:         Element

* ^url = "http://clinfhir.com/StructureDefinition/actnowupdate"

* patient 1..1 BackboneElement "Patient demographics"
  * nhi 1..1 Identifier "The patients NHI number"
* regimen 0..1 BackboneElement "change to regimen"  
  * ECOG 0..1 integer "ECOG score at start of regimen"
  * url 1..1 string "Url of regimen"
  * intent 0..1 code "Intent of treatment"
  * clinicalTrial 0..1 boolean "Is this a clinical trial regimen"
  * discontinue 0..1 BackboneElement "If the regimen was discontinued"  
    * date 0..1 date "Date discontinued"
    * reason 0..1 CodeableConcept "Reason discontinued"
    * patientFactors 0..* CodeableConcept "patient reasons for discontinuation"
    * toxicity 0..* CodeableConcept "toxicity reasons"
  * cycleCount 0..1 integer "Number of cycles completed"


