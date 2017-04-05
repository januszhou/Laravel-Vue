-- MySQL dump 10.13  Distrib 5.7.15, for Linux (x86_64)
--
-- Host: localhost    Database: ableto
-- ------------------------------------------------------
-- Server version	5.7.15

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
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `question_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `answers_title_unique` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` VALUES (1,'2017-04-01 00:04:21','2017-04-01 00:04:21',NULL,'Very Well',1),(2,'2017-04-01 00:04:21','2017-04-01 00:04:21',NULL,'Well',1),(3,'2017-04-01 00:04:21','2017-04-01 00:04:21',NULL,'Fair',1),(4,'2017-04-01 00:04:21','2017-04-01 00:04:21',NULL,'Bad',1),(5,'2017-04-01 00:04:21','2017-04-01 00:04:21',NULL,'Egg',2),(6,'2017-04-01 00:04:21','2017-04-01 00:04:21',NULL,'Pancake',2),(7,'2017-04-01 00:04:21','2017-04-01 00:04:21',NULL,'Coffee',2),(8,'2017-04-01 00:04:21','2017-04-01 00:04:21',NULL,'Bread',2),(9,'2017-04-01 00:04:21','2017-04-01 00:04:21',NULL,'One day',3),(10,'2017-04-01 00:04:21','2017-04-01 00:04:21',NULL,'Two days',3),(11,'2017-04-01 00:04:21','2017-04-01 00:04:21',NULL,'Three days',3),(12,'2017-04-01 00:04:21','2017-04-01 00:04:21',NULL,'Four days',3),(13,'2017-04-01 00:04:21','2017-04-01 00:04:21',NULL,'Five days',3),(14,'2017-04-01 00:04:21','2017-04-01 00:04:21',NULL,'More days',3);
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (31,'2014_10_12_000000_create_users_table',1),(32,'2014_10_12_100000_create_password_resets_table',1),(33,'2017_03_29_224608_create_question_table',1),(34,'2017_03_29_224806_create_answer_table',1),(35,'2017_03_29_224816_create_user_question_answer_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_multiple` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `questions_title_unique` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,'2017-04-01 00:04:21','2017-04-01 00:04:21',NULL,'How do you feel',0),(2,'2017-04-01 00:04:21','2017-04-01 00:04:21',NULL,'What you had for breakfast',1),(3,'2017-04-01 00:04:21','2017-04-01 00:04:21',NULL,'How many days do you work per week',0);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_question_answer`
--

DROP TABLE IF EXISTS `user_question_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_question_answer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `question_id` int(10) unsigned NOT NULL,
  `answer_id` int(10) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_question_answer_user_id_question_id_answer_id_index` (`user_id`,`question_id`,`answer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_question_answer`
--

LOCK TABLES `user_question_answer` WRITE;
/*!40000 ALTER TABLE `user_question_answer` DISABLE KEYS */;
INSERT INTO `user_question_answer` VALUES (17,'2017-04-03 02:13:37','2017-04-04 02:13:37',12,1,1,NULL),(18,'2017-04-03 02:13:37','2017-04-04 02:13:37',12,2,6,NULL),(19,'2017-04-03 02:13:37','2017-04-04 02:13:37',12,2,7,NULL),(20,'2017-04-03 02:13:37','2017-04-04 02:13:37',12,2,8,NULL),(21,'2017-04-03 02:13:37','2017-04-04 02:13:37',12,3,12,NULL),(22,'2017-04-03 02:13:37','2017-04-04 02:14:31',12,1,3,NULL),(23,'2017-04-03 02:13:37','2017-04-04 02:14:31',12,2,6,NULL),(24,'2017-04-03 02:13:37','2017-04-04 02:14:31',12,2,7,NULL),(25,'2017-04-03 02:13:37','2017-04-04 02:14:31',12,3,12,NULL),(26,'2017-04-04 02:33:11','2017-04-04 02:33:11',14,1,3,NULL),(27,'2017-04-04 02:33:11','2017-04-04 02:33:11',14,2,6,NULL),(28,'2017-04-04 02:33:11','2017-04-04 02:33:11',14,2,7,NULL),(29,'2017-04-04 02:33:11','2017-04-04 02:33:11',14,2,8,NULL),(30,'2017-04-04 02:33:11','2017-04-04 02:33:11',14,3,12,NULL),(31,'2017-04-04 23:51:07','2017-04-04 23:51:07',16,1,4,NULL),(32,'2017-04-04 23:51:07','2017-04-04 23:51:07',16,2,6,NULL),(33,'2017-04-04 23:51:07','2017-04-04 23:51:07',16,2,7,NULL),(34,'2017-04-04 23:51:07','2017-04-04 23:51:07',16,2,8,NULL),(35,'2017-04-04 23:51:07','2017-04-04 23:51:07',16,3,12,NULL),(36,'2017-04-05 03:24:13','2017-04-05 03:24:13',3,1,2,NULL),(37,'2017-04-05 03:24:13','2017-04-05 03:24:13',3,2,5,NULL),(38,'2017-04-05 03:24:13','2017-04-05 03:24:13',3,2,6,NULL),(39,'2017-04-05 03:24:13','2017-04-05 03:24:13',3,3,10,NULL),(40,'2017-04-05 03:24:44','2017-04-05 03:24:44',1,1,4,NULL),(41,'2017-04-05 03:24:44','2017-04-05 03:24:44',1,2,5,NULL),(42,'2017-04-05 03:24:44','2017-04-05 03:24:44',1,2,6,NULL),(43,'2017-04-05 03:24:44','2017-04-05 03:24:44',1,3,14,NULL);
/*!40000 ALTER TABLE `user_question_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_admin` int(11) NOT NULL DEFAULT '0',
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,NULL,'Alayna Pacocha','Dr. Chase Smith','qhettinger@example.com','$2y$10$JNL8a/28lPmjO13xODmvAuaGgT.E.BPMg5YDK2V1iVFBbeYwQguMG',0,'4d8167c9cdfd90be9dccf64ab682c8ffb76f3775379aecf39b332f18af5c018e','QwVoBTaubg','2017-04-01 00:04:22','2017-04-01 00:04:22'),(2,NULL,'Sarai Friesen Sr.','Mrs. Sharon Quigley DVM','fritsch.heloise@example.org','$2y$10$JNL8a/28lPmjO13xODmvAuaGgT.E.BPMg5YDK2V1iVFBbeYwQguMG',0,'47df21387a14e7ad7493f96a4b48365e2377c00721b3fd282c954432fec57c43','pJvWZ3sOhv','2017-04-01 00:04:22','2017-04-01 00:04:22'),(3,NULL,'Marcella Hoeger','Mrs. Colleen Mraz IV','zboyer@example.net','$2y$10$JNL8a/28lPmjO13xODmvAuaGgT.E.BPMg5YDK2V1iVFBbeYwQguMG',0,'ba6cb1fef38166005574611703776e7f789b94cf56ba2a2fb9cd29663c63eb89','3qpWR6We51','2017-04-01 00:04:22','2017-04-01 00:04:22'),(4,NULL,'Trenton Yundt','Alisha Kautzer','walsh.martine@example.org','$2y$10$JNL8a/28lPmjO13xODmvAuaGgT.E.BPMg5YDK2V1iVFBbeYwQguMG',0,'0f32db25194467c00c7aaae936ea84ae6fa4afcf7c27c2e57ace2b57914b2ca0','fGB7oItwd3','2017-04-01 00:04:22','2017-04-01 00:04:22'),(5,NULL,'Prof. Alejandra Champlin III','Houston Schuster','neil25@example.com','$2y$10$JNL8a/28lPmjO13xODmvAuaGgT.E.BPMg5YDK2V1iVFBbeYwQguMG',0,'f0fd79d5a6d094de154322ee9fa89b18cc05a74629a82b3942ee5b8832758bb8','xx2NAYFDye','2017-04-01 00:04:22','2017-04-01 00:04:22'),(6,NULL,'Donald Rau','Ahmed Ondricka','miller.anastacio@example.com','$2y$10$JNL8a/28lPmjO13xODmvAuaGgT.E.BPMg5YDK2V1iVFBbeYwQguMG',0,'30b1ffb0c1d82092acc9751154a08ee09056a78e4ee442d4741fd6340a4955d3','iaC4O1V2wJ','2017-04-01 00:04:22','2017-04-01 00:04:22'),(7,NULL,'Kristoffer Halvorson','Moshe Wisozk','daphne.wehner@example.net','$2y$10$JNL8a/28lPmjO13xODmvAuaGgT.E.BPMg5YDK2V1iVFBbeYwQguMG',0,'72cd438c2a52383ec2accdf262f0403236023601f9bb86e0615942933680197d','pjaqjarVTx','2017-04-01 00:04:22','2017-04-01 00:04:22'),(8,NULL,'Mark VonRueden','Nyasia Feest I','morissette.sabryna@example.org','$2y$10$JNL8a/28lPmjO13xODmvAuaGgT.E.BPMg5YDK2V1iVFBbeYwQguMG',0,'9ce6e75139e66894a78f326753c2eec9c96ea1d5b939e1b1ff3511e0768564eb','2Umre9fP1a','2017-04-01 00:04:22','2017-04-01 00:04:22'),(9,NULL,'Mrs. Lyda Kirlin PhD','Keon Corwin PhD','qschmidt@example.org','$2y$10$JNL8a/28lPmjO13xODmvAuaGgT.E.BPMg5YDK2V1iVFBbeYwQguMG',0,'0db7d12fefbe4fb378e87333a89ba28fc93834ef2280614dd80be567e441cdf7','d6PKxE1SeE','2017-04-01 00:04:22','2017-04-01 00:04:22'),(10,NULL,'Dr. Miguel Kilback II','Dr. Allene Carter','hauck.muriel@example.net','$2y$10$JNL8a/28lPmjO13xODmvAuaGgT.E.BPMg5YDK2V1iVFBbeYwQguMG',0,'162a401d6e2129b17a99d22d3cab3c5e0c6ca4ab654afd18576de01fedd19beb','WJwYgs6BFt','2017-04-01 00:04:22','2017-04-01 00:04:22'),(11,NULL,'Jacinto Maggio','Krystal Kemmer','mariane.kozey@example.com','$2y$10$JNL8a/28lPmjO13xODmvAuaGgT.E.BPMg5YDK2V1iVFBbeYwQguMG',1,'713ce8e645054aba88e5d067a0c903adee267a1985c2de9c9e3a6aacb773c293','G074kgcOpk','2017-04-01 00:04:22','2017-04-01 00:04:22'),(12,NULL,'123','123','qhetti1nger@example.com','$2y$10$CKWdqyGlZrhtW30FI.dC7Ou.ZXbFejmqfMBswg5juAyBcDJCF6Sx2',0,'4185d691f4e55857fa2cd50c6d224fdea0e7048f',NULL,'2017-04-02 22:12:24','2017-04-02 22:12:24'),(13,NULL,'sdf','dsf','qhettinge1r@example.com','$2y$10$0nU7X19DKZeja2ZCEipPcezsZVXOQkBEz6DBDXV2ZmLZnqrc2sDHG',0,'a7ce2aa496ec12cd6559e7fa599561861c785c91',NULL,'2017-04-04 02:31:05','2017-04-04 02:31:05'),(14,NULL,'dsfsdf','dsfdsf','dsfdsf@fdsfds.com','$2y$10$REX4.5kYFPkX.ijfYDOULOG/6xCDqS485mo/.qWiv5I8.alDHqGF.',0,'2903bde87fc5e89092e6d7fb4566bae391e08828',NULL,'2017-04-04 02:31:43','2017-04-04 02:31:43'),(15,NULL,'sdfdsf','sdfdsf','sdfsdf@dsfdsf.com','$2y$10$mJJE/I.iuDgiXAbnOSjSou4tfWilv8p08LXpeIsPmKE0Y6Nkzu.Ze',0,'b4532ad40b1539e00a6cedb3c3d416542b0631d1',NULL,'2017-04-04 02:33:02','2017-04-04 02:33:02'),(16,NULL,'sdf','safdsa','sdfsdfdf@dfsfsdf.com','$2y$10$KCiKnWgnud0wxlVzboH7ju4Av4Ec24S7s24fp2WZrlxSrdzxBGUpG',0,'4c1dd8b9b84ab943a645a4864c43dca59d8ec872',NULL,'2017-04-04 23:48:07','2017-04-04 23:48:07'),(17,NULL,'Harry','Johnston','nya07@example.com','$2y$10$mhLWHLoAS1rtiP0vUeREc.MK3JCKnynsSCcRw3B4txqj5Zd.pEA7q',0,'8cfabf21b331fdf65617ccd702761a5d11cb1a4b126725139a787855500f7be6','9EGZsiffcT','2017-04-05 03:38:15','2017-04-05 03:38:15');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-05  4:08:59
