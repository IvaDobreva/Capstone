'use strict'

const express = require('express');
const router = express.Router();

const index = require('./index');
const game = require('./game');
const users = require('./users');
const map = require('./map');
const word = require('./word');

router.use('/', index);
router.use('/game/', game);
router.use('/', users);
router.use('/map', map);
router.use('/word', word);

module.exports = router;
