const mysql = require('mysql')
const connInfo = require('./dbconfig')
const conn = mysql.createPool({
  ...connInfo,
  multipleStatements: true
})
const query = function (sql, values) {
  return new Promise((resolve, reject) => {
    conn.getConnection(function (err, connection) {
      if (err) {
        reject(err)
      } else {
        connection.query(sql, values, function (err, results) {
          if (err) {
            reject(err)
          } else {
            resolve(results)
          }
        })
      }
      connection.release() // 释放连接资源 | 跟 connection.destroy() 不同，它是销毁
    })
  })
}
conn.query = query
module.exports = conn
