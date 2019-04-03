'use strict'

const express = require('express');
const router = express.Router();

router.get('/', (req, res) => {
  //Check if logged in and redirect
  //if not logged in to login page
  //else to my page
  res.redirect("/login");
});

module.exports = router;
