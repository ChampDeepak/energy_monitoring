-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
--
-- Host: localhost    Database: energy_monitoring
-- ------------------------------------------------------
-- Server version	8.0.42-0ubuntu0.24.04.1

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
-- Table structure for table `appliance_readings`
--

DROP TABLE IF EXISTS `appliance_readings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appliance_readings` (
  `household_id` int NOT NULL,
  `appliance_id` int NOT NULL,
  `amount_consumed` decimal(10,2) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  KEY `appliance_id` (`appliance_id`),
  KEY `idx_appliance_usage` (`household_id`,`appliance_id`,`start_time`),
  CONSTRAINT `appliance_readings_ibfk_1` FOREIGN KEY (`household_id`) REFERENCES `household` (`household_id`),
  CONSTRAINT `appliance_readings_ibfk_2` FOREIGN KEY (`appliance_id`) REFERENCES `appliances` (`appliance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appliance_readings`
--

LOCK TABLES `appliance_readings` WRITE;
/*!40000 ALTER TABLE `appliance_readings` DISABLE KEYS */;
INSERT INTO `appliance_readings` VALUES (1,1,0.24,'2025-07-20 00:00:00','2025-07-20 01:00:00'),(1,1,0.56,'2025-07-20 01:00:00','2025-07-20 02:00:00'),(1,1,0.50,'2025-07-20 02:00:00','2025-07-20 03:00:00'),(1,1,0.14,'2025-07-20 03:00:00','2025-07-20 04:00:00'),(1,1,0.30,'2025-07-20 04:00:00','2025-07-20 05:00:00'),(1,1,0.22,'2025-07-20 05:00:00','2025-07-20 06:00:00'),(1,1,0.45,'2025-07-20 06:00:00','2025-07-20 07:00:00'),(1,1,0.56,'2025-07-20 07:00:00','2025-07-20 08:00:00'),(1,1,0.53,'2025-07-20 08:00:00','2025-07-20 09:00:00'),(1,1,0.42,'2025-07-20 09:00:00','2025-07-20 10:00:00'),(1,1,0.41,'2025-07-20 10:00:00','2025-07-20 11:00:00'),(1,1,0.33,'2025-07-20 11:00:00','2025-07-20 12:00:00'),(1,1,0.58,'2025-07-20 12:00:00','2025-07-20 13:00:00'),(1,1,0.55,'2025-07-20 13:00:00','2025-07-20 14:00:00'),(1,1,0.39,'2025-07-20 14:00:00','2025-07-20 15:00:00'),(1,1,0.35,'2025-07-20 15:00:00','2025-07-20 16:00:00'),(1,1,0.23,'2025-07-20 16:00:00','2025-07-20 17:00:00'),(1,1,0.36,'2025-07-20 17:00:00','2025-07-20 18:00:00'),(1,1,0.30,'2025-07-20 18:00:00','2025-07-20 19:00:00'),(1,1,0.19,'2025-07-20 19:00:00','2025-07-20 20:00:00'),(1,1,0.15,'2025-07-20 20:00:00','2025-07-20 21:00:00'),(1,1,0.13,'2025-07-20 21:00:00','2025-07-20 22:00:00'),(1,1,0.35,'2025-07-20 22:00:00','2025-07-20 23:00:00'),(1,1,0.52,'2025-07-20 00:00:00','2025-07-20 01:00:00'),(1,2,0.28,'2025-07-20 01:00:00','2025-07-20 02:00:00'),(1,10,0.33,'2025-07-20 02:00:00','2025-07-20 03:00:00'),(1,3,0.45,'2025-07-20 03:00:00','2025-07-20 04:00:00'),(1,4,0.62,'2025-07-20 04:00:00','2025-07-20 05:00:00'),(1,5,0.21,'2025-07-20 05:00:00','2025-07-20 06:00:00'),(1,6,0.18,'2025-07-20 06:00:00','2025-07-20 07:00:00'),(1,7,0.88,'2025-07-20 07:00:00','2025-07-20 08:00:00'),(1,8,0.44,'2025-07-20 08:00:00','2025-07-20 09:00:00'),(1,9,0.36,'2025-07-20 09:00:00','2025-07-20 10:00:00'),(2,2,0.55,'2025-07-20 09:00:00','2025-07-20 10:00:00'),(1,2,0.53,'2025-07-21 09:00:00','2025-07-21 10:00:00');
/*!40000 ALTER TABLE `appliance_readings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appliances`
--

DROP TABLE IF EXISTS `appliances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appliances` (
  `appliance_id` int NOT NULL AUTO_INCREMENT,
  `appliance_name` varchar(100) NOT NULL,
  `type` enum('cooling','digital','lighting','ev','other') NOT NULL,
  PRIMARY KEY (`appliance_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appliances`
--

LOCK TABLES `appliances` WRITE;
/*!40000 ALTER TABLE `appliances` DISABLE KEYS */;
INSERT INTO `appliances` VALUES (1,'Air Conditioner','cooling'),(2,'Refrigerator','cooling'),(3,'Television','digital'),(4,'Laptop','digital'),(5,'LED Bulb','lighting'),(6,'Tube Light','lighting'),(7,'EV Charger','ev'),(8,'Washing Machine','other'),(9,'Microwave','other'),(10,'Ceiling Fan','cooling');
/*!40000 ALTER TABLE `appliances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `bill_id` int NOT NULL AUTO_INCREMENT,
  `household_id` int NOT NULL,
  `bill_amount` decimal(10,2) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`bill_id`),
  UNIQUE KEY `uq_bill_month` (`household_id`,`date`),
  CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`household_id`) REFERENCES `household` (`household_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES (1,1,1250.50,'2025-05-01'),(2,2,980.75,'2025-05-01'),(3,3,1115.00,'2025-05-01'),(4,1,1320.00,'2025-06-01'),(5,2,1050.30,'2025-06-01'),(6,3,1185.75,'2025-06-01'),(7,1,1405.10,'2025-07-01'),(8,2,1120.45,'2025-07-01'),(9,3,1233.80,'2025-07-01');
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_rates`
--

DROP TABLE IF EXISTS `bill_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill_rates` (
  `rate_id` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `rate` decimal(10,2) NOT NULL,
  PRIMARY KEY (`rate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_rates`
--

LOCK TABLES `bill_rates` WRITE;
/*!40000 ALTER TABLE `bill_rates` DISABLE KEYS */;
INSERT INTO `bill_rates` VALUES (1,'2025-02-01',6.50),(2,'2025-03-01',6.75),(3,'2025-04-01',6.90),(4,'2025-05-01',7.10),(5,'2025-06-01',7.30),(6,'2025-07-01',7.50);
/*!40000 ALTER TABLE `bill_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `budget`
--

DROP TABLE IF EXISTS `budget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `budget` (
  `budget_id` int NOT NULL AUTO_INCREMENT,
  `household_id` int NOT NULL,
  `date` date NOT NULL,
  `budget_amount_kwh` decimal(10,2) NOT NULL,
  PRIMARY KEY (`budget_id`),
  UNIQUE KEY `uq_budget_month` (`household_id`,`date`),
  CONSTRAINT `budget_ibfk_1` FOREIGN KEY (`household_id`) REFERENCES `household` (`household_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `budget`
--

LOCK TABLES `budget` WRITE;
/*!40000 ALTER TABLE `budget` DISABLE KEYS */;
INSERT INTO `budget` VALUES (1,1,'2025-07-01',126.00),(2,2,'2025-07-01',144.00),(3,3,'2025-07-01',108.00),(5,5,'2025-08-01',72.00);
/*!40000 ALTER TABLE `budget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estimated_bill`
--

DROP TABLE IF EXISTS `estimated_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estimated_bill` (
  `estimated_bill_id` int NOT NULL AUTO_INCREMENT,
  `household_id` int NOT NULL,
  `date` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`estimated_bill_id`),
  KEY `household_id` (`household_id`),
  CONSTRAINT `estimated_bill_ibfk_1` FOREIGN KEY (`household_id`) REFERENCES `household` (`household_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estimated_bill`
--

LOCK TABLES `estimated_bill` WRITE;
/*!40000 ALTER TABLE `estimated_bill` DISABLE KEYS */;
INSERT INTO `estimated_bill` VALUES (1,1,'2025-05-01',1280.00),(2,2,'2025-05-01',1005.00),(3,3,'2025-05-01',1100.00),(4,1,'2025-06-01',1305.00),(5,2,'2025-06-01',1075.00),(6,3,'2025-06-01',1170.00),(7,1,'2025-07-01',1380.00),(8,2,'2025-07-01',1095.00),(9,3,'2025-07-01',1210.00);
/*!40000 ALTER TABLE `estimated_bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `household`
--

DROP TABLE IF EXISTS `household`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `household` (
  `household_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `household_name` varchar(100) DEFAULT NULL,
  `household_address` text,
  PRIMARY KEY (`household_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `household_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `household`
--

LOCK TABLES `household` WRITE;
/*!40000 ALTER TABLE `household` DISABLE KEYS */;
INSERT INTO `household` VALUES (1,1,'Sharma Residence','12 Green Park, New Delhi'),(2,2,'Verma Villa','88 MG Road, Bengaluru'),(3,3,'Khan Apartment','502 Galaxy Towers, Mumbai'),(5,9,'A','B');
/*!40000 ALTER TABLE `household` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meter`
--

DROP TABLE IF EXISTS `meter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meter` (
  `meter_id` int NOT NULL AUTO_INCREMENT,
  `household_id` int NOT NULL,
  `meter_type_id` int NOT NULL,
  `serial_number` varchar(100) NOT NULL,
  PRIMARY KEY (`meter_id`),
  UNIQUE KEY `serial_number` (`serial_number`),
  KEY `household_id` (`household_id`),
  KEY `meter_type_id` (`meter_type_id`),
  CONSTRAINT `meter_ibfk_1` FOREIGN KEY (`household_id`) REFERENCES `household` (`household_id`),
  CONSTRAINT `meter_ibfk_2` FOREIGN KEY (`meter_type_id`) REFERENCES `meter_type` (`meter_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meter`
--

LOCK TABLES `meter` WRITE;
/*!40000 ALTER TABLE `meter` DISABLE KEYS */;
INSERT INTO `meter` VALUES (1,1,1,'ANL-DEL-001'),(2,2,2,'SMT-BLR-002'),(3,3,2,'SMT-MUM-003'),(5,5,1,'A');
/*!40000 ALTER TABLE `meter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meter_readings`
--

DROP TABLE IF EXISTS `meter_readings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meter_readings` (
  `reading_id` int NOT NULL AUTO_INCREMENT,
  `meter_id` int NOT NULL,
  `energy_consumed` decimal(10,2) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`reading_id`),
  KEY `idx_meter_time` (`meter_id`,`timestamp`),
  CONSTRAINT `meter_readings_ibfk_1` FOREIGN KEY (`meter_id`) REFERENCES `meter` (`meter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meter_readings`
--

LOCK TABLES `meter_readings` WRITE;
/*!40000 ALTER TABLE `meter_readings` DISABLE KEYS */;
INSERT INTO `meter_readings` VALUES (1,1,1.69,'2025-07-20 01:00:00'),(2,1,1.48,'2025-07-20 02:00:00'),(3,1,1.17,'2025-07-20 03:00:00'),(4,1,2.35,'2025-07-20 04:00:00'),(5,1,1.56,'2025-07-20 05:00:00'),(6,1,2.00,'2025-07-20 06:00:00'),(7,1,1.83,'2025-07-20 07:00:00'),(8,1,2.21,'2025-07-20 08:00:00'),(9,1,1.45,'2025-07-20 09:00:00'),(10,1,1.96,'2025-07-20 10:00:00'),(11,1,1.25,'2025-07-20 11:00:00'),(12,1,2.52,'2025-07-20 12:00:00'),(13,1,2.04,'2025-07-20 13:00:00'),(14,1,1.37,'2025-07-20 14:00:00'),(15,1,1.63,'2025-07-20 15:00:00'),(16,1,1.94,'2025-07-20 16:00:00'),(17,1,1.66,'2025-07-20 17:00:00'),(18,1,2.12,'2025-07-20 18:00:00'),(19,1,1.78,'2025-07-20 19:00:00'),(20,1,1.59,'2025-07-20 20:00:00'),(21,1,2.40,'2025-07-20 21:00:00'),(22,1,2.16,'2025-07-20 22:00:00'),(23,1,2.77,'2025-07-20 23:00:00'),(24,2,1.51,'2025-07-20 01:00:00'),(25,2,2.71,'2025-07-20 02:00:00'),(26,2,1.84,'2025-07-20 03:00:00'),(27,2,1.69,'2025-07-20 04:00:00'),(28,2,2.04,'2025-07-20 05:00:00'),(29,2,1.72,'2025-07-20 06:00:00'),(30,2,2.25,'2025-07-20 07:00:00'),(31,2,2.13,'2025-07-20 08:00:00'),(32,2,1.55,'2025-07-20 09:00:00'),(33,2,2.08,'2025-07-20 10:00:00'),(34,2,2.22,'2025-07-20 11:00:00'),(35,2,1.63,'2025-07-20 12:00:00'),(36,2,2.14,'2025-07-20 13:00:00'),(37,2,2.39,'2025-07-20 14:00:00'),(38,2,1.91,'2025-07-20 15:00:00'),(39,2,1.87,'2025-07-20 16:00:00'),(40,2,2.11,'2025-07-20 17:00:00'),(41,2,1.47,'2025-07-20 18:00:00'),(42,2,2.31,'2025-07-20 19:00:00'),(43,2,2.55,'2025-07-20 20:00:00'),(44,2,2.16,'2025-07-20 21:00:00'),(45,2,2.78,'2025-07-20 22:00:00'),(46,2,0.93,'2025-07-20 23:00:00'),(47,3,1.84,'2025-07-20 01:00:00'),(48,3,1.76,'2025-07-20 02:00:00'),(49,3,1.48,'2025-07-20 03:00:00'),(50,3,2.21,'2025-07-20 04:00:00'),(51,3,2.08,'2025-07-20 05:00:00'),(52,3,2.39,'2025-07-20 06:00:00'),(53,3,1.71,'2025-07-20 07:00:00'),(54,3,1.99,'2025-07-20 08:00:00'),(55,3,2.28,'2025-07-20 09:00:00'),(56,3,1.65,'2025-07-20 10:00:00'),(57,3,1.89,'2025-07-20 11:00:00'),(58,3,1.97,'2025-07-20 12:00:00'),(59,3,2.40,'2025-07-20 13:00:00'),(60,3,2.67,'2025-07-20 14:00:00'),(61,3,2.00,'2025-07-20 15:00:00'),(62,3,1.74,'2025-07-20 16:00:00'),(63,3,1.82,'2025-07-20 17:00:00'),(64,3,2.56,'2025-07-20 18:00:00'),(65,3,2.19,'2025-07-20 19:00:00'),(66,3,2.35,'2025-07-20 20:00:00'),(67,3,2.61,'2025-07-20 21:00:00'),(68,3,2.08,'2025-07-20 22:00:00'),(69,3,2.43,'2025-07-20 23:00:00'),(70,1,1.30,'2025-07-21 00:00:00'),(71,2,1.45,'2025-07-21 00:00:00'),(72,3,2.70,'2025-07-21 00:00:00');
/*!40000 ALTER TABLE `meter_readings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meter_type`
--

DROP TABLE IF EXISTS `meter_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meter_type` (
  `meter_type_id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`meter_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meter_type`
--

LOCK TABLES `meter_type` WRITE;
/*!40000 ALTER TABLE `meter_type` DISABLE KEYS */;
INSERT INTO `meter_type` VALUES (1,'Electricity'),(2,'Gas'),(3,'Water'),(4,'Solar');
/*!40000 ALTER TABLE `meter_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `notification_id` int NOT NULL AUTO_INCREMENT,
  `household_id` int NOT NULL,
  `type` enum('alert','suggestion') NOT NULL,
  `message` text NOT NULL,
  `read_status` enum('unseen','seen') NOT NULL DEFAULT 'unseen',
  `date` datetime NOT NULL,
  PRIMARY KEY (`notification_id`),
  KEY `idx_household_read_status` (`household_id`,`read_status`),
  KEY `idx_household_date` (`household_id`,`date`),
  CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`household_id`) REFERENCES `household` (`household_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,1,'alert','Your energy usage crossed 80% of your monthly budget.','unseen','2025-07-24 09:00:00'),(2,1,'suggestion','Consider switching off unused appliances at night.','seen','2025-07-25 08:30:00'),(3,2,'alert','Smart plug EV charger was active during peak hours.','unseen','2025-07-23 19:00:00'),(4,2,'suggestion','Try scheduling EV charging between 10 PM and 6 AM.','unseen','2025-07-24 07:45:00'),(5,3,'alert','Your meter hasn’t reported data in the last 3 hours.','seen','2025-07-25 10:00:00'),(6,3,'suggestion','Set a weekly energy goal to optimize usage.','unseen','2025-07-25 11:15:00'),(7,1,'alert','Your energy usage crossed 95% of your monthly budget.','seen','2025-07-26 09:00:00');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smart_plug`
--

DROP TABLE IF EXISTS `smart_plug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smart_plug` (
  `plug_id` int NOT NULL,
  `household_id` int NOT NULL,
  PRIMARY KEY (`plug_id`),
  KEY `idx_plug_household` (`household_id`),
  CONSTRAINT `smart_plug_ibfk_1` FOREIGN KEY (`household_id`) REFERENCES `household` (`household_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smart_plug`
--

LOCK TABLES `smart_plug` WRITE;
/*!40000 ALTER TABLE `smart_plug` DISABLE KEYS */;
INSERT INTO `smart_plug` VALUES (11,1),(12,1),(13,2),(14,2),(15,3),(16,3);
/*!40000 ALTER TABLE `smart_plug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `main_address` text,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Amit Sharma','123 Green Valley, Delhi','amit.sharma@example.com','9876543210'),(2,'Priya Verma','456 Tech Park, Bangalore','priya.verma@example.com','9988776655'),(3,'Rohan Mehta','789 Ocean Drive, Mumbai','rohan.mehta@example.com','9123456789'),(9,'A','B','C','1');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-27 21:09:47
