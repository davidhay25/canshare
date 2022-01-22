
Instance:   formsReceiverCS
InstanceOf: CapabilityStatement
Title:          "Forms Receiver CapabilityStatement"
Description:    "API exposed by Forms Reciever"
Usage: #definition

* jurisdiction.coding = urn:iso:std:iso:3166#NZ

* text.status = #additional
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Forms Receiver capabilities</div>"

* name = "FR_CapabilityStatement"
* title = "Capability Statement describing the API exposed by Forms Reciever"
* description = """
This is the computable resource that describes the RESTful endpoint
"""

* date = "2020-04-01"
* status = #draft
* kind = #instance
* fhirVersion = #4.0.1
* format = #json

* implementation.description = "Forms Reciever"
* implementation.url = ""



* rest.mode = #server



