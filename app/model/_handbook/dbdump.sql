-- MySQL dump 10.13  Distrib 8.0.26, for Linux (x86_64)
--
-- Host: localhost    Database: laas
-- ------------------------------------------------------
-- Server version	8.0.26-0ubuntu0.20.04.2

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
-- Table structure for table `TB_GUEST`
--

DROP TABLE IF EXISTS `TB_GUEST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_GUEST` (
  `username` varchar(15) NOT NULL,
  `full_name` varchar(35) NOT NULL,
  `phone` varchar(13) DEFAULT NULL,
  `address` text,
  `postal_code` varchar(6) DEFAULT NULL,
  `activation` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_GUEST`
--

LOCK TABLES `TB_GUEST` WRITE;
/*!40000 ALTER TABLE `TB_GUEST` DISABLE KEYS */;
INSERT INTO `TB_GUEST` VALUES ('hanip','Hanif Salsabil Kusumaditya',NULL,NULL,NULL,1,'2021-10-01 14:48:11','2021-10-01 14:48:11'),('haspul','Haspul Naser','082125337746','Jl. Siaga Raya Komp. LAN, C13, Pejaten Barat','12520',1,'2021-10-01 14:45:47','2021-10-01 14:45:47');
/*!40000 ALTER TABLE `TB_GUEST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_ITEM`
--

DROP TABLE IF EXISTS `TB_ITEM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_ITEM` (
  `item_id` varchar(5) NOT NULL,
  `item_name` text NOT NULL,
  `item_price` decimal(7,2) NOT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_ITEM`
--

LOCK TABLES `TB_ITEM` WRITE;
/*!40000 ALTER TABLE `TB_ITEM` DISABLE KEYS */;
INSERT INTO `TB_ITEM` VALUES ('BDC-L','Berdcover Besar (L)',40000.00),('BDC-M','Berdcover Sedang (M)',30000.00),('BDC-S','Berdcover Kecil (S)',20000.00),('HRD','Hordeng',11000.00),('JJK','Jas/Jaket/Kebaya',15000.00),('MSJ','Peralatan Sholat Masjid',0.00),('PKN','Pakaian',8000.00),('SPR-L','Sprei Besar (L)',20000.00),('SPR-M','Sprei Sedang (M)',15000.00),('SPR-S','Sprei Kecil (S)',10000.00),('VTR','Vitrase',12000.00);
/*!40000 ALTER TABLE `TB_ITEM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_LAUNDRY_LOG`
--

DROP TABLE IF EXISTS `TB_LAUNDRY_LOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_LAUNDRY_LOG` (
  `order_no` int NOT NULL AUTO_INCREMENT,
  `drop_in_item` date NOT NULL,
  `drop_off_item` date NOT NULL,
  `pick_up_item` date DEFAULT NULL,
  `guest_username` varchar(15) NOT NULL,
  `staff_username` varchar(15) NOT NULL,
  `payment_status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`order_no`),
  KEY `guest_username` (`guest_username`),
  KEY `staff_username` (`staff_username`),
  CONSTRAINT `TB_LAUNDRY_LOG_ibfk_1` FOREIGN KEY (`guest_username`) REFERENCES `TB_GUEST` (`username`),
  CONSTRAINT `TB_LAUNDRY_LOG_ibfk_2` FOREIGN KEY (`staff_username`) REFERENCES `TB_STAFF` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_LAUNDRY_LOG`
--

LOCK TABLES `TB_LAUNDRY_LOG` WRITE;
/*!40000 ALTER TABLE `TB_LAUNDRY_LOG` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_LAUNDRY_LOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_LAUNDRY_LOG_DETAILS`
--

DROP TABLE IF EXISTS `TB_LAUNDRY_LOG_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_LAUNDRY_LOG_DETAILS` (
  `order_no` int NOT NULL,
  `item_id` varchar(8) NOT NULL,
  `service_id` varchar(3) NOT NULL,
  `timing_id` varchar(3) NOT NULL,
  `qty` decimal(5,3) NOT NULL,
  KEY `order_no` (`order_no`),
  KEY `item_id` (`item_id`),
  KEY `service_id` (`service_id`),
  KEY `timing_id` (`timing_id`),
  CONSTRAINT `TB_LAUNDRY_LOG_DETAILS_ibfk_1` FOREIGN KEY (`order_no`) REFERENCES `TB_LAUNDRY_LOG` (`order_no`),
  CONSTRAINT `TB_LAUNDRY_LOG_DETAILS_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `TB_ITEM` (`item_id`),
  CONSTRAINT `TB_LAUNDRY_LOG_DETAILS_ibfk_3` FOREIGN KEY (`service_id`) REFERENCES `TB_SERVICE` (`service_id`),
  CONSTRAINT `TB_LAUNDRY_LOG_DETAILS_ibfk_4` FOREIGN KEY (`timing_id`) REFERENCES `TB_TIMING` (`timing_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_LAUNDRY_LOG_DETAILS`
--

LOCK TABLES `TB_LAUNDRY_LOG_DETAILS` WRITE;
/*!40000 ALTER TABLE `TB_LAUNDRY_LOG_DETAILS` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_LAUNDRY_LOG_DETAILS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_SERVICE`
--

DROP TABLE IF EXISTS `TB_SERVICE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_SERVICE` (
  `service_id` varchar(3) NOT NULL,
  `service_name` varchar(10) NOT NULL,
  PRIMARY KEY (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_SERVICE`
--

LOCK TABLES `TB_SERVICE` WRITE;
/*!40000 ALTER TABLE `TB_SERVICE` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_SERVICE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_STAFF`
--

DROP TABLE IF EXISTS `TB_STAFF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_STAFF` (
  `username` varchar(15) NOT NULL,
  `password` text NOT NULL,
  `full_name` varchar(35) NOT NULL,
  `phone` varchar(13) NOT NULL,
  `email` varchar(25) NOT NULL,
  `address` text NOT NULL,
  `postal_code` varchar(6) NOT NULL,
  `level` varchar(15) NOT NULL,
  `activation` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_STAFF`
--

LOCK TABLES `TB_STAFF` WRITE;
/*!40000 ALTER TABLE `TB_STAFF` DISABLE KEYS */;
INSERT INTO `TB_STAFF` VALUES ('admin1','staff_81afb89066e28a30e94710a9e067213656100b95','Muhammad Nur Irsyad','081318420901','hotpotcookie@gmail.com','Jl. Siaga Raya Komp. LAN, C13, Pejaten Barat','12520','super',1,'2021-10-02 14:25:37','2021-10-02 14:25:37');
/*!40000 ALTER TABLE `TB_STAFF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_TIMING`
--

DROP TABLE IF EXISTS `TB_TIMING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_TIMING` (
  `timing_id` varchar(3) NOT NULL,
  `timing_name` varchar(10) NOT NULL,
  PRIMARY KEY (`timing_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_TIMING`
--

LOCK TABLES `TB_TIMING` WRITE;
/*!40000 ALTER TABLE `TB_TIMING` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_TIMING` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-03 16:16:24
