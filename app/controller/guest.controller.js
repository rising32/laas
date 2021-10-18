const path = require("path");
const logs = require("log4js");
const Guest = require("../model/guest.model.js");
// ---------------------------------------
logs.configure({
	appenders: { 
  		ERR: { type: "file", filename: path.join(__dirname,"../../log/error.log") }, 
  		GET: { type: "file", filename: path.join(__dirname,"../../log/get-request.log") } },
  	categories: { 
  		default: { appenders: ["ERR"], level: "error" },
  		GET: { appenders: ["GET"], level: "debug" } }
});
// ---------------------------------------
exports.getallguest = (req,res) => {
	logs.getLogger("GET").debug(req.host+""+req.originalUrl.split("?").shift()+" "+req.connection.remoteAddress);
	Guest.getallguest((err,data) => {
		if (err) { res.status(500).send({ message: err.message }); }
		else {
			console.log("[nodemon] retrieving all guest ..."+req.connection.remoteAddress+"\n",data);			
			res.send(data);
		}
	});
};

exports.geteachguest = (req,res) => {
	logs.getLogger("GET").debug(req.host+""+req.originalUrl.split("?").shift()+" "+req.connection.remoteAddress);
	Guest.geteachguest(req.params.username, (err,data) => {
		if (err) { res.status(500).send({ message: err.message }); }
		else {
			console.log("[nodemon] retrieving a guest by username ..."+req.connection.remoteAddress+"\n",data);			
			res.send(data);
		}
	});
};

exports.getregexguest = (req,res) => {
	logs.getLogger("GET").debug(req.host+""+req.originalUrl.split("?").shift()+" "+req.connection.remoteAddress);
	Guest.getregexguest(req.params.username, (err,data) => {
		if (err) { res.status(500).send({ message: err.message }); }
		else {
			console.log("[nodemon] retrieving guests by username wildcard ..."+req.connection.remoteAddress+"\n",data);
			res.send(data);
		}
	});
};

exports.getguesttransaction = (req,res) => {
	logs.getLogger("GET").debug(req.host+""+req.originalUrl.split("?").shift()+" "+req.connection.remoteAddress);
	Guest.getguesttransaction(req.params.username, (err,data) => {
		if (err) { res.status(500).send({ message: err.message }); }
		else {
			console.log("[nodemon] getting guest transaction ..."+req.connection.remoteAddress+"\n",data);
			res.send(data);
		}
	});
};

exports.getguesttransaction_details = (req,res) => {
	logs.getLogger("GET").debug(req.hostname+""+req.originalUrl.split("?").shift()+" "+req.connection.remoteAddress);
	console.log(req.params);
	Guest.getguesttransaction_details(req.params.username,req.params.order_no,(err,data) => {
		if (err) { res.status(500).send({ message: err.message }); }
		else {
			console.log("[nodemon] getting guest transaction's details ..."+req.connection.remoteAddress+"\n",data);
			res.send(data);
		}
	});
};

exports.getguesttransaction_progress = (req,res) => {
	logs.getLogger("GET").debug(req.hostname+""+req.originalUrl.split("?").shift()+" "+req.connection.remoteAddress);
	console.log(req.params);
	Guest.getguesttransaction_progress(req.params.username,req.params.order_no,(err,data) => {
		if (err) { res.status(500).send({ message: err.message }); }
		else {
			console.log("[nodemon] getting guest transaction's progress ..."+req.connection.remoteAddress+"\n",data);
			res.send(data);
		}
	});
};
