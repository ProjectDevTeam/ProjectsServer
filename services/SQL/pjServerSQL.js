const pjServerSQL = {
	getUserInfo(cookie) {
		return `SELECT id,userName,theme, routes FROM userInfo WHERE cookie='${cookie}'`;
	},
	getTheme(cookie) {
		return `SELECT theme FROM userInfo WHERE cookie='${cookie}'`;
	}
};

module.exports = pjServerSQL;
