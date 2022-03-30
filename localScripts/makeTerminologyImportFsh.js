#!/usr/bin/env node
//From a csv file, create FSH rules to copy into FSH document

const fs = require('fs');
let QName = 'QLungCancer'


let inFilePath = "./requirements/" + QName + "-terminology.csv"
let outFilePath = "./requirements/" + QName + "-terminology.fsh"
let contents = fs.readFileSync(inFilePath, {encoding: 'utf8'})

let arData = contents.split('\r\n')

console.log(contents)

let fsh = []
let lastLinkId = ""

arData.forEach(function(line){
    let ar = line.split(',')
    let linkId = ar[0]
    let text = ar[1]
    let qCode = ar[2]
    let level = ar[3]
    let code = ar[4]
    let system = ar[5]
    let display = ar[6]

    if (linkId !== lastLinkId) {
        lastLinkId = linkId
        fsh.push("\r\n")
        fsh.push(linkId + " " + qCode + " " + text)
        fsh.push("\r\n")
    }
    let fshRule = "* "
    for (i = 0; i < level; i++) {
        fshRule += "item[=]."
    }
    fshRule += "answerOption[+].valueCoding = "
    fshRule += system + "#" + code + " " + display
    fsh.push(fshRule)


})


let fileContents = fsh.join("\r\n")
fs.writeFileSync(outFilePath,fileContents)


