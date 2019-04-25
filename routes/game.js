'use strict'

const express = require('express');
const router = express.Router();
const cookies = require('cookie');

const wrapper = require('../model/wrapper');
const imageModel = require('../model/image');
const vocModel = require('../model/vocabulary');
const image = require('../model/image');

router.get('/', (req, res) => {
  if(cookies.parse(req.headers.cookie)['token'] == undefined) {
    res.render('game', {token: "false"});
    //res.redirect('/login');
  }
  res.render('game', {token: "true"});
});

router.get('/getImage', wrapper.asyncMiddleware(async(req, res) => {
  //1. Get random image
  //2. get image's labels
  //3. Find labels' translation
  //Send to the sever
  //{image: path,
  //   kor: []}

  //Get random image by selecting random number from
  const rows = await imageModel.getTotalRows();
  const randImg = await imageModel.getRandImg(rows[0]['COUNT(*)']);

  //Get labels
  const labels = randImg[0]['labels'].split(",");
  const vocab = await vocModel.getVocab(randImg[0]['imgname']);
  console.log(vocab);

  //Get korean translation for every label
  const kor = [];
  for(let i=0; i<labels.length; i++) {
    let labelKR = await vocModel.getTranslationKOR(labels[i]);
    if(labelKR.length > 0 ) {
      kor.push(labelKR[0]['kor_word']);
    }
  }

  console.log(kor);
  res.send({image: "/images/"+randImg[0]['imgname'],
            kor: kor});
}));

router.post('/word', wrapper.asyncMiddleware(async(req, res) => {
  //......
  if(req.body['word'] == req.body['image']) {
    res.send({answer: "true"});
  }
  res.send({answer: "false"});
}));

module.exports = router;
