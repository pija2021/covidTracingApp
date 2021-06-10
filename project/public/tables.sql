
CREATE DATABASE IF NOT EXISTS `tables` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `tables`;



CREATE TABLE IF NOT EXISTS `AddressLine` (
	`id` INT NOT NULL,
	`Address` VARCHAR(50),
	PRIMARY KEY (id)

) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `AddressLine`  (`id`,`Address`) VALUES (1,"123 Fake St");



CREATE TABLE IF NOT EXISTS `Venue` (
	`id` INT NOT NULL,
	`Name` VARCHAR(50),
	`Address` VARCHAR(50),
	`Date_Time` DATE,
	PRIMARY KEY (id)

) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `Venue`  (`id`,`Name`,`Address`) VALUES (1,"GongCha","40 Hindley St");



CREATE TABLE `History` (
	`id` INT NOT NULL,
	`Venue` VARCHAR(50),
	`Date_Time` DATE,
	PRIMARY KEY (id)


) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;





CREATE TABLE `Customer` (
	`id` INT NOT NULL,
	`First_Name` VARCHAR(50),
	`Last_Name` VARCHAR(50),
	`Email` VARCHAR(50) NOT NULL UNIQUE,
	`Address` VARCHAR(50),
	`Contact` INT NOT NULL,
	`History` INT,
	PRIMARY KEY (id)

) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `Customer`  (`id`,`First_Name`,`Last_Name`,`Email`,`Address`,`Contact`) VALUES (1,"John","Smith","johnsmith1@gmail.com","22 Rose St Rosewater","0412345678");




CREATE TABLE `Official` (
	`id` INT NOT NULL,
	`First_Name` VARCHAR(50),
	`Last_Name` VARCHAR(50),
	`Email` VARCHAR(50) NOT NULL UNIQUE,
	`Address` VARCHAR(50),
	`Contact` INT NOT NULL,
	`History` INT,
	PRIMARY KEY (id)

) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `Official`  (`id`,`First_Name`,`Last_Name`,`Email`,`Address`,`Contact`) VALUES (1,"Ella","Musk","Ellamusk2@gmail.com","23 Rose St Rosewater","0498765432");


CREATE TABLE `Managers` (
	`id` INT,
	`First_Name` VARCHAR(50),
	`Last_Name` VARCHAR(50),
	`Email` VARCHAR(50) NOT NULL UNIQUE,
	`Address` VARCHAR(50),
	`Contact` INT NOT NULL,
	`History` INT,
	`Venue` VARCHAR(50),
	PRIMARY KEY (id)


) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `Managers`  (`id`,`First_Name`,`Last_Name`,`Email`,`Address`,`Contact`) VALUES (1,"Andy","Lam","Andylam3@gmail.com","18 Eastern Parade Ottoway","0411223344");



CREATE TABLE `Hotspot` (
	`id` INT NOT NULL,
	`Official` INT,
	`Venue` VARCHAR(50),
	PRIMARY KEY (id)

) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `Hotspot`  (`id`,`Venue`) VALUES (1,"Subway");







