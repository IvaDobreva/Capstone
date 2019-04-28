'use trict'

const db = require('../db');

module.exports = {
  updateGameSession: (uid, imgId, answer, answBool) => {
    const QUERY_UPDATE_SESSION = `INSERT INTO game_session(uid, imgid, answer, ansTrue) VALUES('${uid}', '${imgId}', '${answer}', '${answBool}');`
    return db.getQueryResult(QUERY_UPDATE_SESSION);
  },

  getGameSession: (uid) => {
    const QUERY_GET_GAME = `SELECT * FROM game_session WHERE uid='${uid}';`;
    return db.getQueryResult(QUERY_GET_GAME);
  }
}
