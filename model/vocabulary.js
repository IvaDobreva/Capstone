'use strict';

const db = require('../db');

module.exports = {
  getVocab: (word) => {
    const QUERY_SELECT_WORD = `SELECT * FROM vocabulary WHERE "${word}"=eng_word;`
    return db.getQueryResult(QUERY_SELECT_WORD);
  }
}
