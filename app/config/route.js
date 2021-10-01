module.exports = app => {
	const guest = require("../controller/guest.controller.js");

	app.get("/",(req,res) => {
		res.json({
			name:"laas",
			version:"1.1.1",
			description:"Laundry-as-a-service API",
			main:"app.js"
		});
	});

	app.get("/echo",(req,res) => {
		res.json({
			status:"laundry-as-a-service",
			db_name:process.env.DB_HOST,
			db_user:process.env.DB_USER,
			db_password:process.env.DB_PASSWORD
		});
	});
		
	app.get("/guest", guest.getallguest);
	app.get("/guest/:username", guest.geteachguest);
};