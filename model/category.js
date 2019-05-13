'use strict'

const db = require('../db');

module.exports = {
  getCategories: () => {
    const SELECT_ALL = `SELECT * FROM category;`
    return db.getQueryResult(SELECT_ALL);
  }
}
