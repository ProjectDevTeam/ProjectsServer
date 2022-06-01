const conn = require('../services/db');
const { requestType } = require('../utils/request.config');

const pjServer = {
	getUserInfo: {
		fun: (req, res, next) => {
			const { cookies } = req;
			const cookie = cookies['X-Request-Auth'];
			const sql = `SELECT id,userName,theme, routes FROM userInfo WHERE cookie='${cookie}'`;
			conn.query(sql, (err, data, flieds) => {
				if (err)
					res.status(200).json({
						code: 300,
						messages: [err]
					});
				const resData = { ...data[0] };
				const routes = resData.routes.split(',');
				let whereSql = '';
				routes.forEach((item, index) => {
					if (index == 0) {
						whereSql += `id=${item}`;
					} else {
						whereSql += ` or id=${item}`;
					}
				});
				const routesSql = `select * from \`t-routes\` where ${whereSql}`;
				conn.query(routesSql, '', (err, routeData) => {
					if (err)
						res.status(200).json({
							code: 300,
							messages: [err]
						});
					resData.routes = routeData;
					res.status(200).json({
						code: 0,
						messages: ['success'],
						data: resData
					});
				});
			});
		},
		type: requestType[1]
	},
	getTheme: {
		fun: (req, res, next) => {
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
		},
		type: requestType[1]
	}
};

module.exports = pjServer;
