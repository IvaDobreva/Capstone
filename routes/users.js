'use strict';

const express = require('express');
const cookies = require('cookie');
const router = express.Router();

const cGen = require('../payload-gen');

const wrapper = require('../model/wrapper');
const userModel = require('../model/user');

router.get('/login', (req, res) => {
  //load login page
  res.render('login');
});

router.get('/myPage', wrapper.asyncMiddleware(async(req, res) => {
  const token = cookies.parse(req.headers.cookie)['token'];
  res.end();
}));

//Login
router.post('/login', wrapper.asyncMiddleware(async(req, res) => {
  const uname = req.body.username;
  const upass = req.body.pass;

  const loginRes = await userModel.userLogin(uname, upass);

  //If user does not exist
  if(loginRes.length == 0 ) {
    res.status(500).send("fail");
  }

  const token = cGen.sign(uname, upass);
  res.cookie('token', token);

  //redirect to my page or index page
  res.send("res");
}));

//Sing up page
router.get('/signup', (req, res) => {
  res.render('signup');
})

//REgister a new user
//Do validation checks at front end
router.post('/register', wrapper.asyncMiddleware(async(req,res) => {
  const un = req.body.username;
  const isExisting = await userModel.checkIfExisting(un);
  if(isExisting.length == 0 ) {
    const newUser = await userModel.registerNewUser(req.body);
  } else {
    res.status(500).send("fail");
  }
  console.log(isExisting.length);
  res.status(200).send("success");
}));

module.exports = router;
