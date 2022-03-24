### Questionnaire Structure

The [Questionnaire](http://hl7.org/fhir/questionnaire.html) has a specific structure

Items off the root of the resource are regarded as section items. They are of type 'group' and contain the nested items within them (no answers). When rendered on the form, they will be 'tabs' with their child items within them.

Items off the section can be of any type. If they are of type 'group' then they represent a related set of items - commonly used in show/hide behaviours. A group will contain the nested items within it - a single level only. When rendered, the first item in the group will appear in the left pane, the others in the right (to facilitate the show/hide sructure)

Any other items outside of this structure will be ignored.

Note that an application that is providing a form compliant to this spec is not obliged to present the form in the same way as the Refernce Implementation. It is free to have the UI in any way that it wishes. However, the resultant QuestionnaireResponse that represents the form contents **must** follow the Questionnaire structure.

#### Show / Hide

Show / Hide is implemented through the '[item.enableWhen](http://hl7.org/fhir/questionnaire-definitions.html#Questionnaire.item.enableWhen)' element. At the time of writing, only Coding comparisons are supported.

#### QuestionnaireResponse

The QuestionnaireResponse represents the results of a specific form - a form instance. It has the url of the Questionnaire in the [.questionnaire](http://hl7.org/fhir/questionnaireresponse-definitions.html#QuestionnaireResponse.questionnaire) element. Note that this is a [canonical reference](http://hl7.org/fhir/references.html#canonical) (ie the url of the Questionnaire) rather than an inter-resource reference that uses the resource logical id.

It **must** have the same structure as the Questionnaire from which it is derived.

This can be checked using the $validate operation against the QuestionnaireResponse endpoint - provided that the server implememting the validate also has a copy of the Questionnaire. 