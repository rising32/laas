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

Staff.getallstaff = (result) => {
	sql.query("SELECT * FROM TB_STAFF",(err,res) => {
		if (err) {
			console.log("[nodemon] "+err);
			result(null,err);
			return;
		}
		result(null,res);
	});
};

module.exports = Staff;