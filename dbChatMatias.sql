-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_chatmatias
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `conversation`
--

DROP TABLE IF EXISTS `conversation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conversation` (
  `idconversation` int NOT NULL AUTO_INCREMENT,
  `user1_id` int NOT NULL,
  `user2_id` int NOT NULL,
  PRIMARY KEY (`idconversation`),
  KEY `conversation_u1_user_idx` (`user1_id`),
  KEY `conversation_u2_user_idx` (`user2_id`),
  CONSTRAINT `conversation_u1_user` FOREIGN KEY (`user1_id`) REFERENCES `user` (`idUser`),
  CONSTRAINT `conversation_u2_user` FOREIGN KEY (`user2_id`) REFERENCES `user` (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversation`
--

LOCK TABLES `conversation` WRITE;
/*!40000 ALTER TABLE `conversation` DISABLE KEYS */;
INSERT INTO `conversation` VALUES (8,8,8),(9,8,9),(10,10,8),(11,11,8);
/*!40000 ALTER TABLE `conversation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `idimages` int NOT NULL AUTO_INCREMENT,
  `url` varchar(300) NOT NULL,
  PRIMARY KEY (`idimages`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,'C:\\Users\\losmelli\\Pictures\\instagram-logo-796x404.png'),(2,'C:\\Users\\losmelli\\Documents\\javadeveloper.png'),(3,'C:\\Users\\losmelli\\Pictures\\instagram-logo-796x404.png'),(4,'C:\\Users\\losmelli\\Pictures\\facebook-logo-200x200.png'),(5,'C:\\Users\\losmelli\\Pictures\\facebook-logo-200x200.png'),(6,'C:\\Users\\losmelli\\Pictures\\messi2.jpg'),(7,'C:\\Users\\losmelli\\Pictures\\messi2.jpg'),(8,'C:\\Users\\losmelli\\Pictures\\instagram-logo-796x404.png'),(9,'C:\\Users\\losmelli\\Pictures\\facebook-logo-200x200.png');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `idmessages` int NOT NULL AUTO_INCREMENT,
  `conversation_id` int NOT NULL,
  `message` varchar(150) NOT NULL,
  `sender_id` int NOT NULL,
  `created_at` datetime NOT NULL,
  `photo` int DEFAULT NULL,
  PRIMARY KEY (`idmessages`),
  KEY `convid_messages_idx` (`conversation_id`),
  KEY `convid_sender_idx` (`sender_id`),
  CONSTRAINT `convid_messages` FOREIGN KEY (`conversation_id`) REFERENCES `conversation` (`idconversation`),
  CONSTRAINT `convid_sender` FOREIGN KEY (`sender_id`) REFERENCES `user` (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (61,9,'hola',8,'2024-11-18 22:00:11',0),(62,9,'C:\\Users\\losmelli\\Pictures\\instagram-logo-796x404.png',8,'2024-11-18 22:00:28',1),(63,9,'te llego?',8,'2024-11-18 22:00:42',0),(64,9,'o',8,'2024-11-18 22:00:56',0),(65,9,'ll',9,'2024-11-18 22:02:45',0),(66,9,'ll',9,'2024-11-18 22:02:53',0),(67,9,'como va?=',8,'2024-11-18 22:12:37',0),(68,9,'anda lindo che',9,'2024-11-18 22:12:43',0),(69,9,'C:\\Users\\losmelli\\Documents\\javadeveloper.png',8,'2024-11-18 22:12:59',1),(70,9,'que facha el pibe ese',9,'2024-11-18 22:13:14',0),(128,9,'hola matias como estas',8,'2024-11-18 22:52:06',0),(129,9,'bien y vos',9,'2024-11-18 22:52:15',0),(130,9,'C:\\Users\\losmelli\\Pictures\\facebook-logo-200x200.png',8,'2024-11-18 22:52:32',1),(131,9,'ya te va a llegar el mensaje',8,'2024-11-18 23:02:01',0),(132,9,'ya te va a llegar el mensaje',8,'2024-11-18 23:02:07',0),(133,9,'llegoooooo???',8,'2024-11-18 23:03:44',0),(134,9,'llegoooooo???',8,'2024-11-18 23:03:45',0),(135,9,'wqwqwqwqwqwq',9,'2024-11-18 23:04:13',0),(136,9,'wqwqwqwqwqwq',9,'2024-11-18 23:04:14',0),(137,8,'sasa',8,'2024-11-18 23:13:12',0);
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `idUser` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `profile_pic` varchar(500) NOT NULL,
  PRIMARY KEY (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (8,'santino','12345','C:\\Users\\losmelli\\Pictures\\instagram-logo-796x404.png'),(9,'matias','reloj','C:\\Users\\losmelli\\Pictures\\facebook-logo-200x200.png'),(10,'lolo','12345','C:\\Users\\losmelli\\Pictures\\clima.jpg'),(11,'juan','12345','C:\\Users\\losmelli\\Pictures\\instagram-logo-796x404.png');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-18 23:14:04
