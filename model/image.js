'use strict';

const db = require('../db');

module.exports = {
  getTotalRows: () => {
    const GET_TOTAL_TABLE_ROWS = `SELECT COUNT(*) FROM image;`
    return db.getQueryResult(GET_TOTAL_TABLE_ROWS);
  },

  getRandImg: (totalRows) => {
    const randNum = (Math.floor(Math.random()*totalRows)+1);
    const GET_RANDOM_IMG = `SELECT imgname FROM image WHERE id=${randNum};`;
    return db.getQueryResult(GET_RANDOM_IMG);
  },

  getLabels: (image) => {
    const QUERY_GET_LABELS = `SELECT labels FROM image WHERE imgname = '${image}';`;
    return db.getQueryResult(QUERY_GET_LABELS);
  }
}
