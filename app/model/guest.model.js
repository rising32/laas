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
  		error: { type: "file", filename: path.join(__dirname,"../../log/error.log") }, 
  		get_request: { type: "file", filename: path.join(__dirname,"../../log/get-request.log") } },
  	categories: { 
  		default: { appenders: ["error"], level: "error" },
  		get_request: { appenders: ["get_request"], level: "debug" } }
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
		result(null,res);
	});
};

Guest.geteachguest = (username,result) => {
	sql.query("SELECT * FROM TB_GUEST WHERE username=?",username,(err,res) => {
		if (err) {
			console.log("[nodemon] "+err);
			logs.getLogger("error").error(err);			
			result(null,err);
			return;
		}
		result(null,res);
	});
};

Guest.getregexguest = (username,result) => {
	var fixed_username = Validation.sanitizeWord(username,0); 
	console.log("[nodemon] username: "+username+" >> "+fixed_username);	
	sql.query("SELECT * FROM TB_GUEST WHERE username LIKE ?","%"+fixed_username+"%",(err,res) => {
		if (err) {
			console.log("[nodemon] "+err);
			result(null,err);
			return;
		}
		logs.getLogger("get_request").debug("username: "+username+" >> "+fixed_username);				
		logs.getLogger("get_request").debug(res);		
		result(null,res);
	});
};

module.exports = Guest;