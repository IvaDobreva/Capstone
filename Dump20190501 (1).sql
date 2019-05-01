-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: capstone
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `game_session`
--

DROP TABLE IF EXISTS `game_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `game_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `imgid` int(11) DEFAULT NULL,
  `answer` varchar(45) DEFAULT NULL,
  `ansTrue` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_session`
--

LOCK TABLES `game_session` WRITE;
/*!40000 ALTER TABLE `game_session` DISABLE KEYS */;
INSERT INTO `game_session` VALUES (291,3,5,'겨울',1),(292,3,1,'거품',0),(293,3,2,'거북이',1),(294,3,5,'겨울',1),(295,3,5,'겨울',1),(296,3,5,'겨울',1),(297,3,3,'개',1),(298,3,1,'거품',0),(299,3,1,'거품',0),(300,3,6,'차',1);
/*!40000 ALTER TABLE `game_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imgname` varchar(45) DEFAULT NULL,
  `labels` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (1,'foam','White,Nose,Illustration'),(2,'turtle','Tortoise,Vertebrate,Pond turtle,Turtle,Reptile,Kinosternidae,Box turtle,Geoemydidae,Common snapping turtle,Gopher Tortoise'),(3,'puppy','Mammal,Dog,Vertebrate,Dog breed,Canidae,Puppy,Companion dog,Puppy love,Carnivore,Labrador retriever'),(4,'fall','Tree,Autumn,Orange,Leaf,Deciduous,Woody plant,Natural landscape,Plant,Maple,Maple leaf'),(5,'winter','Red,Winter,Snow,Rowan,Branch,Plant,Spring,Freezing,Flower,Sky'),(6,'car','Land vehicle,Vehicle,Car,Automotive design,Supercar,Luxury vehicle,Coupé,Sports car,Personal luxury car,Concept car');
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sessions` (
  `idsessions` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `token` longtext,
  PRIMARY KEY (`idsessions`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (74,3,'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6Iml2YSIsInBhc3MiOiIxMjMiLCJkYXRlIjoiMjAxOS0wNC0yOVQwNDoxMjozNC45NjRaIiwiaWF0IjoxNTU2NTExMTU0LCJleHAiOjE1NTkxMDMxNTQsImlzcyI6ImFkbWluIiwic3ViIjoiaWFtQHVzZXIubWUifQ.LAVIgH2KD_XJ8Qvppj87Yf03xi70769eveKn9HXUcPFZ0R3lSDWM-CLwCWIWct8mTmLJGpuMq1ijhqk_wKkPQ_baKV5Ji2_mP_ihK3FJkzWlWt7hcWUYwaUrwVuLsaAIeWdc-b0cvu9BQu8PP5KFgqZ_EZcgu9dO_Q3YUtaWwhCw_4LhrlumWxn-TV9i4ycFd4t-GatCLJigGxrdQZNUcXImE4hPQvKKc7xQhn2LhyvE-Ata4_n1ktT5gozjx-DYUawSbspUUNsKaCdq-tB1AekQjgtqV0zmxxWjd-CVTw7ncb7TETXd6PHCB2-9gAiYu9AFtzINEmWbV7INcJmhkA');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_game_history`
--

DROP TABLE IF EXISTS `user_game_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_game_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT '0',
  `date` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_game_history`
--

LOCK TABLES `user_game_history` WRITE;
/*!40000 ALTER TABLE `user_game_history` DISABLE KEYS */;
INSERT INTO `user_game_history` VALUES (22,3,8,'01-05-2019'),(23,3,7,'01-05-2019'),(24,3,8,'01-05-2019'),(25,3,9,'01-05-2019'),(26,3,7,'01-05-2019'),(27,3,7,'01-05-2019');
/*!40000 ALTER TABLE `user_game_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `nationality` varchar(45) DEFAULT NULL,
  `score` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'user1','123','user','emailatgmail.com','UK',0),(2,'SOMENAME','bdej','eweff','feeef','fsefe',0),(3,'iva','123','Iva','somemail ','Bulgaria ',227),(4,'iva2','123','Iva','somemail ','Bulgaria ',0),(5,'undefined','undefined','undefined','undefined','undefined',0),(7,'nnnnn','undefined','undefined','uisbfkj@kjes','undefined',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vocabulary`
--

DROP TABLE IF EXISTS `vocabulary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `vocabulary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kor_word` varchar(45) DEFAULT NULL,
  `eng_word` varchar(45) DEFAULT NULL,
  `level` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `processed` int(10) NOT NULL DEFAULT '0',
  `hits` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vocabulary`
--

LOCK TABLES `vocabulary` WRITE;
/*!40000 ALTER TABLE `vocabulary` DISABLE KEYS */;
INSERT INTO `vocabulary` VALUES (1,'거품','foam','middle','n',1,0),(2,'거북이','turtle','middle','n',1,0),(3,'강아지','puppy',NULL,NULL,1,5),(4,'가을 ','fall',NULL,NULL,1,0),(5,'겨울','winter',NULL,NULL,1,5),(6,'차','car','easy','n',1,16),(7,'차동자','car','easy','n',1,0),(9,'개','dog',NULL,'n',1,2),(10,'가을','autumn',NULL,NULL,1,2);
/*!40000 ALTER TABLE `vocabulary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'capstone'
--

--
-- Dumping routines for database 'capstone'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-01 16:21:43
