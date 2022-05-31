const test = require('./test.js');
const pjServer = require('./pjServer');
const login = require('./login');
const config = require('./config');
const controllers = { test, pjServer, login, config };
module.exports = controllers;
