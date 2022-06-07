const conn = require('../services/db');
const resCode = require('../resCode');
const { createCookie } = require('../utils/createCokkie');
const { long } = require('../utils/serverConfig');
const { requestType } = require('../utils/request.config');
const { loginSQL } = require('../services/SQL');
const login = {
	authLogin: {
		fun: (req, res, next) => {
			const { userName, password } = req.body;
			const sql = loginSQL.authloginUserName(userName);
			conn.query(sql, (err, data) => {
				if (err)
					res.status(200).json({
						code: 300,
						messages: [err]
					});
				if (data[0]?.password == password) {
					const { cookie, endTime } = createCookie(long);
					const setCookieSql = loginSQL.authloginSetCookie(cookie, endTime, userName);
					conn.query(setCookieSql, (err) => {
						if (err)
							res.status(200).json({
								code: 300,
								messages: [err]
							});
						res.cookie('X-Request-Auth', cookie, {
							maxAge: long,
							httpOnly: true
						});
						res.status(200).json({
							...resCode.login.success
						});
					});
				} else {
					res.status(200).json({
						...resCode.login.failed
					});
				}
			});
		},
		type: requestType[2]
	}
};
module.exports = login;
