
Instance:   dataserverCS
InstanceOf: CapabilityStatement
Title:          "Data Server Capability Statement"
Description:    "Represents API exposed by the Data Server"
Usage: #definition

* jurisdiction.coding = urn:iso:std:iso:3166#NZ

* text.status = #additional
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Data Server capabilities</div>"

* name = "DS_CapabilityStatement"
* title = "Capability Statement describing Data Server FHIR APIs"
* description = """
This is the computable resource that describes the RESTful endpoint
"""

* date = "2020-04-01"
* status = #draft
* kind = #instance
* fhirVersion = #4.0.1
* format = #json

* implementation.description = "The Data Server endpoint"
* implementation.url = ""

* rest.mode = #server
