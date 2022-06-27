const conn = require('../services/db')
const resCode = require('../resCode')
const { createCookie } = require('../utils/createCokkie')
const { long } = require('../utils/serverConfig')
const { requestType } = require('../utils/request.config')
const { loginSQL } = require('../services/SQL')
const login = {
  authLogin: {
    fun: (req, res, next) => {
      const { userName, password } = req.body
      if (!userName) {
        return res.status(200).json({
          ...resCode.login.noUserName
        })
      }
      if (!password) {
        return res.status(200).json({
          ...resCode.login.noPassword
        })
      }
      const sql = loginSQL.authloginUserName(userName)
      conn
        .query(sql)
        .then(res1 => {
          if (res1[0]?.password == password) {
            const { cookie, endTime } = createCookie(long)
            const setCookieSql = loginSQL.authloginSetCookie(cookie, endTime, userName)
            conn
              .query(setCookieSql)
              .then(res2 => {
                res.cookie('X-Request-Auth', cookie, {
                  maxAge: long,
                  httpOnly: true
                })
                res.status(200).json({
                  ...resCode.login.success
                })
              })
              .catch(err1 => {
                res.status(200).json({
                  code: 300,
                  messages: [err1]
                })
              })
          } else {
            res.status(200).json({
              ...resCode.login.failed
            })
          }
        })
        .catch(err => {
          res.status(200).json({
            code: 300,
            messages: [err],
            messagesType: 'error'
          })
        })
    },
    type: requestType[2]
  }
}
module.exports = login
