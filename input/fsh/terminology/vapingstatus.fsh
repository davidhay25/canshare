
CodeSystem:  VapingStatus
Id: vaping-status
Title: "Vaping Status"

* ^url = $vs-cs

* #currentnic  "Currently vaping with nicotine"
* #currentnonic "Currently vaping without nicotine"
* #current  "Currently vaping"
* #exlt1yr "Ex vaping less than 1 year"
* #exgt1yr "Ex vaping more than 1 year"
* #trying   "Trying to give up vaping"
* #never  "Never vaped"

ValueSet : VapingStatus
Id: vaping-status
Title: "Vaping Status"

* ^url = $vs-vs
* codes from system $vs-cs 
