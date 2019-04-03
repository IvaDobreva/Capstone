'use strict';
const mysql = require('mysql');
const config = require('./config');
const connection = mysql.createPool(config.db);

exports.getQueryResult = (sql) => {
  return new Promise( function(resolve, reject)  {
    connection.getConnection((err, connection) => {
      if(err) return reject(err);
      connection.query(sql, (err, rows) => {
        connection.release();
        if (err) return reject(err);
      //  console.log()
         resolve(rows);
      });
    });
  });
};
