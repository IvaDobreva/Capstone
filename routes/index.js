'use strict'

const express = require('express');
const router = express.Router();
const cookies = require('cookie');

const wrapper = require('../model/wrapper');
const imageModel = require('../model/image');
const vocModel = require('../model/vocabulary');

router.get('/', wrapper.asyncMiddleware(async(req, res) => {
  //Check if logged in and redirect
  //if not logged in to login page
  //else to my page

  const rows = await imageModel.getTotalRows();
  const randImg = await imageModel.getRandImg(rows[0]['COUNT(*)']);

  if(req.headers.cookie == undefined) {
    res.render("index", {image: "/images/"+randImg[0]['imgname'],
                        token: "false"});
    res.end;
  }
  const token = cookies.parse(req.headers.cookie)['token'];

  res.render("index", {image: "/images/"+randImg[0]['imgname'],
                        token: "true"});

}));

module.exports = router;
