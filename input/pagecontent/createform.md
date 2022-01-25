
### FHIR resources

The following graph shows the resources that represent a completed form on the FHIR server

<img style="width:500px; float:none" src="fhir-resources.png"/>

There are 4 'categories' of resource:
* The QuestionnaireResponse (QR) that represents the form as completed by the user. This ability to unambiguously identify what the user entered is likely to be medico-legally important, and difficult to establish in the absense of the QR
* Resources that were extracted from the QR during form submission. These are resources that need to be queried independently from the QR resource
* A Provenance resource that links the extracted resources to the QR from which they are extracted. This also supports form editing.

### Form creation process

This section describes how a form instance is created, completed by a user and saved to the FHIR server. There are 3 main stages:

1. Create Form UI
2. Generate QuestionnaireResponse
3. Process in custom operation


#### Create Form UI

The form filler renders the form to the user, performing any pre-population it can (based on information in the Q)

There are a couple of ways this can be done.

##### Generate the form from the Questionnaire

This is what the Reference Implementation does - it loads the Questionnaire (Q) from the forms manager and dynamically generates the HTML user interface from the Q. This approach is the most flexible, as generating a new form is simply a matter of creating the appropriate Q

##### Manually implement the form

In this situation, the user interface is created using whatever features the form filler has. This may be a completely manual process - in which case the Q acts as the detailed requirements - and the structure for the QR. Alternatively, the form filler may have some scaffolding ability, in which case the Q may be used to create that scaffolding algorithmically.

#### Generate form data instance

The form filler, accepts the data input and generates the form instance as a QuestionnaireResponse (QR) resource. The structure of the QR - ie the nesting of the individual items - is the same as the Q. The information entered by the user (or pre-populated) is present as answer elements in the QR items. The QR is submitted to the custom operation

#### Process the QR

The custom operation receives the QR, and retrieves the matching Q (this can be from the Forms Manager or some other process).

Using the information in the Q, the operation creates resources (generally Observations) from the data in the QR.

It also creates 2 additional resources from the QR content:
* A ServiceRequest resource that acts as the trigger for any workflow relating to the form. A Task would be another possibility - but ServiceRequest seems the best fit
* A Provenance resource that links the extracted resources to the QR from where they were created. The Provenance provides the creation history of the resources (who, when, source) as well as supporting the ability to edit the form (see below)

The resources are then saved in the FHIR server. In the Reference Implementation this is done by simply placing all the resources into a transaction bundle and posting to the server.

At this point, all resources - QR, extracted clinical resources and Provenance are saved on the FHOR server and can be queries using the usual FHIR API (as supported by the FHIR server)

### Updating a form

At times, it is necessary to amend a form that has been submitted and processed as there was an error of some sort during it's completion. Note that this is not the same as 'information evolution' - eg where a diagnosis changes after histological examination - as it is desirable to be able to track that change.

For this to be done, it must be possible to collect and potentially modify all the resources that were created as part of that form. This is one of the responsibilities of the Provenance resource.

There are a couple of strategies that could be used.

#### Simplistic update

* Retrieve the Provenance resource (Provenance.entity.role = 'source' will refer to the QR)
* Collect all extracted resources (Provenance.entity.role = 'derivation') and mark as deprecated. eg Observation.status = 'entered-in-error'
* Re-run extraction

#### Smarter update

* Retrieve the Provenance resource (Provenance.entity.role = 'source' will refer to the QR)
* Collect all extracted resources (Provenance.entity.role = 'derivation') 
* Run the extraction routine from the QR into areference bundle
* Run diff between existing and new into transaction (can do CRUD)
* Post the transaction 


At the time of writing, form update is not supported by the Reference Implementation.

### Designing a Questionnaire 

In this IG, the Questionnaire serves 2 main purposes:
* defining the form contents (including data types and terminologies)
* defining the resources that are to be extracted from a QR instance


This process is described in the SDC IG. 

For Observations, all that is needed is to have the Observation.code in the questionnaire item, and include the specific SDC extension in the item.

For other resources, the details needed in the item can vary.

The Reference Implementation currently supports Observation extraction