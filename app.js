const express = require("express");
const cors = require("cors");
const router = require("./routes");
const app = express()
app.use(cors(), router);
app.all("*", (req, res, next) => {

});
const PORT = 3000;
app.listen(PORT, () => {
    console.log(`server running on port ${PORT}`);
});

module.exports = app;