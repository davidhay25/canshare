
Instance:   formsManagerCS
InstanceOf: CapabilityStatement
Title:          "Forms Manager CapabilityStatement"
Description:    "API exposed by Forms Manager"
Usage: #definition

* jurisdiction.coding = urn:iso:std:iso:3166#NZ

* text.status = #additional
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Forms Manager capabilities</div>"

* name = "FM_CapabilityStatement"
* title = "Capability Statement describing Forms Manager"
* description = """
This is the computable resource that describes the RESTful endpoint
"""

* date = "2020-04-01"
* status = #draft
* kind = #instance
* fhirVersion = #4.0.1
* format = #json

* implementation.description = "Forms Manager"
* implementation.url = ""

* rest.mode = #server


* rest.resource.type = #Questionnaire

* rest.resource.documentation = """
Questionnaire query

"""

//read by id
* rest.resource.interaction.code = #read
* rest.resource.interaction.documentation = "Used to retrieve a Practitioner resource by Id."

//search by various parameters
* rest.resource.interaction[1].code = #search-type
* rest.resource.interaction[1].documentation = ""
