const pjServerSQL = {
  getUserInfo(cookie) {
    return `SELECT id,userName,theme, routes,fileKey FROM userInfo WHERE cookie='${cookie}'`
  },
  getTheme(cookie) {
    return `SELECT theme FROM userInfo WHERE cookie='${cookie}'`
  }
}

module.exports = pjServerSQL
