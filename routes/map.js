'use strict'

const express = require('express');
const cookies = require('cookie');

const router = express.Router();

router.get('/', (req, res) => {
  console.log(req.headers.cookie);
  if(req.headers.cookie == undefined){
    res.render('map', {token: "false"});
  }

  res.render('map', {token: "true"});
});

module.exports = router;
