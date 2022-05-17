//303 不合法
const success = {
    code: 0,
    messages: ['sucess']
}

const login = {
    success,
    failed: {
        code: 303,
        messages: ['用户名或密码错误']
    }
}


module.exports = { login }