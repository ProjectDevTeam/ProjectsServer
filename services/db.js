const mysql = require('mysql');
const connInfo = require('./dbconfig')
const conn = mysql.createConnection({
    ...connInfo
});
conn.connect();

module.exports = conn;