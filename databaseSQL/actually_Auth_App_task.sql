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
-- Table structure for table `Auth_App_task`
--

DROP TABLE IF EXISTS `Auth_App_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Auth_App_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `percentage` double NOT NULL,
  `progress` double NOT NULL,
  `prevProgress` double NOT NULL,
  `section_id` int(11) NOT NULL,
  `milestone_id` int(11) NOT NULL,
  `developer_id` int(11) DEFAULT NULL,
  `optional1` varchar(100) DEFAULT NULL,
  `optional2` varchar(100) DEFAULT NULL,
  `optional3` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Auth_App_task_b402b60b` (`section_id`),
  KEY `Auth_App_task_97058a4c` (`milestone_id`),
  KEY `Auth_App_task_97ab1235` (`developer_id`),
  CONSTRAINT `developer_id_refs_id_0843e6d8` FOREIGN KEY (`developer_id`) REFERENCES `Auth_App_developer` (`id`),
  CONSTRAINT `milestone_id_refs_id_c4e69282` FOREIGN KEY (`milestone_id`) REFERENCES `Auth_App_milestone` (`id`),
  CONSTRAINT `section_id_refs_id_75552971` FOREIGN KEY (`section_id`) REFERENCES `Auth_App_section` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Auth_App_task`
--

LOCK TABLES `Auth_App_task` WRITE;
/*!40000 ALTER TABLE `Auth_App_task` DISABLE KEYS */;
INSERT INTO `Auth_App_task` VALUES (1,'TaskA','task a',20,0.35,0,1,1,1,'Finished','',''),(2,'TaskB','task b',20,0.23,0,1,1,1,'Ongoing','',''),(3,'TaskC','task c',20,0.44,0,1,1,1,'Ongoing','',''),(4,'TaskD','task d',20,0.11,0,1,1,1,'Ongoing','',''),(5,'TaskE','task e',10,0.85,0,1,1,1,'Ongoing','',''),(6,'TaskF','task f',10,0.3,0,1,1,1,'Not Started','',''),(7,'task1','1',0.1,0.1,0.1,3,1,3,'','','0.2'),(8,'task2','2',0.1,0.1,0.2,3,2,3,'','','0.25'),(9,'task3','3',0.1,0.1,0.2,3,2,3,'','','0.3'),(10,'task4','4',0.1,0.2,0.3,4,1,4,'','','0.35'),(11,'task5','5',0.1,0.2,0.2,4,2,4,'','','0.5'),(12,'task6','6',0.3,0.3,0.5,2,2,2,'','','0.4'),(13,'task7','7',0.2,0.2,0.2,2,2,2,'','','0.2'),(14,'task8','0.2',0.2,0.2,0.3,2,2,2,'','','0.25');
/*!40000 ALTER TABLE `Auth_App_task` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-11-28 22:46:48
