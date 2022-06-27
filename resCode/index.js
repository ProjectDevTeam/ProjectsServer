const config = require('./config')
const login = require('./login')
const resCode = { ...config, ...login }

module.exports = resCode
