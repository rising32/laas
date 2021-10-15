const path = require("path");
const logs = require("log4js");
const Staff = require("../model/staff.model.js");
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
exports.getallstaff = (req,res) => {
	logs.getLogger("GET").debug(req.host+""+req.originalUrl.split("?").shift()+" "+req.connection.remoteAddress);						
	Staff.getallstaff((err,data) => {
		if (err) { res.status(500).send({ message: err.message }); }
		else {
			console.log("[nodemon] retrieving all staff ..."+req.connection.remoteAddress+"\n",data);			
			res.send(data);
		}
	});
};

exports.geteachstaff = (req,res) => {
	logs.getLogger("GET").debug(req.host+""+req.originalUrl.split("?").shift()+" "+req.connection.remoteAddress);						
	Staff.geteachstaff(req.params.username, (err,data) => {
		if (err) { res.status(500).send({ message: err.message }); }
		else {
			console.log("[nodemon] retrieving a staff by username ..."+req.connection.remoteAddress+"\n",data);			
			res.send(data);
		}
	});
};
