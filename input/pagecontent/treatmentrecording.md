### Recording treatment

### Workflow

The following diagram shows the overall workflow - from pathologt request to treatment. The models on this
page correspond to the summaries in the track labelled "Systemic therapy provider" and describe how summary
data is sent from the source system to CanShare.

<img style="width:800px; float:none" src="workflow.png"/>

There are 3 main interactions where data is sent from the external system to canShare. Currently, the data flow is from external system to CanShare only. For each interaction type, there is (or will be)

* A Logical Model that represents the information that could be present in the interaction. There will be overlap between the models for common elements - eg the chosen regimens or TNM status
* A mapping table that indicates how the information in the logical model maps to FHIR artifacts
* A profile on Composition to provide the overall structure of the interaction
* Examples


#### Review

This model represents the data collected by the external system when the patient is first referred to the treatment provider. It could also represent a review done at any time.

[Logical Model](StructureDefinition-ActNowReview.html)

[Mapping to resources](ActNowReviewmapping.html)

#### Deliver care

This model represents a summary of care delivered over some period. It could encompass one or more physical encounters. Primarily, this represents the administration of medication.

[Logical Model](StructureDefinition-ActNowDeliver.html)


#### Update plan of care

When there is a change to the plan of care, this model represents the data collected. Often, this will be a change to the regimen that is used and contains information about why the previous regimen was discontinued, a summary of treatment given under that regimen, and the new one.

[Logical Model](StructureDefinition-ActNowUpdate.html)
