
Profile:        ObservationSS
Parent:         Observation
Id:             observation-ss
Title:          "Smoking Status"
Description:    "An observation for smoking status"

* ^url = "http://hl7.org.nz/fhir/StructureDefinition/spath-observation-ss"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^text.status = #additional
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Smoking Status Observation</div>"

* code = $canshare#ss (exactly)

* value[x] only CodeableConcept

* valueCodeableConcept from $ss-vs (required)


