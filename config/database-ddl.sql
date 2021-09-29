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

/* REFERENCES
-------------
- https://www.mysqltutorial.org/mysql-datetime/
- https://dev.mysql.com/doc/refman/8.0/en/creating-database.html
- https://www.javatpoint.com/mysql-boolean
*/