CREATE DATABASE  IF NOT EXISTS `capstone_27` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `capstone_27`;
-- MySQL dump 10.13  Distrib 8.0.21, for macos10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: capstone_27
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deposit_withdraw`
--

LOCK TABLES `deposit_withdraw` WRITE;
/*!40000 ALTER TABLE `deposit_withdraw` DISABLE KEYS */;
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
  `status` int NOT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_board`
--

LOCK TABLES `employee_board` WRITE;
/*!40000 ALTER TABLE `employee_board` DISABLE KEYS */;
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
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_board`
--

LOCK TABLES `qa_board` WRITE;
/*!40000 ALTER TABLE `qa_board` DISABLE KEYS */;
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
INSERT INTO `sessions` VALUES ('6M91dLnKAH7D7_F_fRNJXV3ieaeSEhxr',1615901908,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','23de8962a9e42a0f8de3bc5dfec106774685fdc6b5b1bf5d5f3da33130932e576394aec2c029421f9eb8e522204ed34a828baec333adf6617b1dc475587b5af0','admin','admin','admin','admin@admin.com','admin','admin',10000,0,0,'2021-03-15','2021-03-15',NULL);
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
  `writer_id` bigint NOT NULL,
  `price` int NOT NULL,
  `quantity` int NOT NULL,
  `example_file_idx` varchar(50) NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(30) NOT NULL,
  `total_price` int NOT NULL,
  `status` int NOT NULL COMMENT '0 = 진행중 / 1 = 마감 / 2 = 완료',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_board`
--

LOCK TABLES `work_board` WRITE;
/*!40000 ALTER TABLE `work_board` DISABLE KEYS */;
/*!40000 ALTER TABLE `work_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'capstone_27'
--
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
SET UsedKrwWork = (SELECT SUM(total_price) as 'UsedKrwWork' FROM `work_board` WHERE `writer_id`=param_user_idx AND `status` != 2);
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
INSERT INTO `deposit_withdraw` (`type`, `price`, `status`, `user_idx`, `req_date`) VALUES ('0', param_price, '0', param_uidx, NOW());
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
	SELECT 'Withdraw price must be upper than 5,000' as 'result';
ELSE
	# 이용가능한 금액보다 많이 신청했을 경우
	IF AvailableKRW < param_price THEN
		SELECT 'Available KRW must be upper than withdraw price' as 'result';
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-15 23:46:21
