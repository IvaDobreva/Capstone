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
  }
}
