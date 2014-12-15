CREATE DATABASE  IF NOT EXISTS `actually` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `actually`;
-- MySQL dump 10.13  Distrib 5.6.19, for osx10.7 (i386)
--
-- Host: 127.0.0.1    Database: actually
-- ------------------------------------------------------
-- Server version	5.6.21

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

--
-- Table structure for table `Auth_App_developer`
--

DROP TABLE IF EXISTS `Auth_App_developer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Auth_App_developer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `githubName` varchar(50) NOT NULL,
  `pmAssigned_id` int(11) DEFAULT NULL,
  `optional1` varchar(100) DEFAULT NULL,
  `optional2` varchar(100) DEFAULT NULL,
  `optional3` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Auth_App_developer_d3712109` (`pmAssigned_id`),
  CONSTRAINT `pmAssigned_id_refs_id_31d65d2f` FOREIGN KEY (`pmAssigned_id`) REFERENCES `Auth_App_pm` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Auth_App_developer`
--

LOCK TABLES `Auth_App_developer` WRITE;
/*!40000 ALTER TABLE `Auth_App_developer` DISABLE KEYS */;
INSERT INTO `Auth_App_developer` VALUES (1,'Wen','Zhu','spoiled_piggy',1,'','',''),(2,'Long','Ma','treebug',1,'','',''),(3,'Sha','Jin','jinsha',1,'','',''),(4,'Yachen','Xie','xieyachen',2,'','',''),(5,'Yiming','Jia','jiayiming',2,'','','');
/*!40000 ALTER TABLE `Auth_App_developer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Auth_App_developer_project`
--

DROP TABLE IF EXISTS `Auth_App_developer_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Auth_App_developer_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `developer_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `developer_id` (`developer_id`,`project_id`),
  KEY `Auth_App_developer_project_97ab1235` (`developer_id`),
  KEY `Auth_App_developer_project_37952554` (`project_id`),
  CONSTRAINT `developer_id_refs_id_0f48b725` FOREIGN KEY (`developer_id`) REFERENCES `Auth_App_developer` (`id`),
  CONSTRAINT `project_id_refs_id_f5fa4d40` FOREIGN KEY (`project_id`) REFERENCES `Auth_App_project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Auth_App_developer_project`
--

LOCK TABLES `Auth_App_developer_project` WRITE;
/*!40000 ALTER TABLE `Auth_App_developer_project` DISABLE KEYS */;
INSERT INTO `Auth_App_developer_project` VALUES (1,1,1),(2,1,2),(9,2,1),(10,2,2),(5,3,1),(6,3,2),(7,4,3),(8,5,3);
/*!40000 ALTER TABLE `Auth_App_developer_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Auth_App_extensibility`
--

DROP TABLE IF EXISTS `Auth_App_extensibility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Auth_App_extensibility` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commit_id` int(11) NOT NULL,
  `attribute` varchar(100) NOT NULL,
  `value` varchar(100) NOT NULL,
  `optional1` varchar(1000) DEFAULT NULL,
  `optional2` varchar(1000) DEFAULT NULL,
  `optional3` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Auth_App_extensibility_0b918771` (`commit_id`),
  CONSTRAINT `commit_id_refs_id_3185d21b` FOREIGN KEY (`commit_id`) REFERENCES `Auth_App_commit` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Auth_App_extensibility`
--

