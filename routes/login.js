const express = require('express');
const routerLogin = express.Router();
const { login } = require('../controllers');
// routerLogin.route("/login").post(controllers.login)
Object.keys(login).map((item) => {
	routerLogin.route('/' + item)[login[item].type](login[item].fun);
});
module.exports = routerLogin;
