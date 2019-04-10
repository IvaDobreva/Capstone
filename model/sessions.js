'use strict'

const db = require('../db');

module.exports = {
  createSession: (uname, token) => {
    const QUERY_NEW_SESSION = `INSERT INTO sessions(userID, token) SELECT users.id, '${token}' FROM users WHERE users.username = '${uname}'`;
    return db.getQueryResult(QUERY_NEW_SESSION);
  },

  deleteSession: (uname) => {
    return db.getQueryResult();
  },

  checkSession: (token) => {
    const QUERY_SESSION_USER = `SELECT * FROM users, sessions WHERE token = '${token}' AND idsessions = users.id;`;
    return db.getQueryResult(QUERY_SESSION_USER);
  }
};
