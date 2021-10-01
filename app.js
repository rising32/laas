const express = require("express");
const parser = require("body-parser");
const app = express();
require("dotenv").config();
require("./app/config/route.js")(app);

app.use(parser.json());
app.use(parser.urlencoded({extended: true}));
app.listen(process.env.APP_PORT,() => {
	console.log("[nodemon] running laas on port "+process.env.APP_PORT+" ...");
});
