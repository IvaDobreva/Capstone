'use strict'

const express = require('express');
const cookies = require('cookie');

const wrapper = require('../model/wrapper');
const catModel = require('../model/category');
const image = require('../model/image');
const vocab = require('../model/vocabulary');

const router = express.Router();

router.get('/', wrapper.asyncMiddleware(async(req, res) => {
  const categories = await catModel.getCategories();

  if(req.headers.cookie == undefined){
    res.render('map', {token: "false", categories: categories});
  }

  res.render('map', {token: "true", categories: categories});
}));

router.post('/category', wrapper.asyncMiddleware(async(req, res) => {
  const nodes = [];
  const edges = [];

  const catID = req.body.cat;
  const catName = await catModel.getCatName(catID);
  const imgs = await catModel.getCatIMG(catID);
  let edgeTrg = 0;

  //Create list of nodes
  for(let i=0; i<imgs.length; i++) {
    const img = await image.getImgLab(imgs[i]['img_id']);
    const wordKR = await vocab.getTranslationKOR(img[0]['imgname'])

    let isCat = 'false';
    if(img[0]['imgname'] == catName[0]['cat_name'].toLowerCase()) {
      isCat = 'true';
      edgeTrg = img[0]['id'];
    }
    const node = {id: img[0]['id'],
                  label: wordKR[0]['kor_word'],
                  eng: img[0]['imgname'],
                  cat: isCat
                 }
    nodes.push(node);
  }

  //Create list of edges
//  for(let i=0; i<file)
  res.send({nodes: nodes, targetId: edgeTrg})
}));

module.exports = router;
