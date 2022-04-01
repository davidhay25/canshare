#!/usr/bin/env node
/**
 * Upload questionnaires

 * */

const http = require('http')
const fs = require('fs');

//let QName = 'QLungCancer'
//let QName = 'QLungCancerCognito'
let QName = 'QCervicalCancer'

console.log("Uploading " + QName)

uploadQ(QName,'canshare.clinfhir.com')
uploadQ(QName,'localhost')


function uploadQ(id,url) {

    let fullFileName = "./fsh-generated/resources/Questionnaire-"+id+".json";
    let contents = fs.readFileSync(fullFileName, {encoding: 'utf8'});


    const options = {
        hostname: url,
        port: 9099,
        path: '/baseR4/Questionnaire/'+ id,
        method: 'PUT',
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
        return
      })
      
      req.write(contents)
      req.end()
      console.log('updated')
    
}

  
  //----------


