const express = require("express");
const cors = require("cors");
const router = require("./routes");
const routerLogin = require('./routes/login')
const app = express()
const bodyparser = require('body-parser');
const cookieParser = require('cookie-parser');
const errorHandler = require("./utils/errorHandler");
const AppError = require("./utils/appError");
const conn = require('./services/db')
const { long } = require('./utils/serverConfig')
app.use(bodyparser.urlencoded({ extended: true }));
app.use(bodyparser.json())
app.use(cookieParser())
app.use(cors(), router);
app.use('/config', router)
app.use('/auth', routerLogin)
app.all(/^\/pjts/, (req, res, next) => {
    const { cookies } = req
    if (cookies['X-Request-Auth'] === undefined) {
        res.status(401).json()
    } else {
        conn.query("SELECT endTime FROM userInfo WHERE cookie = ?", [cookies['X-Request-Auth']], function (err, data, fields) {
            if (err) return next(new AppError(err))
            if (data.length === 0) {
                res.status(401).json()
            } else {
                if (Number(data[0].endTime) < Number(new Date())) {
                    res.status(401).json()
                } else {
                    const setCookieSql = `UPDATE userInfo SET endTime='${Number(new Date()) + long}' WHERE userName='${userName}'`
                    conn.query(setCookieSql, (err) => {
                        if (err) res.status(200).json({
                            code: 300,
                            messages: [err]
                        })
                        res.cookie('X-Request-Auth', cookies['X-Request-Auth'], { maxAge: long, httpOnly: true })
                        next()
                    })
                }
            }
        });
    }
});
app.all("*", (req, res, next) => {
    next(new AppError(`The URL ${req.originalUrl} does not exists`, 404));
});

app.use(errorHandler)
const PORT = 3000;
app.listen(PORT, () => {
    console.log(`server running on port ${PORT}`);
});

module.exports = app;