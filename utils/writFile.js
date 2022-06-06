const path = require('path');
const fs = require('fs');
const writeFile = (file, data, success, error) => {
	console.log(data);
	fs.writeFile(file, data, function (err, data) {
		if (err) {
			console.log(file + '写文件操作失败:', err);
			error(err);
		} else {
			console.log('文件写入成功' + file);
			success();
		}
	});
};

module.exports = writeFile;
