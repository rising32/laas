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

Guest.getallguest = (result) => {
	sql.query("SELECT * FROM TB_GUEST",(err,res) => {
		if (err) {
			console.log("[nodemon] "+err);
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
			result(null,err);
			return;
		}
		result(null,res);
	});
};

module.exports = Guest;