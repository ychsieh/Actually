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
-- Table structure for table `Auth_App_commit`
--

DROP TABLE IF EXISTS `Auth_App_commit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Auth_App_commit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commitTime` datetime NOT NULL,
  `developer_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `optional1` varchar(1000) DEFAULT NULL,
  `optional2` varchar(1000) DEFAULT NULL,
  `optional3` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Auth_App_commit_97ab1235` (`developer_id`),
  KEY `Auth_App_commit_37952554` (`project_id`),
  KEY `Auth_App_commit_ef96c3b8` (`task_id`),
  CONSTRAINT `developer_id_refs_id_0ff2133e` FOREIGN KEY (`developer_id`) REFERENCES `Auth_App_developer` (`id`),
  CONSTRAINT `project_id_refs_id_17e46fbc` FOREIGN KEY (`project_id`) REFERENCES `Auth_App_project` (`id`),
  CONSTRAINT `task_id_refs_id_2bcb6c0b` FOREIGN KEY (`task_id`) REFERENCES `Auth_App_task` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Auth_App_commit`
--

LOCK TABLES `Auth_App_commit` WRITE;
/*!40000 ALTER TABLE `Auth_App_commit` DISABLE KEYS */;
/*!40000 ALTER TABLE `Auth_App_commit` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-12-15 21:55:27
