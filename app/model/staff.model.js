const path = require("path");
const logs = require("log4js");
const sql = require("../config/database.js");
const Staff = (staff) => {
	this.username = staff.username;
	this.password = staff.password;
	this.full_name = staff.full_name;
	this.phone = staff.phone;
	this.email = staff.email;
	this.address = staff.address;
	this.postal_code = staff.postal_code;
	this.level = staff.level;
	this.activation = staff.activation;
	this.created_at = staff.created_at;
	this.updated_at = staff.updated_at;
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
Staff.getallstaff = (result) => {
	sql.query("SELECT * FROM TB_STAFF",(err,res) => {
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

Staff.geteachstaff = (username,result) => {
	var fixed_username = Validation.sanitizeWord(username,0);		
	sql.query("SELECT * FROM TB_STAFF WHERE username=?",fixed_username,(err,res) => {
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


module.exports = Staff;