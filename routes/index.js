const express = require("express");
const router = express.Router();
const controllers = require('../controllers')

router.route("/test1").get(controllers.test1)

module.exports = router;