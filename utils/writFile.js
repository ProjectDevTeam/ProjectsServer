const path = require('path')
const util = require('util')
const fs = require('fs')
const { createThemeToolStr, createThemeToolValueStr } = require('./createStr')
const createId = require('./creatId')
const conn = require('../services/db')
const { themeToolSQL } = require('../services/SQL')

const writeFile = util.promisify(fs.writeFile)
const access = util.promisify(fs.access)
const unlink = util.promisify(fs.unlink)
const updetedFile = (platform, theme, cookies, callback) => {
  let key = ''
  const themeToolTb = `${platform}-${theme}`
  conn
    .query('SELECT fileKey FROM userInfo WHERE cookie = ?', [cookies['X-Request-Auth']])
    .then(res => {
      key = res[0].fileKey
      let ThemeToolStr = ''
      const SQL = `select * from \`${themeToolTb}\``
      Promise.all([conn.query(SQL), conn.query(themeToolSQL.getValueList(platform))]).then(([res1, res2]) => {
        createThemeToolStr(res1, platform, function (err) {
          return callback(err)
        }).then(resData => {
          const ThemeToolValueStr = createThemeToolValueStr(res2, platform)
          Promise.all([
            writeFile(path.resolve(__dirname, `../web-app/files/${platform}/css/global${createId(key)}.css`), resData),
            writeFile(path.resolve(__dirname, `../web-app/files/${platform}/css/valueList${createId(key)}.css`), ThemeToolValueStr)
              .then(() => {
                Promise.all([
                  access(path.resolve(__dirname, `../web-app/files/${platform}/css/global${key}.css`), fs.constants.F_OK),
                  access(path.resolve(__dirname, `../web-app/files/${platform}/css/valueList${key}.css`), fs.constants.F_OK)
                ])
                  .then(([sta1, sta2]) => {
                    Promise.all([
                      unlink(path.resolve(__dirname, `../web-app/files/${platform}/css/global${key}.css`)),
                      unlink(path.resolve(__dirname, `../web-app/files/${platform}/css/valueList${key}.css`))
                    ])
                      .then(() => {
                        conn
                          .query(`UPDATE userInfo SET fileKey='${createId(key)}' WHERE cookie = ${[cookies['X-Request-Auth']]}`)
                          .then(() => {
                            return callback(null, createId(key))
                          })
                          .catch(err => {
                            return callback(err)
                          })
                      })
                      .catch(err => {
                        return callback(err)
                      })
                  })
                  .catch(err => {
                    const SQL = `UPDATE userInfo SET fileKey = '${createId(key)}' WHERE cookie = ${[cookies['X-Request-Auth']]}`
                    conn
                      .query(SQL)
                      .then(() => {
                        return callback(null, createId(key))
                      })
                      .catch(err => {
                        return callback(err)
                      })
                  })
              })
              .catch(err => {
                return callback(err)
              })
          ])
        })
      })
    })
    .catch(err => {
      callback(err)
    })
}

module.exports = updetedFile
