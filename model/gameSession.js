'use trict'

const db = require('../db');

module.exports = {
  updateGameSession: (uid, imgId, answer, answBool) => {
    const QUERY_UPDATE_SESSION = `INSERT INTO game_session(uid, imgid, answer, ansTrue) VALUES('${uid}', '${imgId}', '${answer}', '${answBool}');`
    return db.getQueryResult(QUERY_UPDATE_SESSION);
  }
}
