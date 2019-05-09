'use strict'

const db = require('../db');

module.exports = {
    updateGameHistory: (uid, score, date) => {
      const QUERY_UPDATE_HISTORY = `INSERT INTO user_game_history(uid, score, date) VALUES('${uid}', '${score}', '${date}')`;
      return db.getQueryResult(QUERY_UPDATE_HISTORY)
    },

    getCurrentScore: (uid) => {
      const QUERY_GET_SCORE = `SELECT score FROM user_game_history WHERE uid='${uid}';`;
      return db.getQueryResult(QUERY_GET_SCORE);
    }
}
