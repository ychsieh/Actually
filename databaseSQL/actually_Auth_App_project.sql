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
-- Table structure for table `Auth_App_project`
--

DROP TABLE IF EXISTS `Auth_App_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Auth_App_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `startTime` date NOT NULL,
  `finishTime` date DEFAULT NULL,
  `progress` double NOT NULL,
  `repo` varchar(100) DEFAULT NULL,
  `repoOwner` varchar(100) DEFAULT NULL,
  `optional1` varchar(1000) DEFAULT NULL,
  `optional2` varchar(1000) DEFAULT NULL,
  `optional3` varchar(1000) DEFAULT NULL,
  `expectedProgress` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Auth_App_project`
--

LOCK TABLES `Auth_App_project` WRITE;
/*!40000 ALTER TABLE `Auth_App_project` DISABLE KEYS */;
INSERT INTO `Auth_App_project` VALUES (1,'Google','','2014-10-05',NULL,0.41,'google.com','Wen Zhu','0.5','','',0.34),(2,'Amazon','','2014-10-20',NULL,0.4,'amzon.com','Wen Zhu','0.3','','',0.8),(3,'Oracle','','2014-11-04',NULL,0.3,'oracle.com','Wen Zhu','0.2','','',0.8),(98,'Facebook','social','2014-12-15','2014-12-15',0.3,'facebook','treesbug','','','',0.4),(99,'projectName','projectName','2014-12-15','2014-12-15',0,NULL,'treebug',NULL,NULL,NULL,0),(104,'Fucking Man','Fucking Man','2014-12-15','2014-12-15',0,'test','treebug',NULL,NULL,NULL,0.01);
/*!40000 ALTER TABLE `Auth_App_project` ENABLE KEYS */;
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
