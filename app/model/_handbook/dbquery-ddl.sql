CREATE DATABASE laas;
USE laas;

CREATE TABLE IF NOT EXISTS TB_GUEST (
	username VARCHAR(15) NOT NULL PRIMARY KEY,
	full_name VARCHAR(35) NOT NULL,
	phone VARCHAR(13) NULL,
	address TEXT NULL,
	postal_code VARCHAR(6) NULL,
	activation BOOLEAN NOT NULL,
	created_at DATETIME NOT NULL,
	updated_at DATETIME NOT NULL
);

CREATE TABLE IF NOT EXISTS TB_STAFF (
	username VARCHAR(15) NOT NULL PRIMARY KEY,
	password VARCHAR(15) NOT NULL,
	full_name VARCHAR(35) NOT NULL,
	phone VARCHAR(13) NOT NULL,
	email VARCHAR(25) NOT NULL,
	address TEXT NOT NULL,
	postal_code VARCHAR(6) NOT NULL,
	level VARCHAR(15) NOT NULL,
	activation BOOLEAN NOT NULL,
	created_at DATETIME NOT NULL,
	updated_at DATETIME NOT NULL
);

CREATE TABLE IF NOT EXISTS TB_LAUNDRY_LOG (
	order_no INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	drop_in_item DATE NOT NULL,
	drop_off_item DATE NOT NULL,
	pick_up_item DATE NULL,
	guest_username VARCHAR(15) NOT NULL,
	staff_username VARCHAR(15) NOT NULL,
	payment_status BOOLEAN NULL,
	FOREIGN KEY (guest_username) REFERENCES TB_GUEST(username),
	FOREIGN KEY (staff_username) REFERENCES TB_STAFF(username)
);

CREATE TABLE IF NOT EXISTS TB_ITEM (
	item_id VARCHAR(8) NOT NULL PRIMARY KEY,
	item_name VARCHAR(35) NOT NULL,
	item_price DECIMAL(7,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS TB_LAUNDRY_LOG_DETAILS (
	order_no INT NOT NULL,
	item_id VARCHAR(8) NOT NULL,
	qty DECIMAL(5,3) NOT NULL,
	FOREIGN KEY (order_no) REFERENCES TB_LAUNDRY_LOG(order_no),
	FOREIGN KEY (item_id) REFERENCES TB_ITEM(item_id)
);

/* REFERENCES
-------------
- https://www.mysqltutorial.org/mysql-datetime/
- https://dev.mysql.com/doc/refman/8.0/en/creating-database.html
- https://www.javatpoint.com/mysql-boolean
- https://dev.mysql.com/doc/refman/8.0/en/example-auto-increment.html
- https://www.w3schools.com/sql/sql_foreignkey.asp
- https://www.mysqltutorial.org/mysql-show-users/
*/