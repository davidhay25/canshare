
### Reference Implementation

3 main apps.
* Dashboard. Concerned with environment aspects like Questionnaire design and Terminology
* EHR. A sample client. Contains a simple form rendering screen (form filler) and can show existing forms (QR) and query the FHIR server
* Forms receiver. An implementation of the forms processing including resource extraction.

It is expected that the EHR and Forms receiver will be replaced by 'production level' components - though will remain useful in the design and prototyping phases of new forms (including FHIR design aspects) and new functionality. The dashboard (which does not deal with patient data at all) will likely remain useful for production use.


### Dashboard

[Link](http://localhost:9090/dashboard.html) to app

<img style="width:100%; float:none" src="dashboard.png"/>

#### Demo process:
* Start with Questionnaire tab - demonstrate Q editing
  * Maintain a list of Q (Forms Manager) 
* Terminology tab. 
  * Idea that there is a collection of ValueSets in the environment - likely stored in national terminology server
    * Perhaps parse known Q to see what is in use
  * This tab allows exploration of a VS
  * Maybe a VS editor - though there are alternatives



### EHR

[Link](http://localhost:9090/ehr.html) to app

<img style="width:100%; float:none" src="ehr.png"/>


#### Demo process

* Start with new form
  * Select Q and enter data
  * Form tab
    * Terminology lookup
    * Observation extraction indicated
  * QR Tab
    * show QR being assembled
  * Test resource extraction
    * Can see what Observations will be extracted
  * Submit form
* Query resources tab
    * From RESTful query
    * Refresh and show increase in numbers
* Existing forms
  * Very basic ATM


