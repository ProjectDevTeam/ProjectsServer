const test = require('./test.js')
const config = require('./config')
const login = require('./login')
const controllers = { ...test, ...config, ...login }
module.exports = controllers