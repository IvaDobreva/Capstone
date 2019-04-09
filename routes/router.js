'use strict'

const express = require('express');
const router = express.Router();

const index = require('./index');
const game = require('./game');
const users = require('./users');
const map = require('./map');

router.use('/', index);
router.use('/game/', game);
router.use('/', users);
router.use('/map', map);

module.exports = router;
