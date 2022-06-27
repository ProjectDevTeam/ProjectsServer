const configSQL = {
  getThemeLists() {
    return `SELECT exp FROM sysConfig WHERE config="theme"`
  }
}

module.exports = configSQL
