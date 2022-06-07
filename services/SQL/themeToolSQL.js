const themeToolSQL = {
	getThemeValue(themeToolTb) {
		return `select * from \`${themeToolTb}\``;
	},
	getValueList(platform) {
		return `select * from \`${platform}-value-list\``;
	},
	getValueName(platform, value) {
		return `select name from \`${platform}-value-list\` where id=${value}`;
	}
};

module.exports = themeToolSQL;
