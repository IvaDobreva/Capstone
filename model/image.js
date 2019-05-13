'use strict';

const db = require('../db');

module.exports = {
  getTotalRows: () => {
    const GET_TOTAL_TABLE_ROWS = `SELECT COUNT(*) FROM image;`
    return db.getQueryResult(GET_TOTAL_TABLE_ROWS);
  },

  getRandImg: (totalRows) => {
    const randNum = (Math.floor(Math.random()*totalRows)+1);
    const GET_RANDOM_IMG = `SELECT * FROM image WHERE id=${randNum};`;
    return db.getQueryResult(GET_RANDOM_IMG);
  },

  getLabels: (image) => {
    const QUERY_GET_LABELS = `SELECT labels FROM image WHERE imgname = '${image}';`;
    return db.getQueryResult(QUERY_GET_LABELS);
  },

  getImage: (id) => {
    const QUERY_GET_BY_ID = `SELECT imgname FROM image WHERE id='${id}';`;
    return db.getQueryResult(QUERY_GET_BY_ID);
  },

  getImgLab: (id) => {
    const QUERY_GET_BY_ID = `SELECT * FROM image WHERE id='${id}';`;
    return db.getQueryResult(QUERY_GET_BY_ID);
  }
}
