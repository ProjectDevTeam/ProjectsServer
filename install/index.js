const db = require('./createConnection');
const { readLine, close } = require('../utils/inputFunc');
const fs = require('fs');
const path = require('path');
let dbconn;
const connInfo = {
	host: '',
	user: '',
	password: ''
};
const config = {
	theme: 'dark'
};
async function createInfo() {
	console.log('Please input host');
	await readLine().then((res) => {
		connInfo.host = res;
	});
	console.log('Please input user');
	await readLine().then((res) => {
		connInfo.user = res;
	});
	console.log('Please input password');
	await readLine().then((res) => {
		connInfo.password = res;
		close();
	});
	const file = path.resolve(__dirname, '../services/dbconfig.js');
	data = `const connInfo = {
        host:'${connInfo.host}',
        user:'${connInfo.user}',
        password: '${connInfo.password}',
        database:'projectsMysql'
    }
    module.exports=connInfo;
    `;
	fs.writeFile(file, data, function (err, data) {
		if (err) {
			console.log(file + '写文件操作失败:', err);
		} else {
			console.log('文件写入成功' + file);
		}
	});
}

createInfo().then(() => {
	dbconn = db(connInfo);
	dbconn.connect((err) => {
		if (err) throw err;
		let sql = `DROP DATABASE IF EXISTS projectsMysql`;
		dbconn.query(sql, (err, res) => {
			if (err) throw err;
			console.log(res);
			dbconn.query('CREATE DATABASE projectsMysql', (errs) => {
				if (errs) throw errs;
				const projectsMysql = db({ ...connInfo, database: 'projectsMysql' });
				projectsMysql.connect((err) => {
					if (err) throw err;
					projectsMysql.query(
						`CREATE TABLE sysConfig (
                        config varchar(255) NOT NULL,
                        data varchar(255) DEFAULT NULL,
                        PRIMARY KEY (config)
                      ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;`,
						(errr, ress) => {
							if (errr) throw errr;
							console.log(ress);
							let columns = 'config,data',
								values = [],
								data = '';
							Object.keys(config).forEach((key) => {
								values.push(`'${key}','${config[key]}'`);
							});
							values.forEach((item) => {
								data += `(${item}),`;
							});
							data = data.slice(0, -1);
							projectsMysql.query(
								`INSERT INTO sysConfig(${columns}) VALUES ${data}`,
								(err, res) => {
									if (err) throw err;
									console.log(res);
									process.exit();
								}
							);
						}
					);
				});
			});
		});
	});
});
