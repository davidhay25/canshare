### CanShare implementation guide


The CanShare program of work is intended to capture clinical information relating to Cancer diagnosis and treatment from a wide variety of sources and present data through a FHIR API.

It is a FHIR based repository of information. Data is saved - and exposed - as FHIR resources.

### High level

<img style="width:800px; float:none" src="canshare.png"/>

### Workflow

<img style="width:800px; float:none" src="workflow.png"/>


### First deliverable

The first deliverable is to support a forms based interface that captures data as resources in the repository. This IG uses an architecture that is compliant with the [SDC](https://build.fhir.org/ig/HL7/sdc/) Implementation guide, specifically supporting the [Resource extraction](http://build.fhir.org/ig/HL7/sdc/extraction.html) part of the guide. 

The SDC IG names a number of actors, of which the following are used in this guide (more detail is in the [SDC](http://build.fhir.org/ig/HL7/sdc/workflow.html))
* [Form Filler](http://build.fhir.org/ig/HL7/sdc/CapabilityStatement-sdc-form-filler.html) - the application that presents a form to a user, collects the input, and generates the QR
* [Form Receiver](http://build.fhir.org/ig/HL7/sdc/CapabilityStatement-sdc-form-receiver.html) - the application that receives forms for processing. In this IG, a custom operation is defined, as there are workflow components to the forms processing, so an Operation makes that clear.


This guide uses the [Questionnaire](http://hl7.org/fhir/questionnaire.html) (Q) and [QuestionnaireResponse](http://hl7.org/fhir/questionnaireresponse.html) (QR) resources to define the form and represent a completed form respectively. In addition to the form content and structure, the Questionnaire resources also contains the markers to allow detail resources to be extracted during form submission. These are primarily [Observation](http://hl7.org/fhir/observation.html) resources, but any resource type is feasible such as [Procedure](http://hl7.org/fhir/procedure.html) and [ServiceRequest](http://hl7.org/fhir/servicerequest.html).

A [custom operation](OperationDefinition-ProcessForm.html) is defined to perform the Form Receiver role, as the processing that is needed is more than resource creation. Specifically, there are workflow and provenance elements of the processing - creating a [ServiceRequest](http://hl7.org/fhir/servicerequest.html) and [Provenance](http://hl7.org/fhir/provenance.html) resource respectively. 

This approach makes it much simpler for the application presenting the form to the user (the Form Filler role), making it easier to introduce new forms and following the FHIR philosophy of moving complexity to the server. Even if the Form Filler cannot consume the Q directly, they only need produce a single resource - the QuestionnaireResponse - and the Q becomes the technical requirements (eg terminology bindings).

Using the SDC approach over the alternative architecture of having the Form Filler create the bundle directly brings a number of advantages.
* It is much easier on the client, as creating a bundle with all the needed resources to represent a form is not straightforward. In addition, not all the elements in a form need to be in a discrete resource. 
* Each new form type would require a complete re-design of the bundle contents, making the infrastructure less scalable from a design perspective. In the SDC approach, the design work (including the extracted FHIR information model) is represented in the Q.
* The Questionnaire makes the form design explicit and computable, even if the Form Filler cannot utilize it directly
* There are medico-legal aspects to a form completed by a clinician, making it important to be able to re-produce the form if needed, and to support corrections. This is what the QR provides.
* The SDC IG has been designed and tested at connectathon over a number of years for this exact purpose. It makes sense to take advantage of this work.


An example of a Questionnaire is the [Lung cancer](Questionnaire-QLungCancer.html) questionnaire
A sample [QuestionnaireResponse](QuestionnaireResponse-QLungCancerInstance.html) is also available

A description of the process of creating a form is found [here](createform.html). This does not cover the Q authoring process

> It is important to emphasise that the Form Filler does not have to read the Q directly and render a UI from that resource. It is
quite feasible for the Form Filler to generate the form manually (using the Q as the technical requirements) and simply generate the appropriately structured QR on form completion. Obviously, this will be more time consuming than using the Q directly, but this may be necessary depending on the capabilities of the application.

#### Resource extraction
The SDC IG describes how any resource type can be extracted from the QR by the form filler. It describes 3 possible methods.

* Observation extraction is the most straightforward (and common). The Q designer simply adds an extension to the item, and the Observation can be created from the information in the QR item. This is currently supported in the Reference Implementation.
* Definition based will create any resource. In this IG, likely candidates are Procedure, Condition and ServiceRequest. This will be added to the Reference Implementation.
* StructureMap based is also described, but won't be used in this IG.


### External ecosystem

The CanShare application does not exist in a silo - rather it is part of an ecosystem, some of the components of which are shown below.

<img style="width:800px; float:none" src="ecosystem.png"/>

Not all of these interfaces and services will be used in the first deliverable.

### Reference Implementation

As the overall architecture of a flexible forms infrastructure can be complex, and it is likely that requirements will evolve over the course of the project, a Reference Implementation (RI) has been developed to show the key aspects of the design. 

There are 3 key parts of the RI:
* The Dashboard incorporates a simple Questionnaire designer as well as views of other aspects of the environment such as the terminology
* The EHR is a sample client application that hosts the Form Filler role. It retrieves Q resources from the Forms Manager, presents a simple UI to the user and constructs the QR which is send to the Forms receiver.
* The Forms Receiver is a service that hosts the custom operation and saves the resources to a local FHIR server

The RI also accesses a number of services - notably a Terminology server

The RI serves a number of purposes:
* To demonstrate the validity of the approach
* Clarify design by testing
* Develop FHIR design aspects - eg supporting Episodes of Care by entering sample data
* Create an environment within which application developers (such as Form Fillers) can operate during the development phase.
* Useful to show new/potential customers what the environment can do
* Empower designers and clinicians developing Questionnaires

### Security 

There are no specific security requirements of this IG. There are some notes that are applicable in the [SDC security](http://build.fhir.org/ig/HL7/sdc/security.html) section

### Focus of IG

This IG is focussed on the FHIR infrastructure supporting the CanShare initiative, rather than the individual Questionnaires that will be created within it.  