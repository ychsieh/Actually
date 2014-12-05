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
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2014-11-05 00:37:12','1','Fasta',1,'',8,1),(2,'2014-11-05 00:37:45','2','Facebook',1,'',8,1),(3,'2014-11-05 00:38:11','3','Google',1,'',8,1),(4,'2014-11-05 00:39:09','4','Amazon',1,'',8,1),(5,'2014-11-05 00:41:13','1','CRUD',1,'',12,1),(6,'2014-11-05 00:43:46','1','Jin Sha',1,'',10,1),(7,'2014-11-05 00:45:32','1','Jin Sha',1,'',9,1),(8,'2014-11-05 00:45:44','1','Jin Sha',2,'Changed githubName.',9,1),(9,'2014-11-05 00:46:39','1','CRUD',2,'Changed developer.',12,1),(10,'2014-11-05 02:31:40','5','Actually',1,'',8,1),(11,'2014-11-05 02:31:57','1','Jin Sha',2,'Changed project.',10,1),(12,'2014-11-05 02:33:07','5','Actually',2,'Changed optional1.',8,1),(13,'2014-11-05 02:33:18','2','Facebook',2,'Changed optional1.',8,1),(14,'2014-11-05 02:33:28','4','Amazon',2,'Changed optional1.',8,1),(15,'2014-11-05 02:33:48','3','Google',2,'Changed optional1.',8,1),(16,'2014-11-05 02:34:03','1','Fasta',2,'Changed optional1.',8,1),(17,'2014-11-05 02:37:56','4','Amazon',2,'Changed optional1.',8,1),(18,'2014-11-05 02:38:02','5','Actually',2,'Changed optional1.',8,1),(19,'2014-11-05 02:38:11','3','Google',2,'Changed optional1.',8,1),(20,'2014-11-05 02:38:19','2','Facebook',2,'Changed optional1.',8,1),(21,'2014-11-05 02:38:26','1','Fasta',2,'Changed optional1.',8,1),(22,'2014-11-05 02:42:34','2','Long Ma',1,'',10,1),(23,'2014-11-05 02:43:04','3','XinHe Lian',1,'',10,1),(24,'2014-11-05 02:43:28','4','Wen Zhu',1,'',10,1),(25,'2014-11-05 03:44:58','2','Long Ma',2,'Changed optional1.',10,1),(26,'2014-11-05 03:45:13','4','Wen Zhu',2,'Changed optional1.',10,1),(27,'2014-11-05 03:45:42','3','XinHe Lian',2,'Changed optional1.',10,1),(28,'2014-11-05 03:47:06','3','XinHe Lian',2,'No fields changed.',10,1),(29,'2014-11-05 03:54:37','5','Chen Ya',1,'',10,1),(30,'2014-11-05 03:54:50','5','Chen Ya',2,'Changed optional1.',10,1),(31,'2014-11-05 04:00:14','1','AmazonM1',1,'',11,1),(32,'2014-11-05 04:01:15','2','ActuallyM1',1,'',11,1),(33,'2014-11-05 04:01:27','1','TaskA',1,'',13,1),(34,'2014-11-05 04:02:03','2','TaskB',1,'',13,1),(35,'2014-11-05 04:02:34','3','Task C',1,'',13,1),(36,'2014-11-05 04:02:43','3','TaskC',2,'Changed name.',13,1),(37,'2014-11-05 04:03:02','4','TaskD',1,'',13,1),(38,'2014-11-05 04:03:41','5','TaskE',1,'',13,1),(39,'2014-11-05 04:04:17','6','TaskF',1,'',13,1),(40,'2014-11-05 04:08:23','6','TaskF',2,'Changed optional1.',13,1),(41,'2014-11-05 04:08:36','1','TaskA',2,'Changed optional1.',13,1),(42,'2014-11-05 04:08:54','6','TaskF',2,'Changed optional1.',13,1),(43,'2014-11-05 04:09:12','2','TaskB',2,'Changed optional1.',13,1),(44,'2014-11-05 04:09:16','3','TaskC',2,'Changed optional1.',13,1),(45,'2014-11-05 04:09:21','4','TaskD',2,'Changed optional1.',13,1),(46,'2014-11-05 04:09:25','5','TaskE',2,'Changed optional1.',13,1),(47,'2014-11-05 04:33:10','2','Section',1,'',12,1),(48,'2014-11-05 04:39:17','1','Jin Sha',2,'Changed project.',10,1),(49,'2014-11-05 04:39:36','2','Facebook',2,'Changed progress.',8,1),(50,'2014-11-05 19:41:03','4','Wen Zhu',2,'Changed optional2 and optional3.',10,1),(51,'2014-11-05 19:41:10','5','Chen Ya',2,'Changed optional2 and optional3.',10,1),(52,'2014-11-05 19:41:16','4','Wen Zhu',2,'No fields changed.',10,1),(53,'2014-11-05 19:41:28','3','XinHe Lian',2,'Changed optional2 and optional3.',10,1),(54,'2014-11-05 19:41:51','2','Long Ma',2,'Changed optional2 and optional3.',10,1),(55,'2014-11-05 19:41:56','1','Jin Sha',2,'No fields changed.',10,1),(56,'2014-11-29 03:00:01','3','FastaSession1',1,'',12,1),(57,'2014-11-29 03:03:52','4','FestaSession2',1,'',12,1),(58,'2014-11-29 03:04:19','2','FastaSession3',2,'Changed name, description, progress, prevProgress and project.',12,1),(59,'2014-11-29 03:17:31','7','task1',1,'',13,1),(60,'2014-11-29 03:18:02','7','task1',2,'Changed developer.',13,1),(61,'2014-11-29 03:18:33','8','task2',1,'',13,1),(62,'2014-11-29 03:19:08','9','task3',1,'',13,1),(63,'2014-11-29 03:20:02','10','task4',1,'',13,1),(64,'2014-11-29 03:20:39','11','task5',1,'',13,1),(65,'2014-11-29 03:21:04','12','task6',1,'',13,1),(66,'2014-11-29 03:21:21','13','task7',1,'',13,1),(67,'2014-11-29 03:21:43','14','task8',1,'',13,1),(68,'2014-11-29 03:26:47','7','task1',2,'Changed optional3.',13,1),(69,'2014-11-29 03:26:53','8','task2',2,'Changed optional3.',13,1),(70,'2014-11-29 03:26:57','9','task3',2,'Changed optional3.',13,1),(71,'2014-11-29 03:27:03','10','task4',2,'Changed optional3.',13,1),(72,'2014-11-29 03:27:09','11','task5',2,'Changed optional3.',13,1),(73,'2014-11-29 03:27:14','12','task6',2,'Changed optional3.',13,1),(74,'2014-11-29 03:27:18','13','task7',2,'Changed optional3.',13,1),(75,'2014-11-29 03:27:22','14','task8',2,'Changed optional3.',13,1),(76,'2014-12-04 03:27:59','5','Actually',2,'Changed repoOwner.',8,1),(77,'2014-12-04 04:59:47','2','Long Ma',2,'Changed project.',10,1),(78,'2014-12-04 05:00:27','2','Long Ma',1,'',9,1),(79,'2014-12-04 05:16:55','1','Ya-Chen Hsieh',2,'Changed firstName, lastName and githubName.',9,1),(80,'2014-12-04 06:01:29','5','Ya-Chen Hsieh',2,'Changed firstName, lastName and githubName.',10,1),(81,'2014-12-04 06:02:00','1','Ya-Chen Hsieh',2,'Changed project.',9,1),(82,'2014-12-04 06:13:05','5','Order System',1,'',12,1),(83,'2014-12-04 06:14:36','5','Order System',2,'Changed project.',12,1),(84,'2014-12-05 06:06:50','5','SendMssage',2,'Changed name.',12,1),(85,'2014-12-05 06:07:32','15','FBtask1',1,'',13,1),(86,'2014-12-05 06:08:07','15','FBtask1',2,'Changed developer.',13,1),(87,'2014-12-05 06:08:31','16','FBtask2',1,'',13,1),(88,'2014-12-05 06:09:07','3','FBMSTONE1',1,'',11,1),(89,'2014-12-05 06:40:13','4','FastaM',1,'',11,1),(90,'2014-12-05 06:40:39','7','task1',2,'Changed milestone.',13,1),(91,'2014-12-05 06:40:47','8','task2',2,'No fields changed.',13,1),(92,'2014-12-05 06:40:56','11','task5',2,'Changed milestone.',13,1),(93,'2014-12-05 06:47:06','12','task6',2,'Changed milestone.',13,1),(94,'2014-12-05 06:48:42','12','task6',2,'Changed developer.',13,1),(95,'2014-12-05 06:49:05','12','task6',2,'Changed milestone.',13,1),(96,'2014-12-05 06:49:28','12','task6',2,'Changed section.',13,1),(97,'2014-12-05 06:50:11','12','task6',2,'Changed developer.',13,1),(98,'2014-12-05 06:50:48','10','task4',2,'Changed section.',13,1),(99,'2014-12-05 06:50:59','10','task4',2,'Changed section.',13,1),(100,'2014-12-05 06:52:47','9','task3',2,'Changed section.',13,1),(101,'2014-12-05 06:53:52','3','FastaSession1',2,'No fields changed.',12,1),(102,'2014-12-05 07:08:57','7','task1',2,'Changed optional1.',13,1),(103,'2014-12-05 07:09:02','8','task2',2,'Changed optional1.',13,1),(104,'2014-12-05 07:09:08','10','task4',2,'Changed optional1.',13,1),(105,'2014-12-05 07:09:13','10','task4',2,'No fields changed.',13,1),(106,'2014-12-05 07:09:19','11','task5',2,'Changed optional1.',13,1),(107,'2014-12-05 07:09:25','12','task6',2,'Changed optional1.',13,1),(108,'2014-12-05 07:09:31','13','task7',2,'Changed optional1.',13,1),(109,'2014-12-05 07:09:37','14','task8',2,'Changed optional1.',13,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-12-05  3:33:29
