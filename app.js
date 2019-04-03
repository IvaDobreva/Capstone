'use strict'

const logger = require('morgan');
const cors = require('cors');
const bodyParser = require('body-parser');
const path = require('path');

//Set up the express app
const express = require('express');
const app = express();

const config = require('./config');
const router = require('./routes/router');

const PORT = config.port;

app.use(cors());
app.use(logger('dev'));
app.use(bodyParser.urlencoded({extended: true}));
app.use(bodyParser.json());

app.set('view engine', 'ejs')
app.set('views', path.join(__dirname, '/view'));

app.use('/', router);

const server = app.listen(PORT, () => {
  console.log(`server running on port ${PORT}`);
});
