USE laas;
ALTER TABLE TB_LAUNDRY_LOG AUTO_INCREMENT = 1;

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

INSERT INTO TB_LAUNDRY_LOG_DETAILS VALUES
(1,"PKN","CCI","REG",1.700),
(1,"SPR-M","CCI","REG",1.000),
(1,"BDC-S","CCI","REG",1.000);

INSERT INTO TB_LAUNDRY_LOG VALUES 
(NULL,CURDATE(),DATE_ADD(CURDATE(),interval 3 day),NULL,"hanip","admin1",0);

INSERT INTO TB_SERVICE VALUES
("CCI","Cuci"),
("STR","Setrika"),
("DRY","Dry Clean");

INSERT INTO TB_TIMING VALUES
("REG","Reguler 3D"),
("EX2","Express 2D"),
("EX1","Express 1D");

INSERT INTO TB_ITEM VALUES
("PKN","Pakaian",8000.00),
("SPR-S","Sprei Kecil (S)",10000.00),
("SPR-M","Sprei Sedang (M)",15000.00),
("SPR-L","Sprei Besar (L)",20000.00),
("BDC-S","Berdcover Kecil (S)",20000.00),
("BDC-M","Berdcover Sedang (M)",30000.00),
("BDC-L","Berdcover Besar (L)",40000.00),
("JJK","Jas/Jaket/Kebaya",15000.00),
("HRD","Hordeng",11000.00),
("VTR","Vitrase",12000.00),
("MSJ","Peralatan Sholat Masjid",0.00);

INSERT INTO TB_STAFF VALUES
("admin1",CONCAT('staff_',SHA1(UNHEX(SHA1('irsyadndu1ABC')))),"Muhammad Nur Irsyad","081318420901","hotpotcookie@gmail.com","Jl. Siaga Raya Komp. LAN, C13, Pejaten Barat","12520","super",1,NOW(),NOW());

INSERT INTO TB_GUEST VALUES
("haspulqadir","Muhammad H. Qadir","081318420901","Jl. Aganis Blok A B20, Mampang Prapatan","12730",1,NOW(),NOW()),
("haspul","Haspul Naser","082125337746","Jl. Siaga Raya Komp. LAN, C13, Pejaten Barat","12520",1,NOW(),NOW()),
("hanip","Hanif Salsabil Kusumaditya",NULL,NULL,NULL,1,NOW(),NOW());

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