LOCK TABLES `Auth_App_extensibility` WRITE;
/*!40000 ALTER TABLE `Auth_App_extensibility` DISABLE KEYS */;
/*!40000 ALTER TABLE `Auth_App_extensibility` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Auth_App_milestone`
--

LOCK TABLES `Auth_App_milestone` WRITE;
/*!40000 ALTER TABLE `Auth_App_milestone` DISABLE KEYS */;
INSERT INTO `Auth_App_milestone` VALUES (1,'GoogleM1','',0.53,0.98,0.4,'2015-02-05',1,'','',''),(2,'GoogleM2','',0.2,0.1,0.4,'2015-03-05',1,'','',''),(3,'GoogleM3','',0,0,0.2,'2015-05-05',1,'','',''),(4,'AmazonM1','',0.5,0.2,0.5,'2015-01-05',2,'','',''),(5,'AmazonM2','',0,0,0.5,'2015-06-05',2,'','',''),(6,'OracleM1','',0.3,0.1,0.4,'2015-01-05',3,'','',''),(7,'OracleM2','',0,0,0.6,'2015-05-05',3,'','','');
/*!40000 ALTER TABLE `Auth_App_milestone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Auth_App_milestone_developer`
--

DROP TABLE IF EXISTS `Auth_App_milestone_developer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Auth_App_milestone_developer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `milestone_id` int(11) NOT NULL,
  `developer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `milestone_id` (`milestone_id`,`developer_id`),
  KEY `Auth_App_milestone_developer_97058a4c` (`milestone_id`),
  KEY `Auth_App_milestone_developer_97ab1235` (`developer_id`),
  CONSTRAINT `developer_id_refs_id_72068c45` FOREIGN KEY (`developer_id`) REFERENCES `Auth_App_developer` (`id`),
  CONSTRAINT `milestone_id_refs_id_a0aeba19` FOREIGN KEY (`milestone_id`) REFERENCES `Auth_App_milestone` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Auth_App_milestone_developer`
--

LOCK TABLES `Auth_App_milestone_developer` WRITE;
/*!40000 ALTER TABLE `Auth_App_milestone_developer` DISABLE KEYS */;
INSERT INTO `Auth_App_milestone_developer` VALUES (1,1,1),(2,1,2),(3,1,3),(4,2,1),(5,2,2),(6,2,3),(7,3,1),(8,3,2),(9,3,3),(10,4,1),(11,4,2),(12,4,3),(13,5,1),(14,5,2),(15,5,3),(20,6,4),(21,6,5),(18,7,4),(19,7,5);
/*!40000 ALTER TABLE `Auth_App_milestone_developer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Auth_App_pm`
--

DROP TABLE IF EXISTS `Auth_App_pm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Auth_App_pm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `githubName` varchar(50) NOT NULL,
  `optional1` varchar(1000) DEFAULT NULL,
  `optional2` varchar(1000) DEFAULT NULL,
  `optional3` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Auth_App_pm`
--

LOCK TABLES `Auth_App_pm` WRITE;
/*!40000 ALTER TABLE `Auth_App_pm` DISABLE KEYS */;
INSERT INTO `Auth_App_pm` VALUES (1,'Wen','Zhu','spoiled_piggy','','',''),(2,'Yiming','Jia','yjsirus','','','');
/*!40000 ALTER TABLE `Auth_App_pm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Auth_App_pm_project`
--

DROP TABLE IF EXISTS `Auth_App_pm_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Auth_App_pm_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pm_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pm_id` (`pm_id`,`project_id`),
  KEY `Auth_App_pm_project_ffdd2213` (`pm_id`),
  KEY `Auth_App_pm_project_37952554` (`project_id`),
  CONSTRAINT `pm_id_refs_id_4637873c` FOREIGN KEY (`pm_id`) REFERENCES `Auth_App_pm` (`id`),
  CONSTRAINT `project_id_refs_id_c68fc4d6` FOREIGN KEY (`project_id`) REFERENCES `Auth_App_project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Auth_App_pm_project`
--

LOCK TABLES `Auth_App_pm_project` WRITE;
/*!40000 ALTER TABLE `Auth_App_pm_project` DISABLE KEYS */;
INSERT INTO `Auth_App_pm_project` VALUES (2,1,1),(3,1,2),(4,2,3);
/*!40000 ALTER TABLE `Auth_App_pm_project` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Auth_App_project`
--

LOCK TABLES `Auth_App_project` WRITE;
/*!40000 ALTER TABLE `Auth_App_project` DISABLE KEYS */;
INSERT INTO `Auth_App_project` VALUES (1,'Google','','2014-10-05',NULL,0.41,'google.com','Wen Zhu','0.5','','',0),(2,'Amazon','','2014-10-20',NULL,0.4,'amzon.com','Wen Zhu','0.3','','',0),(3,'Oracle','','2014-11-04',NULL,0.3,'oracle.com','Wen Zhu','0.2','','',0);
/*!40000 ALTER TABLE `Auth_App_project` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Auth_App_section`
--

LOCK TABLES `Auth_App_section` WRITE;
/*!40000 ALTER TABLE `Auth_App_section` DISABLE KEYS */;
INSERT INTO `Auth_App_section` VALUES (1,'GoogleWen','',0.2,0.5,1,1,'','','',0,'0.4 0.4 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 '),(2,'GoogleLong','',0.4,0.3,2,1,'','','',0,''),(3,'GoogleSha','',0.4,0.4,3,1,'','','',0,''),(4,'AmazonWen','',0.5,0.6,1,2,'','','',0,'0.6 0.6 0.6 0.6 0.6 0.6 '),(5,'AmazonLong','',0.3,0.2,2,2,'','','',0,NULL),(6,'AmazonSha','',0.2,0.5,3,2,'','','',0,NULL),(7,'OracleYa','',0.5,0.5,4,3,'','','',0,NULL),(8,'OracleYi','',0.5,0.6,5,3,'','','',0,NULL);
/*!40000 ALTER TABLE `Auth_App_section` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Auth_App_task`
--

LOCK TABLES `Auth_App_task` WRITE;
/*!40000 ALTER TABLE `Auth_App_task` DISABLE KEYS */;
INSERT INTO `Auth_App_task` VALUES (1,'GW1','',0.5,0.2,0.4,1,1,1,'','','',0,0),(2,'GW2','',0.5,0.2,0.9,1,1,1,'0.7','','',0,NULL),(3,'GL1','',0.2,0.3,0.9,2,1,2,'0.91','','',0,NULL),(4,'GL2','',NULL,0.5,0.9,2,2,2,'0','','',0,NULL),(5,'GS1','',NULL,NULL,0.9,3,2,3,'0','','',0,NULL),(6,'GS2','',NULL,NULL,0.9,3,3,3,'0','','',0,NULL),(7,'AW1','',NULL,NULL,0,4,4,1,'0','','',0,NULL),(8,'AW2','',NULL,NULL,0,4,5,1,'0','','',0,NULL),(9,'AL1','',NULL,NULL,0,5,4,2,'0','','',0,NULL),(10,'AL2','',NULL,NULL,0,5,5,2,'0','','',0,NULL),(11,'AS1','',NULL,NULL,0,6,4,3,'0','','',0,NULL),(12,'AS2','',NULL,NULL,0,6,5,3,'0','','',0,NULL),(13,'OY1','',NULL,NULL,0,7,6,4,'0','','',0,NULL),(14,'OY2','',NULL,NULL,0,7,7,4,'0','','',0,NULL),(15,'OYM1','',NULL,NULL,0,8,6,5,'0','','',0,NULL),(16,'OYM2','',NULL,NULL,0,8,7,5,'0','','',0,NULL);
/*!40000 ALTER TABLE `Auth_App_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_0e939a4f` (`group_id`),
  KEY `auth_group_permissions_8373b171` (`permission_id`),
  CONSTRAINT `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permission_group_id_689710a9a73b7457_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_417f1b1c` (`content_type_id`),
  CONSTRAINT `auth__content_type_id_508cf46651277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add site',6,'add_site'),(17,'Can change site',6,'change_site'),(18,'Can delete site',6,'delete_site'),(19,'Can add log entry',7,'add_logentry'),(20,'Can change log entry',7,'change_logentry'),(21,'Can delete log entry',7,'delete_logentry'),(22,'Can add project',8,'add_project'),(23,'Can change project',8,'change_project'),(24,'Can delete project',8,'delete_project'),(25,'Can add pm',9,'add_pm'),(26,'Can change pm',9,'change_pm'),(27,'Can delete pm',9,'delete_pm'),(28,'Can add developer',10,'add_developer'),(29,'Can change developer',10,'change_developer'),(30,'Can delete developer',10,'delete_developer'),(31,'Can add milestone',11,'add_milestone'),(32,'Can change milestone',11,'change_milestone'),(33,'Can delete milestone',11,'delete_milestone'),(34,'Can add section',12,'add_section'),(35,'Can change section',12,'change_section'),(36,'Can delete section',12,'delete_section'),(37,'Can add task',13,'add_task'),(38,'Can change task',13,'change_task'),(39,'Can delete task',13,'delete_task'),(40,'Can add commit',14,'add_commit'),(41,'Can change commit',14,'change_commit'),(42,'Can delete commit',14,'delete_commit'),(43,'Can add extensibility',15,'add_extensibility'),(44,'Can change extensibility',15,'change_extensibility'),(45,'Can delete extensibility',15,'delete_extensibility');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$12000$3mYYikZk12pO$kvAaHr0OgXADxKuXng+SBAB0PZ1N7pHpxIAHiNkBp/g=','2014-12-14 20:27:57',1,'kevin','','','',1,1,'2014-12-05 05:59:14');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_e8701ad4` (`user_id`),
  KEY `auth_user_groups_0e939a4f` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_e8701ad4` (`user_id`),
  KEY `auth_user_user_permissions_8373b171` (`permission_id`),
  CONSTRAINT `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissi_user_id_7f0938558328534a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_417f1b1c` (`content_type_id`),
  KEY `django_admin_log_e8701ad4` (`user_id`),
  CONSTRAINT `djang_content_type_id_697914295151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=257 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2014-12-05 06:02:04','1','Google',1,'',8,1),(2,'2014-12-05 06:02:08','1','Google',2,'No fields changed.',8,1),(3,'2014-12-05 06:02:44','2','Amazon',1,'',8,1),(4,'2014-12-05 06:03:52','3','Oracle',1,'',8,1),(5,'2014-12-05 06:04:48','1','Wen Zhu',1,'',9,1),(6,'2014-12-05 06:05:03','1','Wen Zhu',2,'Changed project.',9,1),(7,'2014-12-05 06:05:19','2','Yiming Jia',1,'',9,1),(8,'2014-12-05 06:06:40','1','Wen Zhu',1,'',10,1),(9,'2014-12-05 06:08:18','2','Long Ma',1,'',10,1),(10,'2014-12-05 06:08:34','3','Sha Jin',1,'',10,1),(11,'2014-12-05 06:08:55','4','Yachen Xie',1,'',10,1),(12,'2014-12-05 06:09:14','5','Yiming Jia',1,'',10,1),(13,'2014-12-05 06:10:31','1','GoogleM1',1,'',11,1),(14,'2014-12-05 06:11:21','2','GoogleM2',1,'',11,1),(15,'2014-12-05 06:12:10','3','GoogleM3',1,'',11,1),(16,'2014-12-05 06:12:56','4','AmazonM1',1,'',11,1),(17,'2014-12-05 06:13:17','5','AmazonM2',1,'',11,1),(18,'2014-12-05 06:13:46','6','Oracle',1,'',11,1),(19,'2014-12-05 06:14:09','7','OracleM2',1,'',11,1),(20,'2014-12-05 06:14:16','6','OracleM1',2,'Changed name.',11,1),(21,'2014-12-05 06:15:29','1','GoogleWen',1,'',12,1),(22,'2014-12-05 06:15:59','2','GoogleLong',1,'',12,1),(23,'2014-12-05 06:16:39','3','GoogleSha',1,'',12,1),(24,'2014-12-05 06:17:02','4','AmazonWen',1,'',12,1),(25,'2014-12-05 06:17:33','5','AmazonLong',1,'',12,1),(26,'2014-12-05 06:18:17','6','AmazonSha',1,'',12,1),(27,'2014-12-05 06:18:41','7','OracleYa',1,'',12,1),(28,'2014-12-05 06:19:06','8','OracleYi',1,'',12,1),(29,'2014-12-05 06:20:47','1','GW1',1,'',13,1),(30,'2014-12-05 06:21:53','2','GW2',1,'',13,1),(31,'2014-12-05 06:55:25','3','GL1',1,'',13,1),(32,'2014-12-05 06:56:29','4','GL2',1,'',13,1),(33,'2014-12-05 07:19:38','5','GS1',1,'',13,1),(34,'2014-12-05 07:19:58','6','GS2',1,'',13,1),(35,'2014-12-05 07:20:15','7','AW1',1,'',13,1),(36,'2014-12-05 07:20:46','8','AW2',1,'',13,1),(37,'2014-12-05 07:21:00','9','AL1',1,'',13,1),(38,'2014-12-05 07:21:48','10','AL2',1,'',13,1),(39,'2014-12-05 07:24:33','11','AS1',1,'',13,1),(40,'2014-12-05 07:24:45','12','AS2',1,'',13,1),(41,'2014-12-05 07:25:06','13','OY1',1,'',13,1),(42,'2014-12-05 07:25:40','14','OY2',1,'',13,1),(43,'2014-12-05 07:25:54','15','OYM1',1,'',13,1),(44,'2014-12-05 07:26:09','16','OYM2',1,'',13,1),(45,'2014-12-05 07:45:54','5','GS1',2,'Changed progress and prevProgress.',13,1),(46,'2014-12-05 07:46:50','1','GW1',2,'Changed progress and prevProgress.',13,1),(47,'2014-12-05 07:47:46','1','GW1',2,'Changed progress and prevProgress.',13,1),(48,'2014-12-05 07:51:06','1','GW1',2,'Changed progress and prevProgress.',13,1),(49,'2014-12-05 08:11:21','1','GW1',2,'Changed progress and optional1.',13,1),(50,'2014-12-05 08:11:51','2','GW2',2,'Changed optional1.',13,1),(51,'2014-12-05 08:17:25','3','GL1',2,'Changed optional1.',13,1),(52,'2014-12-05 08:22:17','4','GL2',2,'Changed optional1.',13,1),(53,'2014-12-05 08:22:23','5','GS1',2,'Changed optional1.',13,1),(54,'2014-12-05 08:23:25','6','GS2',2,'Changed optional1.',13,1),(55,'2014-12-05 08:24:17','7','AW1',2,'Changed optional1.',13,1),(56,'2014-12-05 08:24:22','8','AW2',2,'Changed optional1.',13,1),(57,'2014-12-05 08:24:28','9','AL1',2,'Changed optional1.',13,1),(58,'2014-12-05 08:24:32','8','AW2',2,'Changed optional1.',13,1),(59,'2014-12-05 08:24:41','10','AL2',2,'Changed optional1.',13,1),(60,'2014-12-05 08:24:52','11','AS1',2,'Changed optional1.',13,1),(61,'2014-12-05 08:24:58','12','AS2',2,'Changed optional1.',13,1),(62,'2014-12-05 08:25:04','13','OY1',2,'Changed optional1.',13,1),(63,'2014-12-05 08:25:09','14','OY2',2,'Changed optional1.',13,1),(64,'2014-12-05 08:25:15','15','OYM1',2,'Changed optional1.',13,1),(65,'2014-12-05 08:25:19','16','OYM2',2,'Changed optional1.',13,1),(66,'2014-12-05 10:31:07','6','f1 l1',1,'',10,1),(67,'2014-12-05 12:04:23','2','Long Ma',2,'Changed githubName.',10,1),(68,'2014-12-05 12:05:14','3','Oracle',2,'Changed optional1.',8,1),(69,'2014-12-05 12:05:21','2','Amazon',2,'Changed optional1.',8,1),(70,'2014-12-05 12:05:27','1','Google',2,'Changed optional1.',8,1),(71,'2014-12-05 12:29:49','3','Long Ma',3,'',9,1),(72,'2014-12-05 12:29:54','13','Long Ma',3,'',9,1),(73,'2014-12-05 12:30:07','12','Long Ma',3,'',9,1),(74,'2014-12-05 12:30:12','11','Long Ma',3,'',9,1),(75,'2014-12-05 12:30:16','10','Long Ma',3,'',9,1),(76,'2014-12-05 12:30:20','9','Long Ma',3,'',9,1),(77,'2014-12-05 12:30:25','8','Long Ma',3,'',9,1),(78,'2014-12-05 12:30:28','7','Long Ma',3,'',9,1),(79,'2014-12-05 12:30:33','6','Long Ma',3,'',9,1),(80,'2014-12-05 12:30:37','5','Long Ma',3,'',9,1),(81,'2014-12-05 12:30:41','4','Long Ma',3,'',9,1),(82,'2014-12-05 12:30:56','15','Dropbox',3,'',8,1),(83,'2014-12-05 12:31:00','14','Dropbox',3,'',8,1),(84,'2014-12-05 12:31:08','13','Dropbox',3,'',8,1),(85,'2014-12-05 12:31:11','12','Dropbox',3,'',8,1),(86,'2014-12-05 12:31:15','11','Dropbox',3,'',8,1),(87,'2014-12-05 12:31:19','10','Dropbox',3,'',8,1),(88,'2014-12-05 12:31:22','9','Dropbox',3,'',8,1),(89,'2014-12-05 12:31:25','7','Dropbox',3,'',8,1),(90,'2014-12-05 12:31:29','8','Dropbox',3,'',8,1),(91,'2014-12-05 12:31:33','5','Dropbox',3,'',8,1),(92,'2014-12-05 12:31:38','6','Dropbox',3,'',8,1),(93,'2014-12-05 12:31:43','4','Dropbox',3,'',8,1),(94,'2014-12-05 12:33:53','19','Long Ma',3,'',9,1),(95,'2014-12-05 12:33:57','14','Long Ma',3,'',9,1),(96,'2014-12-05 12:34:01','15','Long Ma',3,'',9,1),(97,'2014-12-05 12:34:06','16','Long Ma',3,'',9,1),(98,'2014-12-05 12:34:10','17','Long Ma',3,'',9,1),(99,'2014-12-05 12:34:14','18','Long Ma',3,'',9,1),(100,'2014-12-05 12:43:01','33','Long Ma',3,'',9,1),(101,'2014-12-05 12:43:05','31','Long Ma',3,'',9,1),(102,'2014-12-05 12:43:08','26','Long Ma',3,'',9,1),(103,'2014-12-05 12:43:14','25','Long Ma',3,'',9,1),(104,'2014-12-05 12:43:19','20','Long Ma',3,'',9,1),(105,'2014-12-05 12:43:23','21','Long Ma',3,'',9,1),(106,'2014-12-05 12:43:27','22','Long Ma',3,'',9,1),(107,'2014-12-05 12:43:31','23','Long Ma',3,'',9,1),(108,'2014-12-05 12:43:35','24','Long Ma',3,'',9,1),(109,'2014-12-05 12:43:39','27','Long Ma',3,'',9,1),(110,'2014-12-05 12:43:43','28','Long Ma',3,'',9,1),(111,'2014-12-05 12:43:48','29','Long Ma',3,'',9,1),(112,'2014-12-05 12:43:52','30','Long Ma',3,'',9,1),(113,'2014-12-05 12:43:55','32','Long Ma',3,'',9,1),(114,'2014-12-05 12:44:06','16','Dropbox',3,'',8,1),(115,'2014-12-05 12:44:12','23','Dropbox',3,'',8,1),(116,'2014-12-05 12:44:16','24','Dropbox',3,'',8,1),(117,'2014-12-05 12:44:20','35','Dropbox',3,'',8,1),(118,'2014-12-05 12:44:24','34','Dropbox',3,'',8,1),(119,'2014-12-05 12:44:28','33','Dropbox',3,'',8,1),(120,'2014-12-05 12:44:32','32','Dropbox',3,'',8,1),(121,'2014-12-05 12:44:37','31','Dropbox',3,'',8,1),(122,'2014-12-05 12:44:41','30','Dropbox',3,'',8,1),(123,'2014-12-05 12:44:45','29','Dropbox',3,'',8,1),(124,'2014-12-05 12:44:49','28','Dropbox',3,'',8,1),(125,'2014-12-05 12:45:08','27','Dropbox',3,'',8,1),(126,'2014-12-05 12:45:08','26','Dropbox',3,'',8,1),(127,'2014-12-05 12:45:08','25','Dropbox',3,'',8,1),(128,'2014-12-05 12:45:08','22','Dropbox',3,'',8,1),(129,'2014-12-05 12:45:08','21','Dropbox',3,'',8,1),(130,'2014-12-05 12:45:08','20','Dropbox',3,'',8,1),(131,'2014-12-05 12:45:08','19','Dropbox',3,'',8,1),(132,'2014-12-05 12:45:08','18','Dropbox',3,'',8,1),(133,'2014-12-05 12:45:08','17','Dropbox',3,'',8,1),(134,'2014-12-05 12:47:53','39','Long Ma',3,'',9,1),(135,'2014-12-05 12:47:53','38','Long Ma',3,'',9,1),(136,'2014-12-05 12:47:53','37','Long Ma',3,'',9,1),(137,'2014-12-05 12:47:53','36','Long Ma',3,'',9,1),(138,'2014-12-05 12:47:53','35','Long Ma',3,'',9,1),(139,'2014-12-05 12:47:53','34','Long Ma',3,'',9,1),(140,'2014-12-05 12:48:12','41','Dropbox',3,'',8,1),(141,'2014-12-05 12:48:12','40','Dropbox',3,'',8,1),(142,'2014-12-05 12:48:12','39','Dropbox',3,'',8,1),(143,'2014-12-05 12:48:12','38','Dropbox',3,'',8,1),(144,'2014-12-05 12:48:12','37','Dropbox',3,'',8,1),(145,'2014-12-05 12:48:12','36','Dropbox',3,'',8,1),(146,'2014-12-05 12:48:52','45','Long Ma',3,'',9,1),(147,'2014-12-05 12:48:52','44','Long Ma',3,'',9,1),(148,'2014-12-05 12:48:52','43','Long Ma',3,'',9,1),(149,'2014-12-05 12:48:52','42','Long Ma',3,'',9,1),(150,'2014-12-05 12:48:52','41','Long Ma',3,'',9,1),(151,'2014-12-05 12:48:52','40','Long Ma',3,'',9,1),(152,'2014-12-05 12:49:03','47','Dropbox',3,'',8,1),(153,'2014-12-05 12:49:03','46','Dropbox',3,'',8,1),(154,'2014-12-05 12:49:03','45','Dropbox',3,'',8,1),(155,'2014-12-05 12:49:03','44','Dropbox',3,'',8,1),(156,'2014-12-05 12:49:03','43','Dropbox',3,'',8,1),(157,'2014-12-05 12:49:03','42','Dropbox',3,'',8,1),(158,'2014-12-05 12:51:14','59','Dropbox',3,'',8,1),(159,'2014-12-05 12:51:14','58','Dropbox',3,'',8,1),(160,'2014-12-05 12:51:14','57','Dropbox',3,'',8,1),(161,'2014-12-05 12:51:14','56','Dropbox',3,'',8,1),(162,'2014-12-05 12:51:14','55','Dropbox',3,'',8,1),(163,'2014-12-05 12:51:14','54','Dropbox',3,'',8,1),(164,'2014-12-05 12:51:14','53','Dropbox',3,'',8,1),(165,'2014-12-05 12:51:14','52','Dropbox',3,'',8,1),(166,'2014-12-05 12:51:14','51','Dropbox',3,'',8,1),(167,'2014-12-05 12:51:14','50','Dropbox',3,'',8,1),(168,'2014-12-05 12:51:14','49','Dropbox',3,'',8,1),(169,'2014-12-05 12:51:14','48','Dropbox',3,'',8,1),(170,'2014-12-05 12:52:04','65','Dropbox',3,'',8,1),(171,'2014-12-05 12:52:04','64','Dropbox',3,'',8,1),(172,'2014-12-05 12:52:04','63','Dropbox',3,'',8,1),(173,'2014-12-05 12:52:04','62','Dropbox',3,'',8,1),(174,'2014-12-05 12:52:04','61','Dropbox',3,'',8,1),(175,'2014-12-05 12:52:04','60','Dropbox',3,'',8,1),(176,'2014-12-05 12:55:44','67','Dropbox',3,'',8,1),(177,'2014-12-05 12:55:53','71','Dropbox',3,'',8,1),(178,'2014-12-05 12:55:53','70','Dropbox',3,'',8,1),(179,'2014-12-05 12:55:53','69','Dropbox',3,'',8,1),(180,'2014-12-05 12:55:53','68','Dropbox',3,'',8,1),(181,'2014-12-05 12:55:53','66','Dropbox',3,'',8,1),(182,'2014-12-05 12:58:11','77','Dropbox',3,'',8,1),(183,'2014-12-05 12:58:11','76','Dropbox',3,'',8,1),(184,'2014-12-05 12:58:11','75','Dropbox',3,'',8,1),(185,'2014-12-05 12:58:11','74','Dropbox',3,'',8,1),(186,'2014-12-05 12:58:11','73','Dropbox',3,'',8,1),(187,'2014-12-05 12:58:11','72','Dropbox',3,'',8,1),(188,'2014-12-05 12:59:25','82','Dropbox',3,'',8,1),(189,'2014-12-05 12:59:25','81','Dropbox',3,'',8,1),(190,'2014-12-05 12:59:25','80','Dropbox',3,'',8,1),(191,'2014-12-05 12:59:25','79','Dropbox',3,'',8,1),(192,'2014-12-05 12:59:25','78','Dropbox',3,'',8,1),(193,'2014-12-05 13:01:14','87','Dropbox',3,'',8,1),(194,'2014-12-05 13:01:14','86','Dropbox',3,'',8,1),(195,'2014-12-05 13:01:14','85','Dropbox',3,'',8,1),(196,'2014-12-05 13:01:14','84','Dropbox',3,'',8,1),(197,'2014-12-05 13:01:14','83','Dropbox',3,'',8,1),(198,'2014-12-05 13:05:14','92','Dropbox',3,'',8,1),(199,'2014-12-05 13:05:14','91','Dropbox',3,'',8,1),(200,'2014-12-05 13:05:14','90','Dropbox',3,'',8,1),(201,'2014-12-05 13:05:14','89','Dropbox',3,'',8,1),(202,'2014-12-05 13:05:14','88','Dropbox',3,'',8,1),(203,'2014-12-10 06:53:16','97','Dropbox',3,'',8,1),(204,'2014-12-10 06:53:16','96','Dropbox',3,'',8,1),(205,'2014-12-10 06:53:16','95','Dropbox',3,'',8,1),(206,'2014-12-10 06:53:16','94','Dropbox',3,'',8,1),(207,'2014-12-10 06:53:16','93','Dropbox',3,'',8,1),(208,'2014-12-10 06:53:28','6','f1 l1',3,'',10,1),(209,'2014-12-10 23:37:19','1','GW1',2,'Changed progress and prevProgress.',13,1),(210,'2014-12-10 23:40:19','1','GW1',2,'Changed progress and prevProgress.',13,1),(211,'2014-12-11 00:23:50','1','GoogleWen',2,'Changed optional1.',12,1),(212,'2014-12-11 00:27:46','1','GoogleWen',2,'No fields changed.',12,1),(213,'2014-12-11 02:43:11','1','GoogleWen',2,'No fields changed.',12,1),(214,'2014-12-11 03:00:06','1','GoogleWen',2,'Changed progress and optional1.',12,1),(215,'2014-12-11 03:17:09','1','GoogleWen',2,'Changed optional1.',12,1),(216,'2014-12-11 03:24:22','1','GoogleWen',2,'Changed optional1.',12,1),(217,'2014-12-11 03:24:24','1','GoogleWen',2,'No fields changed.',12,1),(218,'2014-12-11 03:26:00','1','GoogleWen',2,'Changed progress and optional1.',12,1),(219,'2014-12-11 03:27:43','1','GoogleWen',2,'No fields changed.',12,1),(220,'2014-12-13 01:09:28','1','GW1',2,'No fields changed.',13,1),(221,'2014-12-13 01:26:26','4','AmazonWen',2,'Changed fifteenDaysProgressList.',12,1),(222,'2014-12-13 01:30:25','4','AmazonWen',2,'Changed fifteenDaysProgressList.',12,1),(223,'2014-12-13 01:30:29','4','AmazonWen',2,'No fields changed.',12,1),(224,'2014-12-13 01:33:58','4','AmazonWen',2,'No fields changed.',12,1),(225,'2014-12-13 02:13:04','1','GoogleWen',2,'Changed progress.',12,1),(226,'2014-12-13 04:16:46','3','GoogleSha',2,'Changed percentage.',12,1),(227,'2014-12-13 04:17:03','2','GoogleLong',2,'Changed progress.',12,1),(228,'2014-12-13 04:23:10','1','GoogleWen',2,'Changed optional1.',12,1),(229,'2014-12-13 04:30:46','1','GoogleWen',2,'Changed fifteenDaysProgressList.',12,1),(230,'2014-12-13 04:35:17','1','GoogleWen',2,'Changed progress.',12,1),(231,'2014-12-13 04:37:43','1','GoogleWen',2,'Changed progress and fifteenDaysProgressList.',12,1),(232,'2014-12-13 04:38:06','1','GoogleWen',2,'Changed progress.',12,1),(233,'2014-12-13 04:38:39','1','GoogleWen',2,'Changed progress.',12,1),(234,'2014-12-13 04:57:46','1','GoogleWen',2,'Changed fifteenDaysProgressList.',12,1),(235,'2014-12-13 18:02:26','1','GoogleWen',2,'Changed fifteenDaysProgressList.',12,1),(236,'2014-12-13 18:02:38','1','GoogleWen',2,'Changed fifteenDaysProgressList.',12,1),(237,'2014-12-13 18:03:42','1','GoogleWen',2,'Changed fifteenDaysProgressList.',12,1),(238,'2014-12-13 19:05:50','1','GoogleWen',2,'Changed fifteenDaysProgressList.',12,1),(239,'2014-12-13 19:06:05','1','GoogleWen',2,'Changed fifteenDaysProgressList.',12,1),(240,'2014-12-14 20:28:07','1','GW1',2,'Changed optional1.',13,1),(241,'2014-12-14 20:33:42','1','GoogleWen',2,'Changed fifteenDaysProgressList.',12,1),(242,'2014-12-14 20:34:07','1','GoogleWen',2,'Changed fifteenDaysProgressList.',12,1),(243,'2014-12-14 20:37:10','1','GoogleWen',2,'Changed progress.',12,1),(244,'2014-12-14 20:37:53','1','GoogleWen',2,'Changed fifteenDaysProgressList.',12,1),(245,'2014-12-14 20:39:35','1','GoogleWen',2,'Changed fifteenDaysProgressList.',12,1),(246,'2014-12-14 20:41:04','1','GoogleWen',2,'Changed fifteenDaysProgressList.',12,1),(247,'2014-12-14 20:46:12','1','GoogleWen',2,'Changed fifteenDaysProgressList.',12,1),(248,'2014-12-14 20:48:09','1','GoogleWen',2,'Changed fifteenDaysProgressList.',12,1),(249,'2014-12-14 20:49:48','1','GoogleWen',2,'Changed fifteenDaysProgressList.',12,1),(250,'2014-12-14 20:51:11','1','GoogleWen',2,'Changed fifteenDaysProgressList.',12,1),(251,'2014-12-14 20:52:14','1','GoogleWen',2,'Changed fifteenDaysProgressList.',12,1),(252,'2014-12-14 20:53:10','1','GoogleWen',2,'Changed fifteenDaysProgressList.',12,1),(253,'2014-12-14 20:55:29','1','GoogleWen',2,'Changed fifteenDaysProgressList.',12,1),(254,'2014-12-14 20:58:26','1','GoogleWen',2,'Changed fifteenDaysProgressList.',12,1),(255,'2014-12-14 21:07:57','1','GoogleWen',2,'Changed fifteenDaysProgressList.',12,1),(256,'2014-12-14 21:08:19','1','GoogleWen',2,'Changed progress.',12,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_45f3b1d93ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'content type','contenttypes','contenttype'),(5,'session','sessions','session'),(6,'site','sites','site'),(7,'log entry','admin','logentry'),(8,'project','Auth_App','project'),(9,'pm','Auth_App','pm'),(10,'developer','Auth_App','developer'),(11,'milestone','Auth_App','milestone'),(12,'section','Auth_App','section'),(13,'task','Auth_App','task'),(14,'commit','Auth_App','commit'),(15,'extensibility','Auth_App','extensibility');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2014-12-05 05:59:03'),(2,'auth','0001_initial','2014-12-05 05:59:04'),(3,'admin','0001_initial','2014-12-05 05:59:04'),(4,'sessions','0001_initial','2014-12-05 05:59:04'),(5,'sites','0001_initial','2014-12-05 05:59:04');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('febxa3olijhm365ocyte9l9q0aixe03n','NzRhMzM5YTE5MWVhMDQyYWI1MTMwNWM3OGM4ZDAwYTBjODk1ZTVjNTp7Il9hdXRoX3VzZXJfaGFzaCI6ImFiOGVkNWNmZDhhZGRjMDhjMzhjMmI2OTg5NDNlNTJkZTcwMDFiNTIiLCJfYXV0aF91c2VyX2lkIjoxLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsInVzZXIiOnsidXNlcm5hbWUiOiJ0cmVlYnVnIiwidXNlcmltZyI6Imh0dHBzOi8vYXZhdGFycy5naXRodWJ1c2VyY29udGVudC5jb20vdS85MTU3NzMxP3Y9MyIsImFjY2Vzc190b2tlbiI6IjcxN2EwYzBlNWY5ZWZlOTY5ODYxNzdiYTllODk5ODI3ODRkODJmM2IiLCJ1c2VyaWQiOjIsInByb2plY3RzIjpbeyJuYW1lIjoiR29vZ2xlIiwiY29sb3IiOiJncmVlbiIsImV4cGVjdGVkIjo1MC4wLCJwcm9ncmVzcyI6MjI3Ljk5OTk5OTk5OTk5OTk3LCJ0eXBlIjoiRGV2ZWxvcGVyIiwiaWQiOjF9LHsibmFtZSI6IkFtYXpvbiIsImNvbG9yIjoiZ3JlZW4iLCJleHBlY3RlZCI6MzAuMCwicHJvZ3Jlc3MiOjQwLjAsInR5cGUiOiJEZXZlbG9wZXIiLCJpZCI6Mn1dfX0=','2014-12-19 12:05:53'),('ovh6wn8w89w7h0fun7h0rg8lq4wynza8','ODdhMDljMzVhNjE5NGJjN2U3MDRkYWI5YWNiOTc0ODQ2MDFkNWRlYjp7Il9hdXRoX3VzZXJfaGFzaCI6ImFiOGVkNWNmZDhhZGRjMDhjMzhjMmI2OTg5NDNlNTJkZTcwMDFiNTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2014-12-27 02:10:47'),('s9p8duz5tud3f1y6d1e21o3422450qpb','ODdhMDljMzVhNjE5NGJjN2U3MDRkYWI5YWNiOTc0ODQ2MDFkNWRlYjp7Il9hdXRoX3VzZXJfaGFzaCI6ImFiOGVkNWNmZDhhZGRjMDhjMzhjMmI2OTg5NDNlNTJkZTcwMDFiNTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2014-12-28 20:27:57'),('xhdcdgw8oz545dodnudxmvqb7tl9ixve','ODdhMDljMzVhNjE5NGJjN2U3MDRkYWI5YWNiOTc0ODQ2MDFkNWRlYjp7Il9hdXRoX3VzZXJfaGFzaCI6ImFiOGVkNWNmZDhhZGRjMDhjMzhjMmI2OTg5NDNlNTJkZTcwMDFiNTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2014-12-19 12:04:08');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-12-14 16:28:36
