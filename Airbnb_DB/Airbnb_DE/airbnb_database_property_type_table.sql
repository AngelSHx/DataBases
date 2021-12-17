-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: airbnb_database
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `property_type_table`
--

DROP TABLE IF EXISTS `property_type_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `property_type_table` (
  `PropertyTypeID` int NOT NULL,
  `PropertyTypeName` varchar(25) NOT NULL,
  PRIMARY KEY (`PropertyTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property_type_table`
--

LOCK TABLES `property_type_table` WRITE;
/*!40000 ALTER TABLE `property_type_table` DISABLE KEYS */;
INSERT INTO `property_type_table` VALUES (1,'Entire guesthouse\r'),(2,'Entire loft\r'),(3,'Private room in residenti'),(4,'Entire guest suite\r'),(5,'Entire cottage\r'),(6,'Entire condominium (condo'),(7,'Entire residential home\r'),(8,'Private room in condomini'),(9,'Entire rental unit\r'),(10,'Entire townhouse\r'),(11,'Private room in townhouse'),(12,'Entire bungalow\r'),(13,'Private room in bungalow\r'),(14,'Private room in rental un'),(15,'Tiny house\r'),(16,'Castle\r'),(17,'Room in hostel\r'),(18,'Shared room in residentia'),(19,'Camper/RV\r'),(20,'Private room in guest sui'),(21,'Shared room in hostel\r'),(22,'Private room in guesthous'),(23,'Entire serviced apartment'),(24,'Private room in bed and b'),(25,'Shipping container\r'),(26,'Private room in loft\r'),(27,'Private room\r'),(28,'Private room in hostel\r'),(29,'Room in boutique hotel\r'),(30,'Farm stay\r'),(31,'Lighthouse\r'),(32,'Room in bed and breakfast'),(33,'Room in aparthotel\r'),(34,'Private room in serviced '),(35,'Shared room in rental uni'),(36,'Private room in villa\r'),(37,'Room in hotel\r'),(38,'Private room in castle\r'),(39,'Shared room in condominiu'),(40,'Entire villa\r'),(41,'Campsite\r'),(42,'Entire vacation home\r');
/*!40000 ALTER TABLE `property_type_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-17  9:17:15
