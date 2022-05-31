const endCookie = (length = 8) => {
	let res = '';
	for (let i = 0; i < length; i++) {
		res += Math.ceil(Math.random() * 10);
	}
	return res;
};
const createCookie = (long) => {
	const now = Number(new Date());
	const cookie = now + endCookie();
	const endTime = now + long;
	return { cookie, endTime };
};

module.exports = { createCookie };
