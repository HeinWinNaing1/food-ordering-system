-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: fooddb
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `food`
--

DROP TABLE IF EXISTS `food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food` (
  `id` int NOT NULL AUTO_INCREMENT,
  `foodname` varchar(256) NOT NULL,
  `catagory` varchar(256) NOT NULL,
  `taste` varchar(45) NOT NULL,
  `price` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food`
--

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
INSERT INTO `food` VALUES (13,'MokeHinGar','MyanmarFood','good',100),(14,'HanBurger','FastFood','good',50),(15,'Pizza','FastFood','good',75),(16,'OnionRing','FastFood','sweet',25),(17,'Pancake','FastFood','sweet',75),(18,'Pasta','StarchyFood','good',30),(19,'ApplePie','Dessert','sweet',100),(20,'Bread','FastFood','good',25),(21,'ChickenFried','FastFood','good',100),(22,'Chimichanga','WesternFood','sweet',75),(23,'Donuts','Dessert','sweet',45),(24,'FriedRice','MainFood','good',50),(25,'Fries','FastFood','good',50),(26,'Icecream','Dessert','sweet',75),(27,'IcecreamCake','Dessert','sweet',150),(28,'PotPie','Dessert','sweet',200),(29,'Steak','Meat','good',300),(30,'Tacos','FastFood','good',300),(31,'OnionRing','FastFood','sweet',25);
/*!40000 ALTER TABLE `food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_order`
--

DROP TABLE IF EXISTS `food_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `rate` int DEFAULT NULL,
  `foodName` varchar(255) DEFAULT NULL,
  `price` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_order`
--

LOCK TABLES `food_order` WRITE;
/*!40000 ALTER TABLE `food_order` DISABLE KEYS */;
INSERT INTO `food_order` VALUES (44,'ko@gmail.com','2022/11/04 20:41:15',3,75,'Chimichanga',225),(45,'ko@gmail.com','2022/11/04 20:41:40',5,100,'ApplePie',500),(46,'hein@gmail.com','2022/11/04 21:02:52',10,100,'ChickenFried',1000),(47,'hein@gmail.com','2022/11/04 21:03:00',5,300,'Tacos',1500),(48,'zaw@gmail.com','2022/11/04 21:10:53',4,25,'Bread',100),(49,'zaw@gmail.com','2022/11/04 21:11:43',10,25,'OnionRing',250),(50,'ko@gmail.com','2022/11/05 08:37:22',4,25,'Bread',100),(51,'ko@gmail.com','2022/11/05 08:44:48',20,100,'ApplePie',2000),(52,'ko@gmail.com','2022/11/05 12:58:13',1,75,'Chimichanga',75),(53,'ko@gmail.com','2022/11/05 16:17:13',4,75,'Pizza',300),(54,'hein@gmail.com','2022/11/05 16:18:56',4,200,'PotPie',800),(55,'ko@gmail.com','2022/11/05 16:33:36',1,100,'MokeHinGar',100),(56,'ko@gmail.com','2022/11/05 19:26:44',1,300,'Tacos',300),(57,'ko@gmail.com','2022/11/06 09:20:30',10,100,'MokeHinGar',1000),(58,'ko@gmail.com','2022/11/06 09:28:47',5,150,'IcecreamCake',750);
/*!40000 ALTER TABLE `food_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_cart`
--

DROP TABLE IF EXISTS `shopping_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping_cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `foodName` varchar(45) DEFAULT NULL,
  `catagory` varchar(255) DEFAULT NULL,
  `taste` varchar(45) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `price` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_cart`
--

LOCK TABLES `shopping_cart` WRITE;
/*!40000 ALTER TABLE `shopping_cart` DISABLE KEYS */;
INSERT INTO `shopping_cart` VALUES (111,'ChickenFried','FastFood','good','zaw@gmail.com',100),(113,'MokeHinGar','MyanmarFood','good','zaw@gmail.com',100),(115,'ApplePie','Dessert','sweet','hein@gmail.com',100),(117,'ApplePie','Dessert','sweet','hein@gmail.com',100),(119,'Bread','FastFood','good','zaw@gmail.com',25),(131,'ChickenFried','FastFood','good','hein@gmail.com',100),(132,'Tacos','FastFood','good','hein@gmail.com',300),(133,'OnionRing','FastFood','sweet','zaw@gmail.com',25),(147,'ChickenFried','FastFood','good','ko@gmail.com',100);
/*!40000 ALTER TABLE `shopping_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `email` varchar(256) DEFAULT NULL,
  `password` varchar(256) DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'KyawKyaw','kyaw@gmail.com','1000:a1a7893f5284ffa8181ec533990a0863:56636f607b92908f425698a7e1ce10a23eaccc92845199c6a8c5a8be70afb273bc9a6b16892c71af3a6a95dd258a8fcb33e8684178e518ee45996dbcd31ed346','admin'),(2,'ZoeZoe','ko@gmail.com','1000:7b4df851568c50d7ddaefdd6bb92e3f4:88a931220cca2d5ed10919dde12b0d56a7d3f193acc64fb4efe2cf495a57a493e0f1fb146a83048752f2606456cd35bd7898b4a9c5193f0bd31f44308b060c86','user'),(3,'WinKo','win@gmail.com','1000:c7d870eef6a22c0411ec62b1ba704b30:e893b18194106a514c9520504ccb0a01d2e79d3b7e9e10108be46fea8db4172c2652f2017848a92b173e49f22b7635882f23f6929ace8131655384c68e185c42','admin'),(4,'Ko Zaw','zaw@gmail.com','1000:14048fe101103d052afe950cca393ed8:bb05db0104757c1d0f3ad088b3c59a18831ea8bab3963ca2ea86a64db16386f6caf62d4de90c954592031eee58297ae1360a01a039e47201f12d05d5977752ef','user'),(5,'KoHein','hein@gmail.com','1000:ee75a5af52f7a327029772cea9c9b091:893b855a6506aab11e6dcfd35c9c03795fbfb368ee367d54abfd2ee13d98a20f7002a637542abf8f076f681ce8c3bd30af5d3e62094605e187a1e07983d48fc0','user');
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

-- Dump completed on 2022-12-01 16:34:34
