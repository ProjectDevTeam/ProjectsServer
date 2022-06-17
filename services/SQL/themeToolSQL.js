const themeToolSQL = {
	getThemeValue(themeToolTb) {
		return `select * from \`${themeToolTb}\``;
	},
	getValueList(platform) {
		return `select * from \`${platform}-colorField\``;
	},
	getValueName(platform, value) {
		return `select name from \`${platform}-colorField\` where id=${value}`;
	},
	getAppThemeInfo(query) {
		return `select * from \`${query.platform}-${query.theme}\``;
	},
	getThemeInfoById({ id }) {
		return `select \`id\`, \`component\`,\`position\`, \`group\`, \`status\`, \`attribute\` from  \`theme-tool-light\` where value=${id}`;
	},
	qureyColorField({ id, name, value }) {
		if (id || name || value) {
			let keyInfo = [
				{ key: 'id', value: id, exact: true },
				{ key: 'name', value: name },
				{ key: 'value', value: value }
			];
			return `select * from \`theme-tool-colorField\` where ${qureyColorFieldWhere(keyInfo)}`;
		} else {
			return `select * from \`theme-tool-colorField\``;
		}
	}
};

module.exports = themeToolSQL;

function qureyColorFieldWhere(keyInfo) {
	let sqlWhere = '';
	let numCondition = 0;
	keyInfo.forEach((item, index) => {
		const { key, value, exact = false } = item;
		if (numCondition > 0) {
			if (value) {
				sqlWhere += exact ? ` AND ${key}=${value}` : ` AND ${key} like '%${value}%'`;
				numCondition++;
			}
		} else {
			if (value) {
				sqlWhere += exact ? `${key}=${value}` : `${key} like '%${value}%'`;
				numCondition++;
			}
		}
	});
	return sqlWhere;
}
