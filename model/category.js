'use strict'

const db = require('../db');

module.exports = {
  getCategories: () => {
    const SELECT_ALL = `SELECT * FROM category;`
    return db.getQueryResult(SELECT_ALL);
  },

  getCatIMG: (catID) => {
    const SELECT_IMG_BY_CAT = `SELECT * FROM cat_img WHERE cat_id='${catID}';`
    return db.getQueryResult(SELECT_IMG_BY_CAT);
  },

  getCatName: (id) => {
    const SELECT_CATEGORY = `SELECT * FROM category WHERE id='${id}';`
    return db.getQueryResult(SELECT_CATEGORY);
  }
}
