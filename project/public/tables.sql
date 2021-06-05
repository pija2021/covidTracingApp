DROP DATABASE IF EXISTS tables;
CREATE DATABASE tables;
USE tables;





CREATE TABLE AddressLine (
	id INT,
	Address VARCHAR(50),
	PRIMARY KEY(id)

);

CREATE TABLE Venue (
	id INT,
	Name VARCHAR(50),
	Address VARCHAR(50),
	Date_Time DATE,
	PRIMARY KEY(id)

);

CREATE TABLE History (
	id INT,
	Venue VARCHAR(50),
	Date_Time DATE,
	PRIMARY KEY (id)


);

CREATE TABLE Customer (
	id INT,
	First_Name VARCHAR(50),
	Last_Name VARCHAR(50),
	Email VARCHAR(50) NOT NULL UNIQUE,
	Address VARCHAR(50),
	Contact INT NOT NULL,
	History INT,
	PRIMARY KEY (id)

);




CREATE TABLE Official (
	id INT,
	First_Name VARCHAR(50),
	Last_Name VARCHAR(50),
	Email VARCHAR(50) NOT NULL UNIQUE,
	Address VARCHAR(50),
	Contact INT NOT NULL,
	History INT,
	PRIMARY KEY (id)

);



CREATE TABLE Managers (
	id INT,
	First_Name VARCHAR(50),
	Last_Name VARCHAR(50),
	Email VARCHAR(50) NOT NULL UNIQUE,
	Address VARCHAR(50),
	Contact INT NOT NULL,
	History INT,
	Venue VARCHAR(50),
	PRIMARY KEY (id)


);


CREATE TABLE Hotspot (
	id INT,
	Official INT,
	Venue VARCHAR(50),
	PRIMARY KEY (id)

);








