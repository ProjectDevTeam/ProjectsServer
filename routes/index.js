const express = require("express");
const router = express.Router();
const controllers = require('../controllers')
router.route("/test1").get(controllers.test1)
router.route("/getTheme").get(controllers.getTheme)
router.route('/changeTheme').get(controllers.changeTheme)
router.route('/getThemeLists').get(controllers.getThemeLists)

module.exports = router;