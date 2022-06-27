const loginSQL = {
  authloginUserName(userName) {
    return `SELECT password FROM userInfo WHERE userName='${userName}'`
  },
  authloginSetCookie(cookie, endTime, userName) {
    return `UPDATE userInfo SET cookie='${cookie}',endTime='${endTime}' WHERE userName='${userName}'`
  }
}

module.exports = loginSQL
