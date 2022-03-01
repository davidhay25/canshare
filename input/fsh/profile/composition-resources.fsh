// PROFILES 

Profile: ActNowReviewComposition
Parent: Composition
Id: actnow-review
Title: "ActNow review Composition"
Description: "Defines the ActNow review composition"

* ^url = "https://aehrc.com/fhir/StructureDefinition/actnow-review"
//* status = #draft

* type = http://loinc.org#11503-0 "Medical Records"
* subject 1..1      //there must be a subject
// - maybe nz patient* subject only Reference(https://aehrc.com/fhir/StructureDefinition/AUPrimaryCarePatient)

* title = "Review document"

//discriminator for the sections - slice on the section code...
* section ^slicing.discriminator.type = #value
* section ^slicing.discriminator.path = "code.coding.code"
* section ^slicing.rules = #open

* section contains 
    cancerDetails 1..1 
/*
    adverseReactionList 1..1 and
    vaccinationList 1..1 and
    medicineList 1..1 and
    clinicalSynopsis 0..1 and
    familyHistory 0..1 and
    socialHistory 0..1
*/
//* section 1..*
* section.section 0..0          //can't have sub sections
* section.emptyReason 0..0      //and no empty reason on the sections


* section[cancerDetails].code.coding.system = "http://loinc.org"
* section[cancerDetails].code.coding.code = #11348-0 (exactly)
* section[cancerDetails].mode = #snapshot
//* section[cancerDetails].entry only Reference(https://aehrc.com/fhir/StructureDefinition/AUPrimaryCareMedicalHistoryList | https://aehrc.com/fhir/StructureDefinition/AUPrimaryCareProcedureList | https://aehrc.com/fhir/StructureDefinition/AUPrimaryCareProblemList)
* section[cancerDetails].entry MS

/* - temp

//* section contains adverseReactionList 1..1
* section[adverseReactionList].code.coding.system = "http://loinc.org"
* section[adverseReactionList].code.coding.code = #48765-2 (exactly)
* section[adverseReactionList].mode = #snapshot
* section[adverseReactionList].entry only Reference(https://aehrc.com/fhir/StructureDefinition/AUPrimaryCareAllergyIntoleranceList)
* section[adverseReactionList].entry MS

//* section contains vaccinationList 1..1
* section[vaccinationList].code.coding.system = "http://loinc.org"
* section[vaccinationList].code.coding.code = #41291-6 (exactly)
* section[vaccinationList].code.coding.display = "Immunization"
* section[vaccinationList].mode = #snapshot
* section[vaccinationList].entry only Reference(https://aehrc.com/fhir/StructureDefinition/AUPrimaryCareImmunisationList)
* section[vaccinationList].entry MS

//* section contains medicineList 1..1
* section[medicineList].code.coding.system = "http://loinc.org"
* section[medicineList].code.coding.code = #10160-0 (exactly) 
* section[medicineList].mode = #snapshot
* section[medicineList].entry only Reference(https://aehrc.com/fhir/StructureDefinition/AUPrimaryCareMedicineList)
* section[medicineList].entry MS

//* section contains clinicalSynopsis 0..1
* section[clinicalSynopsis].code.coding.userSelected = false
* section[clinicalSynopsis].code.coding.system = "http://loinc.org"
* section[clinicalSynopsis].code.coding.code = #11329-0 (exactly)
* section[clinicalSynopsis].code.coding.display = "History general"
* section[clinicalSynopsis].mode = #snapshot
* section[clinicalSynopsis].text MS

//* section contains familyHistory 0..1
* section[familyHistory].code.coding.system = "http://loinc.org"
* section[familyHistory].code.coding.code = #10157-6 (exactly)
* section[familyHistory].mode = #snapshot
* section[familyHistory].entry MS

//* section contains socialHistory 0..1
* section[socialHistory].code.coding.system = "http://loinc.org"
* section[socialHistory].code.coding.code = #29762-2 (exactly)
* section[socialHistory].mode = #snapshot
* section[socialHistory].entry only Reference(https://aehrc.com/fhir/StructureDefinition/AUPrimaryCareSocialHistoryList)
* section[socialHistory].entry MS

*/