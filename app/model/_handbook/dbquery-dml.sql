USE laas;

CREATE TABLE IF NOT EXISTS TB_SERVICE (
	service_id VARCHAR(3) NOT NULL PRIMARY KEY,
	service_name VARCHAR(10) NOT NULL
);

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
("haspul","Haspul Naser","082125337746","Jl. Siaga Raya Komp. LAN, C13, Pejaten Barat","12520",1,NOW(),NOW()),
("hanip","Hanif Salsabil Kusumaditya",NULL,NULL,NULL,1,NOW(),NOW());

/* REFERENCES
-------------
- https://www.mysqltutorial.org/mysql-datetime/
- https://dev.mysql.com/doc/refman/8.0/en/creating-database.html
- https://www.javatpoint.com/mysql-boolean
- https://dev.mysql.com/doc/refman/8.0/en/example-auto-increment.html
- https://www.w3schools.com/sql/sql_foreignkey.asp
- https://www.mysqltutorial.org/mysql-show-users/
- https://www.w3schools.com/sql/sql_insert.asp
- https://stackoverflow.com/questions/3031412/how-to-export-a-mysql-database-using-command-prompt
- https://www.w3schools.com/php/php_mysql_delete.asp
*/