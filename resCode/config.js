//303 不合法
const success = {
    code: 0,
    messages: ['sucess']
}
const getTheme = {
    success
}
const changeTheme = {
    success,
    failed: {
        themeUndefind: {
            code: 303,
            messages: ['参数不合法,theme不存在']
        },
        themeTypeErr: {
            code: 304,
            messages: ['参数不合法，类型错误，应为number']
        }
    }
}
const getThemeLists = {
    success,
}
const config = {
    getTheme,
    changeTheme,
    getThemeLists
}

module.exports = config