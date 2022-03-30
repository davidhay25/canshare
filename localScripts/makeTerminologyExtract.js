#!/usr/bin/env node
//Create a csv file with all embedded terminology data in it.


const fs = require('fs');
let QName = 'QLungCancer'

let outFilePath = "./requirements/" + QName + "-terminology.csv"


let fullFileName = "./fsh-generated/resources/Questionnaire-"+QName+".json"
let contents = fs.readFileSync(fullFileName, {encoding: 'utf8'})

let json = JSON.parse(contents)


function extractTerm(arCsv,item,level) {
    if (item.type == 'group' && item.item) {
        //if it has an item 
        level ++
        item.item.forEach(function(child){
           
            extractTerm(arCsv,child,level)
        })
            
       
    } else {
        //a single item
        //let entry = {linkId:item.linkId}
        let ar = []
        ar.push(item.linkId)
        ar.push(item.text)
        let itemCode = "undefinedCode"
        if (item.code && item.code[0].code) {
            itemCode = item.code[0].code
        }
        ar.push(itemCode)
        ar.push(level)
        if (item.answerOption) {
            item.answerOption.forEach(function(ao){
                let ar1 = []
                ar1.push(ao.valueCoding.code || " ")
                ar1.push(ao.valueCoding.system || " ")
                ar1.push(ao.valueCoding.display || " ")

                let newAr = ar.concat(ar1)
                arCsv.push(newAr)
            })
        }


       // ar.push(itemCode)
       // arCsv.push(ar)
    }
}


let arCsv = []
json.item.forEach(function(child){
    extractTerm(arCsv,child,1)
})

//console.log(arCsv)

let fileContents = "linkId,text,itemCode,level,code,system,display\r\n"

arCsv.forEach(function(arLine){
    fileContents += arLine.join(",") + "\r\n"
})

fs.writeFileSync(outFilePath,fileContents)


