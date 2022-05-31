const { resolve } = require('path');
const readline = require('readline');
const r1 = readline.createInterface({
	input: process.stdin,
	output: process.stdout
});
async function readLine() {
	return new Promise((resolve) => {
		r1.on('line', (str) => {
			if (str == '/r') {
				console.log('回车');
			}
			resolve(str);
		});
	});
}

function close() {
	r1.close();
}
module.exports = {
	readLine,
	close
};
