'use strict';

const db = require('../db');

module.exports = {
  getVocab: (word) => {
    const QUERY_SELECT_WORD = `SELECT * FROM vocabulary WHERE "${word}"=eng_word;`
    return db.getQueryResult(QUERY_SELECT_WORD);
  },

  ifExists: (word, trans) => {
    const QUESRY_CHECK_EXISTING = `SELECT * FROM vocabulary WHERE kor_word = '${word}' AND eng_word= '${trans}';`;
    return db.getQueryResult(QUESRY_CHECK_EXISTING);
  },

  addVocab: (word, trans, level, type) => {
    const QUERY_ADD_NEW = `INSERT INTO vocabulary(kor_word, eng_word) VALUES ('${word}', '${trans}');`;
    return db.getQueryResult(QUERY_ADD_NEW);
  },

  getTranslationENG: (kor_word) => {
    const QUERY_GET_ENG = `SELECT eng_word FROM vocabulary WHERE kor_word = '${kor_word}';`;
    return db.getQueryResult(QUERY_GET_ENG);
  },

  getTranslationKOR: (eng_word) => {
    const QUERY_GET_ENG = `SELECT kor_word FROM vocabulary WHERE eng_word = '${eng_word}';`;
    return db.getQueryResult(QUERY_GET_ENG);
  }
}
