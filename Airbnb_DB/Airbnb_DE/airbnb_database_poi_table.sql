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
-- Table structure for table `poi_table`
--

DROP TABLE IF EXISTS `poi_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `poi_table` (
  `POI_PK` int NOT NULL,
  `POI_Phone` varchar(12) DEFAULT NULL,
  `POI_Address` varchar(50) NOT NULL,
  `POI_Neighborhood` varchar(50) NOT NULL,
  PRIMARY KEY (`POI_PK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poi_table`
--

LOCK TABLES `poi_table` WRITE;
/*!40000 ALTER TABLE `poi_table` DISABLE KEYS */;
INSERT INTO `poi_table` VALUES (1,'','Colorado State Bank Building','1600 Broadway\r'),(2,'','1999 Broadway','1999 Broadway\r'),(3,'','Hyatt Regency','1750 Welton St.\r'),(4,'303-777-4441','Phipps Mansion','3400 Belcaro Dr.\r'),(5,'303-571-4401','Museo de las Americas','861 Santa Fe Dr.\r'),(6,'303-322-1053','\"Denver Museum of Miniatures',' Dolls and Toys\"'),(7,'303-322-7009','Denver Museum of Nature and Science','2001 Colorado Blvd.\r'),(8,'303-260-6000','Denver Pavilions Shopping Center','500 16th St.\r'),(9,'303-296-0219','El Centro Su Teatro','4725 High St.\r'),(10,'303-761-0117','Fort Logan National Cemetery','3698 S. Sheridan Blvd.\r'),(11,'303-866-3682','Governor\'s Mansion','400 E. 8th Ave.\r'),(12,'303-894-2505','Grant-Humphreys Mansion','770 Pennsylvania St.\r'),(13,'303-446-9207','Houston Fine Arts Center','7111 Montview Blvd.\r'),(14,'303-322-7009','Imax Theatre and Gates Planetarium','2001 Colorado Blvd.\r'),(15,'303-744-6883','Mayan Theater','110 Broadway St.\r'),(16,'303-556-2400','Metropolitan State College of Denver','1380 Lawrence St.\r'),(17,'303-458-4850','Invesco Field at Mile High Stadium','2755 W. 17th Ave.\r'),(18,'303-399-2660','Mizel Arts Center','350 S. Dahlia St.\r'),(19,'303-832-4092','Molly Brown House Museum','1340 Pennsylvania St.\r'),(20,'303-297-1166','National Western Complex','4655 Humboldt St.\r'),(21,'303-561-4450','Ocean Journey','700 Water St.\r'),(22,'303-831-9448','Ogden Theatre','935 E. Colfax Ave.\r'),(23,'303-388-3900','Cherry Creek Shopping Center','3000 E. 1st Ave.\r'),(24,'303-825-4904','Paramount Theater','1631 Glenarm Pl.\r'),(25,'303-458-4900','Regis University','3333 Regis Blvd.\r'),(26,'','Richthofen Castle','7020 E. 12th Ave.\r'),(27,'303-871-2336','Ritchie Events Center','2240 E. Buchtel Blvd.\r'),(28,'303-866-2604','State Capitol','200 E. Colfax Ave.\r'),(29,'303-572-6868','Tabor Center','\"1201 16th St.'),(30,'303-534-1012','Union Station','1701 Wynkoop St.\r'),(31,'303-405-4761','United States Mint at Denver','320 W. Colfax Ave.\r'),(32,'303-399-1859','Four Mile House and Historic Park','715 S. Forest St.\r'),(33,'303-753-6046','Rocky Mountain College of Art and Design','6875 E. Evans Ave.\r'),(34,'303-556-2400','University of Colorado at Denver','1250 14th St.\r'),(35,'303-372-0000','University of Colorado Health Sciences Center','4200 E. 9th Ave.\r'),(36,'303-871-2000','University of Denver','2199 S. University Blvd.\r'),(37,'303-405-8555','Pepsi Center','1000 Chopper Pl.\r'),(38,'303-342-2000','Denver International Airport','8500 Pena Blvd.\r'),(39,'720-865-5000','Denver Art Museum','100 W. 14th Ave. Parkway\r'),(40,'303-556-3291','Ninth Street Historic Park','1027 9th St.\r'),(41,'303-861-8888','Children\'s Hospital','1056 E. 19th Ave.\r'),(42,'303-376-4800','Denver Zoo','2300 Steele St.\r'),(43,'303-433-7444','Children\'s Museum','2121 Childrens Museum Dr.\r'),(44,'303-871-5172','Chamberlain Observatory','2390 E. Warren Ave.\r'),(45,'','410 W 17th St','410 W. 17th St.\r'),(46,'','World Trade Center','1625 Broadway\r'),(47,'303-893-3333','Adam\'s Mark Hotel','1550 Court Pl.\r'),(48,'','1899 Wynkoop','1899 Wynkoop St.\r'),(49,'','Blake Street Terrace','1860 Blake St.\r'),(50,'','Mellon Financial Center','1775 Sherman St.\r'),(51,'','Lincoln Center','1660 Lincoln St.\r'),(52,'','17th Street Plaza','1225 17th St.\r'),(53,'','Denver Dry Building','700 16th St.\r'),(54,'','Hotel Teatro','1100 14th St.\r'),(55,'','One Tabor Center','1200 17th St.\r'),(56,'','Columbine Place','216 16th St.\r'),(57,'','Larimer Corporate Plaza','1675 Larimer St.\r'),(58,'303-556-3276','Auraria Campus/Higher Education','1380 Lawrence St.\r'),(59,'303-892-1436','Denver Firefighters Museum','1326 Tremont Pl.\r'),(60,'303-640-2862','Denver Performing Arts Complex','950 13th St.\r'),(61,'303-685-8143','Larimer Square','1430 Larimer Square\r'),(62,'','Legacy Tower','700 17th St.\r'),(63,'','Sakura Square','1255 19th St.\r'),(64,'720-913-4900','Denver City and County Building','1435 Bannock St.\r'),(65,'720-865-1111','Denver Public Library','10 W. 14th Ave. Parkway\r'),(66,'','Wells Fargo Tower','621 17th St.\r'),(67,'','Denver Club Building','518 17th St\r'),(68,'303-595-4386','Six Flags Elitch Gardens','2000 Elitches Cir.\r'),(69,'303-360-5360','Wings Over the Rockies Air and Space Museum','7711 E. Academy Blvd. (Lowry Campus)\r'),(70,'','Guaranty Bank Building','805 17th St.\r'),(71,'','Johns Manville Plaza','717 17th St.\r'),(72,'303-292-2566','Black American West Museum and Heritage Center','3091 California St.\r'),(73,'303-297-3111','Brown Palace Hotel','321 17th St.\r'),(74,'303-620-4933','Byers-Evans House','1310 Bannock St.\r'),(75,'303-866-3682','Colorado Historical Society and Museum','1300 Broadway\r'),(76,'303-292-0200','Coors Field','2001 Blake St.\r'),(77,'720-865-3500','Denver Botanic Gardens','1005 York St.\r'),(78,'303-595-3800','Denver Civic Theater','721 Santa Fe Dr.\r'),(79,'303-288-8000','Denver Convention Complex','700 14th St.\r'),(80,'303-436-6000','Denver Health Medical Center','777 Bannock St.\r'),(81,'','Denver Post Tower','1560 Broadway');
/*!40000 ALTER TABLE `poi_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-17  9:17:17
