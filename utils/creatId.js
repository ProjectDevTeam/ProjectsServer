const fs = require('fs')
var md5 = require('md5')
const path = require('path')

const createId = key => {
  return md5(key)
}
module.exports = createId
