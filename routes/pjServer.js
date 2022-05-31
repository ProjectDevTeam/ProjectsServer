const express = require('express');
const routerPjServer = express.Router();
const { pjServer } = require('../controllers');
// routerPjts.route("/getUserInfo").get(controllers.getUserInfo)
// routerPjts.route('/getTheme').get(controllers.getTheme)
Object.keys(pjServer).map((item) => {
	routerPjServer.route('/' + item)[pjServer[item].type](pjServer[item].fun);
});
module.exports = routerPjServer;
