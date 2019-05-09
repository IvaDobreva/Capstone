'use strict'

const express = require('express');
const router = express.Router();
const cookies = require('cookie');

const wrapper = require('../model/wrapper');

router.get('/', wrapper.asyncMiddleware(async(req, res) => {
  //Check if logged in and redirect
  //if not logged in to login page
  //else to my page

  console.log(req.headers.cookie);

  if(req.headers.cookie == undefined ) {
    res.render("index", { token: "false"});
    res.end;
  }
  if(cookies.parse(req.headers.cookie)['token'] == undefined ) {
    res.render("index", {token: "false"});
    res.end;
  }

  const token = cookies.parse(req.headers.cookie)['token'];

  res.render("index", {token: "true"});

}));

module.exports = router;
