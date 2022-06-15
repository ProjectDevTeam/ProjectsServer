const messagesType = require('../utils/messagesType');

//303 不合法
const success = {
	code: 0,
	messages: ['sucess']
};

const login = {
	success,
	failed: {
		code: 303,
		messages: ['用户名或密码错误'],
		messagesType: messagesType.err
	},
	noUserName: {
		code: '301',
		messages: ['请输入用户名'],
		messagesType: 'error'
	},
	noPassword: {
		code: '301',
		messages: ['请输入密码'],
		messagesType: 'error'
	}
};

module.exports = { login };
