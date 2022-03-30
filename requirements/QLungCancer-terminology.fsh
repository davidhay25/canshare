

linkId itemCode text


* answerOption[+].valueCoding = system#code display


ss 272166-2 Smoking Status


* item[=].item[=].answerOption[+].valueCoding = http://clinfhir.com/CodeSystem/ss#current Current smoker
* item[=].item[=].answerOption[+].valueCoding = http://clinfhir.com/CodeSystem/ss#exlt1yr Ex smoker less than 1 year
* item[=].item[=].answerOption[+].valueCoding = http://clinfhir.com/CodeSystem/ss#exgt1yr Ex smoker greater than 1 year
* item[=].item[=].answerOption[+].valueCoding = http://clinfhir.com/CodeSystem/ss#never Never smoked


vs 272166-2 Vaping Status


* item[=].item[=].answerOption[+].valueCoding = http://canshare.com/CodeSystem/vs#currentnic Currently vaping with nicotine
* item[=].item[=].answerOption[+].valueCoding = http://canshare.com/CodeSystem/vs#currentnonic Currently vaping without nicotine
* item[=].item[=].answerOption[+].valueCoding = http://canshare.com/CodeSystem/vs#current Currently vaping
* item[=].item[=].answerOption[+].valueCoding = http://canshare.com/CodeSystem/vs#exlt1yr Ex vaping less than 1 year
* item[=].item[=].answerOption[+].valueCoding = http://canshare.com/CodeSystem/vs#exgt1yr Ex vaping more than 1 year
* item[=].item[=].answerOption[+].valueCoding = http://canshare.com/CodeSystem/vs#trying Trying to give up vaping
* item[=].item[=].answerOption[+].valueCoding = http://canshare.com/CodeSystem/vs#never Never vaped


absestos undefinedCode Asbestos exposure


* item[=].item[=].answerOption[+].valueCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y Yes
* item[=].item[=].answerOption[+].valueCoding = http://terminology.hl7.org/CodeSystem/v2-0136#N No


symptoms undefinedCode Presenting symptoms


* item[=].item[=].item[=].answerOption[+].valueCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y Yes
* item[=].item[=].item[=].answerOption[+].valueCoding = http://terminology.hl7.org/CodeSystem/v2-0136#N No
* item[=].item[=].item[=].answerOption[+].valueCoding = http://terminology.hl7.org/CodeSystem/v2-0136#asked-unknown Unknown


previousCyto undefinedCode Result of any previous cytological investigations or biopsies


* item[=].item[=].item[=].answerOption[+].valueCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y Yes
* item[=].item[=].item[=].answerOption[+].valueCoding = http://terminology.hl7.org/CodeSystem/v2-0136#N No
* item[=].item[=].item[=].answerOption[+].valueCoding = http://terminology.hl7.org/CodeSystem/v2-0136#asked-unknown Unknown


previousTreatment undefinedCode Result of any previous treatment


* item[=].item[=].item[=].answerOption[+].valueCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y Yes
* item[=].item[=].item[=].answerOption[+].valueCoding = http://terminology.hl7.org/CodeSystem/v2-0136#N No
* item[=].item[=].item[=].answerOption[+].valueCoding = http://terminology.hl7.org/CodeSystem/v2-0136#asked-unknown Unknown


previousDiagnosis undefinedCode Details of any previous diagnosis


* item[=].item[=].item[=].answerOption[+].valueCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y Yes
* item[=].item[=].item[=].answerOption[+].valueCoding = http://terminology.hl7.org/CodeSystem/v2-0136#N No
* item[=].item[=].item[=].answerOption[+].valueCoding = http://terminology.hl7.org/CodeSystem/v2-0136#asked-unknown Unknown


radiology undefinedCode Details of any relevant radiology


* item[=].item[=].item[=].answerOption[+].valueCoding = http://snomed.info/sct#unk Unknown
* item[=].item[=].item[=].answerOption[+].valueCoding = http://snomed.info/sct#tnm Clinical TNM
* item[=].item[=].item[=].answerOption[+].valueCoding = http://snomed.info/sct#other Other


neoadjuvant undefinedCode Details of any relevant neoadjuvant therapy


* item[=].item[=].item[=].answerOption[+].valueCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y Yes
* item[=].item[=].item[=].answerOption[+].valueCoding = http://terminology.hl7.org/CodeSystem/v2-0136#N No
* item[=].item[=].item[=].answerOption[+].valueCoding = http://terminology.hl7.org/CodeSystem/v2-0136#asked-unknown Unknown


