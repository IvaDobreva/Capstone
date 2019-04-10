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

  const vocab = await vocModel.getVocab(randImg[0]['imgname']);
  console.log(vocab);

// /  res.send({image: randImg[0]['imgname']});
  res.render("index", {image: "/images/"+randImg[0]['imgname'],
                        word: randImg[0]['kor_word']});
}));

module.exports = router;
