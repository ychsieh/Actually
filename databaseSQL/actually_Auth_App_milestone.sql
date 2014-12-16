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
-- Table structure for table `Auth_App_milestone`
--

DROP TABLE IF EXISTS `Auth_App_milestone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Auth_App_milestone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `progress` double NOT NULL,
  `expectedProgress` double NOT NULL,
  `percentage` double DEFAULT NULL,
  `dueDate` date NOT NULL,
  `project_id` int(11) NOT NULL,
  `optional1` varchar(100) DEFAULT NULL,
  `optional2` varchar(100) DEFAULT NULL,
  `optional3` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Auth_App_milestone_37952554` (`project_id`),
  CONSTRAINT `project_id_refs_id_38b5324b` FOREIGN KEY (`project_id`) REFERENCES `Auth_App_project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Auth_App_milestone`
--

LOCK TABLES `Auth_App_milestone` WRITE;
/*!40000 ALTER TABLE `Auth_App_milestone` DISABLE KEYS */;
INSERT INTO `Auth_App_milestone` VALUES (1,'GoogleM1','',0.53,0.98,0.4,'2015-02-05',1,'','',''),(2,'GoogleM2','',0.2,0.1,0.4,'2015-03-05',1,'','',''),(3,'GoogleM3','',0,0,0.2,'2015-05-05',1,'','',''),(4,'AmazonM1','',0.5,0.2,0.5,'2015-01-05',2,'','',''),(5,'AmazonM2','',0,0,0.5,'2015-06-05',2,'','',''),(6,'OracleM1','',0.3,0.1,0.4,'2015-01-05',3,'','',''),(7,'OracleM2','',0,0,0.6,'2015-05-05',3,'','',''),(8,'FacebookM1','fbm1',0.3,0.5,0.3,'2014-12-24',98,'','',''),(9,'FacebookM2','fbm2',0.3,0.4,0.5,'2014-12-26',98,'','','');
/*!40000 ALTER TABLE `Auth_App_milestone` ENABLE KEYS */;
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