tumourprocedure undefinedCode Procedure


* item[=].item[=].answerOption[+].valueCoding =  #diag Diagnostic (biopsy / cytology)
* item[=].item[=].answerOption[+].valueCoding =  #resec Resection specimen (operative)
* item[=].item[=].answerOption[+].valueCoding =  #frozen Frozen section


tumourindication undefinedCode Clinical Indication


* item[=].item[=].answerOption[+].valueCoding =  #new New primary cancer
* item[=].item[=].answerOption[+].valueCoding =  #regional Regional recurrance
* item[=].item[=].answerOption[+].valueCoding =  #distant distant metastasis
* item[=].item[=].answerOption[+].valueCoding =  #other Other


tumoursite undefinedCode Tumour site


* item[=].item[=].answerOption[+].valueCoding = http://clinfhir.com/CodeSystem/site#rul Right Upper Lobe
* item[=].item[=].answerOption[+].valueCoding = http://clinfhir.com/CodeSystem/site#rml Right Middle Lobe
* item[=].item[=].answerOption[+].valueCoding = http://clinfhir.com/CodeSystem/site#rll Right Lower Lobe
* item[=].item[=].answerOption[+].valueCoding = http://clinfhir.com/CodeSystem/site#lul Left Upper Lobe
* item[=].item[=].answerOption[+].valueCoding = http://clinfhir.com/CodeSystem/site#lll Left Lower Lobe
* item[=].item[=].answerOption[+].valueCoding = http://clinfhir.com/CodeSystem/site#mb Main Bronchus


procedureType undefinedCode Select procedure


* item[=].item[=].item[=].answerOption[+].valueCoding = http://canshare.com#bron Bronchoscopic
* item[=].item[=].item[=].answerOption[+].valueCoding =  #trans Transthoracic
* item[=].item[=].item[=].answerOption[+].valueCoding =  #frozen Frozen section (intra operative)
* item[=].item[=].item[=].answerOption[+].valueCoding =  #op Operative


bronchoscopicTumourSite undefinedCode Tumour site


* item[=].item[=].item[=].answerOption[+].valueCoding = http://clinfhir.com/CodeSystem/site#rul Right Upper Lobe
* item[=].item[=].item[=].answerOption[+].valueCoding = http://clinfhir.com/CodeSystem/site#rml Right Middle Lobe
* item[=].item[=].item[=].answerOption[+].valueCoding = http://clinfhir.com/CodeSystem/site#rll Right Lower Lobe
* item[=].item[=].item[=].answerOption[+].valueCoding = http://clinfhir.com/CodeSystem/site#lul Left Upper Lobe
* item[=].item[=].item[=].answerOption[+].valueCoding = http://clinfhir.com/CodeSystem/site#lll Left Lower Lobe
* item[=].item[=].item[=].answerOption[+].valueCoding = http://clinfhir.com/CodeSystem/site#mb Main Bronchus


bronchoscopicProcedureType undefinedCode Procedure type


* item[=].item[=].item[=].answerOption[+].valueCoding =  #ebiop Endobronchial biopsy
* item[=].item[=].item[=].answerOption[+].valueCoding =  #tbiop Transbronchial biopsy
* item[=].item[=].item[=].answerOption[+].valueCoding =  #wash Bronchial washings
* item[=].item[=].item[=].answerOption[+].valueCoding =  #brush Bronchial brushings
* item[=].item[=].item[=].answerOption[+].valueCoding =  #lavage Bronchoalveolar lavage
* item[=].item[=].item[=].answerOption[+].valueCoding =  #needle Transbronchial needle aspirate (TBNA)
* item[=].item[=].item[=].answerOption[+].valueCoding =  #ebus Endobronchial Ultrasound-guided Bronchoscopy (EBUS)
* item[=].item[=].item[=].answerOption[+].valueCoding =  #other Other


transthoracicProcedureSite undefinedCode Tumour site


* item[=].item[=].item[=].answerOption[+].valueCoding = http://clinfhir.com/CodeSystem/site#rul Right Upper Lobe
* item[=].item[=].item[=].answerOption[+].valueCoding = http://clinfhir.com/CodeSystem/site#rml Right Middle Lobe
* item[=].item[=].item[=].answerOption[+].valueCoding = http://clinfhir.com/CodeSystem/site#rll Right Lower Lobe
* item[=].item[=].item[=].answerOption[+].valueCoding = http://clinfhir.com/CodeSystem/site#lul Left Upper Lobe
* item[=].item[=].item[=].answerOption[+].valueCoding = http://clinfhir.com/CodeSystem/site#lll Left Lower Lobe
* item[=].item[=].item[=].answerOption[+].valueCoding =  #lin Lingula
* item[=].item[=].item[=].answerOption[+].valueCoding =  #trac Trachea
* item[=].item[=].item[=].answerOption[+].valueCoding =  #cw Chest wall
* item[=].item[=].item[=].answerOption[+].valueCoding =  #ns Not Specified
* item[=].item[=].item[=].answerOption[+].valueCoding =  #oth Other


