'use strict'

const express = require('express');
const router = express.Router();

const index = require('./index');
const game = require('./game');
const users = require('./users');

router.use('/', index);
router.use('/game/', game);
router.use('/', users);


module.exports = router;
