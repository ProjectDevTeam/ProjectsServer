const conn = require('../services/db')
const AppError = require('../utils/appError')
const resCode = require('../resCode/index')
const { is } = require('express/lib/request')
const exp = require('constants')
const getTheme = (req, res, next) => {
    const sql = `SELECT exp , data FROM sysConfig
    WHERE config = "theme"`
    conn.query(sql, (err, data, flieds) => {
        if (err) return next(new AppError(err))
        res.status(200).json({
            ...resCode.getTheme.success,
            data: { theme: data[0].exp.split(',')[data[0].data] }
        })
    })
}
const changeTheme = (req, res, next) => {
    const theme = Number(req.query.theme)
    console.log(theme)
    if (isNaN(theme)) {
        return res.status(200).json({
            ...resCode.changeTheme.failed.themeTypeErr
        })
    }
    const themeListSql = `SELECT exp FROM sysConfig WHERE config="theme"`
    const setThemeSql = `UPDATE sysConfig SET data=${theme} WHERE config='theme' `
    conn.query(themeListSql, (err, data, flieds) => {
        if (err) return next(new AppError(err))
        const themeLists = data[0].exp.split(',')
        // return res.status(200).json({
        //     data: themeLists
        // })
        if (theme < 0 || themeLists.length < theme + 1) {
            return res.status(200).json({
                ...resCode.changeTheme.failed.themeUndefind
            })
        } else {
            conn.query(setThemeSql, (err, data, flieds) => {
                if (err) return next(new AppError(err))
                return res.status(200).json({
                    ...resCode.changeTheme.success,
                })
            })
        }

    })
    // const sql = `UPDATE sysConfig SET data='${theme}'
    // WHERE config = "theme"`
}

const getThemeLists = (req, res, next) => {
    const themeListSql = `SELECT exp FROM sysConfig WHERE config="theme"`
    conn.query(themeListSql, (err, data, flieds) => {
        if (err) return next(new AppError(err))
        const themeLists = data[0].exp.split(',')
        const resData = themeLists.map((item, index) => {
            return { id: index, theme: item }
        })
        return res.status(200).json({
            ...resCode.getThemeLists.success,
            data: resData
        })
    })
}
const config = {
    getTheme,
    changeTheme,
    getThemeLists
}

module.exports = config