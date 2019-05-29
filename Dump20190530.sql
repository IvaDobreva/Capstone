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
-- Table structure for table `cat_img`
--

DROP TABLE IF EXISTS `cat_img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cat_img` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `cat_id` int(11) NOT NULL,
  `img_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_img`
--

LOCK TABLES `cat_img` WRITE;
/*!40000 ALTER TABLE `cat_img` DISABLE KEYS */;
INSERT INTO `cat_img` VALUES (1,1,46),(2,1,47),(3,1,48),(4,1,49),(5,1,50),(6,1,32),(7,1,51),(8,6,1),(9,6,58);
/*!40000 ALTER TABLE `cat_img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `cat_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'School'),(2,'University'),(3,'Office'),(4,'Home'),(5,'Clothes'),(6,'Food');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=454 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_session`
--

LOCK TABLES `game_session` WRITE;
/*!40000 ALTER TABLE `game_session` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (1,'cucumber','Food,Vegetable,Cuisine,Dish,Cucumis,Ingredient,Produce,Plant,Cucumber,Vegetarian food'),(2,'cucumber','Food,Vegetable,Cuisine,Dish,Cucumis,Ingredient,Produce,Plant,Cucumber,Vegetarian food'),(3,'fortune','Hand,Architecture,House'),(4,'castle','Illustration,Watercolor paint,Architecture,Castle,Medieval architecture,Château,Sky,Building,World,Tree'),(5,'tool','Tool,Metalworking hand tool,Cutting tool,Screwdriver,Set tool'),(6,'girl','School uniform,Clothing,Uniform,Plaid,Japanese idol,Tartan'),(7,'king','Music,Cool,Movie,Headgear,Facial hair,Moustache,Beard'),(8,'honey','Liquid,Honey,Drop,Syrup,Caramel color,Sauces,Cooking oil,Cajeta,Food,Drink'),(9,'stroll','Walking,Fashion,Tree,Photography,Adaptation,Leisure,Gesture,Recreation,Vacation,Plantation'),(10,'walk','Walking,Fashion,Tree,Photography,Adaptation,Leisure,Gesture,Recreation,Vacation,Plantation'),(11,'post office','Yellow,Property,Font,Real estate,Building,Sky,House,Signage,Residential area,Logo'),(12,'a pillow','White,Pillow,Throw pillow,Cushion,Furniture,Linens,Textile,Bedding,Rectangle,Interior design'),(13,'prison','Room,Property,Furniture,Building,Bedroom,Interior design,House,Real estate,Bed,Table'),(14,'thursday','Text,Font,Illustration'),(15,'father','Face,Black,Facial expression,Nose,Black-and-white,Head,Monochrome,Chin,Close-up,Mouth'),(16,'pack','Face,Skin,Forehead,Nose,Cheek,Head,Eyebrow,Chin,Jaw,Mouth'),(17,'sky','Sky,Cloud,Daytime,Cumulus,Blue,White,Atmosphere,Meteorological phenomenon,Atmospheric phenomenon,Azure'),(18,'clothes','Clothing,Pink,Dress,Day dress,Outerwear,Pattern,Pattern,Peach,Blouse,Sleeve'),(19,'cafe','Restaurant,Building,Interior design,Room,Table,Bar,Tavern,Architecture,Furniture,Pub'),(20,'a dream','People in nature,Text,Sky,Font,Happy,Album cover,Photography,Gesture,Smile'),(21,'a window','Room,Property,Floor,Daylighting,Interior design,House,Building,Furniture,Window,Wall'),(22,'piano','Piano,Musical instrument,Electronic instrument,Keyboard,Musical keyboard,Electronic keyboard,Electric piano,Electronic musical instrument,Digital piano,Technology'),(23,'chicken','Chicken,Rooster,Bird,Fowl,Galliformes,Beak,Poultry,Phasianidae,Livestock,Comb'),(24,'plane','Airline,Air travel,Aviation,Airliner,Vehicle,Airplane,Wide-body aircraft,Aircraft,Boeing,Flap'),(25,'coffee','Caffè macchiato,Ristretto,Cortado,Flat white,Coffee,Espresso,Café au lait,White coffee,Latte,Mocaccino'),(26,'car','Land vehicle,Vehicle,Car,Automotive design,Mitsubishi,Automotive exterior,Mitsubishi outlander,Mid-size car,Automotive fog light,Sport utility vehicle'),(27,'dog','Dog,Mammal,Vertebrate,Dog breed,Canidae,German spitz mittel,Volpino italiano,Japanese spitz,Indian spitz,American eskimo dog'),(28,'puppy','Mammal,Dog,Vertebrate,Dog breed,Canidae,Puppy,Companion dog,Puppy love,Carnivore,Labrador retriever'),(29,'cat','Cat,Mammal,Vertebrate,Whiskers,Felidae,Small to medium-sized cats,Snout,Nose,Carnivore,Close-up'),(30,'tree','Tree,Trunk,Plant,Fu ling,Root'),(31,'forest','Tree,Natural landscape,Forest,Natural environment,Nature,Woodland,Green,Vegetation,Nature reserve,Old-growth forest'),(32,'school','Event,Music,Performance'),(33,'university','Landmark,Building,Architecture,Public space,City,Human settlement,Plaza,Town square,Campus,Palace'),(34,'coffee shop','Restaurant,Building,Interior design,Room,Table,Bar,Tavern,Architecture,Furniture,Pub'),(35,'spring','Flower,Blossom,Spring,Plant,Tree,Sky,Branch,Cherry blossom,Twig,Flowering plant'),(36,'autmn','Tree,Autumn,Orange,Leaf,Deciduous,Woody plant,Natural landscape,Plant,Maple,Maple leaf'),(37,'autmn','Tree,Autumn,Orange,Leaf,Deciduous,Woody plant,Natural landscape,Plant,Maple,Maple leaf'),(38,'fall','Tree,Autumn,Orange,Leaf,Deciduous,Woody plant,Natural landscape,Plant,Maple,Maple leaf'),(39,'tea','Land vehicle,Vehicle,Car,Automotive design,Mitsubishi,Automotive exterior,Mitsubishi outlander,Mid-size car,Automotive fog light,Sport utility vehicle'),(40,'notebook','Notebook,Text,Book,Diary,Paper product,Paper,Font,Writing,Stationery'),(41,'flower','Flower,Flowering plant,Petal,african daisy,Purple,Violet,Plant,Lilac,Spring,Botany'),(42,'autumn','Wave,Surfing Equipment,Wind wave,Surfing,Boardsport,Surfboard,Surface water sports,Skimboarding,Water sport,Tide'),(43,'winter','Tree,Autumn,Orange,Leaf,Deciduous,Woody plant,Natural landscape,Plant,Maple,Maple leaf'),(44,'vending machine','Product,Advertising,Cola,Machine,Coca-cola,Plant,Vending machine,Coca,Display advertising,Hair coloring'),(45,'water','Water,Drinking water,Transparent material,Glass,Liquid,Mineral water,Drink,Distilled water,Old fashioned glass,Fluid'),(46,'book','Book,Publication,Wood,Furniture,Shelf,Bookselling,Collection'),(47,'pen','Technology,Pen,Electronic device'),(48,'notebook','Notebook,Text,Book,Diary,Paper product,Paper,Font,Writing,Stationery'),(49,'rubber','Eraser,Font,Rectangle'),(50,'teacher','Blackboard,Teacher,Professor,Classroom,Room,Class,Gesture,Education'),(51,'student','Cartoon,People,Illustration,Standing,Fun,Art,Animation,Conversation,Style,Gesture'),(52,'house','Home,House,Property,Green,Building,Cottage,Real estate,Siding,Roof,Grass'),(53,'bag','Bag,Leather,Handbag,Tan,Briefcase,Brown,Business bag,Fashion accessory,Beige,Baggage'),(54,'bag','Bag,Leather,Handbag,Tan,Briefcase,Brown,Business bag,Fashion accessory,Beige,Baggage'),(55,'bag','Bag,Leather,Handbag,Tan,Briefcase,Brown,Business bag,Fashion accessory,Beige,Baggage'),(56,'bag','Bag,Leather,Handbag,Tan,Briefcase,Brown,Business bag,Fashion accessory,Beige,Baggage'),(57,'bag','Bag,Leather,Handbag,Tan,Briefcase,Brown,Business bag,Fashion accessory,Beige,Baggage'),(58,'food','Natural foods,Whole food,Local food,Vegetable,Vegan nutrition,Food,Superfood,Food group,Leaf vegetable,Vegetarian food');
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `image_BEFORE_INSERT` BEFORE INSERT ON `image` FOR EACH ROW BEGIN

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `kor_labels`
--

DROP TABLE IF EXISTS `kor_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `kor_labels` (
  `imgID` int(11) DEFAULT NULL,
  `labelsKR` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kor_labels`
--

LOCK TABLES `kor_labels` WRITE;
/*!40000 ALTER TABLE `kor_labels` DISABLE KEYS */;
INSERT INTO `kor_labels` VALUES (1,'오이'),(2,'오이'),(3,''),(4,'성,하늘,나무'),(5,'도구'),(6,''),(7,''),(8,'꿀'),(9,'나무'),(10,'나무'),(11,'하늘'),(12,'베개'),(13,''),(14,''),(15,''),(16,''),(17,'하늘'),(18,''),(19,''),(20,'하늘'),(21,'창문'),(22,'피아노'),(23,'닭'),(24,'비행기'),(25,'커피'),(26,'차'),(27,'개'),(28,'개,강아지'),(29,'고양이 '),(30,'나무'),(31,'나무,숲'),(32,''),(33,''),(34,''),(35,'꽃,봄,나무,하늘'),(36,'나무,여름'),(37,'나무,여름'),(38,'나무,여름'),(39,'차'),(40,'공책,책'),(41,'꽃,봄'),(42,''),(43,'나무,여름'),(44,'자판기'),(45,'물'),(46,'책'),(47,'펜'),(48,'공책,책'),(49,''),(50,'선생님'),(51,''),(57,'가방'),(58,'음식');
/*!40000 ALTER TABLE `kor_labels` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (80,3,'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6Iml2YSIsInBhc3MiOiIxMjMiLCJkYXRlIjoiMjAxOS0wNS0yOVQyMToxNTo0MS44NzhaIiwiaWF0IjoxNTU5MTY0NTQxLCJleHAiOjE1NjE3NTY1NDEsImlzcyI6ImFkbWluIiwic3ViIjoiaWFtQHVzZXIubWUifQ.Fa9TxKs6dmn9FBH2MCvRjn9b6C4m4qsH5aUG8sso8WaLxpU1G0Lus7XbbbusXNJyVv5-s4-2G04oALKW7qX6pdwk5kNyw-jX8m9Qj-avOSJqzTxIJWUSN0gliYAO6gfPrLmqDQGrK1PBaxzPHyjYTyzOSYBug0rYzKt8Ui2Yr-iidrwJOIeowby0f8Mrx5dMYlmz8xMETTNVLG2IUkD5YmX1jWxGrrSmZGc0e_ZF4Qo9W9faFZhMVuYAFlszZ2olkrqCX0DAbalJcbKMdfe4D453xXYRFQmkyiCv_-tu0rVWtH98At_AMHHTtrYbPvXk5paHlelF8gfOfLekoQUZaw');
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
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_game_history`
--

LOCK TABLES `user_game_history` WRITE;
/*!40000 ALTER TABLE `user_game_history` DISABLE KEYS */;
INSERT INTO `user_game_history` VALUES (22,3,8,'01-05-2019'),(23,3,7,'01-05-2019'),(24,3,8,'01-05-2019'),(25,3,9,'01-05-2019'),(26,3,7,'01-05-2019'),(27,3,7,'01-05-2019'),(28,3,4,'02-05-2019'),(29,3,4,'02-05-2019'),(30,3,2,'02-05-2019'),(31,3,7,'03-05-2019'),(32,3,5,'10-05-2019'),(33,3,0,'10-05-2019'),(34,3,0,'10-05-2019'),(35,3,0,'10-05-2019'),(36,3,0,'10-05-2019'),(37,3,0,'10-05-2019'),(38,3,0,'10-05-2019'),(39,3,0,'10-05-2019'),(40,3,0,'10-05-2019'),(41,3,0,'10-05-2019'),(42,3,0,'10-05-2019'),(43,3,1,'13-05-2019'),(44,3,2,'15-05-2019'),(45,3,1,'15-05-2019'),(46,3,0,'29-05-2019 00:05:25');
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
INSERT INTO `users` VALUES (1,'user1','123','user','emailatgmail.com','UK',0),(2,'SOMENAME','bdej','eweff','feeef','fsefe',0),(3,'iva','123','Iva','somemail ','Bulgaria ',253),(4,'iva2','123','Iva','somemail ','Bulgaria ',0),(5,'undefined','undefined','undefined','undefined','undefined',0),(7,'nnnnn','undefined','undefined','uisbfkj@kjes','undefined',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vocabulary`
--

LOCK TABLES `vocabulary` WRITE;
/*!40000 ALTER TABLE `vocabulary` DISABLE KEYS */;
INSERT INTO `vocabulary` VALUES (1,'오이','cucumber',NULL,'n',1,5),(2,'재산','fortune',NULL,'n',1,0),(3,'성','castle',NULL,'n',1,0),(4,'도구','tool',NULL,'n',1,5),(5,'소녀','girl',NULL,'n',1,0),(6,'왕','king',NULL,'n',1,0),(7,'꿀','honey',NULL,'n',1,0),(8,'산책','stroll',NULL,'n',1,0),(9,'산책','walk',NULL,'n',1,0),(10,'우체국','post office',NULL,'n',1,0),(11,'베개','pillow',NULL,'n',1,5),(12,'감옥','prison',NULL,'n',1,0),(13,'목요일','thursday',NULL,'n',1,0),(14,'아버지','father',NULL,'n',1,0),(15,'팩','pack',NULL,'n',1,0),(16,'하늘','sky',NULL,'n',1,4),(17,'옷','clothes',NULL,'n',1,0),(18,'카페','cafe',NULL,'n',1,0),(19,'꿈','dream',NULL,'n',1,0),(20,'창문','window',NULL,'n',1,0),(21,'피아노','piano',NULL,'n',1,0),(22,'닭','chicken',NULL,'n',1,0),(23,'비행기','airplane',NULL,'n',1,0),(24,'커피','coffee',NULL,'n',1,0),(25,'차','car',NULL,'n',1,4),(26,'개','dog',NULL,'n',1,8),(27,'강아지','puppy',NULL,'n',1,5),(28,'고양이 ','cat',NULL,'n',1,4),(29,'나무','tree',NULL,'n',1,7),(30,'숲','forest',NULL,'n',1,4),(31,'학교','school',NULL,'n',1,0),(32,'대학교','university',NULL,'n',1,0),(33,'카페','coffee shop',NULL,'n',1,0),(34,'봄','spring',NULL,'n',1,0),(35,'여름','autumn',NULL,'n',1,5),(36,'가을','winter',NULL,'n',1,0),(37,'가을','fall',NULL,'n',1,0),(38,'차','tea',NULL,'n',1,0),(39,'노트북','notebook',NULL,'n',1,0),(40,'꽃','flower',NULL,'n',1,0),(41,'자판기','vending machine',NULL,NULL,1,0),(42,'물','water',NULL,NULL,1,0),(43,'책','book',NULL,NULL,1,0),(44,'펜','pen',NULL,NULL,1,0),(45,'펜','pen',NULL,NULL,1,0),(46,'공책','notebook',NULL,NULL,1,0),(47,'지우개','rubber',NULL,NULL,1,0),(48,'선생님','teacher',NULL,NULL,1,0),(49,'학생','student',NULL,NULL,1,0),(50,'집','house',NULL,NULL,1,0),(51,'가방','bag',NULL,NULL,1,0),(52,'가방','bag',NULL,NULL,1,0),(53,'가방','bag',NULL,NULL,1,0),(54,'가방','bag',NULL,NULL,1,0),(55,'가방','bag',NULL,NULL,1,0),(56,'음식','food',NULL,NULL,1,0);
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

-- Dump completed on 2019-05-30  8:15:06
