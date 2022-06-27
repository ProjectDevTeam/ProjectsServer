const test = require('./test.js')
const pjServer = require('./pjServer')
const login = require('./login')
const config = require('./config')
const themeTool = require('./themeTool/index')

const controllers = { test, pjServer, login, config, themeTool }
module.exports = controllers
