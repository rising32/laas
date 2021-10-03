const Guest = require("../model/staff.model.js");

exports.getallstaff = (req,res) => {
	Guest.getallstaff((err,data) => {
		if (err) { res.status(500).send({ message: err.message }); }
		else {
			console.log("[nodemon] retrieving all guest ..."+req.connection.remoteAddress+"\n",data);			
			res.send(data);
		}
	});
};