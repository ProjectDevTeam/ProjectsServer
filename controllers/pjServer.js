const conn = require('../services/db');
const getUserInfo = (req, res, next) => {
	const { cookies } = req;
	const cookie = cookies['X-Request-Auth'];
	const sql = `SELECT id,userName,theme FROM userInfo WHERE cookie='${cookie}'`;
	conn.query(sql, (err, data, flieds) => {
		if (err)
			res.status(200).json({
				code: 300,
				messages: [err]
			});
		res.status(200).json({
			code: 0,
			messages: ['success'],
			data: data[0]
		});
	});
};
const getTheme = (req, res, next) => {
	const { cookies } = req;
	const cookie = cookies['X-Request-Auth'];
	const sql = `SELECT theme FROM userInfo WHERE cookie='${cookie}'`;
	conn.query(sql, (err, data, flieds) => {
		if (err)
			res.status(200).json({
				code: 300,
				messages: [err]
			});
		res.status(200).json({
			code: 0,
			messages: ['success'],
			data: data[0]
		});
	});
};
const pjServer = {
	getUserInfo: { fun: getUserInfo, type: 'get' },
	getTheme: { fun: getTheme, type: 'get' }
};

module.exports = pjServer;
