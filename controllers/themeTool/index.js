const path = require('path');
const { requestType } = require('../../utils/request.config');
const conn = require('../../services/db');
const AppError = require('../../utils/appError');
const writeFile = require('../../utils/writFile');
const { createThemeToolStr, createThemeToolValueStr } = require('./createStr');
const { themeToolSQL } = require('../../services/SQL');
const themeTool = {
	getThemeValue: {
		fun: (req, res, next) => {
			const { query } = req;
			const { platform, theme } = query;
			const themeToolTb = `${platform}-${theme}`;
			const SQL = themeToolSQL.getThemeValue(themeToolTb);
			conn.query(SQL, (err, data, flieds) => {
				if (err) return next(new AppError(err));
				return res.status(200).json({
					code: '0',
					data: data
				});
			});
		},

		type: requestType[1]
	},
	getValueList: {
		fun: (req, res, next) => {
			const { query } = req;
			// conn.query();
			const { platform } = query;
			const SQL = themeToolSQL.getValueList(platform);
			conn.query(SQL, (err, data, flieds) => {
				if (err) return next(new AppError(err));
				return res.status(200).json({
					code: '0',
					data: data
				});
			});
		},
		type: requestType[1]
	},
	updataThemeValue: {
		fun: (req, res, next) => {
			const { platform, theme } = req.body;
			const themeToolTb = `${platform}-${theme}`;
			const SQL = `select * from \`${themeToolTb}\``;
			conn.query(SQL, (err, data, flieds) => {
				if (err) return next(new AppError(err));
				const ThemeToolStr = createThemeToolStr(data, platform, function (err) {
					res.status(200).json({
						code: '300',
						messages: [err]
					});
				});
				ThemeToolStr.then((resu) => {
					writeFile(
						path.resolve(__dirname, `../../web-app/files/${platform}/css/global.css`),
						resu,
						function () {},
						function (err) {
							next(new AppError(err));
						}
					);
					conn.query(themeToolSQL.getValueList(platform), (err, dataValue, flieds) => {
						if (err) return next(new AppError(err));
						const ThemeToolValueStr = createThemeToolValueStr(dataValue, platform);
						writeFile(
							path.resolve(__dirname, `../../web-app/files/${platform}/css/valueList.css`),
							ThemeToolValueStr,
							function () {
								res.status(200).json({
									code: '0',
									messages: ['success']
								});
							},
							function (err) {}
						);
					});
				});
			});
		},
		type: requestType[2]
	}
};
module.exports = themeTool;
