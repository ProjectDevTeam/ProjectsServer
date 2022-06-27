const { requestType } = require('../utils/request.config')

const test = {
  test1: {
    fun: (req, res, next) => {
      res.status(200).json({
        code: '0',
        messages: ['success']
      })
    },
    type: requestType[1]
  }
}
module.exports = test
