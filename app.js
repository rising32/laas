const express = require("express");
const parser = require("body-parser");
const app = express();
require('dotenv').config();

app.use(parser.json());
app.use(parser.urlencoded({extended: true}));

app.get("/echo",(req,res) => {
	res.json({
		status:"laundry-as-a-service",
		db_name:process.env.DB_HOST,
		db_user:process.env.DB_USER,
		db_password:process.env.DB_PASSWORD
	});
});

app.listen(3000,() => {
	console.log("[nodemon] running laas on port 3000 ...");
});
