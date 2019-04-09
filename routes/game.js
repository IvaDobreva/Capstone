'use strict'

const express = require('express');
const router = express.Router();

const wrapper = require('../model/wrapper');
const imageModel = require('../model/image');
const vocModel = require('../model/vocabulary');

router.get('/', (req, res) => {
  res.render('game');
});

router.get('/getImage', wrapper.asyncMiddleware(async(req, res) => {
  const rows = await imageModel.getTotalRows();
  const randImg = await imageModel.getRandImg(rows[0]['COUNT(*)']);

  const vocab = await vocModel.getVocab(randImg[0]['imgname']);
  console.log(vocab);

  res.send({image: randImg[0]['imgname'],
            kor: vocab[0]['kor_word'],
            eng: vocab[0]['eng_word'],
            level: vocab[0]['level'],
            type: vocab[0]['type']});
}));

module.exports = router;
