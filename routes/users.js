'use strict';

const express = require('express');
const cookies = require('cookie');
const router = express.Router();

const cGen = require('../payload-gen');

const wrapper = require('../model/wrapper');
const userModel = require('../model/user');
const session = require('../model/sessions');

router.get('/login', wrapper.asyncMiddleware(async(req, res) => {
  res.render('login', {token: 'false'});
}));

router.get('/myPage', wrapper.asyncMiddleware(async(req, res) => {
  const token = cookies.parse(req.headers.cookie)['token'];
  const user = await session.checkSession(token);

  if(user.length == 0 ) {
  //  res.set({session: false});
    res.render('index');
  }
  //res.set({session: true});
  res.render('index', {session: true });
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

  //create session log in db
  await session.createSession(uname, token);

  res.cookie('token', token);

  //redirect to my page or index page
  res.redirect('/');
}));

//Sing up page
router.get('/signup', (req, res) => {
  res.render('signup');
});

//REgister a new user
//Do validation checks at front end
router.post('/signup', wrapper.asyncMiddleware(async(req,res) => {
  const un = req.body.username;

  console.log(req.body);

  const isExisting = await userModel.checkIfExisting(un);
  if(isExisting.length != 0 ) {
    res.send("existing");
  }

  await userModel.registerNewUser(req.body);
  res.redirect('myPage');
}));

router.get('/logout', wrapper.asyncMiddleware(async(req, res) => {
  //delete the token
  const token = cookies.parse(req.headers.cookie)['token'];
  await session.deleteSession(token);
  //Send empty token
  res.clearCookie('token');
  res.redirect('/');
}));

router.get('/users/profile', wrapper.asyncMiddleware(async(req, res) => {

  if(req.headers.cookie == undefined){
    res.render('profile', {token: "false"});
  }

  const token = cookies.parse(req.headers.cookie)['token'];
  const uid = await session.getUID(token);
  const uprofile = await userModel.getUserData(uid[0]['userID']);

  res.render('profile', {token: "true",
                        user: uprofile[0]});
}));

//Update users score after the game ends
router.post('/user/score', wrapper.asyncMiddleware(async(req, res) => {
  const token = req.body.token;
  const uscore = req.body.score;

  const uid = await session.getUID(token);
  await userModel.updateScore(uid[0]['userID'], uscore);

  res.render('score');
})) ;

module.exports = router;
