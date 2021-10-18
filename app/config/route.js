module.exports = app => {
	const guest = require("../controller/guest.controller.js");
	const staff = require("../controller/staff.controller.js");

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

//	app.get("/guest/register",..);
//	app.get("/guest/login",..);
		
	app.get("/guest", guest.getallguest);
	app.get("/guest/:username", guest.geteachguest);
	app.get("/guest/search/:username", guest.getregexguest);

	app.get("/guest/:username/transaction", guest.getguesttransaction); // (user_transaction)
	app.get("/guest/:username/transaction/:order_no/details", guest.getguesttransaction_details); // (user_transaction_details)
	app.get("/guest/:username/transaction/:order_no/progress", guest.getguesttransaction_progress);	// (user_progress)

	app.get("/staff", staff.getallstaff);
	app.get("/staff/:username", staff.geteachstaff);	

	/* NEXT ROUTE: Transaction
	-------------------
	- app.get("/guest/:username/laundry/",..)                   # (user_transaction) order by desc
	- app.get("/guest/:username/laundry/detail/:order_no",..)   # (user_transaction_details) order by desc
	- app.get("/guest/:username/laundry/progress/:order_no",..) # (user_progress)
	*/ 
};