
CodeSystem:  SmokingStatus
Id: smoking-status
Title: "Smoking Status"

* ^url = $ss-cs

* #current "current" "The person is currently a smoker"
* #exlt1yr "Ex smoker less than 1 year"
* #never "never" "The person has never smoked."
* #exgt1yr "Ex smoker greater than 1 year"


ValueSet : AliasTypeSmokingStatus
Id: smoking-status
Title: "Smoking Status"

* ^url = $ss-vs
* codes from system $ss-cs 
