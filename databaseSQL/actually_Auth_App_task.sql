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
  `percentage` double DEFAULT NULL,
  `mPercentage` double DEFAULT NULL,
  `progress` double NOT NULL,
  `section_id` int(11) NOT NULL,
  `milestone_id` int(11) NOT NULL,
  `developer_id` int(11) DEFAULT NULL,
  `optional1` varchar(1000) DEFAULT NULL,
  `optional2` varchar(1000) DEFAULT NULL,
  `optional3` varchar(1000) DEFAULT NULL,
  `expectedProgress` double DEFAULT '0',
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Auth_App_task_b402b60b` (`section_id`),
  KEY `Auth_App_task_97058a4c` (`milestone_id`),
  KEY `Auth_App_task_97ab1235` (`developer_id`),
  CONSTRAINT `developer_id_refs_id_0843e6d8` FOREIGN KEY (`developer_id`) REFERENCES `Auth_App_developer` (`id`),
  CONSTRAINT `milestone_id_refs_id_c4e69282` FOREIGN KEY (`milestone_id`) REFERENCES `Auth_App_milestone` (`id`),
  CONSTRAINT `section_id_refs_id_75552971` FOREIGN KEY (`section_id`) REFERENCES `Auth_App_section` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Auth_App_task`
--

LOCK TABLES `Auth_App_task` WRITE;
/*!40000 ALTER TABLE `Auth_App_task` DISABLE KEYS */;
INSERT INTO `Auth_App_task` VALUES (1,'GW1','',0.5,0.2,0.4,1,1,1,'','','',0,0),(2,'GW2','',0.5,0.2,0.9,1,1,1,'0.7','','',0,NULL),(3,'GL1','',0.2,0.3,0.9,2,1,2,'0.91','','',0,NULL),(4,'GL2','',NULL,0.5,0.9,2,2,2,'0','','',0,NULL),(5,'GS1','',NULL,NULL,0.9,3,2,3,'0','','',0,NULL),(6,'GS2','',NULL,NULL,0.9,3,3,3,'0','','',0,NULL),(7,'AW1','',NULL,NULL,0,4,4,1,'0','','',0,NULL),(8,'AW2','',NULL,NULL,0,4,5,1,'0','','',0,NULL),(9,'AL1','',NULL,NULL,0,5,4,2,'0','','',0,NULL),(10,'AL2','',NULL,NULL,0,5,5,2,'0','','',0,NULL),(11,'AS1','',NULL,NULL,0,6,4,3,'0','','',0,NULL),(12,'AS2','',NULL,NULL,0,6,5,3,'0','','',0,NULL),(13,'OY1','',NULL,NULL,0,7,6,4,'0','','',0,NULL),(14,'OY2','',NULL,NULL,0,7,7,4,'0','','',0,NULL),(15,'OYM1','',NULL,NULL,0,8,6,5,'0','','',0,NULL),(16,'OYM2','',NULL,NULL,0,8,7,5,'0','','',0,NULL),(17,'FBST1','shasha',0.2,0.3,0.5,11,8,3,'','','',0.2,0),(18,'FBST2','shsha',0.2,0.2,0.45,11,8,3,'','','',0.49,0),(19,'FBST3','shasha',0.2,0.2,0.77,11,8,3,'','','',0.88,0),(20,'FBST4','shasha',0.2,0.2,0.9,11,8,3,'','','',0.8,0),(21,'FBST5','fbsj5',0.2,0.2,0.64,11,9,3,'','','',0.5,0),(22,'FBYM1','yiming',0.25,0.25,0.7,10,8,5,'','','',0.56,0),(23,'FBYM2','yiming',0.25,0.25,0.6,10,8,5,'','','',0.8,0),(24,'FBYM3','jia',0.25,0.25,0.5,10,8,5,'','','',0.9,0),(25,'FBYM4','fbym',0.25,0.25,0.4,10,9,5,'','','',0.1,0),(26,'FBZW1','wz',0.4,0.4,0.2,9,8,1,'','','',0.2,0),(27,'FBZW2','wz',0.4,0.2,0.85,9,9,1,'','','',0.75,0),(28,'FBWZ3','somb',0.2,0.4,0.55,9,9,1,'','','',0.67,0);
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

-- Dump completed on 2014-12-15 21:55:28
