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
-- Table structure for table `neighborhoods_table`
--

DROP TABLE IF EXISTS `neighborhoods_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `neighborhoods_table` (
  `NeighborhoodID` int NOT NULL,
  `NeighborhoodName` varchar(25) NOT NULL,
  PRIMARY KEY (`NeighborhoodID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `neighborhoods_table`
--

LOCK TABLES `neighborhoods_table` WRITE;
/*!40000 ALTER TABLE `neighborhoods_table` DISABLE KEYS */;
INSERT INTO `neighborhoods_table` VALUES (1,'Washington Virginia Vale\r'),(2,'Highland\r'),(3,'Five Points\r'),(4,'North Park Hill\r'),(5,'North Capitol Hill\r'),(6,'Baker\r'),(7,'West Highland\r'),(8,'Overland\r'),(9,'South Park Hill\r'),(10,'CBD\r'),(11,'Washington Park\r'),(12,'Union Station\r'),(13,'Washington Park West\r'),(14,'City Park West\r'),(15,'Clayton\r'),(16,'Stapleton\r'),(17,'Platt Park\r'),(18,'Lowry Field\r'),(19,'Sunnyside\r'),(20,'Congress Park\r'),(21,'Goldsmith\r'),(22,'Capitol Hill\r'),(23,'Berkeley\r'),(24,'Lincoln Park\r'),(25,'Cole\r'),(26,'Cheesman Park\r'),(27,'University\r'),(28,'West Colfax\r'),(29,'Speer\r'),(30,'Sloan Lake\r'),(31,'Hilltop\r'),(32,'Country Club\r'),(33,'Cory - Merrill\r'),(34,'City Park\r'),(35,'Athmar Park\r'),(36,'Gateway - Green Valley Ra'),(37,'Rosedale\r'),(38,'Whittier\r'),(39,'Fort Logan\r'),(40,'Skyland\r'),(41,'Windsor\r'),(42,'Hale\r'),(43,'Cherry Creek\r'),(44,'Bear Valley\r'),(45,'Harvey Park\r'),(46,'Hampden South\r'),(47,'Civic Center\r'),(48,'Jefferson Park\r'),(49,'Montclair\r'),(50,'Harvey Park South\r'),(51,'Regis\r'),(52,'University Park\r'),(53,'Wellshire\r'),(54,'Hampden\r'),(55,'Barnum West\r'),(56,'Virginia Village\r'),(57,'Barnum\r'),(58,'University Hills\r'),(59,'Northeast Park Hill\r'),(60,'East Colfax\r'),(61,'Villa Park\r'),(62,'Chaffee Park\r'),(63,'Belcaro\r'),(64,'Ruby Hill\r'),(65,'Indian Creek\r'),(66,'Globeville\r'),(67,'Montbello\r'),(68,'DIA\r'),(69,'College View - South Plat'),(70,'Mar Lee\r'),(71,'Westwood\r'),(72,'Valverde\r'),(73,'Sun Valley\r'),(74,'Elyria Swansea\r'),(75,'Kennedy\r'),(76,'Marston\r'),(77,'Southmoor Park\r'),(78,'Auraria\r');
/*!40000 ALTER TABLE `neighborhoods_table` ENABLE KEYS */;
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
