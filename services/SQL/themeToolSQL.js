const themeToolSQL = {
  getThemeValue(themeToolTb) {
    return `select * from \`${themeToolTb}\``
  },
  getValueList(platform) {
    return `select * from \`${platform}-colorField\``
  },
  getValueName(platform, value) {
    return `select name from \`${platform}-colorField\` where id=${value}`
  },
  getAppThemeInfo(query) {
    return `select * from \`${query.platform}-${query.theme}\``
  },
  getThemeInfoById({ id }) {
    return `select \`id\`, \`component\`,\`position\`, \`group\`, \`status\`, \`attribute\` from  \`theme-tool-light\` where value=${id}`
  },
  qureyColorField({ id, name, value }) {
    if (id || name || value) {
      let keyInfo = [
        { key: 'id', value: id, exact: true },
        { key: 'name', value: name ?? undefined },
        { key: 'value', value: value ?? undefined }
      ]
      return `select * from \`theme-tool-colorField\` where ${qureyFuzzyWhere(keyInfo)}`
    } else {
      return `select * from \`theme-tool-colorField\``
    }
  },
  qureyThemeInfo({ id, component, position, group, status, attribute }) {
    if (id || component || position || group || status || attribute) {
      let keyInfo = [
        { key: 'id', value: id, exact: true },
        { key: 'component', value: component },
        { key: 'position', value: position },
        { key: 'group', value: group },
        { key: 'status', value: status },
        { key: 'attribute', value: attribute }
      ]
      return `select * from \`theme-tool-light\` where ${qureyFuzzyWhere(keyInfo)}`
    } else {
      return `select * from \`theme-tool-light\``
    }
  },
  updateColorField({ id, color, usedIdLists, swapInfo }) {
    const updateColorFiledsSQL = `UPDATE \`theme-tool-colorField\` SET \`value\`='${color}' where \`id\`='${id}';`
    let userIdListsSQL = ``
    usedIdLists.forEach(item => {
      userIdListsSQL += `UPDATE \`theme-tool-light\` SET \`value\`='${id}' where \`id\`='${item}';`
    })
    let swapInfoSQL = ``
    Object.keys(swapInfo).forEach(item => {
      swapInfoSQL += `UPDATE \`theme-tool-light\` SET \`value\`='${swapInfo[item].to}' where \`id\`='${item}';`
    })
    return updateColorFiledsSQL + userIdListsSQL + swapInfoSQL
  },
  addColorFiled({ name, color }) {
    return `INSERT INTO \`theme-tool-colorField\` (\`name\`, \`value\`) VALUES ('${name}', '${color}');`
  },
  deleteColorFiled(id) {
    return `DELETE FROM \`theme-tool-colorField\` WHERE \`id\`=${id}`
  }
}

module.exports = themeToolSQL

function qureyFuzzyWhere(keyInfo) {
  let sqlWhere = ''
  let numCondition = 0
  keyInfo.forEach((item, index) => {
    const { key, value, exact = false } = item
    if (numCondition > 0) {
      if (value) {
        sqlWhere += exact ? ` AND \`${key}\`=${value}` : ` AND \`${key}\` like '%${value}%'`
        numCondition++
      }
    } else {
      if (value) {
        sqlWhere += exact ? `\`${key}\`=${value}` : `\`${key}\` like '%${value}%'`
        numCondition++
      }
    }
  })
  return sqlWhere
}
