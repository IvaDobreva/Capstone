module.exports = {
  port: 5000,
  appRoot: __dirname,
  db: {
    connectionLimit: 20,
    host: '127.0.0.1',
    user: 'root',
	  port: 3306,
    password: 'password',
    database: 'capstone',
  }
};
