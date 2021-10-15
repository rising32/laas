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
	password TEXT NOT NULL,
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
	item_id VARCHAR(5) NOT NULL PRIMARY KEY,
	item_name TEXT NOT NULL,
	item_price DECIMAL(7,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS TB_SERVICE (
	service_id VARCHAR(3) NOT NULL PRIMARY KEY,
	service_name VARCHAR(10) NOT NULL
);

CREATE TABLE IF NOT EXISTS TB_TIMING (
	timing_id VARCHAR(3) NOT NULL PRIMARY KEY,
	timing_name VARCHAR(10) NOT NULL
);

CREATE TABLE IF NOT EXISTS TB_LAUNDRY_LOG_DETAILS (
	order_no INT NOT NULL,
	item_id VARCHAR(8) NOT NULL,
	service_id VARCHAR(3) NOT NULL,
	timing_id VARCHAR(3) NOT NULL,
	qty DECIMAL(5,3) NOT NULL,
	FOREIGN KEY (order_no) REFERENCES TB_LAUNDRY_LOG(order_no),
	FOREIGN KEY (item_id) REFERENCES TB_ITEM(item_id),
	FOREIGN KEY (service_id) REFERENCES TB_SERVICE(service_id),
	FOREIGN KEY (timing_id) REFERENCES TB_TIMING(timing_id)
);

CREATE OR REPLACE VIEW VW_USER_TRANSACTION AS 
	SELECT LL.order_no, G.username AS guest_username, LL.drop_in_item, LL.drop_off_item, LL.pick_up_item,
	G.full_name AS guest_full_name, G.phone AS guest_phone, S.full_name AS staff_full_name, S.phone AS staff_phone,
	SUM(VW.total_price) AS payment_total, LL.payment_status
	FROM TB_LAUNDRY_LOG AS LL 
	INNER JOIN TB_GUEST AS G ON G.username = LL.guest_username
	INNER JOIN TB_STAFF AS S ON S.username = LL.staff_username
	INNER JOIN VW_USER_TRANSACTION_DETAILS VW ON VW.order_no = LL.order_no
	GROUP BY LL.order_no;

CREATE OR REPLACE VIEW VW_USER_TRANSACTION_DETAILS AS 
	SELECT LL.order_no, G.username AS guest_username, G.full_name AS guest_full_name, I.item_name, I.item_price,
	SV.service_name, T.timing_name,
	CASE
		WHEN T.timing_id = "REG" && SV.service_id = "CCI" THEN ROUND((I.item_price * 1.000 * 1.000),2)
		WHEN T.timing_id = "REG" && SV.service_id = "STR" THEN ROUND((I.item_price * 1.000 * 0.812),2)
		WHEN T.timing_id = "REG" && SV.service_id = "DRY" THEN ROUND((I.item_price * 1.000 * 0.900),2)

		WHEN T.timing_id = "EX1" && SV.service_id = "CCI" THEN ROUND((I.item_price * 1.125 * 1.000),2)
		WHEN T.timing_id = "EX1" && SV.service_id = "STR" THEN ROUND((I.item_price * 1.125 * 0.812),2)
		WHEN T.timing_id = "EX1" && SV.service_id = "DRY" THEN ROUND((I.item_price * 1.125 * 0.900),2)	

		WHEN T.timing_id = "EX2" && SV.service_id = "CCI" THEN ROUND((I.item_price * 1.625 * 1.000),2)
		WHEN T.timing_id = "EX2" && SV.service_id = "STR" THEN ROUND((I.item_price * 1.625 * 0.812),2)
		WHEN T.timing_id = "EX2" && SV.service_id = "DRY" THEN ROUND((I.item_price * 1.625 * 0.900),2)			
	END AS total_price
	FROM TB_LAUNDRY_LOG_DETAILS AS LLD
	INNER JOIN TB_LAUNDRY_LOG AS LL ON LLD.order_no = LL.order_no
	INNER JOIN TB_GUEST AS G ON G.username = LL.guest_username
	INNER JOIN TB_STAFF AS ST ON ST.username = LL.staff_username
	INNER JOIN TB_ITEM AS I ON I.item_id = LLD.item_id
	INNER JOIN TB_SERVICE AS SV ON SV.service_id = LLD.service_id
	INNER JOIN TB_TIMING AS T ON T.timing_id = LLD.timing_id;

/*
- Timing:
	1. Regular   : Baseprice * 1.000 = Temp (REG)
	2. Express 1 : Baseprice * 1.125 = Temp (EX1)
	3. Express 2 : Baseprice * 1.625 = Temp (EX2)
- Service
	1. Cuci	     : Temp * 1.000 = Total (CCI)
	2. Setrika   : Temp * 0.812 = Total (STR)
	3. Dry Clean : Temp * 1.000 = Total (DRY)
*/


/* REFERENCES
-------------
- https://www.mysqltutorial.org/mysql-datetime/
- https://dev.mysql.com/doc/refman/8.0/en/creating-database.html
- https://www.javatpoint.com/mysql-boolean
- https://dev.mysql.com/doc/refman/8.0/en/example-auto-increment.html
- https://www.w3schools.com/sql/sql_foreignkey.asp
- https://www.mysqltutorial.org/mysql-show-users/
*/