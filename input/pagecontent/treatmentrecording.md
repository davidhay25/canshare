### Recording treatment

### Workflow

The following diagram shows the overall workflow - from pathologt request to treatment. The models on this
page correspond to the summaries in the track labelled "Systemic therapy provider" and describe how summary
data is sent from the source system to CanShare.

<img style="width:800px; float:none" src="workflow.png"/>

There are 3 main interactions where data is sent from the external system to canShare.


#### Review

This model represents the data collected by the external system when the patient is first referred to the treatment provider. It could also represent a review done at any time.

[Logical Model](StructureDefinition-ActNowReview.html)

#### Deliver care

This model represents a summary of care delivered over some period. It could encompass one or more physical encounters. Primarily, this represents the administration of medication.

[Logical Model](StructureDefinition-ActNowDeliver.html)


#### Update plan of care

When there is a change to the plan of care, this model represents the data collected. Often, this will be a change to the regimen that is used and contains information about why the previous regimen was discontinued, a summary of treatment given under that regimen, and the new one.

[Logical Model](StructureDefinition-ActNowUpdate.html)
