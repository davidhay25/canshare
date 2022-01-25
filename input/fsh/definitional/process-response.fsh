Instance: ProcessResponse
InstanceOf: OperationDefinition 
Description: "Process a completed QuestionnaireResponse. This could be the SDC one"

* url = "http://clinfhir.com/OperationDefinition/process-response"

* name = "ProcessForm"
* status = #draft
* kind = #operation
* code = #process-response
* system = false
* type = true
* instance = false
* comment = "Process a QR instance, extracting rsources as defined by the Questionnaire and create ServiceRequest and Provenance"
* parameter[+].name = #QR
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].type = #QuestionnaireResponse

* parameter[+].name = #result
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].type = #OperationOutcome