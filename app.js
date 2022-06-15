const express = require('express');
const path = require('path');
const cors = require('cors');
const routerConfig = require('./routes/config');
const routerLogin = require('./routes/login');
const routePjServer = require('./routes/pjServer.js');
const routerthemeTool = require('./routes/themeTool');
const app = express();
const bodyparser = require('body-parser');
const cookieParser = require('cookie-parser');
const errorHandler = require('./utils/errorHandler');
const AppError = require('./utils/appError');
const conn = require('./services/db');
const { long } = require('./utils/serverConfig');
const fs = require('fs');
app.use(bodyparser.urlencoded({ extended: true }));
app.use(bodyparser.json());
app.use(cookieParser());
app.use(cors(), [routePjServer, routerConfig, routerLogin]);
app.use('/', express.static(path.resolve(__dirname, './web-app/files/')));
app.use(express.static(path.resolve(__dirname, './web-app/app/tts/')));
app.use(express.static(path.resolve(__dirname, './web-app/app/auth')));

app.all(/\/pjServer|\/ThemeTool/, (req, res, next) => {
	const { cookies } = req;
	if (cookies['X-Request-Auth'] === undefined) {
		res.status(401).json();
	} else {
		conn.query('SELECT endTime FROM userInfo WHERE cookie = ?', [cookies['X-Request-Auth']], function (err, data, fields) {
			if (err) return next(new AppError(err));
			if (data.length === 0) {
				res.status(401).json();
			} else {
				if (Number(data[0].endTime) < Number(new Date())) {
					res.status(401).json();
				} else {
					const setCookieSql = `UPDATE userInfo SET endTime='${Number(new Date()) + long}' WHERE cookie='${[cookies['X-Request-Auth']]}'`;
					conn.query(setCookieSql, (err) => {
						if (err)
							res.status(200).json({
								code: 300,
								messages: [err]
							});
						res.cookie('X-Request-Auth', cookies['X-Request-Auth'], {
							maxAge: long,
							httpOnly: true
						});
						next();
					});
				}
			}
		});
	}
});
app.use('/themeTool', routerthemeTool);
app.use('/config', routerConfig);
app.use('/auth', routerLogin);
app.use('/pjServer', routePjServer);
app.get(/^\/tts\/*/, (req, res) => {
	fs.readFile(__dirname + '/web-app/app/tts/build/index.html', (err, data) => {
		if (err) {
			console.log(err);
			res.send('后台错误');
		} else {
			res.writeHead(200, {
				'Content-Type': 'text/html; charset=utf-8'
			});
			res.end(data);
		}
	});
});
app.get(/^\/login/, (req, res) => {
	fs.readFile(__dirname + '/web-app/app/auth/build/index.html', (err, data) => {
		if (err) {
			console.log(err);
			res.send('后台错误');
		} else {
			res.writeHead(200, {
				'Content-Type': 'text/html; charset=utf-8'
			});
			res.end(data);
		}
	});
});
app.all('*', (req, res, next) => {
	next(new AppError(`The URL ${req.originalUrl} does not exists`, 404));
});

app.use(errorHandler);
const PORT = 3000;
app.listen(PORT, () => {
	console.log(`server running on port ${PORT}`);
});

module.exports = app;
