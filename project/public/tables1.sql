-- MySQL dump 10.13  Distrib 8.0.25, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: tables
-- ------------------------------------------------------
-- Server version	8.0.19-0ubuntu5

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `tables`
--

DROP DATABASE IF EXISTS tables;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `tables` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `tables`;

--
-- Table structure for table `AddressLine`
--

DROP TABLE IF EXISTS `AddressLine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AddressLine` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Address` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AddressLine`
--

LOCK TABLES `AddressLine` WRITE;
/*!40000 ALTER TABLE `AddressLine` DISABLE KEYS */;
INSERT INTO `AddressLine` VALUES (1,'123 Fake St'); -- User
INSERT INTO `AddressLine` VALUES (2,'456 Ram St'); -- Manager
INSERT INTO `AddressLine` VALUES (3,'78 Apple St'); -- Official
INSERT INTO `AddressLine` VALUES (4,'91 Gong St'); -- Gongcha Venue
INSERT INTO `AddressLine` VALUES (5,'99 Veg St'); -- Subway Venue that is hotspot
/*!40000 ALTER TABLE `AddressLine` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `Venue`
--

DROP TABLE IF EXISTS `Venue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Venue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  `AddressID` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Venue`
--

ALTER TABLE Venue
ADD FOREIGN KEY (AddressID) REFERENCES AddressLine(id);

 LOCK TABLES `Venue` WRITE;
/*!40000 ALTER TABLE `Venue` DISABLE KEYS */;
 INSERT INTO `Venue` VALUES (1,'GongCha',4);
 INSERT INTO `Venue` VALUES (2,'Subway',5);
/*!40000 ALTER TABLE `Venue` ENABLE KEYS */;
 UNLOCK TABLES;




--
-- Table structure for table `User`
--



DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `First_Name` varchar(50) DEFAULT NULL,
  `Last_Name` varchar(50) DEFAULT NULL,
  `Email` varchar(50) NOT NULL,
  `AddressID` int NOT NULL,
  `DOB` date,
  `Contact` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

ALTER TABLE User
ADD FOREIGN KEY (AddressID) REFERENCES AddressLine(id);


LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User`
       (`username`,`password`, `First_Name`, `Last_Name`, `Email`,              `AddressID`, `DOB`,            `Contact`)
VALUES ('test',    'test123', 'John',        'Smith',     'johnsmith@gmail.com', 1,         '1997-12-08',      412345678 );
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;






--
-- Table structure for table `History`
--

DROP TABLE IF EXISTS `History`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `History` (
  `id` int NOT NULL AUTO_INCREMENT,
  `UserID` INT NOT NULL,
  `VenueID` INT NOT NULL,
  `Date_Time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `History`
--

ALTER TABLE History
ADD FOREIGN KEY (UserID) REFERENCES User(id),
ADD FOREIGN KEY (VenueID) REFERENCES Venue(id);


LOCK TABLES `History` WRITE;
/*!40000 ALTER TABLE `History` DISABLE KEYS */;
INSERT INTO `History` (id,UserID,VenueID,Date_Time) VALUES (1,2,1, now());
/*!40000 ALTER TABLE `History` ENABLE KEYS */;
UNLOCK TABLES;





--
-- Table structure for table `Managers`
--

DROP TABLE IF EXISTS `Managers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Managers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `First_Name` varchar(50) DEFAULT NULL,
  `Last_Name` varchar(50) DEFAULT NULL,
  `Email` varchar(50) NOT NULL,
  `AddressID` int NOT NULL,
  `Contact` int NOT NULL,
  `Venue` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Managers`
--

ALTER TABLE Managers
ADD FOREIGN KEY (AddressID) REFERENCES AddressLine(id),
ADD FOREIGN KEY (Venue) REFERENCES Venue(id);

LOCK TABLES `Managers` WRITE;
/*!40000 ALTER TABLE `Managers` DISABLE KEYS */;
INSERT INTO `Managers` VALUES (1,'Andy','Lam','Andylam3@gmail.com',2,411223344,1); -- Andy is Manager of Gongcha
/*!40000 ALTER TABLE `Managers` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `Official`
--

DROP TABLE IF EXISTS `Official`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Official` (
  `id` int NOT NULL AUTO_INCREMENT,
  `First_Name` varchar(50) DEFAULT NULL,
  `Last_Name` varchar(50) DEFAULT NULL,
  `Email` varchar(50) NOT NULL,
  `AddressID` int NOT NULL,
  `Contact` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Official`
--

ALTER TABLE Official
ADD FOREIGN KEY (AddressID) REFERENCES AddressLine(id);


LOCK TABLES `Official` WRITE;
/*!40000 ALTER TABLE `Official` DISABLE KEYS */;
INSERT INTO `Official`
       (`id`, `First_Name`, `Last_Name`, `Email`,               `AddressID`, `Contact`)
VALUES (1,    'Ella',       'Musk',      'Ellamusk2@gmail.com',  3,           498765432);
/*!40000 ALTER TABLE `Official` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `Hotspot`
--

DROP TABLE IF EXISTS `Hotspot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Hotspot` (
  `id` int NOT NULL AUTO_INCREMENT,
  `VenueID` INT NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hotspot`
--

ALTER TABLE Hotspot
ADD FOREIGN KEY (VenueID) REFERENCES Venue(id);

LOCK TABLES `Hotspot` WRITE;
/*!40000 ALTER TABLE `Hotspot` DISABLE KEYS */;
INSERT INTO `Hotspot` VALUES (1,2); -- VenueID 2 is Subway, which is the hotspot
/*!40000 ALTER TABLE `Hotspot` ENABLE KEYS */;
UNLOCK TABLES;



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-10 17:17:15
