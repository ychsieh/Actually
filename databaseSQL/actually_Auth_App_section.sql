CREATE DATABASE  IF NOT EXISTS `actually` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `actually`;
-- MySQL dump 10.13  Distrib 5.6.19, for osx10.7 (i386)
--
-- Host: 127.0.0.1    Database: actually
-- ------------------------------------------------------
-- Server version	5.6.21-enterprise-commercial-advanced

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Auth_App_section`
--

DROP TABLE IF EXISTS `Auth_App_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Auth_App_section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `percentage` double NOT NULL,
  `progress` double NOT NULL,
  `developer_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `optional1` varchar(1000) DEFAULT NULL,
  `optional2` varchar(1000) DEFAULT NULL,
  `optional3` varchar(1000) DEFAULT NULL,
  `expectedProgress` double NOT NULL DEFAULT '0',
  `fifteenDaysProgressList` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Auth_App_section_97ab1235` (`developer_id`),
  KEY `Auth_App_section_37952554` (`project_id`),
  CONSTRAINT `developer_id_refs_id_2f33f4e2` FOREIGN KEY (`developer_id`) REFERENCES `Auth_App_developer` (`id`),
  CONSTRAINT `project_id_refs_id_8216aea2` FOREIGN KEY (`project_id`) REFERENCES `Auth_App_project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Auth_App_section`
--

LOCK TABLES `Auth_App_section` WRITE;
/*!40000 ALTER TABLE `Auth_App_section` DISABLE KEYS */;
INSERT INTO `Auth_App_section` VALUES (1,'GoogleWen','',0.2,0.5,1,1,'','','',0,'0.4 0.4 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 '),(2,'GoogleLong','',0.4,0.3,2,1,'','','',0,''),(3,'GoogleSha','',0.4,0.4,3,1,'','','',0,''),(4,'AmazonWen','',0.5,0.6,1,2,'','','',0,'0.6 0.6 0.6 0.6 0.6 0.6 '),(5,'AmazonLong','',0.3,0.2,2,2,'','','',0,NULL),(6,'AmazonSha','',0.2,0.5,3,2,'','','',0,NULL),(7,'OracleYa','',0.5,0.5,4,3,'','','',0,NULL),(8,'OracleYi','',0.5,0.6,5,3,'','','',0,NULL),(9,'FacebookZhu','fbz',0.2,0.3,1,98,'','','',0.4,''),(10,'FacebookJia','fbj',0.6,0.45,5,98,'','','',0.33,''),(11,'FacebookSha','fbs',0.2,0.25,3,98,'','','',0.35,'');
/*!40000 ALTER TABLE `Auth_App_section` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-12-15 21:55:28
