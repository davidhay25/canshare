
I think I have a solution to the interoperability question between path form and lab / mdm. When the form is saved in canshare, 2 ServiceRequests (SR) are created - one to the lab and the other to MDM. The ServiceRequest has a reference to the QuestionnaireReport (form) and from there to the individual resources, should the external system require them (I'm actually guessing that the QR - which has all the data in one place - will be of more interest to them). 

The SR's can be directed to a given facility - or just there as a 'placeholder'.

When the lab receives the sample, they retrieve the SR using the NHI and category. The request below will retrieve all active ServiceRequests for a lab, along with the QR (form):

[host]/ServiceRequest?subject.identifier={nhi}&status=active&category=lab&_include=ServiceRequest:supportingInfo

When they have completed the report, they POST the DiagnosticReport / Observation into canshare and set the status of the ServiceRequest to completed. This has the side benefit of being able to ensure that the actions take place - if the SR status is not completed then there can be a manual follow up.
