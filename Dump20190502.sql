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
) ENGINE=InnoDB AUTO_INCREMENT=341 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_session`
--

LOCK TABLES `game_session` WRITE;
/*!40000 ALTER TABLE `game_session` DISABLE KEYS */;
INSERT INTO `game_session` VALUES (331,3,39,'차',1),(332,3,25,'커피',1),(333,3,40,'노트북',0),(334,3,39,'차',1),(335,3,16,'팩',0),(336,3,41,'꽃',1),(337,3,34,'카페',0),(338,3,2,'오이',1),(339,3,24,'비행기',1),(340,3,31,'숲',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (1,'cucumber','Food,Vegetable,Cuisine,Dish,Cucumis,Ingredient,Produce,Plant,Cucumber,Vegetarian food'),(2,'cucumber','Food,Vegetable,Cuisine,Dish,Cucumis,Ingredient,Produce,Plant,Cucumber,Vegetarian food'),(3,'fortune','Hand,Architecture,House'),(4,'castle','Illustration,Watercolor paint,Architecture,Castle,Medieval architecture,Château,Sky,Building,World,Tree'),(5,'tool','Tool,Metalworking hand tool,Cutting tool,Screwdriver,Set tool'),(6,'girl','School uniform,Clothing,Uniform,Plaid,Japanese idol,Tartan'),(7,'king','Music,Cool,Movie,Headgear,Facial hair,Moustache,Beard'),(8,'honey','Liquid,Honey,Drop,Syrup,Caramel color,Sauces,Cooking oil,Cajeta,Food,Drink'),(9,'stroll','Walking,Fashion,Tree,Photography,Adaptation,Leisure,Gesture,Recreation,Vacation,Plantation'),(10,'walk','Walking,Fashion,Tree,Photography,Adaptation,Leisure,Gesture,Recreation,Vacation,Plantation'),(11,'post office','Yellow,Property,Font,Real estate,Building,Sky,House,Signage,Residential area,Logo'),(12,'a pillow','White,Pillow,Throw pillow,Cushion,Furniture,Linens,Textile,Bedding,Rectangle,Interior design'),(13,'prison','Room,Property,Furniture,Building,Bedroom,Interior design,House,Real estate,Bed,Table'),(14,'thursday','Text,Font,Illustration'),(15,'father','Face,Black,Facial expression,Nose,Black-and-white,Head,Monochrome,Chin,Close-up,Mouth'),(16,'pack','Face,Skin,Forehead,Nose,Cheek,Head,Eyebrow,Chin,Jaw,Mouth'),(17,'sky','Sky,Cloud,Daytime,Cumulus,Blue,White,Atmosphere,Meteorological phenomenon,Atmospheric phenomenon,Azure'),(18,'clothes','Clothing,Pink,Dress,Day dress,Outerwear,Pattern,Pattern,Peach,Blouse,Sleeve'),(19,'cafe','Restaurant,Building,Interior design,Room,Table,Bar,Tavern,Architecture,Furniture,Pub'),(20,'a dream','People in nature,Text,Sky,Font,Happy,Album cover,Photography,Gesture,Smile'),(21,'a window','Room,Property,Floor,Daylighting,Interior design,House,Building,Furniture,Window,Wall'),(22,'piano','Piano,Musical instrument,Electronic instrument,Keyboard,Musical keyboard,Electronic keyboard,Electric piano,Electronic musical instrument,Digital piano,Technology'),(23,'chicken','Chicken,Rooster,Bird,Fowl,Galliformes,Beak,Poultry,Phasianidae,Livestock,Comb'),(24,'plane','Airline,Air travel,Aviation,Airliner,Vehicle,Airplane,Wide-body aircraft,Aircraft,Boeing,Flap'),(25,'coffee','Caffè macchiato,Ristretto,Cortado,Flat white,Coffee,Espresso,Café au lait,White coffee,Latte,Mocaccino'),(26,'car','Land vehicle,Vehicle,Car,Automotive design,Mitsubishi,Automotive exterior,Mitsubishi outlander,Mid-size car,Automotive fog light,Sport utility vehicle'),(27,'dog','Dog,Mammal,Vertebrate,Dog breed,Canidae,German spitz mittel,Volpino italiano,Japanese spitz,Indian spitz,American eskimo dog'),(28,'puppy','Mammal,Dog,Vertebrate,Dog breed,Canidae,Puppy,Companion dog,Puppy love,Carnivore,Labrador retriever'),(29,'cat','Cat,Mammal,Vertebrate,Whiskers,Felidae,Small to medium-sized cats,Snout,Nose,Carnivore,Close-up'),(30,'tree','Tree,Trunk,Plant,Fu ling,Root'),(31,'forest','Tree,Natural landscape,Forest,Natural environment,Nature,Woodland,Green,Vegetation,Nature reserve,Old-growth forest'),(32,'school','Event,Music,Performance'),(33,'university','Landmark,Building,Architecture,Public space,City,Human settlement,Plaza,Town square,Campus,Palace'),(34,'coffee shop','Restaurant,Building,Interior design,Room,Table,Bar,Tavern,Architecture,Furniture,Pub'),(35,'spring','Flower,Blossom,Spring,Plant,Tree,Sky,Branch,Cherry blossom,Twig,Flowering plant'),(36,'autmn','Tree,Autumn,Orange,Leaf,Deciduous,Woody plant,Natural landscape,Plant,Maple,Maple leaf'),(37,'autmn','Tree,Autumn,Orange,Leaf,Deciduous,Woody plant,Natural landscape,Plant,Maple,Maple leaf'),(38,'fall','Tree,Autumn,Orange,Leaf,Deciduous,Woody plant,Natural landscape,Plant,Maple,Maple leaf'),(39,'tea','Land vehicle,Vehicle,Car,Automotive design,Mitsubishi,Automotive exterior,Mitsubishi outlander,Mid-size car,Automotive fog light,Sport utility vehicle'),(40,'notebook','Laptop,Electronic device,Technology,Gadget,Output device,Personal computer,Screen,Product,Computer,Netbook'),(41,'flower','Flower,Flowering plant,Petal,african daisy,Purple,Violet,Plant,Lilac,Spring,Botany'),(42,'autumn','Wave,Surfing Equipment,Wind wave,Surfing,Boardsport,Surfboard,Surface water sports,Skimboarding,Water sport,Tide'),(43,'winter','Tree,Autumn,Orange,Leaf,Deciduous,Woody plant,Natural landscape,Plant,Maple,Maple leaf');
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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_game_history`
--

