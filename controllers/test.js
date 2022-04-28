const test1 = (req, res, next) => {
    res.status(200).json({
        code: "0",
        messages: ["success"]
    })
}

module.exports = { test1 }