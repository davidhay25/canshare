// PROFILES 

Profile: ActNowCompleteComposition
Parent: Composition
Id: actnow-complete
Title: "ActNow review Composition"
Description: "Defines the ActNow review composition"

* ^url = "https://aehrc.com/fhir/StructureDefinition/actnow-complete"
//* status = #draft

* type = http://loinc.org#11503-0 "Medical Records"
* subject 1..1      //there must be a subject
// - maybe nz patient* subject only Reference(https://aehrc.com/fhir/StructureDefinition/AUPrimaryCarePatient)

* title = "complete document"

//discriminator for the sections - slice on the section code...
* section ^slicing.discriminator.type = #value
* section ^slicing.discriminator.path = "code.coding.code"
* section ^slicing.rules = #open

* section contains 
    cancerDetails 1..1 and
    clinicalTNM 0..1 and
    pathologicalTNM 0..1 and
    otherStaging 0..1 and
    prognosticScoring 0..1 and
    regimen 0..1

* section.section 0..0          //can't have sub sections
* section.emptyReason 0..0      //and no empty reason on the sections


* section[cancerDetails].code.coding.system = "http://loinc.org"
* section[cancerDetails].code.coding.code = #11348-0 (exactly)
* section[cancerDetails].mode = #snapshot
* section[cancerDetails].entry MS
