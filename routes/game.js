'use strict'

const express = require('express');
const router = express.Router();
const cookies = require('cookie');

const wrapper = require('../model/wrapper');
const imageModel = require('../model/image');
const vocModel = require('../model/vocabulary');
const userModel = require('../model/user');
const session = require('../model/sessions');
const gameSession = require('../model/gameSession');

router.get('/', (req, res) => {
  if(cookies.parse(req.headers.cookie)['token'] == undefined) {
    res.render('game', {token: "false"});
  }

  res.render('game', {token: "true"});
});

router.get('/getImage', wrapper.asyncMiddleware(async(req, res) => {
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

  res.send({image: "/images/"+randImg[0]['imgname'],
            kor: kor,
            name: randImg[0]['imgname'],
            id: randImg[0]['id']});
}));

//Update users score after the game ends
router.get('/score', (req, res) => {
  console.log(req.body);
  res.render('score', {token: "true", score: 0});
});

router.post('/score', wrapper.asyncMiddleware(async(req, res) => {
  const token = req.body.token;
  const uscore = req.body.score;

  const uid = await session.getUID(token);
  const score = await userModel.getScore(uid[0]['userID']);

  const totalScore = parseInt(score[0]['score']) + parseInt(uscore);

  await userModel.updateScore(uid[0]['userID'], totalScore);

  const imageIdLst = req.body.hisImage.split(',');
  const answLst = req.body.hisAnswer.split(',');
  const answBool = req.body.hisAnsBool.split(',');

  //Update game session table
  for(let i=0; i < 10; i++) {
    await gameSession.updateGameSession(uid[0]['userID'], imageIdLst[i], answLst[i], parseInt(answBool[i]));
  }
})) ;

module.exports = router;