transthoracicProcedureType undefinedCode Type of transthoracic procedure


* item[=].item[=].item[=].answerOption[+].valueCoding =  #oth Transthoracic core needle biopsy
* item[=].item[=].item[=].answerOption[+].valueCoding =  #tfna Transthoracic fine needle aspirate
* item[=].item[=].item[=].answerOption[+].valueCoding =  #pfa Pleural fluid aspirate
* item[=].item[=].item[=].answerOption[+].valueCoding =  #vats Video-assisted surgery (VATS) biopsy
* item[=].item[=].item[=].answerOption[+].valueCoding =  #ob Open biopsy
* item[=].item[=].item[=].answerOption[+].valueCoding =  #oth Other


frozensectionindication undefinedCode Clinical indication for frozen section


* item[=].item[=].item[=].answerOption[+].valueCoding =  #pal Confirm malignancy
* item[=].item[=].item[=].answerOption[+].valueCoding =  #anc Confirm malignancy
* item[=].item[=].item[=].answerOption[+].valueCoding =  #clear Confirm margins clear of malignancy
* item[=].item[=].item[=].answerOption[+].valueCoding =  #oth Other


frozensectiontype undefinedCode Type of frozen section


* item[=].item[=].item[=].answerOption[+].valueCoding =  #pal Wedge resection
* item[=].item[=].item[=].answerOption[+].valueCoding =  #anc Lymph node
* item[=].item[=].item[=].answerOption[+].valueCoding =  #oth Other


procedureoperativets undefinedCode Tumour site


* item[=].item[=].item[=].answerOption[+].valueCoding = http://clinfhir.com/CodeSystem/site#rul Right Upper Lobe
* item[=].item[=].item[=].answerOption[+].valueCoding = http://clinfhir.com/CodeSystem/site#rml Right Middle Lobe
* item[=].item[=].item[=].answerOption[+].valueCoding = http://clinfhir.com/CodeSystem/site#rll Right Lower Lobe
* item[=].item[=].item[=].answerOption[+].valueCoding = http://clinfhir.com/CodeSystem/site#lul Left Upper Lobe
* item[=].item[=].item[=].answerOption[+].valueCoding = http://clinfhir.com/CodeSystem/site#lll Left Lower Lobe
* item[=].item[=].item[=].answerOption[+].valueCoding =  #lin Lingula
* item[=].item[=].item[=].answerOption[+].valueCoding =  #trac Trachea
* item[=].item[=].item[=].answerOption[+].valueCoding =  #cw Chest wall
* item[=].item[=].item[=].answerOption[+].valueCoding =  #ns Not Specified
* item[=].item[=].item[=].answerOption[+].valueCoding =  #oth Other


procedureoperativeproc undefinedCode Procedure type


* item[=].item[=].item[=].answerOption[+].valueCoding =  #wedge Wedge resection
* item[=].item[=].item[=].answerOption[+].valueCoding =  #seg Segmentectomy
* item[=].item[=].item[=].answerOption[+].valueCoding =  #lob Lobectomy
* item[=].item[=].item[=].answerOption[+].valueCoding =  #bilob BiLobectomy
* item[=].item[=].item[=].answerOption[+].valueCoding =  #pneum Pneumonectomy
* item[=].item[=].item[=].answerOption[+].valueCoding =  #sleeve Sleeve resection
* item[=].item[=].item[=].answerOption[+].valueCoding =  #oth Other


procedureoperativeadj undefinedCode Involvement of adjacent organs


* item[=].item[=].item[=].answerOption[+].valueCoding =  #ni Not identified
* item[=].item[=].item[=].answerOption[+].valueCoding =  #pres Present


additionalSpecimens undefinedCode Additional specimens submitted


* item[=].item[=].answerOption[+].valueCoding =  #none None
* item[=].item[=].answerOption[+].valueCoding =  #ln Lymph node
* item[=].item[=].answerOption[+].valueCoding =  #oth Other


 undefined undefined


* answerOption[+].valueCoding = undefined#undefined undefined