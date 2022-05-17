const conn = require('../services/db')
const AppError = require('../utils/appError')
const resCode = require('../resCode')
const { createCookie } = require('../utils/createCokkie')
const { long } = require('../utils/serverConfig')
const login = (req, res, next) => {
    const { userName, password } = req.body
    const sql = `SELECT password FROM userInfo WHERE userName='${userName}'`
    conn.query(sql, (err, data) => {
        if (err) res.status(200).json({
            code: 300,
            messages: [err]
        })
        if (data[0]?.password == password) {
            const { cookie, endTime } = createCookie(long)
            const setCookieSql = `UPDATE userInfo SET cookie='${cookie}',endTime='${endTime}' WHERE userName='${userName}'`
            conn.query(setCookieSql, (err) => {
                if (err) res.status(200).json({
                    code: 300,
                    messages: [err]
                })
                res.cookie('X-Request-Auth', cookie, { maxAge: long, httpOnly: true })
                res.status(200).json({
                    ...resCode.login.success
                })
            })

        } else {
            res.status(200).json({
                ...resCode.login.failed
            })
        }
    })
}

module.exports = { login }
