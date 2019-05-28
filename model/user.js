'use strict'

const db = require('../db');

module.exports = {
  registerNewUser: (userdata) => {
    const QUERY_NEW_USER = `INSERT INTO users(username, password, name, email, nationality) VALUES ('${userdata.username}', '${userdata.pass}', '${userdata.realname}', '${userdata.email}', '${userdata.country}');`;
    return db.getQueryResult(QUERY_NEW_USER);
  },

  checkIfExisting: (username) => {
      const QUERY_CHECK_EX = `SELECT * FROM users WHERE users.username = '${username}';`;
      return db.getQueryResult(QUERY_CHECK_EX);
  },

  userLogin: (uname, pass) => {
    const QUERY_LOGIN = `SELECT * FROM users WHERE username = '${uname}' AND password = '${pass}';`;
    return db.getQueryResult(QUERY_LOGIN);
  },

  getUserData: (uid) => {
    const QUERY_FIND_BY_ID = `SELECT * FROM users WHERE id = '${uid}';`;
    return db.getQueryResult(QUERY_FIND_BY_ID);
  },

  updateScore: (uid, score) => {
    const QUERY_UPDATE_SCORE = `UPDATE users SET score='${score}' WHERE id='${uid}'`;
    return db.getQueryResult(QUERY_UPDATE_SCORE);
  },

  getScore: (uid) => {
    const QUERY_GET_SCORE = `SELECT score FROM users WHERE id='${uid}';`;
    return db.getQueryResult(QUERY_GET_SCORE);
  },

  getRankByID: (uid) => {
    const GET_RANKING_BY_ID = `SELECT username, score,
                              FIND_IN_SET( score, (SELECT GROUP_CONCAT( score ORDER BY score DESC )
                              FROM users )) AS 'rank' FROM users WHERE id='${uid}'`
    return db.getQueryResult(GET_RANKING_BY_ID);
  },

  getAllUsersRanking: () => {
    const GET_RANKING = `SELECT id, name, score, FIND_IN_SET( score, (
                        SELECT GROUP_CONCAT( score ORDER BY score DESC )
                        FROM scores )) AS 'rank'
                        FROM users;`
    return db.getQueryResult(GET_RANKING);
  }
}
