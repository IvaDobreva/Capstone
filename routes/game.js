'use strict'

const express = require('express');
const router = express.Router();
const cookies = require('cookie');
const dateFormat = require('dateformat');

const wrapper = require('../model/wrapper');
const imageModel = require('../model/image');
const vocModel = require('../model/vocabulary');
const userModel = require('../model/user');
const session = require('../model/sessions');
const gameSession = require('../model/gameSession');
const userGame = require('../model/userGame');

router.get('/', wrapper.asyncMiddleware(async(req, res) => {
  if(req.headers.cookie == undefined) {
    res.render('game', {token: 'false',
                        ranking: ""})
  }
  if(cookies.parse(req.headers.cookie)['token'] == undefined) {
    res.render('game', {token: "false",
                        ranking: ""});
  }

  const ranking = await userModel.getAllUsersRanking();
  console.log(ranking);
  res.render('game', {token: "true",
                      ranking: ranking});
}));

//Get random image from the DB
router.get('/getImage', wrapper.asyncMiddleware(async(req, res) => {
  //Get random image by selecting random number from
  const rows = await imageModel.getTotalRows();
  const randImg = await imageModel.getRandImg(rows[0]['COUNT(*)']);

  //Get labels
  const labels = randImg[0]['labels'].split(",");
  const vocab = await vocModel.getVocab(randImg[0]['imgname']);

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
router.get('/score', wrapper.asyncMiddleware(async(req, res) => {

  //Get game history
  const token = cookies.parse(req.headers.cookie)['token'];
  const uid = await session.getUID(token);

  const gameHistory = await gameSession.getGameSession(uid[0]['userID']);
  const scoreAll = await userGame.getCurrentScore(uid[0]['userID']);

  //Get images and possible answers
  let images = [];
  let answers = [];
  let uans = [];
  let temp_ans = [];

  for(let i=0; i<gameHistory.length; i++) {
    const img = await imageModel.getImage(gameHistory[i]['imgid']);
    images.push("/images/" + img[0]['imgname']);

    //Get all labels for the image
    let labels = await imageModel.getLabels(img[0]['imgname']);
    labels = labels[0]['labels'].split(',');

    //Get every word that matches the eng_word in vocabulary table
    if(labels.length != 0 ) {
      for(let k =0; k < labels.length; k++ ) {

        const match = await vocModel.getVocab(labels[k].toLowerCase());
        if(match.length != 0 ) {
          temp_ans.push(match[0]);

        }
      }
    }
    answers.push(temp_ans);
    temp_ans = [];

    uans.push(gameHistory[i]['answer']);
  }

  //Delete game session
  await gameSession.deleteSession(uid[0]['userID']);

  const score = scoreAll[scoreAll.length-1]['score'];
  //Display results
  res.render('score', {token: "true",
                       score: score,
                       image: images,
                       answer: answers,
                       uans: uans});
}));

// Update Vocabulary HITS
router.post('/updateHits', wrapper.asyncMiddleware(async(req, res) => {
  const rating = req.body.rating.split(',');
  const kor = req.body.kor.split(',');
  const eng = req.body.eng.split(',');

  for(let i=0; i<rating.length; i++) {
    await vocModel.updateHitsScore(kor[i], eng[i], parseInt(rating[i]));
  }

  res.send({result: "success"});
}));

//Update score
router.post('/score', wrapper.asyncMiddleware(async(req, res) => {
  const token = cookies.parse(req.headers.cookie)['token'];
  const uscore = req.body.score;

  const uid = await session.getUID(token);
  const score = await userModel.getScore(uid[0]['userID']);

  // Update user's total sore
  const totalScore = parseInt(score[0]['score']) + parseInt(uscore);
  await userModel.updateScore(uid[0]['userID'], totalScore);

  //Add a record to the played games history
  const timestamp = new Date();
  await userGame.updateGameHistory(uid[0]['userID'], parseInt(uscore), dateFormat(timestamp, "dd-mm-yyyy HH:mm:ss"));
  const imageIdLst = req.body.hisImage.split(',');
  const answLst = req.body.hisAnswer.split(',');
  const answBool = req.body.hisAnsBool.split(',');

  //Update game session table
  for(let i=0; i < 10; i++) {
    await gameSession.updateGameSession(uid[0]['userID'], imageIdLst[i], answLst[i], parseInt(answBool[i]));
  //  await vocModel.updateHitsScore(answLst[i]);
  }

  res.send({status: "success"});
})) ;

module.exports = router;
