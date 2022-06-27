const conn = require('../services/db')
const { themeToolSQL } = require('../services/SQL')

const createThemeToolStr = async (data, platform, callback) => {
  let str = `:root{`
  for (let i = 0; i < data.length; i++) {
    const { component, group, position, status, attribute, value } = data[i]
    await conn
      .query(themeToolSQL.getValueName(platform, value))
      .then(res => {
        str += `
            --${component ? component + '-' : ''}${group ? group + '-' : ''}${
          position ? position + '-' : ''
        }${status ? status + '-' : ''}${attribute ?? ''}:var(--${res[0].name});`
      })
      .catch(err => {
        callback(err)
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
