-- MySQL dump 10.13  Distrib 8.0.21, for macos10.15 (x86_64)
--
-- Host: capstone.louissoft.kr    Database: capstone_27
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `deposit_withdraw`
--

DROP TABLE IF EXISTS `deposit_withdraw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deposit_withdraw` (
  `idx` bigint NOT NULL AUTO_INCREMENT,
  `type` int NOT NULL COMMENT '입출금 신청 여부\n0 = 입금신청\n1 = 출금신청',
  `price` int NOT NULL,
  `status` int NOT NULL COMMENT '0 = 입금 확인 중\n1 = 입금 완료\n2 = 출금 확인 중\n3 = 출금 완료',
  `user_idx` bigint NOT NULL,
  `req_date` datetime NOT NULL,
  `res_date` datetime DEFAULT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deposit_withdraw`
--

LOCK TABLES `deposit_withdraw` WRITE;
/*!40000 ALTER TABLE `deposit_withdraw` DISABLE KEYS */;
INSERT INTO `deposit_withdraw` VALUES (1,0,10000,1,1,'2021-03-23 11:48:59','2021-03-23 11:49:36'),(2,0,1000,1,2,'2021-03-23 16:51:12','2021-03-24 16:06:48'),(3,0,1000,1,2,'2021-03-24 12:09:56','2021-03-24 16:07:34'),(4,0,20000,1,2,'2021-03-24 12:10:04','2021-03-24 16:08:01'),(5,0,100,1,2,'2021-03-24 12:10:08','2021-03-24 16:08:58'),(6,0,10000,1,2,'2021-03-24 16:09:42','2021-03-24 16:09:57'),(7,0,100,1,2,'2021-03-24 16:09:47','2021-03-24 16:09:59'),(8,0,100,1,2,'2021-03-24 16:09:47','2021-03-24 16:10:01'),(9,0,6000,1,2,'2021-03-24 16:13:54','2021-03-24 16:13:59'),(10,1,6000,3,2,'2021-03-24 16:15:06','2021-03-24 16:18:08'),(11,1,5000,3,2,'2021-03-24 16:18:03','2021-03-24 16:18:09'),(12,1,9999,3,2,'2021-03-24 16:18:14','2021-03-24 16:18:19'),(13,1,6000,3,2,'2021-03-24 16:19:08','2021-03-24 16:21:37'),(14,1,6666,3,2,'2021-03-24 16:20:37','2021-03-24 16:21:38'),(15,0,-9999,1,2,'2021-03-24 16:21:32','2021-03-24 16:21:40'),(16,0,-9999,1,2,'2021-03-24 16:21:59','2021-03-24 16:24:57'),(17,0,2000,1,2,'2021-03-24 16:24:47','2021-03-24 16:24:58'),(18,1,5000,2,2,'2021-03-24 16:58:27',NULL),(19,0,5000,0,2,'2021-03-30 09:55:17',NULL),(20,0,5000,0,2,'2021-03-30 09:55:21',NULL),(21,0,5000,0,2,'2021-03-30 09:55:22',NULL),(22,0,5000,0,2,'2021-03-30 09:55:22',NULL),(23,1,5000,2,2,'2021-03-30 09:55:25',NULL),(24,0,1111,0,2,'2021-03-30 09:56:09',NULL),(25,0,1111,0,2,'2021-03-30 09:56:17',NULL),(26,0,1111,0,2,'2021-03-30 09:56:41',NULL),(27,0,1111,0,2,'2021-03-30 09:57:17',NULL),(28,0,1111,0,2,'2021-03-30 09:57:33',NULL),(29,1,5000,2,2,'2021-03-30 09:59:37',NULL),(30,0,1111,0,2,'2021-03-30 10:00:00',NULL),(31,1,5000,2,2,'2021-03-30 10:00:09',NULL),(32,1,5000,2,2,'2021-03-30 10:00:51',NULL),(33,1,5000,2,2,'2021-03-30 10:02:08',NULL);
/*!40000 ALTER TABLE `deposit_withdraw` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_board`
--

DROP TABLE IF EXISTS `employee_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_board` (
  `idx` bigint NOT NULL AUTO_INCREMENT,
  `worker_idx` bigint NOT NULL,
  `file_idx` bigint NOT NULL,
  `work_board_idx` bigint NOT NULL,
  `similarity` double DEFAULT NULL,
  `date` datetime NOT NULL,
  `status` int NOT NULL COMMENT '0 = 미확인\n1 = 성공',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_board`
--

LOCK TABLES `employee_board` WRITE;
/*!40000 ALTER TABLE `employee_board` DISABLE KEYS */;
INSERT INTO `employee_board` VALUES (3,1,58,3,0.1711947053670883,'2021-05-20 12:22:24',1),(4,1,59,1,0.34506364464759826,'2021-05-20 16:42:36',1),(5,1,60,2,0.34509745240211487,'2021-05-20 16:46:16',0),(6,1,61,3,0.1711947053670883,'2021-05-21 04:51:32',1);
/*!40000 ALTER TABLE `employee_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file` (
  `idx` bigint NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL,
  `url` varchar(100) NOT NULL,
  `label_width` int DEFAULT NULL,
  `label_height` int DEFAULT NULL,
  `label_x` int DEFAULT NULL,
  `label_y` int DEFAULT NULL,
  `show_all` tinyint NOT NULL COMMENT '이 파일을 누구에게 다 보여줄 수 있는지',
  `show_idx` varchar(45) NOT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
INSERT INTO `file` VALUES (1,'img','a8e5671a-4687-4989-b56e-bc13a2a89c44.png',90,138,11,17,1,'1;'),(2,'img','dae78278-ab71-46a4-be33-d7f4161a1c2b.png',115,104,14,13,1,'1;'),(3,'img','04c1fc83-b079-4beb-9a83-fb64398f11bb.png',136,154,17,19,1,'1;'),(4,'img','3a6c1f65-ffe5-42c1-b75b-9ebf548ffe9d.png',211,179,26,22,1,'1;'),(5,'img','8e219cb1-9cef-4ca7-a542-399666403452.png',245,234,31,29,1,'1;'),(6,'img','19aece3f-874b-4b71-adbf-ba7b8a710663.png',830,479,254,278,1,'1;'),(7,'img','c33eb40a-fb29-447c-8e18-c250fe99c2c1.png',90,138,11,17,1,'1;'),(8,'img','cf4d40b2-2dd4-4a12-8c0c-b46e1548f499.png',115,104,14,13,1,'1;'),(9,'img','8062bfab-6186-4de1-b393-39cc8166db2e.png',136,154,17,19,1,'1;'),(10,'img','ba659861-1448-4ec2-b500-97ce2d001c48.png',245,234,31,29,1,'1;'),(11,'img','0a800fb6-054c-4988-a5d9-47aa5ba23bd4.png',577,196,431,31,1,'1;'),(12,'img','13b79eec-01b4-4bec-8605-c6f5c6d425ee.png',302,100,571,255,1,'1;'),(13,'img','1e86bd93-adc2-4a54-b5b9-e0deefaeed7a.png',283,107,144,32,1,'1;'),(14,'img','c4ee8d8d-a173-4489-8ff1-dc1a4ce78349.png',232,74,78,43,1,'1;'),(15,'img','711c69bd-2604-4739-ad64-90c218bf43f0.png',445,157,162,54,1,'1;'),(16,'img','039e2cde-c5a5-4422-816b-4fa45685e8b4.png',1002,552,125,69,1,'1;'),(17,'img','17e165c8-394b-43dc-9d3c-ff082d1bdc8e.png',736,562,92,70,1,'1;'),(18,'img','665d61f0-3cb7-46d6-97e2-0441e85d2191.png',870,400,109,50,1,'1;'),(19,'img','4069046b-db56-4182-9742-c135496e5a2e.png',296,288,37,36,1,'1;'),(20,'img','3da907d4-1cfe-4282-a81e-aa0951b64166.png',515,440,64,55,1,'1;'),(21,'img','2abdc073-5fd0-45e3-a764-9523ec1b6066.png',1002,552,125,69,1,'1;'),(22,'img','9c33ff7a-7ddc-4cf1-80dc-dbada2785e89.png',736,562,92,70,1,'1;'),(23,'img','f858f7e4-c81e-4c65-b745-75bb60cfaddc.png',870,400,109,50,1,'1;'),(24,'img','cda84ea0-55fc-49b4-a3cc-98ad229d3cb7.png',296,288,37,36,1,'1;'),(25,'img','7f851160-1d31-4624-902a-bea675a59f64.png',515,440,64,55,1,'1;'),(26,'img','4398c097-ad64-48c0-b56e-15a166cf13f5.png',485,408,61,51,1,'1;'),(27,'img','f65c96f0-cff8-41c6-8b05-3b0b048851f4.png',485,408,61,51,1,'1;'),(28,'img','586fd5f9-cdca-4780-afc9-a04e973f995f.png',485,408,61,51,1,'1;'),(29,'img','9531c120-e54f-4902-b120-c84966cd3acf.png',485,408,61,51,1,'1;'),(30,'img','b1b5ea6a-8484-4ffc-818d-164fd14400c4.png',485,408,61,51,1,'1;'),(31,'img','374fd9da-638c-4976-95e8-eaafc21ff7c1.png',505,357,58,112,1,'1;'),(32,'img','8a36f3fc-987c-48b9-9972-0224f45cc663.png',1000,1001,100,21,1,'1;'),(33,'img','de7cf15c-331c-4cef-b1b1-7116a4fa2307.png',693,650,208,344,1,'1;'),(34,'img','442d4ae8-26f1-4063-a422-4cbb89d5df8a.png',507,445,182,28,1,'1;'),(35,'img','2a06d221-fa87-44a9-94b2-ab05fefcf7ab.png',473,448,9,69,1,'1;'),(36,'img','3870fb7a-fd77-4584-908c-6b07fe8ec299.jpg',3,4,1,2,0,'1;'),(37,'img','1c3f0ab0-43a9-4e9d-8826-749f7f454cf4.jpg',140,186,17,23,0,'1;'),(38,'img','19c82e82-08f3-42a3-8d3f-d9ec9879287b.jpg',140,186,17,23,0,'1;'),(39,'img','83ab5a18-0cdd-4345-9e2e-6d6a497c1634.jpg',140,186,17,23,0,'1;'),(40,'img','d9faff18-644c-4b45-bf2e-1d73f340851f.jpg',48,42,56,155,0,'1;'),(41,'img','4bbc31b7-6d8e-48c2-b95b-205cd6dfbeaf.jpg',140,186,17,23,0,'1;'),(42,'img','66d3d3b6-b990-4c4b-8230-169c710e6946.jpg',140,186,17,23,0,'1;'),(43,'img','c00779d2-8674-48e7-8e57-81c51ed4967f.jpg',140,186,17,23,0,'1;'),(44,'img','c6f830fe-4e22-4858-bdc3-1755372c8c6f.jpg',140,186,17,23,0,'1;'),(45,'img','1dcacd27-40d7-4bee-88ae-5792b5d57fc0.jpg',140,186,17,23,0,'1;'),(46,'img','3bb98ca6-ba2b-44c3-92ca-c69913e08bea.jpg',140,186,17,23,0,'1;'),(47,'img','9cbc7403-a944-4f39-8013-110a06de8968.jpg',140,186,17,23,0,'1;'),(48,'img','14939a63-437d-4456-8dcf-133a7fc3fb69.jpg',140,186,17,23,0,'1;'),(49,'img','88a8f234-e77f-4830-a5ed-a146a33bd55f.jpg',140,186,17,23,0,'1;'),(50,'img','b26d8ad9-8559-43f9-a364-c296a9df8717.jpg',140,186,17,23,0,'1;'),(51,'img','4fb30f96-8012-43d2-9c93-2c55e5af0d43.jpg',140,186,17,23,0,'1;'),(52,'img','b3438758-8550-404a-ae34-432b0aea44f6.jpg',140,186,17,23,0,'1;'),(53,'img','5e49c321-7a87-4a12-8b3c-81b3ba91562b.jpg',140,186,17,23,0,'1;'),(54,'img','358689eb-b308-48c7-9724-4d8134c041ba.jpg',140,186,17,23,0,'1;'),(55,'img','0cbc41f8-15e4-4add-8298-119c0004d49d.jpg',140,186,17,23,0,'1;'),(56,'img','67b196f2-0cd7-450d-8209-58200ad65e30.jpg',140,186,17,23,0,'1;'),(57,'img','f4a07f10-6553-40db-b125-542cb4778c8a.jpg',140,186,17,23,0,'1;'),(58,'img','8f22982a-a68f-42c1-ae90-5c9f1488222a.jpg',140,186,17,23,0,'1;'),(59,'img','d164adc7-9d65-44b2-a52a-1bee4a7a608c.jpg',140,186,17,23,0,'1;'),(60,'img','6fbb0571-8cf0-45be-b4c2-eebc03c185ef.jpg',140,186,17,23,0,'1;'),(61,'img','628e884c-c4fc-4b66-851c-e8962bfe0573.jpg',65,56,61,146,0,'1;');
/*!40000 ALTER TABLE `file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_board`
--

DROP TABLE IF EXISTS `qa_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qa_board` (
  `idx` bigint NOT NULL AUTO_INCREMENT,
  `work_board_idx` bigint NOT NULL,
  `question` text NOT NULL,
  `questioner` bigint NOT NULL,
  `answer` text,
  `question_date` datetime NOT NULL,
  `answer_date` datetime DEFAULT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_board`
--

LOCK TABLES `qa_board` WRITE;
/*!40000 ALTER TABLE `qa_board` DISABLE KEYS */;
INSERT INTO `qa_board` VALUES (1,1,'한국 신호등만 가능한가요?',1,'네 한국 신호등만 가능합니다!','2021-04-05 05:47:53','2021-04-05 05:48:02'),(2,3,'머그컵사진만 되나요?',1,'네 머그컵만 가능합니다.','2021-05-21 03:45:51','2021-05-21 03:46:11');
/*!40000 ALTER TABLE `qa_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int unsigned NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('-CuJZdnyUTCHCrfwZIuXX2iPVsquIDXD',1621659092,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('-JDWbE7aPfO6YuZaRMfmD5IMyoeeL-Tp',1621620989,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('0uqky4Uvia6v9PaCjC8NrHU7i5t2JHSd',1621658927,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('2SVhfZEKcXUh1b5iqsiq2ov-m0nbOlqR',1621635288,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('3OCsphN4xmmGv0jjSh6r9m-VvCZDwJ4R',1621621202,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('3gaKpYuhE_g7cXaw8MnRiNCRuToiJEWv',1621635285,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('4vsKolzWqj1J4mT19ppLismT7hBDsTk4',1621621973,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('6YGUw8nDQddGHPrGHm9dqsa-0ywTHq47',1621655208,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"nickname\":\"admin\",\"idx\":1}'),('7CXdXIOD5ytSAWQh9qnckpWt2tXjAKWL',1621621899,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('Aclkd7FMqNhSVfpyXeay3X28OQxUVxEz',1621635286,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('Cf5BE0xZLfcoGKT677V54p8wJons-Rg5',1621620665,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('DdIh0AUqM0YhUsDBmIkOFix8rcqlN1rO',1621620834,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('En2kJAayFV0kfRzIee2tf9eGpxVYp0JW',1621621444,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('GBn8SKHnRWKuvUgUqX8J-XbP1BTeOmJM',1621659092,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('GwtO-ErSoGtlrizVcMIH8xfDKCX9SPg6',1621620986,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('Gxue10RSceSNH36XnD8cQ3jeruMNIC7h',1621659181,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"nickname\":\"admin\",\"idx\":1}'),('Jmo7z5U99CzsFzceUag9w9-15IkXr33L',1621635289,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('L4HX8sNKYV5DjBPB8DwbpIUM_4gUsXlt',1621659092,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('LEfEUbDsjxdmLhEtp4v_sglSmNN49nKJ',1621658952,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('LcDv8ZduzBa-wQYLaKOSTG6Mne2wJD2V',1621621441,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('Lk325wFn_Qu9KQHG1S5wTYfegLNzO7RC',1621621203,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('MH-JZB_UwLjrDP7kpDp87cWICnWVXFrM',1621655181,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"nickname\":\"admin\"}'),('ML4hYLwMbMMK9Eu1dlUdx99hORpiVnab',1621659085,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"nickname\":\"admin\",\"idx\":1}'),('MjUqwunMj_s71X2uhgZ4PCwozRJpKylP',1621621202,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('MlqciTAglknAA26862UDsSU1EWJh24-s',1621635287,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('P7zUG4BbtLdCqR3tUdjl8bVmVPpe8aei',1621635288,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('QRS8rsEm8mCxDX20JQMKUv2Fd1h7W9l-',1621621973,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"nickname\":\"admin\",\"idx\":1}'),('QYozTRJl-phst8krgle4jxCewI8KekWH',1621622000,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('QneJ2JT22NW2DvXG8B930DTHAyJmTOse',1621664087,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('UZmLYrJ7vmLNRRVfUx41o7kmrpTscdQY',1621621694,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('V-OFL7kMgzS5hzbXZVa7w3UKf4Jo6KTX',1621621281,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"nickname\":\"admin\",\"idx\":1}'),('YwdFxmNtdORUgzAE7WJ-e4V7YBd9UGgG',1621621898,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"nickname\":\"admin\",\"idx\":1}'),('_iizFNrP4917g9AhtUaAnEvQctV5JZLA',1621620831,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('bmtqEdpTvkYu_Sa7kKN0qX0anYyWgAhc',1621655132,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('daGc7sz09Kg6P-0LhQ_FzO04NuHxMeTO',1621635286,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('edquuql0ioiy7uaHOoo6CtdcEfsV-a5i',1621620831,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"nickname\":\"admin\",\"idx\":1}'),('hZfbs5PB0UfMvvV0D7MfYz5SpY94JKjj',1621635285,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('iEwRIPcoqdl10uD3n46uD08FUTWj2U8y',1621620985,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"nickname\":\"admin\",\"idx\":1}'),('j6GKiZqgt2O4vqLVBuv-4WaqHEcmiu4l',1621621284,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('kXmy3nIfRlK8Nj7ugtivkeV5Auqih2Ks',1621621441,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"nickname\":\"admin\",\"idx\":1}'),('l7WbiHPuvBztooGPyef5vJfW_1BjhE-_',1621621203,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('l_HooLt0ird7rt82GrSVnLtdlNAENfVs',1621621754,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('oHIU-eDexyc-yPYC6h8sX1XRP30cBpk2',1621659093,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('pGPbP-P781aqgIx5YU40yfpM2Cj8NYZv',1621621204,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('q-rISXfvyKleA3IjWk1W9W5gSxhLKvQG',1621621281,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('qhuXLYEtFMqwVL8qY2KtzoAmHARsgVkb',1621659092,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('tkGP1tLzxcn5DrVRMPHLfE9_TJid82FC',1621635287,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('up6rKwG6hZj4nWEjdx33eX2gobAyY73-',1621622582,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"nickname\":\"admin\",\"idx\":1}'),('vwIkweP8XBoOEIRPQotkzWIpLV1IIjq7',1621620667,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('wfXRgBNooGQn763iFKnbCx2IoAkgBdy0',1621654953,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('wki8fSQ4pDJd4ydbvkmg26v-2VBZgG6a',1621621694,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"nickname\":\"admin\",\"idx\":1}'),('xgCRFTLnRWHlOUJyr3PlvK307ALmt_vK',1621659092,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('zNQ43kqBa4OlubyvCoLSZ0JOjJ5_UPKl',1621620664,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"nickname\":\"admin\",\"idx\":1}');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `idx` bigint NOT NULL AUTO_INCREMENT,
  `id` varchar(20) NOT NULL,
  `password` char(128) NOT NULL,
  `name` varchar(20) NOT NULL,
  `nickname` varchar(20) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(30) NOT NULL,
  `bank` varchar(30) NOT NULL,
  `bank_num` varchar(30) NOT NULL,
  `krw` int NOT NULL,
  `warning` int NOT NULL,
  `permission` int NOT NULL,
  `join_date` date NOT NULL,
  `password_change_date` date NOT NULL,
  `last_login` datetime DEFAULT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','15a246948f2fc412f5423754c4fb12164d3e2383dabd42c4b31205d4ae7ac295586a30a7931a07b969a0a68fc42faeb2f9bb548a909b84f592fd64c54c1fa9d6','admin','admin','admin','admin@admin.com','admin','admin',20040,0,0,'2021-03-15','2021-03-15','2021-05-21 04:48:37'),(2,'지현','15a246948f2fc412f5423754c4fb12164d3e2383dabd42c4b31205d4ae7ac295586a30a7931a07b969a0a68fc42faeb2f9bb548a909b84f592fd64c54c1fa9d6','지현','지현','지현','jung@naver.com','지현','11',60000,0,0,'2021-03-23','2021-03-23','2021-04-02 09:10:30'),(3,'wlgus','15a246948f2fc412f5423754c4fb12164d3e2383dabd42c4b31205d4ae7ac295586a30a7931a07b969a0a68fc42faeb2f9bb548a909b84f592fd64c54c1fa9d6','wlgus','wlgus','wlgus','wlgus@naver.com','wlgus','wlgus',0,0,0,'2021-03-24','2021-03-24','2021-05-05 10:21:07'),(4,'admin2','15a246948f2fc412f5423754c4fb12164d3e2383dabd42c4b31205d4ae7ac295586a30a7931a07b969a0a68fc42faeb2f9bb548a909b84f592fd64c54c1fa9d6','admin2','admin2','admin2','admin2@admin.com','admin2','admin2',0,0,0,'2021-03-29','2021-03-29','2021-03-29 14:27:46');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_board`
--

DROP TABLE IF EXISTS `work_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_board` (
  `idx` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `content` text NOT NULL,
  `writer_idx` bigint NOT NULL,
  `price` int NOT NULL,
  `quantity` int NOT NULL,
  `example_file_idx` varchar(50) NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(30) NOT NULL,
  `total_price` int NOT NULL,
  `status` int NOT NULL COMMENT '0 = 진행중 / 1 = 마감 / 2 = 완료',
  PRIMARY KEY (`idx`),
  FULLTEXT KEY `title` (`title`,`content`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_board`
--

LOCK TABLES `work_board` WRITE;
/*!40000 ALTER TABLE `work_board` DISABLE KEYS */;
INSERT INTO `work_board` VALUES (1,'신호등 빨간불 사진 찾아요','3구 4구 상관없이 빨간불만 켜진 신호등 찾습니다.',1,10,100,'21;22;23;24;25;','2021-04-05 05:47:21','img',1000,0),(2,'비상구 사진 요청합니다.','비상구 사진을 올려주세요.',1,100,100,'26;27;28;29;30;','2021-05-11 11:19:50','img',10000,0),(3,'Cup image','Cup image plz',1,10,100,'31;32;33;34;35;','2021-05-19 09:55:26','img',1000,0);
/*!40000 ALTER TABLE `work_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'capstone_27'
--
/*!50003 DROP PROCEDURE IF EXISTS `admitWork` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`capstone_27`@`%` PROCEDURE `admitWork`(IN param_employee_idx BIGINT)
BEGIN
DECLARE worked_price INT default 0;
DECLARE worker INT default 0;

UPDATE `capstone_27`.`employee_board` SET `status` = '1' WHERE (`idx` = param_employee_idx);
SELECT worker_idx, price INTO worker, worked_price
FROM `employee_board`
JOIN `work_board` on `employee_board`.work_board_idx = `work_board`.idx
WHERE `employee_board`.idx = param_employee_idx;

UPDATE `capstone_27`.`users` SET `krw` = `krw` + worked_price WHERE (`idx` = worker);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cashReqList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `cashReqList`()
BEGIN
# 입금/출금 대기 신청 LIST를 불러오는 함수
# made by jihyeon jung
SELECT `deposit_withdraw`.`idx`,`type`, `price`, `req_date`, `users`.`name`, `status`
FROM `deposit_withdraw` LEFT JOIN `users` ON `deposit_withdraw`.`user_idx`= `users`.`idx`
WHERE `status`=0 OR `status`=2;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `fileUpload` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `fileUpload`(IN param_type VARCHAR(30), IN param_url VARCHAR(100), IN param_label_width INT, IN param_label_height INT, IN param_label_x INT, IN param_label_y INT, IN param_show_all tinyint, IN param_show_idx VARCHAR(45))
BEGIN
# made by jiho park
INSERT INTO `file` (`type`,`url`, `label_width`, `label_height`, `label_x`, `label_y`, `show_all`, `show_idx`) VALUES
   (param_type, param_url, param_label_width, param_label_height, param_label_x, param_label_y, param_show_all, param_show_idx);
SELECT LAST_INSERT_ID() as 'file_idx';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAvailable_krw` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `getAvailable_krw`(IN  param_idx bigint, OUT available_krw int)
BEGIN
DECLARE total_krw INT default 0;
DECLARE withdraw_krw INT default 0;
DECLARE worked_krw INT default 0;

CALL getUsedKrwWork(param_idx, worked_krw);
CALL getUsedKrwWithdraw(param_idx, withdraw_krw);
SET total_krw = (SELECT `krw` FROM `users` WHERE `param_idx`=`idx`);
SET available_krw = IFNULL(total_krw, 0) - IFNULL(worked_krw, 0) - IFNULL(withdraw_krw, 0);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getBoardInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `getBoardInfo`(IN param_board_idx BIGINT)
BEGIN
# 보드 정보 가져오는 함수
# made by jihyeon jung
SELECT * FROM `work_board` WHERE idx = param_board_idx;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getBoardList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `getBoardList`()
BEGIN
# 보드 전체 불러오는 함수
# made by jiho park
SELECT * FROM `work_board` ORDER BY idx DESC LIMIT 20;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getFileInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `getFileInfo`(IN param_file_idx BIGINT)
BEGIN
# 파일 정보 가져오는 함수
# made by jiho park
SELECT * FROM `file` WHERE idx = param_file_idx;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getKrwInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `getKrwInfo`(IN  param_idx bigint)
BEGIN
DECLARE total_krw INT default 0;
DECLARE withdraw_krw INT default 0;
DECLARE worked_krw INT default 0;
DECLARE available_krw INT default 0;

CALL getUsedKrwWork(param_idx, worked_krw);
CALL getUsedKrwWithdraw(param_idx, withdraw_krw);
SET total_krw = (SELECT `krw` FROM `users` WHERE `param_idx`=`idx`);
SET available_krw = IFNULL(total_krw, 0) - IFNULL(worked_krw, 0) - IFNULL(withdraw_krw, 0);

SELECT total_krw as 'TotalKRW', IFNULL(withdraw_krw, 0) as 'Withdraw_KRW', IFNULL(worked_krw, 0) as 'Worked_KRW', available_krw as 'Available_KRW';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getQABoard` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `getQABoard`(IN param_work_board_idx BIGINT)
BEGIN
# 게시글에 대한 질문 답변을 가져오는 함수
# made by jiho park
SELECT `qa_board`.`idx`, `work_board_idx`, `question`, `questioner`,  `nickname` as 'questioner_nickname' , `answer`, `question_date`, `answer_date` FROM `qa_board` LEFT JOIN `users` on `users`.`idx` = `qa_board`.`questioner` WHERE `work_board_idx`= param_work_board_idx ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUsedKrwWithdraw` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `getUsedKrwWithdraw`(IN  param_user_idx bigint, OUT UsedKrwWithdraw int)
BEGIN
# deposit_withdraw에서 사용중인 금액의 합을 리턴해주는 함수
# 출금대기
# made by jiho park

# deposit_withdraw에서 type이 1이고(출금) status=2인(출금 확인중) 가격들의 합을 구한다.
SET UsedKrwWithdraw = (SELECT SUM(price) as 'UsedKrwWithdraw' FROM `deposit_withdraw` WHERE `user_idx` = param_user_idx AND `type`=1 AND `status`=2);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUsedKrwWork` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `getUsedKrwWork`(IN  param_user_idx bigint, OUT UsedKrwWork int)
BEGIN
# work_board에서 사용중인 금액의 합을 리턴해주는 함수
# made by jiho park

# work_board에서 status가 2(완료)가 아닌 것의 total_price 가격의 합을 구한다. (param_user_idx == writer_id)
SET UsedKrwWork = (SELECT SUM(total_price) as 'UsedKrwWork' FROM `work_board` WHERE `writer_idx`=param_user_idx AND `status` != 2);
SELECT UsedKrwWork 'UsedKrwWork';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getWorkInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `getWorkInfo`(IN writer BIGINT)
BEGIN
# 보드 정보 가져오는 함수
# made by jihyeon jung
SELECT `employee_board`.idx, title, similarity, work_board_idx, file_idx, price   FROM `employee_board` LEFT JOIN `work_board` on `employee_board`.work_board_idx = `work_board`.idx WHERE work_board_idx IN (SELECT idx FROM work_board WHERE writer_idx=writer) AND `employee_board`.status = 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `isDuplicateEmail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`capstone_27`@`%` PROCEDURE `isDuplicateEmail`(IN param_email varchar(30))
BEGIN
# 이메일 중복 확인을 해주는 함수
# made by jihyeon jung
DECLARE duplicate INT default 0;
Set duplicate = (SELECT COUNT(*) FROM `users` WHERE `email` = param_email);
If duplicate = 0 THEN
	SELECT 'success' as 'result';
ELSE
	SELECT 'duplicate' as 'result';
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `isDuplicateID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`capstone_27`@`%` PROCEDURE `isDuplicateID`(IN param_id varchar(20))
BEGIN
# 아이디 중복 확인을 해주는 함수
# made by jiho park
DECLARE duplicate INT default 0;
Set duplicate = (SELECT COUNT(*) FROM `users` WHERE `id` = param_id);
If duplicate = 0 THEN
	SELECT 'success' as 'result';
ELSE
	SELECT 'duplicate' as 'result';
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `isDuplicateNickname` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`capstone_27`@`%` PROCEDURE `isDuplicateNickname`(IN param_nick varchar(20))
BEGIN
# 닉네임 중복 확인을 해 주는 함수
# made by jiho park
DECLARE duplicate INT default 0;
Set duplicate = (SELECT COUNT(*) FROM `users` WHERE `nickname` = param_nick);
If duplicate = 0 THEN
	SELECT 'success' as 'result';
ELSE
	SELECT 'duplicate' as 'result';
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `join` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `join`(IN param_id varchar(20), IN param_password char(128), IN param_name varchar(20), IN param_nickname varchar(20), IN param_phone varchar(15),
IN param_email varchar(30), IN param_bank varchar(30), IN param_bank_num varchar(30))
BEGIN
# 회원가입을 해 주는 함수
# made by jiho park
# 아이디 중복 체크 or 닉네임 중복 체크 or 이메일 중복 체크
DECLARE duplicate INT default 0;
SET duplicate = (SELECT COUNT(*) FROM `users` WHERE `id`=param_id OR `nickname`=param_nickname OR `email`=param_email);
IF duplicate = 0 THEN
	INSERT INTO `users`(`id`, `password`, `name`, `nickname`, `phone`, `email`, `bank`, `bank_num`, `krw`, `warning`, `permission`, `join_date`, `password_change_date`) VALUES (param_id, SHA2(CONCAT(param_password, 'capstone_27'), 512), param_name, param_nickname, param_phone, param_email, param_bank, param_bank_num, 0, 0, 0, NOW(), NOW());
	SELECT 'success' as 'result';
ELSE
	SELECT 'duplicate' as 'result';
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `login`(IN param_id varchar(20), IN param_pw char(128))
BEGIN
# 로그인을 해 주는 함수
# made by jiho park
set sql_safe_updates=0;
SELECT * FROM `users` WHERE `id`=param_id AND `password`=SHA2(CONCAT(param_pw, 'capstone_27'), 512);
UPDATE `users` SET `last_login` = NOW() WHERE `id` = param_id AND `password` = SHA2(CONCAT(param_pw, 'capstone_27'), 512);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reqDeposit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `reqDeposit`(IN param_uidx bigint, IN param_price int)
BEGIN
# 입금 요청을 해 주는 함수
# made by jiho park
IF param_price < 1000 THEN
	SELECT 'You must deposit at least 1000 won' as 'result';
ELSE
	INSERT INTO `deposit_withdraw` (`type`, `price`, `status`, `user_idx`, `req_date`) VALUES ('0', param_price, '0', param_uidx, NOW());
	SELECT 'success' as 'result';
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reqWithdraw` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`capstone_27`@`%` PROCEDURE `reqWithdraw`(IN param_user_idx bigint, IN param_price int)
BEGIN
# 출금신청을 해 주는 함수
# made by jiho park
# param_user_idx유저의 param_price만큼 출금 신청
# UsedKrwWork, UsedKrwWithdraw의 값과 users테이블의 krw 값을 가져오고 계산한다.
DECLARE UsedKrwWork INT default 0;
DECLARE UsedKrwWithdraw INT default 0;
DECLARE TotalKRW INT default 0;
DECLARE AvailableKRW INT default 0;

CALL getUsedKrwWork(param_user_idx, UsedKrwWork);
CALL getUsedKrwWithdraw(param_user_idx, UsedKrwWithdraw);
SET TotalKRW = (SELECT krw FROM `users` WHERE `idx` = param_user_idx);

SET AvailableKRW = IFNULL(TotalKRW, 0) - IFNULL(UsedKrwWork, 0) - IFNULL(UsedKrwWithdraw, 0);

# 최소 신청 금액(5000원)보다 작으면
IF param_price < 5000 THEN
	SELECT '출금 가능 최소금액은 5,000원 입니다.' as 'result';
ELSE
	# 이용가능한 금액보다 많이 신청했을 경우
	IF AvailableKRW < param_price THEN
		SELECT '사용 가능 금액을 확인해 주십시오.' as 'result';
	# 출금이 가능할 경우
    ELSE
		INSERT INTO `deposit_withdraw` (`type`, `price`, `status`, `user_idx`, `req_date`) VALUES ('1', param_price, '2', param_user_idx, NOW());
        SELECT 'success' as 'result';
    END IF;    
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `resDeposit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `resDeposit`(IN  param_idx bigint)
BEGIN
# 입금 승인을 해 주는 함수
# made by jiho park
DECLARE param_user_idx INT default 0;
DECLARE param_krw INT default 0;
DECLARE param_status INT default 0;
DECLARE param_type INT default 0;
SELECT `user_idx`, `price`, `status`, `type` INTO param_user_idx, param_krw, param_status, param_type FROM `deposit_withdraw` WHERE idx = param_idx;
IF param_type=1 THEN
	SELECT 'funtion call error' as 'result';
ELSE
	IF param_status=0 THEN
		UPDATE `deposit_withdraw` SET `status` = '1', `res_date` = NOW() WHERE (`idx` = param_idx);
		UPDATE `users` SET `krw` = `krw` + param_krw WHERE(`idx` = param_user_idx);
		SELECT 'success' as 'result';
	ELSE
		SELECT 'already deposited' as 'result';
	END IF;
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `resWithdraw` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `resWithdraw`(IN  param_idx bigint)
BEGIN
# 출금 승인을 해 주는 함수
# made by jiho park
DECLARE param_user_idx INT default 0;
DECLARE param_krw INT default 0;
DECLARE param_status INT default 0;
DECLARE param_type INT default 0;
SELECT `user_idx`, `price`, `status`, `type` INTO param_user_idx, param_krw, param_status, param_type FROM `deposit_withdraw` WHERE idx = param_idx;
# 입금인데 출금 승인을 할 경우
IF param_type=0 THEN
	SELECT 'funtion call error' as 'result';
ELSE
	# 출금 진행중일 경우
	IF param_status=2 THEN
		UPDATE `deposit_withdraw` SET `status` = '3', `res_date` = NOW() WHERE (`idx` = param_idx);
		UPDATE `users` SET `krw` = `krw` - param_krw WHERE(`idx` = param_user_idx);
		SELECT 'success' as 'result';
	# 이미 출금된 경우
	ELSE
		SELECT 'already withdraw' as 'result';
	END IF;
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `search` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `search`(IN keyword varchar(100))
BEGIN
# 보드 검색 하는 함수
# made by jiho park
SELECT * FROM `work_board` WHERE match(`title`, `content`) against(keyword);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `workUpload` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `workUpload`(IN param_type VARCHAR(30), IN param_url VARCHAR(100), IN param_label_width INT, IN param_label_height INT, IN param_label_x INT, IN param_label_y INT, IN param_board_idx BIGINT)
BEGIN
# made by jiho park
DECLARE param_writer_idx INT default 0;
SELECT writer_idx INTO param_writer_idx FROM work_board WHERE idx = param_board_idx;
INSERT INTO `file` (`type`,`url`, `label_width`, `label_height`, `label_x`, `label_y`, `show_all`, `show_idx`) VALUES
   (param_type, param_url, param_label_width, param_label_height, param_label_x, param_label_y, 0, CONCAT(param_writer_idx,';'));
SELECT LAST_INSERT_ID() as 'file_idx';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `writeAnswer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `writeAnswer`(IN param_question_idx bigint, IN param_answer text)
BEGIN
# 답글 작성을 해 주는 함수
# made by jiho park
UPDATE `capstone_27`.`qa_board` SET `answer` = param_answer, `answer_date` = NOW() WHERE (`idx` = param_question_idx);
SELECT 'success' as 'result';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `writeBoard` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `writeBoard`(IN param_title varchar(30), IN param_user_idx bigint, IN param_price int, IN param_content text, IN param_quantity int, IN param_type varchar(30), IN param_example_file_idx varchar(50))
BEGIN
# 게시물 업로드 하는 함수
# made_by_jihyeon
DECLARE avail_krw INT default 0;
DECLARE param_total_price INT default 0;
CALL getAvailable_krw(param_user_idx, avail_krw);
SET param_total_price = IFNULL(param_price, 0)*IFNULL(param_quantity, 0);
IF avail_krw < param_total_price THEN 
	SELECT 'error' as 'result';
ELSE
   INSERT INTO `work_board` (`title`,`content`, `writer_idx`, `price`, `quantity`, `example_file_idx`, `date`, `type`, `total_price`, `status`) VALUES
   (param_title, param_content, param_user_idx, param_price, param_quantity, param_example_file_idx, NOW(), param_type, param_total_price, 0);
   SELECT 'success' as 'result';
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `writeQuestion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `writeQuestion`(IN param_work_board_idx bigint, IN param_question text, IN param_questioner bigint)
BEGIN
# 질문 작성을 해 주는 함수
# made by jiho park
INSERT INTO `qa_board` (`work_board_idx`, `question`, `questioner`, `question_date`) VALUES (param_work_board_idx, param_question, param_questioner, NOW());
SELECT 'success' as 'result';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `writeSimilar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `writeSimilar`(IN _worker_idx BIGINT, IN _file_idx BIGINT, IN _work_board_idx BIGINT, IN _sim DOUBLE)
BEGIN
# 유사도 등록을 해 주는 함수
# made by jiho park
INSERT INTO `capstone_27`.`employee_board` (`worker_idx`, `file_idx`, `work_board_idx`, `similarity`, `date`, `status`) VALUES (_worker_idx, _file_idx, _work_board_idx, _sim, NOW(), '0');

SELECT 'success' as 'result';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-22  3:24:28
