const express = require('express');
const routerthemeTool = express.Router();
const { themeTool } = require('../controllers');
// routerPjts.route("/getUserInfo").get(controllers.getUserInfo)
// routerPjts.route('/getTheme').get(controllers.getTheme)
Object.keys(themeTool).map((item) => {
	routerthemeTool.route('/' + item)[themeTool[item].type](themeTool[item].fun);
});
module.exports = routerthemeTool;
