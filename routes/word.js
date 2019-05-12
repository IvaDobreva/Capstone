'use strict'

const express = require('express');
const router = express.Router();

const wrapper = require('../model/wrapper');
const vocab = require('../model/vocabulary');

router.get('/', (req, res) => {
  res.send("adding new word to the vocab");
});

router.post('/', wrapper.asyncMiddleware(async(req, res) => {
  const word = req.body.word;
  const transl = req.body.translation;

  //Find if it already exists in the db
  const existing = await vocab.ifExists(word, transl);

  if(existing != 0 ) {
    res.send({result: 'existing'});
  }

  await vocab.addVocab(word, transl, null, null);

  res.send({result: 'new entry added'});
}));


router.get('/new', wrapper.asyncMiddleware(async(req, res) => {
  res.render('newWord', {token: "true"});
}));

router.post('/new', wrapper.asyncMiddleware(async(req, res) => {
  console.log(req.body)
  res.send({result: "done"})
}));
module.exports = router;
