const path = require("path");
const logs = require("log4js");
const sql = require("../config/database.js");
const Guest = (guest) => {
	this.username = guest.username;
	this.full_name = guest.full_name;
	this.phone = guest.phone;
	this.address = guest.address;
	this.postal_code = guest.postal_code;
	this.activation = guest.activation;
	this.created_at = guest.created_at;
	this.updated_at = guest.updated_at;
};
const Validation = require("../config/validation.js");
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
Guest.getallguest = (result) => {
	sql.query("SELECT * FROM TB_GUEST",(err,res) => {
		if (err) {
			console.log("[nodemon] "+err);
			logs.getLogger("error").error(err);
			result(null,err);
			return;
		}
		logs.getLogger("GET").debug(res);		
		result(null,res);
	});
};

Guest.geteachguest = (username,result) => {
	var fixed_username = Validation.sanitizeWord(username,0);	
	sql.query("SELECT * FROM TB_GUEST WHERE username=?",fixed_username,(err,res) => {
		if (err) {
			console.log("[nodemon] "+err);
			logs.getLogger("error").error(err);			
			result(null,err);
			return;
		}
		logs.getLogger("GET").debug(res);		
		result(null,res);
	});
};

Guest.getregexguest = (username,result) => {
	var fixed_username = Validation.sanitizeWord(username,0); 
	console.log("[nodemon] username: "+username+" >> "+fixed_username);	
	sql.query("SELECT * FROM TB_GUEST WHERE username LIKE ?","%"+fixed_username+"%",(err,res) => {
		if (err) {
			console.log("[nodemon] "+err);
			logs.getLogger("error").error(err);						
			result(null,err);
			return;
		}
		logs.getLogger("GET").debug(res);		
		result(null,res);
	});
};

Guest.getguesttransaction = (username,result) => {
	var fixed_username = Validation.sanitizeWord(username,0); 
	console.log("[nodemon] username: "+username+" >> "+fixed_username);	
	sql.query("SELECT * FROM VW_USER_TRANSACTION WHERE guest_username=?",fixed_username,(err,res) => {
		if (err) {
			console.log("[nodemon] "+err);
			logs.getLogger("error").error(err);						
			result(null,err);
			return;
		}
		logs.getLogger("GET").debug(res);		
		result(null,res);
	});
};


module.exports = Guest;