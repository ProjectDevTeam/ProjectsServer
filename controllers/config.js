const conn = require('../services/db');
const AppError = require('../utils/appError');
const resCode = require('../resCode/index');
const { requestType } = require('../utils/request.config');
const { configSQL } = require('../services/SQL');
const config = {
	getThemeLists: {
		fun: (req, res, next) => {
			const themeListSql = configSQL.getThemeLists();
			conn.query(themeListSql, (err, data, flieds) => {
				if (err) return next(new AppError(err));
				const themeLists = data[0].exp.split(',');
				const resData = themeLists.map((item, index) => {
					return item;
				});
				return res.status(200).json({
					...resCode.getThemeLists.success,
					data: resData
				});
			});
		},
		type: requestType[1]
	}
};

module.exports = config;
