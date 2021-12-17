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
-- Table structure for table `poi_neighborhoods_table`
--

DROP TABLE IF EXISTS `poi_neighborhoods_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `poi_neighborhoods_table` (
  `POI_PK` int NOT NULL,
  `POI_Neighborhood_ID` int NOT NULL,
  `POI_Neighborhood` varchar(50) NOT NULL,
  PRIMARY KEY (`POI_PK`,`POI_Neighborhood_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poi_neighborhoods_table`
--

LOCK TABLES `poi_neighborhoods_table` WRITE;
/*!40000 ALTER TABLE `poi_neighborhoods_table` DISABLE KEYS */;
INSERT INTO `poi_neighborhoods_table` VALUES (1,17,'Platt Park\r'),(2,10,'CBD\r'),(3,10,'CBD\r'),(4,63,'Belcaro\r'),(5,24,'Lincoln Park\r'),(6,14,'City Park West\r'),(7,34,'City Park\r'),(8,10,'CBD\r'),(9,74,'Elyria Swansea\r'),(10,39,'Fort Logan\r'),(11,22,'Capitol Hill\r'),(12,22,'Capitol Hill\r'),(13,9,'South Park Hill\r'),(14,34,'City Park\r'),(15,29,'Speer\r'),(16,10,'CBD\r'),(17,73,'Sun Valley\r'),(18,1,'Washington Virginia Vale\r'),(19,22,'Capitol Hill\r'),(20,74,'Elyria Swansea\r'),(21,48,'Jefferson Park\r'),(22,5,'North Capitol Hill\r'),(23,43,'Cherry Creek\r'),(24,10,'CBD\r'),(25,51,'Regis\r'),(26,49,'Montclair\r'),(27,27,'University\r'),(28,22,'Capitol Hill\r'),(29,79,'LoDo\r'),(30,79,'LoDo\r'),(31,47,'Civic Center\r'),(32,1,'Washington Virginia Vale\r'),(33,56,'Virginia Village\r'),(34,79,'LoDo\r'),(35,42,'Hale\r'),(36,27,'University\r'),(37,78,'Auraria\r'),(38,68,'DIA\r'),(39,47,'Civic Center\r'),(40,78,'Auraria\r'),(41,14,'City Park West\r'),(42,34,'City Park\r'),(43,48,'Jefferson Park\r'),(44,52,'University Park\r'),(45,10,'CBD\r'),(46,10,'CBD\r'),(47,10,'CBD\r'),(48,79,'LoDo\r'),(49,79,'LoDo\r'),(50,5,'North Capitol Hill\r'),(51,5,'North Capitol Hill\r'),(52,79,'LoDo\r'),(53,10,'CBD\r'),(54,10,'CBD\r'),(55,79,'LoDo\r'),(56,10,'CBD\r'),(57,79,'LoDo\r'),(58,78,'Auraria\r'),(59,10,'CBD\r'),(60,10,'CBD\r'),(61,79,'LoDo\r'),(62,10,'CBD\r'),(63,79,'LoDo\r'),(64,47,'Civic Center\r'),(65,47,'Civic Center\r'),(66,10,'CBD\r'),(67,10,'CBD\r'),(68,78,'Auraria\r'),(69,18,'Lowry Field\r'),(70,10,'CBD\r'),(71,10,'CBD\r'),(72,3,'Five Points\r'),(73,10,'CBD\r'),(74,47,'Civic Center\r'),(75,22,'Capitol Hill\r'),(76,3,'Five Points\r'),(77,26,'Cheesman Park\r'),(78,24,'Lincoln Park\r'),(79,10,'CBD\r'),(80,24,'Lincoln Park\r'),(81,5,'North Capitol Hill');
/*!40000 ALTER TABLE `poi_neighborhoods_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-17  9:17:16