LOCK TABLES `user_game_history` WRITE;
/*!40000 ALTER TABLE `user_game_history` DISABLE KEYS */;
INSERT INTO `user_game_history` VALUES (22,3,8,'01-05-2019'),(23,3,7,'01-05-2019'),(24,3,8,'01-05-2019'),(25,3,9,'01-05-2019'),(26,3,7,'01-05-2019'),(27,3,7,'01-05-2019'),(28,3,4,'02-05-2019'),(29,3,4,'02-05-2019'),(30,3,2,'02-05-2019'),(31,3,7,'02-05-2019');
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
INSERT INTO `users` VALUES (1,'user1','123','user','emailatgmail.com','UK',0),(2,'SOMENAME','bdej','eweff','feeef','fsefe',0),(3,'iva','123','Iva','somemail ','Bulgaria ',244),(4,'iva2','123','Iva','somemail ','Bulgaria ',0),(5,'undefined','undefined','undefined','undefined','undefined',0),(7,'nnnnn','undefined','undefined','uisbfkj@kjes','undefined',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vocabulary`
--

LOCK TABLES `vocabulary` WRITE;
/*!40000 ALTER TABLE `vocabulary` DISABLE KEYS */;
INSERT INTO `vocabulary` VALUES (1,'오이','cucumber',NULL,'n',1,0),(2,'재산','fortune',NULL,'n',1,0),(3,'성','castle',NULL,'n',1,0),(4,'도구','tool',NULL,'n',1,0),(5,'소녀','girl',NULL,'n',1,0),(6,'왕','king',NULL,'n',1,0),(7,'꿀','honey',NULL,'n',1,0),(8,'산책','stroll',NULL,'n',1,0),(9,'산책','walk',NULL,'n',1,0),(10,'우체국','post office',NULL,'n',1,0),(11,'베개','pillow',NULL,'n',1,0),(12,'감옥','prison',NULL,'n',1,0),(13,'목요일','thursday',NULL,'n',1,0),(14,'아버지','father',NULL,'n',1,0),(15,'팩','pack',NULL,'n',1,0),(16,'하늘','sky',NULL,'n',1,0),(17,'옷','clothes',NULL,'n',1,0),(18,'카페','cafe',NULL,'n',1,0),(19,'꿈','dream',NULL,'n',1,0),(20,'창문','window',NULL,'n',1,0),(21,'피아노','piano',NULL,'n',1,0),(22,'닭','chicken',NULL,'n',1,0),(23,'비행기','airplane',NULL,'n',1,0),(24,'커피','coffee',NULL,'n',1,0),(25,'차','car',NULL,'n',1,0),(26,'개','dog',NULL,'n',1,0),(27,'강아지','puppy',NULL,'n',1,0),(28,'고양이 ','cat',NULL,'n',1,0),(29,'나무','tree',NULL,'n',1,0),(30,'숲','forest',NULL,'n',1,0),(31,'학교','school',NULL,'n',1,0),(32,'대학교','university',NULL,'n',1,0),(33,'카페','coffee shop',NULL,'n',1,0),(34,'봄','spring',NULL,'n',1,0),(35,'여름','autumn',NULL,'n',1,0),(36,'가을','winter',NULL,'n',1,0),(37,'가을','fall',NULL,'n',1,0),(38,'차','tea',NULL,'n',1,0),(39,'노트북','notebook',NULL,'n',1,0),(40,'꽃','flower',NULL,'n',1,0);
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

-- Dump completed on 2019-05-02 13:25:22
