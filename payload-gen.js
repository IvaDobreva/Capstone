'use strict'

const fs   = require('fs');
const jwt   = require('jsonwebtoken');

const express = require('express');
const privateKEY  = fs.readFileSync('./private.key', 'utf8');
const publicKEY  = fs.readFileSync('./public.key', 'utf8');


// use 'utf8' to get string instead of byte array  (512 bit key)
module.exports = {
 sign: (uid, upass) => {
   const date = new Date();
   const sOptions = {
    issuer: "admin",
    subject: "iam@user.me",
    audience: uid  // this should be provided by client
   };

   const payload = {
      id: uid,
      pass: upass,
      date: date
   };

  // Token signing options
  const signOptions = {
      issuer:  sOptions.issuer,
      subject: sOptions.subject,
      expiresIn:  "30d",    // 30 days validity
      algorithm:  "RS256"
  };
  console.log("here")
  return jwt.sign(payload, privateKEY, signOptions);
},

verify: (token, $Option) => {

   const vOption = {
    issuer: "admin",
    subject: "iam@user.me",
    audience: "y" // this should be provided by client
   }

  const verifyOptions = {
      issuer:  vOption.issuer,
      subject:  vOption.subject,
      expiresIn:  "30d",
      algorithm:  ["RS256"]
  };
   try{
     return jwt.verify(token, publicKEY, verifyOptions);
   }catch (err){
     return false;
   }
},
 decode: (token) => {
    return jwt.decode(token, {complete: true});
    //returns null if token is invalid
 }
}
