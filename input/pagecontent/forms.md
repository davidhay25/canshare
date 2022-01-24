
Describes the forms based input to the repository

Compliant with the [Structured Data Capture (SDC)](https://build.fhir.org/ig/HL7/sdc/) Implementation Guide


### Use Cases

#### Create a new form (EHR)

1. The Form Filler selects the template (Q) 
2. Any possible pre-pop occurs (defined in Q)
3. The form is completed by the user. Parking of forms if Form Filler supports
4. Completed data is sent as a QR to the Forms Receiver
5. Forms Receiver extracts and resources (currently Observations) and saves QR + resources in the repository. If a ServiceRequest was defined in the Q then it will be created to support workflow

#### Reviewing a patients current forms (EHR)

1. Query the Data server for all QR for the selected patient
2. Display the list as appropriate
3. Use the 'renderForm' service of the Forms Manager to display the form (or the EHR can do it directly)

#### Query extracted resources (EHR)

1. Use the supported FHIR queries to extract resources
2. Display as per EHR requirements

#### Determine provenance of extracted resources

1. Query the Provenance resource with an _revinclude to the resource in question

#### Design new Q or edit (Forms Manager - Dashboard in RI)

1. Select Q to edit or create new
2. Use tree based editor to edit form
3. If item is intended to be extracted as a resource, add appropriate extensions to item + add code
4. Save

**Can also add Q directly to Forms Manager - eg create from FSH**

### Key resources

#### Questionnaire


#### QuestionnaireResponse


### Extracting resources