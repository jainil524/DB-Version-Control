-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: book_sharing
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `admin_id` int(60) NOT NULL AUTO_INCREMENT COMMENT 'This is admin id',
  `admin_name` varchar(255) NOT NULL COMMENT 'this is admin name',
  `admin_email` varchar(255) NOT NULL COMMENT 'This is admin email id',
  `password` varchar(255) NOT NULL COMMENT 'this is admin password',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'jainil','jainiladmin@gmail.com','1eeb65bae656479467f57b9e690549df26c12b60');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_transaction`
--

DROP TABLE IF EXISTS `book_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_transaction` (
  `book_id` int(255) NOT NULL AUTO_INCREMENT COMMENT 'This is book id',
  `book_name` varchar(255) NOT NULL COMMENT 'This is book name',
  `book_price` int(255) NOT NULL COMMENT 'This is book price',
  `book_category` int(60) NOT NULL,
  `book_author` varchar(255) NOT NULL COMMENT 'This is book publisher name',
  `book_coverpage` text DEFAULT NULL COMMENT 'This is image of book cover',
  `book_publish_year` year(4) NOT NULL COMMENT 'This is book publish date',
  `book_description` text NOT NULL COMMENT 'This is book description',
  `seller_id` int(255) NOT NULL COMMENT 'This is seller id',
  `buyer_id` int(11) DEFAULT NULL,
  `delivery_guy_id` int(60) DEFAULT NULL,
  `upload_time` datetime NOT NULL DEFAULT current_timestamp(),
  `BookPin` int(6) DEFAULT NULL,
  PRIMARY KEY (`book_id`),
  KEY `Book` (`BookPin`),
  KEY `book_category` (`book_category`),
  KEY `buyer` (`buyer_id`),
  KEY `seller` (`seller_id`),
  KEY `delivery_guy` (`delivery_guy_id`),
  CONSTRAINT `buyer` FOREIGN KEY (`buyer_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `delivery_guy` FOREIGN KEY (`delivery_guy_id`) REFERENCES `delivery_guy` (`delivery_guy_id`),
  CONSTRAINT `seller` FOREIGN KEY (`seller_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_transaction`
--

LOCK TABLES `book_transaction` WRITE;
/*!40000 ALTER TABLE `book_transaction` DISABLE KEYS */;
INSERT INTO `book_transaction` VALUES (3,'C++',320,1,'Ashok kamthene','media/Book_cover_image/c++.png',2004,'c++ is the advance level of c with classes and objects ',20,29,1,'2022-02-22 14:12:24',10560),(4,'Android ',592,0,'Google','media/Book_cover_image/Andriod.png',2006,'Android is the os for the mobile phone',20,29,1,'2022-02-22 14:14:15',11799),(12,'java',214,0,'kishan','media/Book_cover_image/logo_without_text30651.png',2000,'this java book for beginners                                         ',20,29,2,'2022-03-23 16:07:37',6621),(13,'php',333,0,'re','media/Book_cover_image/user45342.png',2003,'gyfygfyvyv ',29,NULL,NULL,'2022-03-25 11:09:15',1934),(14,'fgh',678,0,'rty','media/Book_cover_image/Inkeddashed ovel_LI50067.jpg',2000,'dfgh',29,20,NULL,'2022-03-25 11:21:31',15434),(15,'erg',788,0,'erherh5','media/Book_cover_image/stock-photo-6460160927501.jpg',2005,'tyjuu',29,20,NULL,'2022-03-25 11:27:06',15774),(16,'c++',200,0,'abc','media/Book_cover_image/c++3422240245.png',2000,'kissjksa',20,29,NULL,'2022-03-25 11:54:10',14432),(17,'java',1900,0,'anshraj','media/Book_cover_image/java23643.png',2022,'atmakatha written by anshraj',29,NULL,NULL,'2022-03-25 12:30:49',NULL),(18,'vdfb',212,0,'ndsvksdv','media/Book_cover_image/delivery_guy48441.png',2002,'jdn jd djbdfvf',20,NULL,NULL,'2022-03-31 21:35:51',NULL),(19,'Barbie-world',1000,0,'Barbie','media/Book_cover_image/w3i2v5l3u288141226.gif',2024,'Welcome to Barbie world',31,NULL,NULL,'2024-04-25 10:22:35',NULL),(20,'Barbie-world',1000,0,'Barbie','media/Book_cover_image/w3i2v5l3u288143646.gif',2024,'Welcome to Barbie world',31,NULL,NULL,'2024-04-25 10:23:34',NULL),(23,'&lt;script&gt;alert(&quot;Jainil Barbie Jatin&quot;)&lt;/script&gt;',456,0,'AashkaRaval','media/Book_cover_image/51050350.jpg',1995,' its just a joke. Don&#039;t take it seriously',20,NULL,NULL,'2024-04-25 22:55:52',NULL),(24,'<script>alert(\"You are HAcked\");</script>',454,0,'sdfee','media/Book_cover_image/2020-09-23 (1)64188.png',2023,'dlgnebfk bnrkg jkfn',31,NULL,NULL,'2024-04-29 13:56:25',NULL);
/*!40000 ALTER TABLE `book_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_guy`
--

DROP TABLE IF EXISTS `delivery_guy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivery_guy` (
  `delivery_guy_id` int(255) NOT NULL AUTO_INCREMENT COMMENT 'This is delivery guy id',
  `delivery_guy_name` varchar(255) NOT NULL COMMENT 'This is delivery guy name',
  `delivery_guy_email` varchar(255) NOT NULL COMMENT 'This is delivery guy email',
  `delivery_guy_dob` date NOT NULL COMMENT 'This is delivery guy date of birth',
  `Profile_photo` varchar(70) NOT NULL,
  `delivery_guy_address` varchar(255) NOT NULL,
  `delivery_guy_pincode` int(255) NOT NULL COMMENT 'This is delivery guy pincode',
  `delivery_guy_password` varchar(255) NOT NULL COMMENT 'This is delivery guy password',
  `status` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`delivery_guy_id`),
  UNIQUE KEY `delivery_guy_email` (`delivery_guy_email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_guy`
--

LOCK TABLES `delivery_guy` WRITE;
/*!40000 ALTER TABLE `delivery_guy` DISABLE KEYS */;
INSERT INTO `delivery_guy` VALUES (1,'kishan','kishan118@gmail.com','0000-00-00','','rfbg vsvfbevf ',235542,'',1),(2,'jainil prajapati b','ramu@celaeno.com','0000-00-00','',' df fdvwd fvc',588727,'1eeb65bae656479467f57b9e690549df26c12b60',1);
/*!40000 ALTER TABLE `delivery_guy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reports` (
  `Report_id` int(12) NOT NULL AUTO_INCREMENT,
  `Report_msg` text NOT NULL,
  `reporter_user` int(12) NOT NULL,
  `reported_user` int(12) NOT NULL,
  `report_time` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`Report_id`),
  KEY `reported_user` (`reported_user`),
  KEY `reporter_user` (`reporter_user`),
  CONSTRAINT `reported_user` FOREIGN KEY (`reported_user`) REFERENCES `user` (`user_id`),
  CONSTRAINT `reporter_user` FOREIGN KEY (`reporter_user`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports`
--

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
INSERT INTO `reports` VALUES (1,'bttrbgfrbr 4reb4 rtgf',29,20,'2022-03-03 15:25:33'),(2,'Spam or misleading',29,20,'0000-00-00 00:00:00'),(3,'Spam or misleading',30,29,'0000-00-00 00:00:00');
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(30) NOT NULL AUTO_INCREMENT,
  `fname` varchar(190) NOT NULL,
  `user_name` varchar(40) NOT NULL,
  `email` varchar(90) NOT NULL,
  `Profile_photo` varchar(255) NOT NULL DEFAULT 'media/profile_photos/default_photo.svg',
  `address` text NOT NULL,
  `pincode` int(20) NOT NULL,
  `create_date` date NOT NULL DEFAULT current_timestamp(),
  `password` varchar(255) NOT NULL,
  `IsRestricted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (20,'jainil','jainil112','jainil112@gmail.com','media/profile_photos/default_photo.svg','103,ambikadham-1',37445,'2022-03-02','44c8a9219362c3a56df9eb9a3660d82d55b6b8ce',0),(29,'jainil prajapati b','sfdg','jainil@gmail.com','media/profile_photos/default_photo.svg','103,Ambikadham-1 sector-15,gandhinager',382016,'2022-03-04','1eeb65bae656479467f57b9e690549df26c12b60',1),(30,'jainil prajapati b','jk','jk@gmail.com','media/profile_photos/default_photo.svg','103,Ambikadham-1 sector-15,gandhinager',382016,'2022-03-30','1eeb65bae656479467f57b9e690549df26c12b60',0),(31,'Barbie','eibrab','barbie@gmail.com','media/profile_photos/eibrab_profilePic.jpeg','Home',382330,'2024-04-25','44c8a9219362c3a56df9eb9a3660d82d55b6b8ce',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usermessages`
--

DROP TABLE IF EXISTS `usermessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usermessages` (
  `msgid` int(11) NOT NULL AUTO_INCREMENT,
  `sender` int(255) NOT NULL,
  `receiver` int(255) NOT NULL,
  `usermsg` text NOT NULL,
  `send_time` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`msgid`),
  KEY `sender` (`sender`),
  KEY `receiver` (`receiver`),
  CONSTRAINT `receiver` FOREIGN KEY (`receiver`) REFERENCES `user` (`user_id`),
  CONSTRAINT `sender` FOREIGN KEY (`sender`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usermessages`
--

LOCK TABLES `usermessages` WRITE;
/*!40000 ALTER TABLE `usermessages` DISABLE KEYS */;
INSERT INTO `usermessages` VALUES (54,29,20,'hello','2022-03-20 17:39:16'),(55,29,20,'whats up?','2022-03-20 17:44:27'),(56,29,20,'hii jainil','2022-03-24 19:16:34'),(57,20,29,'hello kishan','2022-03-24 19:16:46'),(58,29,20,'hello','2022-03-25 10:55:39'),(59,29,20,'hey','2022-03-25 10:55:45'),(60,20,29,'hey','2022-03-25 11:04:53'),(61,20,29,'hi','2022-03-25 11:10:07'),(62,29,20,'dgdh','2022-03-25 11:10:38'),(63,29,20,'hlo sir','2022-03-25 11:19:16'),(64,20,29,'hlo','2022-03-25 11:22:16'),(65,29,20,'I have doubt','2022-03-25 11:27:45'),(66,29,20,'hlo','2022-03-25 11:30:02'),(67,20,29,'hleooooo','2022-03-25 11:40:39'),(68,29,20,'AK pztel','2022-03-25 11:43:55'),(69,29,20,'hjsjd','2022-03-25 12:18:49'),(70,29,20,'fgjfg','2022-03-25 12:40:37'),(71,29,20,'lfhg','2022-03-25 13:12:05'),(72,29,20,'bgsfhugfusd','2022-03-25 13:15:01'),(73,29,20,'nghnmghm','2022-03-25 13:15:07'),(74,29,20,'kk','2022-03-25 16:39:29'),(75,29,20,'nvekjrgbv','2022-03-30 13:50:20'),(76,30,20,'hello','2022-03-30 13:52:48'),(77,30,20,'how are you','2022-03-30 13:52:56'),(78,29,20,'hgdsf','2022-03-31 10:36:47'),(79,20,29,'hello jianil','2022-03-31 10:38:08'),(80,29,20,'mvbdfbfd','2022-03-31 19:19:22');
/*!40000 ALTER TABLE `usermessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warn_user_delivery_guy`
--

DROP TABLE IF EXISTS `warn_user_delivery_guy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `warn_user_delivery_guy` (
  `wanr_id` int(255) NOT NULL AUTO_INCREMENT,
  `warn_user_id` int(255) NOT NULL,
  `warning_message` text NOT NULL,
  `warn_time` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`wanr_id`),
  KEY `warned_user` (`warn_user_id`),
  CONSTRAINT `warned_user` FOREIGN KEY (`warn_user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warn_user_delivery_guy`
--

LOCK TABLES `warn_user_delivery_guy` WRITE;
/*!40000 ALTER TABLE `warn_user_delivery_guy` DISABLE KEYS */;
INSERT INTO `warn_user_delivery_guy` VALUES (1,20,'fg grfbeb nngf gtrfb bgfb g fbgv gf fv f f   ','2022-03-22 22:01:56'),(2,20,'cb l kr kr kr kr k kr k nkr f,wkjf s f','2022-03-31 19:02:12');
/*!40000 ALTER TABLE `warn_user_delivery_guy` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-01 21:34:35
