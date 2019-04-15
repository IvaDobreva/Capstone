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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (34,3,'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6Iml2YSIsInBhc3MiOiIiLCJkYXRlIjoiMjAxOS0wNC0xMFQwNzo1NTozMi40NzZaIiwiaWF0IjoxNTU0ODgyOTMyLCJleHAiOjE1NTc0NzQ5MzIsImlzcyI6ImFkbWluIiwic3ViIjoiaWFtQHVzZXIubWUifQ.YflpI-c3miVnoDRsDX9omSq-n7RJ_m0eSw77nf1JfClmyLCvsTH0U_yQMoU3iiilQcDvcgkeAy720DGAITi3f4hCFc4ISHfFA7ulbLqqduQyebJ4TZ03pA86AwdXCnglcZYVaH1-FKJCRdbJI9dQP4tB2TmQr6CbbqIIqY6LgpXu3KvyataAWpcFX6YPg8A9IityMCUmIbs4nikQ7va5ijHSsgcORl8Pcsb1GxdInzbwfoYVBjLMLUAGO93c4j1mPOANJ2jQC5-ZKuwbKpP5QreKs_pJJv3F00UeZxdyx0NmxqIaYfxHBrsZIYGYtXLa9x4H9I3gEkq4Xh_F6Uvg1Q'),(35,6,'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6Iml2YSIsInBhc3MiOiIiLCJkYXRlIjoiMjAxOS0wNC0xMFQwNzo1NTozMi40NzZaIiwiaWF0IjoxNTU0ODgyOTMyLCJleHAiOjE1NTc0NzQ5MzIsImlzcyI6ImFkbWluIiwic3ViIjoiaWFtQHVzZXIubWUifQ.YflpI-c3miVnoDRsDX9omSq-n7RJ_m0eSw77nf1JfClmyLCvsTH0U_yQMoU3iiilQcDvcgkeAy720DGAITi3f4hCFc4ISHfFA7ulbLqqduQyebJ4TZ03pA86AwdXCnglcZYVaH1-FKJCRdbJI9dQP4tB2TmQr6CbbqIIqY6LgpXu3KvyataAWpcFX6YPg8A9IityMCUmIbs4nikQ7va5ijHSsgcORl8Pcsb1GxdInzbwfoYVBjLMLUAGO93c4j1mPOANJ2jQC5-ZKuwbKpP5QreKs_pJJv3F00UeZxdyx0NmxqIaYfxHBrsZIYGYtXLa9x4H9I3gEkq4Xh_F6Uvg1Q'),(37,3,'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6Iml2YSIsInBhc3MiOiIiLCJkYXRlIjoiMjAxOS0wNC0xMFQwNzo1NTo0MS45MjFaIiwiaWF0IjoxNTU0ODgyOTQxLCJleHAiOjE1NTc0NzQ5NDEsImlzcyI6ImFkbWluIiwic3ViIjoiaWFtQHVzZXIubWUifQ.VnAX1SNcoOc1DM_9dydZpGINnXrN9tGhiZH6T5Ja6zTIk7XlQyKZ8jkrFEhHyJlEsLTLhYbgbHs4GsD8JXmA83qCJntgQ78CRGdBWW1_Xe8BlJ_Jvyaf713hr1NnRI8rTD94oQ2I3h41T0T1ba57rlD1jNcltcfkgunMgU3ins-YMmP1TtQo9K9nItpsxY4lvI86w9TiSCU-jxHSnrnY1wcz854hZaXjd8R7NiX04wJVaxeA662IhKyPR7ukdnCHr8gYu0sieHfCCdb63Ehu6bKD7Kx0jATBbprMc_E9rK4p2S6LLSX9UZf78oPbHFFH_MEDPItBjS4-w7hVhQCPRQ'),(38,6,'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6Iml2YSIsInBhc3MiOiIiLCJkYXRlIjoiMjAxOS0wNC0xMFQwNzo1NTo0MS45MjFaIiwiaWF0IjoxNTU0ODgyOTQxLCJleHAiOjE1NTc0NzQ5NDEsImlzcyI6ImFkbWluIiwic3ViIjoiaWFtQHVzZXIubWUifQ.VnAX1SNcoOc1DM_9dydZpGINnXrN9tGhiZH6T5Ja6zTIk7XlQyKZ8jkrFEhHyJlEsLTLhYbgbHs4GsD8JXmA83qCJntgQ78CRGdBWW1_Xe8BlJ_Jvyaf713hr1NnRI8rTD94oQ2I3h41T0T1ba57rlD1jNcltcfkgunMgU3ins-YMmP1TtQo9K9nItpsxY4lvI86w9TiSCU-jxHSnrnY1wcz854hZaXjd8R7NiX04wJVaxeA662IhKyPR7ukdnCHr8gYu0sieHfCCdb63Ehu6bKD7Kx0jATBbprMc_E9rK4p2S6LLSX9UZf78oPbHFFH_MEDPItBjS4-w7hVhQCPRQ'),(40,3,'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6Iml2YSIsInBhc3MiOiIxMjMiLCJkYXRlIjoiMjAxOS0wNC0xMFQwODowMjoyOC4wMzhaIiwiaWF0IjoxNTU0ODgzMzQ4LCJleHAiOjE1NTc0NzUzNDgsImlzcyI6ImFkbWluIiwic3ViIjoiaWFtQHVzZXIubWUifQ.Z3J99egRX9IknqBXiF2REgJ04BlXicW088dPotOhY6cHlH3rUActXuonepmFEk_1bfarTxpzAIStGfK4o4jaJhSbM1TISDTyDNP289zVTKNsrE1CZY52bwVvHwVAC79NUdcmLcr8w96Hv-hzsZmtRw83WmN-Iw0uTXZrNMpeGmzNP0---i61xoneaKz8A8YxJIeiAHTLcL-BarKYDm2-2B82VU1Y0c4_4PWWKwAXg39wKXjz91fJuTgDC07zVrtgO-kVfFaPaKN1oygf_TfQL-WUnWv0VUy4ZGHy2i3MgksmIuwMJk1zqQRJ4bF-3xAK2JW7FvNLHX5R3OYox734jA'),(41,6,'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6Iml2YSIsInBhc3MiOiIxMjMiLCJkYXRlIjoiMjAxOS0wNC0xMFQwODowMjoyOC4wMzhaIiwiaWF0IjoxNTU0ODgzMzQ4LCJleHAiOjE1NTc0NzUzNDgsImlzcyI6ImFkbWluIiwic3ViIjoiaWFtQHVzZXIubWUifQ.Z3J99egRX9IknqBXiF2REgJ04BlXicW088dPotOhY6cHlH3rUActXuonepmFEk_1bfarTxpzAIStGfK4o4jaJhSbM1TISDTyDNP289zVTKNsrE1CZY52bwVvHwVAC79NUdcmLcr8w96Hv-hzsZmtRw83WmN-Iw0uTXZrNMpeGmzNP0---i61xoneaKz8A8YxJIeiAHTLcL-BarKYDm2-2B82VU1Y0c4_4PWWKwAXg39wKXjz91fJuTgDC07zVrtgO-kVfFaPaKN1oygf_TfQL-WUnWv0VUy4ZGHy2i3MgksmIuwMJk1zqQRJ4bF-3xAK2JW7FvNLHX5R3OYox734jA'),(42,8,'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6Iml2YSIsInBhc3MiOiIxMjMiLCJkYXRlIjoiMjAxOS0wNC0xMFQwODowMjoyOC4wMzhaIiwiaWF0IjoxNTU0ODgzMzQ4LCJleHAiOjE1NTc0NzUzNDgsImlzcyI6ImFkbWluIiwic3ViIjoiaWFtQHVzZXIubWUifQ.Z3J99egRX9IknqBXiF2REgJ04BlXicW088dPotOhY6cHlH3rUActXuonepmFEk_1bfarTxpzAIStGfK4o4jaJhSbM1TISDTyDNP289zVTKNsrE1CZY52bwVvHwVAC79NUdcmLcr8w96Hv-hzsZmtRw83WmN-Iw0uTXZrNMpeGmzNP0---i61xoneaKz8A8YxJIeiAHTLcL-BarKYDm2-2B82VU1Y0c4_4PWWKwAXg39wKXjz91fJuTgDC07zVrtgO-kVfFaPaKN1oygf_TfQL-WUnWv0VUy4ZGHy2i3MgksmIuwMJk1zqQRJ4bF-3xAK2JW7FvNLHX5R3OYox734jA'),(43,3,'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6Iml2YSIsInBhc3MiOiIxMjMiLCJkYXRlIjoiMjAxOS0wNC0xMFQwODowNDoyNC4wNzlaIiwiaWF0IjoxNTU0ODgzNDY0LCJleHAiOjE1NTc0NzU0NjQsImlzcyI6ImFkbWluIiwic3ViIjoiaWFtQHVzZXIubWUifQ.ZYLFTjoSpiA4HnxHrNQwfWY3t5o-ojefumD3MrKiATW-AO7ceyaaCJlyFWS2nEUijfl2wh8JgLeyYI5yMnld4wMZdVS88mWAmnGVffMpEFTignodTQ4kMZ2fEVmonlkZTarjiCHiIFtRbGcxQFA69JwXsvVIzqVgCWpBvpJz4Nmn5OWhTPOO_rE983OFg-G5V9S23GpQwZ0p1Sg0ot8UFZCnQ9Ip4pxBet2Oh4l-T7zdET-zXNYu0AF3k30wNXnvvC-1MTOLP9O1jNMB-2pW0VBdhwFZmDK23zbhP9LR0T7R8zWc0Tmb9ie-64iPiBX-ZNtdvMzEJr7RhZXlTBF_iA'),(44,6,'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6Iml2YSIsInBhc3MiOiIxMjMiLCJkYXRlIjoiMjAxOS0wNC0xMFQwODowNDoyNC4wNzlaIiwiaWF0IjoxNTU0ODgzNDY0LCJleHAiOjE1NTc0NzU0NjQsImlzcyI6ImFkbWluIiwic3ViIjoiaWFtQHVzZXIubWUifQ.ZYLFTjoSpiA4HnxHrNQwfWY3t5o-ojefumD3MrKiATW-AO7ceyaaCJlyFWS2nEUijfl2wh8JgLeyYI5yMnld4wMZdVS88mWAmnGVffMpEFTignodTQ4kMZ2fEVmonlkZTarjiCHiIFtRbGcxQFA69JwXsvVIzqVgCWpBvpJz4Nmn5OWhTPOO_rE983OFg-G5V9S23GpQwZ0p1Sg0ot8UFZCnQ9Ip4pxBet2Oh4l-T7zdET-zXNYu0AF3k30wNXnvvC-1MTOLP9O1jNMB-2pW0VBdhwFZmDK23zbhP9LR0T7R8zWc0Tmb9ie-64iPiBX-ZNtdvMzEJr7RhZXlTBF_iA'),(45,8,'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6Iml2YSIsInBhc3MiOiIxMjMiLCJkYXRlIjoiMjAxOS0wNC0xMFQwODowNDoyNC4wNzlaIiwiaWF0IjoxNTU0ODgzNDY0LCJleHAiOjE1NTc0NzU0NjQsImlzcyI6ImFkbWluIiwic3ViIjoiaWFtQHVzZXIubWUifQ.ZYLFTjoSpiA4HnxHrNQwfWY3t5o-ojefumD3MrKiATW-AO7ceyaaCJlyFWS2nEUijfl2wh8JgLeyYI5yMnld4wMZdVS88mWAmnGVffMpEFTignodTQ4kMZ2fEVmonlkZTarjiCHiIFtRbGcxQFA69JwXsvVIzqVgCWpBvpJz4Nmn5OWhTPOO_rE983OFg-G5V9S23GpQwZ0p1Sg0ot8UFZCnQ9Ip4pxBet2Oh4l-T7zdET-zXNYu0AF3k30wNXnvvC-1MTOLP9O1jNMB-2pW0VBdhwFZmDK23zbhP9LR0T7R8zWc0Tmb9ie-64iPiBX-ZNtdvMzEJr7RhZXlTBF_iA');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'user1','123','user','emailatgmail.com','UK'),(2,'SOMENAME','bdej','eweff','feeef','fsefe'),(3,'iva','123','Iva','somemail ','Bulgaria '),(4,'iva2','123','Iva','somemail ','Bulgaria '),(5,'undefined','undefined','undefined','undefined','undefined'),(6,'iva','undefined','undefined','','undefined'),(7,'nnnnn','undefined','undefined','uisbfkj@kjes','undefined'),(8,'iva','','undefined','hgvghvhj@uheekjbkj','');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vocabulary`
--

LOCK TABLES `vocabulary` WRITE;
/*!40000 ALTER TABLE `vocabulary` DISABLE KEYS */;
INSERT INTO `vocabulary` VALUES (1,'거품','foam','middle','n',1,0),(2,'거북이','turtle','middle','n',1,0),(3,'강아지','puppy',NULL,NULL,1,0),(4,'가을 ','fall',NULL,NULL,1,0),(5,'겨울','winter',NULL,NULL,1,0),(6,'차','car','easy','n',1,3);
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

-- Dump completed on 2019-04-12 16:32:18
