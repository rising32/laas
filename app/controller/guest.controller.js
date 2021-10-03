const Guest = require("../model/guest.model.js");

exports.getallguest = (req,res) => {
	Guest.getallguest((err,data) => {
		if (err) { res.status(500).send({ message: err.message }); }
		else {
			console.log("[nodemon] retrieving all guest ..."+req.connection.remoteAddress+"\n",data);			
			res.send(data);
		}
	});
};

exports.geteachguest = (req,res) => {
	Guest.geteachguest(req.params.username, (err,data) => {
		if (err) { res.status(500).send({ message: err.message }); }
		else {
			console.log("[nodemon] retrieving a guest by username ..."+req.connection.remoteAddress+"\n",data);			
			res.send(data);
		}
	});
};