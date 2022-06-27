const conn = require('../../services/db')
const { themeToolSQL } = require('../../services/SQL')
const selectValueName = (platform, item) => {
  const { component, group, position, status, attribute, value } = item
  return new Promise((resolve, reject) => {
    conn.query(themeToolSQL.getValueName(platform, value), (err, data) => {
      if (err) error(err)
      resolve(`
            --${component ? component + '-' : ''}${group ? group + '-' : ''}${
        position ? position + '-' : ''
      }${status ? status + '-' : ''}${attribute ?? ''}:var(--${data[0].name});`)
    })
  })
}

const createThemeToolStr = async (data, platform) => {
  let str = `:root{`
  for (let i = 0; i < data.length; i++) {
    await selectValueName(platform, data[i]).then(res => {
      str += res
    })
  }
  return (str += `
}`)
}
const createThemeToolValueStr = data => {
  let str = `:root{`
  for (let i = 0; i < data.length; i++) {
    const { name, value } = data[i]
    str += `
        --${name}:${value};`
  }
  return (str += `
}`)
}

module.exports = {
  createThemeToolStr,
  createThemeToolValueStr
}
