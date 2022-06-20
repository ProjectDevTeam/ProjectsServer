const mysql = require('mysql');
const connInfo = require('./dbconfig');
const conn = mysql.createConnection({
	...connInfo,
	multipleStatements: true
});
conn.connect();

module.exports = conn;
