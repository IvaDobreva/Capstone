'use strict'

const express = require('express');
const cookies = require('cookie');

const wrapper = require('../model/wrapper');
const catModel = require('../model/category');

const router = express.Router();

router.get('/', wrapper.asyncMiddleware(async(req, res) => {
  const categories = await catModel.getCategories();
  console.log(categories);

  if(req.headers.cookie == undefined){
    res.render('map', {token: "false", categories: categories});
  }

  res.render('map', {token: "true", categories: categories});
}));

module.exports = router;
