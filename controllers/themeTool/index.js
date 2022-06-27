const path = require('path')
const { requestType } = require('../../utils/request.config')
const conn = require('../../services/db')
const AppError = require('../../utils/appError')
const updetedFile = require('../../utils/writFile')
const { createThemeToolStr, createThemeToolValueStr } = require('./createStr')
const { themeToolSQL } = require('../../services/SQL')
const themeTool = {
  //获取主题所有配置
  getThemeValue: {
    fun: (req, res, next) => {
      const { query } = req
      const { platform, theme } = query
      const themeToolTb = `${platform}-${theme}`
      const SQL = themeToolSQL.getThemeValue(themeToolTb)
      conn
        .query(SQL)
        .then(res1 => {
          return res.status(200).json({
            code: '0',
            data: res1
          })
        })
        .catch(err => {
          next(new AppError(err))
        })
    },

    type: requestType[1]
  },
  //获取所有颜色
  getValueList: {
    fun: (req, res, next) => {
      const { query } = req
      const { platform } = query
      const SQL = themeToolSQL.getValueList(platform)
      conn
        .query(SQL)
        .then(data => {
          res.status(200).json({
            code: '0',
            data: data
          })
        })
        .catch(err => {
          next(new AppError(err))
        })
    },
    type: requestType[1]
  },
  //生成css文件
  updataThemeValue: {
    fun: (req, res, next) => {
      const { cookies } = req
      const { platform, theme } = req.body
      updetedFile(platform, theme, cookies, (err, data) => {
        if (err) return res.status(200).json({ code: '300', err })
        res.status(200).json({
          code: '0',
          data
        })
      })
    },
    type: requestType[2]
  },
  //查找值域
  qureyColorField: {
    fun(req, res, next) {
      const { query } = req
      const SQL = themeToolSQL.qureyColorField(query)
      conn
        .query(SQL)
        .then(data => {
          res.status(200).json({
            code: '0',
            data: data
          })
        })
        .catch(err => {
          console.log(err)
          next(new AppError(err))
        })
    },
    type: requestType[1]
  },
  //查找值使用元素
  qureyThemeInfo: {
    fun(req, res, next) {
      const { query } = req
      const SQL = themeToolSQL.qureyThemeInfo(query)
      conn
        .query(SQL)
        .then(data => {
          res.status(200).json({
            code: '0',
            data: data
          })
        })
        .catch(err => {
          next(new AppError(err))
        })
    },
    type: requestType[1]
  },
  //ID查找值使用元素
  getThemeInfoById: {
    fun(req, res, next) {
      const { query } = req
      const SQL = themeToolSQL.getThemeInfoById(query)
      conn
        .query(SQL)
        .then(data => {
          res.status(200).json({
            code: '0',
            data: data
          })
        })
        .catch(err => {
          next(new AppError(err))
        })
    },
    type: requestType[1]
  },
  getAppThemeInfo: {
    fun(req, res, next) {
      const { query } = req
      const SQL = themeToolSQL.getAppThemeInfo(query)
      conn
        .query(SQL)
        .then(data => {
          res.status(200).json({
            code: '0',
            data: data
          })
        })
        .catch(err => {
          next(new AppError(err))
        })
    },
    type: requestType[1]
  },
  //更新colorField
  updateColorField: {
    fun(req, res, next) {
      const { id, color, usedIdLists, swapInfo, platform, theme } = req.body

      const { cookies } = req
      const SQL = themeToolSQL.updateColorField({
        id,
        color,
        usedIdLists,
        swapInfo
      })
      conn
        .query(SQL)
        .then(data => {
          updetedFile(platform, theme, cookies, (err, data) => {
            if (err) return res.status(200).json({ code: '300', err })
            res.status(200).json({
              code: '0',
              data
            })
          })
        })
        .catch(err => {
          next(new AppError(err))
        })
    },
    type: requestType[2]
  },
  addColorFiled: {
    fun(req, res, next) {
      const { platform, theme, name, color } = req.query
      const { cookies } = req
      if (!name || !color) {
        return res.status(200).json({
          code: '300',
          data: 'name and color is required'
        })
      } else {
        const SQL = themeToolSQL.addColorFiled({ name, color })
        conn
          .query(SQL)
          .then(data => {
            updetedFile(platform, theme, cookies, (err, data) => {
              if (err) return res.status(200).json({ code: '300', err })
              res.status(200).json({
                code: '0',
                data
              })
            })
          })
          .catch(err => {
            next(new AppError(err))
          })
      }
    },
    type: requestType[1]
  },
  deleteColorFiled: {
    fun(req, res, next) {
      const { cookies } = req
      const { id, platform, theme } = req.query
      const SQL = themeToolSQL.deleteColorFiled(id)
      conn
        .query(SQL)
        .then(data => {
          updetedFile(platform, theme, cookies, (err, data) => {
            if (err) return res.status(200).json({ code: '300', err })
            res.status(200).json({
              code: '0',
              data
            })
          })
        })
        .catch(err => {
          next(new AppError(err))
        })
    },
    type: requestType[1]
  }
}
module.exports = themeTool
