'use strict'

const express = require('express');
const router = express.Router();
const cookies = require('cookie');

const wrapper = require('../model/wrapper');
const imageModel = require('../model/image');
const vocModel = require('../model/vocabulary');
const image = require('../model/image');

router.get('/', (req, res) => {
  if(req.headers.cookie == undefined) {
    res.render('game', {token: "false"});
    //res.redirect('/login');
  }
  res.render('game', {token: "true"});
});

router.get('/getImage', wrapper.asyncMiddleware(async(req, res) => {
  const rows = await imageModel.getTotalRows();
  const randImg = await imageModel.getRandImg(rows[0]['COUNT(*)']);

  const vocab = await vocModel.getVocab(randImg[0]['imgname']);
  console.log(vocab);

  res.send({image: "/images/"+randImg[0]['imgname'],
            kor: vocab[0]['kor_word'],
            eng: vocab[0]['eng_word'],
            level: vocab[0]['level'],
            type: vocab[0]['type']});
}));

router.post('/word', wrapper.asyncMiddleware(async(req, res) => {
  if(req.body['word'] == req.body['image']) {
    res.send({answer: "true"});
  }
  res.send({answer: "false"});
}));

module.exports = router;
