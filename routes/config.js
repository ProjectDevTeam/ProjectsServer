const express = require('express')
const routerConfig = express.Router()
const { config } = require('../controllers')
// routerTheme.route('/getThemeLists').get(controllers.getThemeLists)
Object.keys(config).map(item => {
  routerConfig.route('/' + item)[config[item].type](config[item].fun)
})
module.exports = routerConfig
