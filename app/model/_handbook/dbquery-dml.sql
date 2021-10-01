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

INSERT INTO TB_GUEST VALUES ("haspul","Haspul Naser","082125337746","Jl. Siaga Raya Komp. LAN, C13, Pejaten Barat","12520",1,NOW(),NOW());
INSERT INTO TB_GUEST VALUES ("hanip","Hanif Salsabil Kusumaditya",NULL,NULL,NULL,1,NOW(),NOW());

/* REFERENCES
-------------
- https://www.mysqltutorial.org/mysql-datetime/
- https://dev.mysql.com/doc/refman/8.0/en/creating-database.html
- https://www.javatpoint.com/mysql-boolean
- https://dev.mysql.com/doc/refman/8.0/en/example-auto-increment.html
- https://www.w3schools.com/sql/sql_foreignkey.asp
- https://www.mysqltutorial.org/mysql-show-users/
- https://www.w3schools.com/sql/sql_insert.asp
*/