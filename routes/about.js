'use strict'

const express = require('express');
const cookie = require('cookies');

const router = express.Router();

router.get('/', (req, res) => {
  if(req.headers.cookie == undefined) {
    res.render('about', {token: "false"});
  }

  res.render('about', {token: "true"});
});

module.exports = router;
