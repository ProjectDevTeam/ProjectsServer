const conn = require('../services/db')
const { requestType } = require('../utils/request.config')
const { pjServerSQL } = require('../services/SQL/index')
const pjServer = {
  getUserInfo: {
    fun: (req, res, next) => {
      const { cookies } = req
      const cookie = cookies['X-Request-Auth']
      const sql = pjServerSQL.getUserInfo(cookie)
      conn
        .query(sql)
        .then(res1 => {
          const resData = { ...res1[0] }
          const routes = resData.routes.split(',')
          let whereSql = ''
          routes.forEach((item, index) => {
            if (index == 0) {
              whereSql += `id=${item}`
            } else {
              whereSql += ` or id=${item}`
            }
          })
          const routesSql = `select * from \`t-routes\` where ${whereSql}`
          conn
            .query(routesSql)
            .then(res2 => {
              resData.routes = res2
              res.status(200).json({
                code: 0,
                messages: ['success'],
                data: resData
              })
            })
            .catch(err => {
              res.status(200).json({
                code: 300,
                messages: [err]
              })
            })
        })
        .catch(err => {
          res.status(200).json({
            code: 300,
            messages: [err]
          })
        })
    },
    type: requestType[1]
  },
  getTheme: {
    fun: (req, res, next) => {
      const { cookies } = req
      const cookie = cookies['X-Request-Auth']
      const sql = pjServerSQL.getTheme(cookie)
      conn
        .query(sql)
        .then(res1 => {
          res.status(200).json({
            code: 0,
            messages: ['success'],
            data: res1[0]
          })
        })
        .catch(err => {
          res.status(200).json({
            code: 300,
            messages: [err]
          })
        })
    },
    type: requestType[1]
  }
}

module.exports = pjServer
