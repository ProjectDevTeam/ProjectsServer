const express = require("express");
const routerLogin = express.Router();
const controllers = require('../controllers')
routerLogin.route("/login").post(controllers.login)

module.exports = routerLogin;