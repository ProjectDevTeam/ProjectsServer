const test1 = (req, res, next) => {
	res.status(200).json({
		code: '0',
		messages: ['success']
	});
};
const test = { get: { test1 } };
module.exports = test;
