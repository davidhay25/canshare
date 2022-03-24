#!/usr/bin/env node
/**
 * the bundle of base data for the canshare server after clearing
  * run after makeBundleTransaction, which converts the collection bundle into the transaction
 * */

const http = require('http')
const fs = require('fs');

let fhirServer = "localhost"
//let fhirServer = "canshare.clinfhir.com"

let fullFileName = "./fsh-generated/resources/Bundle-baseData-tran.json";
let contents = fs.readFileSync(fullFileName, {encoding: 'utf8'});

const options = {
    hostname: fhirServer,
    port: 9099,
    path: '/baseR4/',
    method: 'POST',
    headers: {
      'Content-Type': 'application/fhir+json',
      'Content-Length': contents.length
    }
  }
  
  const req = http.request(options, res => {
    console.log(`statusCode: ${res.statusCode}`)
  
    res.on('data', d => {
     // process.stdout.write(d)
    })
  })
  
  req.on('error', error => {
    console.error(error)
  })
  
  req.write(contents)
  req.end()

  
  //----------


