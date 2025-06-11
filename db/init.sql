CREATE DATABASE  IF NOT EXISTS `iltuo_upgrade` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `iltuo_upgrade`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 34.123.249.241    Database: iltuo_upgrade
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `address_id` bigint NOT NULL AUTO_INCREMENT COMMENT '일련번호',
  `user_idx` bigint NOT NULL,
  `postal_code` varchar(7) NOT NULL COMMENT '우편번호',
  `default_address` text NOT NULL COMMENT '기본주소',
  `detail_address` text COMMENT '상세주소',
  `extra_address` text COMMENT '추가주소',
  `is_main` tinyint NOT NULL COMMENT '메인주소여부',
  `is_valid` tinyint NOT NULL DEFAULT '1' COMMENT '유효성여부',
  PRIMARY KEY (`address_id`),
  KEY `user.address.FK_idx` (`user_idx`),
  CONSTRAINT `user.address.FK` FOREIGN KEY (`user_idx`) REFERENCES `user` (`user_idx`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='주소';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,1,'16509','경기 수원시 영통구 도청로89번길 30',', 501호 일투오커피',' (이의동)',1,1),(2,2,'18306','경기 화성시 봉담읍 수영로 161',', 306동 2303호',' (중흥에스클래스 에듀파크)',1,1),(3,3,'16872','경기 용인시 수지구 대지로 21','000동 000호','(죽전동)',1,1),(4,4,'16640','경기 수원시 권선구 서수원로 99','000동 000호','(오목천동, 수원권선 꿈에그린 아파트)',1,1),(5,2,'16509','경기 수원시 영통구 도청로89번길 30','501호 일투오커피','(이의동)',0,0),(6,2,'16640','경기 수원시 권선구 서수원로 99','000동 0000호','(오목천동, 수원권선 꿈에그린 아파트)',0,0),(7,2,'16872','경기 용인시 수지구 대지로 21','000동 000호','(죽전동)',0,0),(8,2,'16620','경기 수원시 권선구 세화로168번길 15','000동 000호','(서둔동, 센트라우스)',0,1),(9,5,'16620','경기 수원시 권선구 세화로168번길 15','105동 602호','(서둔동, 센트라우스)',1,1),(10,5,'18306','경기 화성시 봉담읍 수영로 161','306동 2303호','(중흥에스클래스 에듀파크)',0,0),(11,5,'16872','경기 용인시 수지구 대지로 21','000동 000호','(죽전동)',0,0),(12,2,'16640','경기 수원시 권선구 서수원로 99','104동 802호','(오목천동, 수원권선 꿈에그린 아파트)',0,0);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cart_id` bigint NOT NULL AUTO_INCREMENT COMMENT '일련번호',
  `product_id` bigint NOT NULL COMMENT '상품 일련번호',
  `user_idx` bigint NOT NULL COMMENT '아이디',
  `quantity` int NOT NULL COMMENT '수량',
  `cart_date` timestamp NOT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `product.cart.FK_idx` (`product_id`),
  KEY `user.cart.FK_idx` (`user_idx`),
  CONSTRAINT `product.cart.FK` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user.cart.FK` FOREIGN KEY (`user_idx`) REFERENCES `user` (`user_idx`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_option`
--

DROP TABLE IF EXISTS `cart_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_option` (
  `cart_option_id` bigint NOT NULL AUTO_INCREMENT COMMENT '일련번호',
  `cart_id` bigint NOT NULL COMMENT '장바구니 일련번호',
  `option_detail_id` bigint NOT NULL COMMENT '옵션 일련번호',
  PRIMARY KEY (`cart_option_id`),
  KEY `cart.FK_idx` (`cart_id`),
  KEY `option.cart.FK_idx` (`option_detail_id`),
  CONSTRAINT `cart.FK` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `option.cart.FK` FOREIGN KEY (`option_detail_id`) REFERENCES `option_detail` (`option_detail_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_option`
--

LOCK TABLES `cart_option` WRITE;
/*!40000 ALTER TABLE `cart_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `cart_option_view`
--

DROP TABLE IF EXISTS `cart_option_view`;
/*!50001 DROP VIEW IF EXISTS `cart_option_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cart_option_view` AS SELECT 
 1 AS `cart_option_id`,
 1 AS `cart_id`,
 1 AS `option_detail_id`,
 1 AS `user_idx`,
 1 AS `option_id`,
 1 AS `priority_index`,
 1 AS `option_name`,
 1 AS `option_type_code`,
 1 AS `option_detail_name`,
 1 AS `option_fluctuating_price`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `cart_view`
--

DROP TABLE IF EXISTS `cart_view`;
/*!50001 DROP VIEW IF EXISTS `cart_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cart_view` AS SELECT 
 1 AS `cart_id`,
 1 AS `product_id`,
 1 AS `product_name`,
 1 AS `product_code`,
 1 AS `user_idx`,
 1 AS `price`,
 1 AS `discounted_rate`,
 1 AS `quantity`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `code`
--

DROP TABLE IF EXISTS `code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `code` (
  `code_id` bigint NOT NULL AUTO_INCREMENT,
  `code_category` varchar(100) NOT NULL,
  `code_value` varchar(6) NOT NULL,
  `code_comment` varchar(100) NOT NULL,
  `is_valid` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`code_id`),
  UNIQUE KEY `code_value_UNIQUE` (`code_value`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `code`
--

LOCK TABLES `code` WRITE;
/*!40000 ALTER TABLE `code` DISABLE KEYS */;
INSERT INTO `code` VALUES (1,'option_type','OPT001','비율 증감',1),(2,'option_type','OPT002','등차 증감',1),(3,'user_permissions','AR001','일반회원',1),(4,'user_permissions','AR002','관리자',1),(5,'auth_method','AM001','일반회원',1),(6,'auth_method','AM002','외부회원',1),(7,'payment_method','PM001','신용카드',1),(8,'payment_method','PM002','무통장 입금',1),(9,'order_status','OS001','미주문',1),(10,'order_status','OS002','입금 대기',1),(11,'order_status','OS003','결제 완료',1),(12,'order_status','OS004','배송중',1),(13,'order_status','OS005','배송완료',1),(14,'order_status','OS006','취소',1),(15,'order_status','OS007','환불',1);
/*!40000 ALTER TABLE `code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery` (
  `payment_id` bigint NOT NULL,
  `postal_code` varchar(7) NOT NULL,
  `default_address` text NOT NULL,
  `detail_address` text,
  `extra_address` text,
  `courier_company` varchar(100) DEFAULT NULL,
  `invoice_number` varchar(100) DEFAULT NULL,
  `delivery_date` timestamp NULL DEFAULT NULL,
  `arrive_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  CONSTRAINT `delivery.FK` FOREIGN KEY (`payment_id`) REFERENCES `order_group` (`payment_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES (6,'18306','경기 화성시 봉담읍 수영로 161',', 306동 2303호',' (중흥에스클래스 에듀파크)',NULL,NULL,NULL,NULL),(12,'16620','경기 수원시 권선구 세화로168번길 15','000동 000호','(서둔동, 센트라우스)',NULL,NULL,NULL,NULL),(13,'16620','경기 수원시 권선구 세화로168번길 15','000동 000호','(서둔동, 센트라우스)',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `major_category`
--

DROP TABLE IF EXISTS `major_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `major_category` (
  `major_category_id` bigint NOT NULL AUTO_INCREMENT COMMENT '일련번호',
  `major_category_name` varchar(45) NOT NULL COMMENT '이름',
  `is_valid` tinyint NOT NULL DEFAULT '1' COMMENT '유효성',
  PRIMARY KEY (`major_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='주 카테고리';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `major_category`
--

LOCK TABLES `major_category` WRITE;
/*!40000 ALTER TABLE `major_category` DISABLE KEYS */;
INSERT INTO `major_category` VALUES (1,'원두커피',1),(2,'드립백',1),(3,'커피용품',1);
/*!40000 ALTER TABLE `major_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `miner_category`
--

DROP TABLE IF EXISTS `miner_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `miner_category` (
  `miner_category_id` bigint NOT NULL AUTO_INCREMENT COMMENT '일련번호',
  `major_category_id` bigint NOT NULL COMMENT '주 카테고리 일련번호',
  `miner_category_name` varchar(45) NOT NULL COMMENT '이름',
  `is_valid` tinyint NOT NULL DEFAULT '1' COMMENT '유효성',
  PRIMARY KEY (`miner_category_id`),
  KEY `major_category.miner_category.FK_idx` (`major_category_id`),
  CONSTRAINT `major_category.miner_category.FK` FOREIGN KEY (`major_category_id`) REFERENCES `major_category` (`major_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='부 카테고리';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `miner_category`
--

LOCK TABLES `miner_category` WRITE;
/*!40000 ALTER TABLE `miner_category` DISABLE KEYS */;
INSERT INTO `miner_category` VALUES (1,1,'싱글 오리진',1),(2,1,'블랜드',1),(3,2,'드립백세트',1),(4,2,'드립백단품',1),(5,3,'핸드드립용품',1),(6,3,'기타용품',1);
/*!40000 ALTER TABLE `miner_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `native_auth`
--

DROP TABLE IF EXISTS `native_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `native_auth` (
  `user_idx` bigint NOT NULL,
  `password` varchar(65) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`user_idx`),
  CONSTRAINT `user.native.FK` FOREIGN KEY (`user_idx`) REFERENCES `user` (`user_idx`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `native_auth`
--

LOCK TABLES `native_auth` WRITE;
/*!40000 ALTER TABLE `native_auth` DISABLE KEYS */;
INSERT INTO `native_auth` VALUES (1,'$2a$10$nvGUVFIfYqW0EBPQGTiEIODBqRzRoy0dMtuFHdKLDDwmXfmJ50AkC','관리자','010-0000-0000','iltuo@iltuo.com'),(2,'$2a$10$dvFmCgMUnbbcuZQga1GFEOT./I4PacdJQAkN7Jel3ED6MslG1IVRG','이상윤','010-6567-3544','cw282@naver.com'),(3,'$2a$10$.RmvItR9ejNBoNhxXu79AeULIFe6P5h4nmr6mVOO0KBPTfLnKWCwa','이민영','010-0000-0000','email@email.com'),(4,'$2a$10$KBuxdNkXpw.CaRRoH1el0OPQ6hfx.Mfv9eYSwVqeSCshJ61SxE3UK','이모씨','010-0000-0000','email@email.com');
/*!40000 ALTER TABLE `native_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `native_user_view`
--

DROP TABLE IF EXISTS `native_user_view`;
/*!50001 DROP VIEW IF EXISTS `native_user_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `native_user_view` AS SELECT 
 1 AS `user_idx`,
 1 AS `user_id`,
 1 AS `user_name`,
 1 AS `phone_number`,
 1 AS `email`,
 1 AS `register_date`,
 1 AS `user_permissions_code`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `option`
--

DROP TABLE IF EXISTS `option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `option` (
  `option_id` bigint NOT NULL AUTO_INCREMENT COMMENT '일련번호',
  `major_category_id` bigint NOT NULL COMMENT '주 카테고리 일련번호',
  `priority_index` bigint NOT NULL COMMENT '순번',
  `option_name` varchar(45) NOT NULL COMMENT '이름',
  `option_type_code` varchar(6) NOT NULL COMMENT '타입',
  `is_valid` tinyint NOT NULL DEFAULT '1' COMMENT '유효성',
  PRIMARY KEY (`option_id`),
  KEY `major_category.option.FK_idx` (`major_category_id`),
  CONSTRAINT `major_category.option.FK` FOREIGN KEY (`major_category_id`) REFERENCES `major_category` (`major_category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `option`
--

LOCK TABLES `option` WRITE;
/*!40000 ALTER TABLE `option` DISABLE KEYS */;
INSERT INTO `option` VALUES (1,1,1,'용량','OPT001',1),(2,1,2,'분쇄도','OPT001',1),(3,1,3,'배전도','OPT001',1),(4,1,4,'증정품','OPT002',1);
/*!40000 ALTER TABLE `option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `option_detail`
--

DROP TABLE IF EXISTS `option_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `option_detail` (
  `option_detail_id` bigint NOT NULL AUTO_INCREMENT COMMENT '일련번호',
  `option_id` bigint NOT NULL COMMENT '옵션그룹 일련번호',
  `option_detail_name` varchar(45) NOT NULL COMMENT '이름',
  `option_fluctuating_price` int NOT NULL COMMENT '변동가격',
  `is_valid` tinyint NOT NULL DEFAULT '1' COMMENT '유효성',
  PRIMARY KEY (`option_detail_id`),
  KEY `option.FK_idx` (`option_id`),
  CONSTRAINT `option.FK` FOREIGN KEY (`option_id`) REFERENCES `option` (`option_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `option_detail`
--

LOCK TABLES `option_detail` WRITE;
/*!40000 ALTER TABLE `option_detail` DISABLE KEYS */;
INSERT INTO `option_detail` VALUES (1,1,'200g',100,1),(2,1,'500g',250,1),(3,1,'1kg',500,1),(4,2,'홀빈(분쇄안함)',90,1),(5,2,'프랜치프레스(1.0mm)',100,1),(6,2,'핸드드립(0.7mm)',112,1),(7,2,'콜드브루(0.5mm)',125,1),(8,3,'하이(핸드드립 추천)',90,1),(9,3,'시티',100,1),(10,3,'풀시티(에스프레소 추천)',110,1),(11,4,'없음',-500,1),(12,4,'필터',0,1),(13,4,'드리퍼 + 필터',4000,1);
/*!40000 ALTER TABLE `option_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `option_view`
--

DROP TABLE IF EXISTS `option_view`;
/*!50001 DROP VIEW IF EXISTS `option_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `option_view` AS SELECT 
 1 AS `option_detail_id`,
 1 AS `option_id`,
 1 AS `priority_index`,
 1 AS `major_category_id`,
 1 AS `option_type_code`,
 1 AS `option_name`,
 1 AS `option_detail_name`,
 1 AS `option_fluctuating_price`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `order_id` bigint NOT NULL AUTO_INCREMENT COMMENT '일련번호',
  `payment_id` bigint NOT NULL COMMENT '결제 일련번호',
  `product_name` varchar(100) NOT NULL,
  `product_code` varchar(65) NOT NULL,
  `quantity` int NOT NULL COMMENT '수량',
  PRIMARY KEY (`order_id`),
  KEY `order.FK_idx` (`payment_id`),
  CONSTRAINT `order.FK` FOREIGN KEY (`payment_id`) REFERENCES `order_group` (`payment_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (21,6,'에티오피아 예가체프 G2 띠에라','product-1-1-2',3),(22,7,'[하리오] 드리퍼 VD 02T','product-3-5-90',1),(23,8,'드립백커피 PNG 블루마운틴 아고가','product-2-4-38',1),(24,9,'천연펄프 드립필터 1X2(5~6인용) 100P','product-3-5-79',1),(25,10,'드립백커피 에티오피아 아바야 게이샤 G1','product-2-4-39',1),(26,11,'[하리오] 드리퍼 VD 02T','product-3-5-90',1),(27,11,'스타블랜드','product-1-2-3',3),(28,12,'드립백커피 선물세트 2호(6종X5개입)','product-2-3-41',1),(29,13,'에티오피아 시다모 G2 Aida','product-1-1-18',1),(30,13,'드립백커피 에티오피아 아바야 게이샤 G1','product-2-4-39',2),(31,13,'도자기 드리퍼 102LD 화이트(3~4인용)','product-3-5-84',1),(32,13,'[코맥] 드리퍼 플라스틱타입 3-4인용','product-3-5-97',1);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_group`
--

DROP TABLE IF EXISTS `order_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_group` (
  `payment_id` bigint NOT NULL AUTO_INCREMENT,
  `user_idx` bigint NOT NULL,
  `order_date` timestamp NOT NULL,
  `order_status_code` varchar(6) NOT NULL DEFAULT 'OS001',
  `is_valid` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`payment_id`),
  KEY `user.order.FK_idx` (`user_idx`),
  CONSTRAINT `user.order.FK` FOREIGN KEY (`user_idx`) REFERENCES `user` (`user_idx`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_group`
--

LOCK TABLES `order_group` WRITE;
/*!40000 ALTER TABLE `order_group` DISABLE KEYS */;
INSERT INTO `order_group` VALUES (6,2,'2025-05-30 03:18:42','OS003',1),(7,2,'2025-05-30 03:34:53','OS001',1),(8,2,'2025-05-30 03:39:24','OS001',1),(9,2,'2025-05-30 03:45:37','OS001',1),(10,2,'2025-05-30 05:17:36','OS001',1),(11,2,'2025-06-03 08:33:02','OS001',1),(12,2,'2025-06-05 01:59:03','OS002',1),(13,2,'2025-06-05 02:01:04','OS003',1);
/*!40000 ALTER TABLE `order_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_option`
--

DROP TABLE IF EXISTS `order_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_option` (
  `order_option_id` bigint NOT NULL AUTO_INCREMENT COMMENT '일련번호',
  `order_id` bigint NOT NULL COMMENT '주문 일련번호',
  `priority_index` bigint NOT NULL,
  `option_name` varchar(45) NOT NULL COMMENT '옵션 이름',
  `option_detail_name` varchar(45) NOT NULL COMMENT '상세옵션 이름',
  `option_fluctuating_price` int NOT NULL COMMENT '변동금액',
  PRIMARY KEY (`order_option_id`),
  KEY `order.option.FK_idx` (`order_id`),
  CONSTRAINT `order.option.FK` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_option`
--

LOCK TABLES `order_option` WRITE;
/*!40000 ALTER TABLE `order_option` DISABLE KEYS */;
INSERT INTO `order_option` VALUES (31,21,1,'용량','500g',24300),(32,21,2,'분쇄도','홀빈(분쇄안함)',-4050),(33,21,3,'배전도','풀시티(에스프레소 추천)',3640),(34,21,4,'증정품','없음',-500),(35,27,1,'용량','1kg',40800),(36,27,2,'분쇄도','홀빈(분쇄안함)',-5100),(37,27,3,'배전도','풀시티(에스프레소 추천)',4590),(38,27,4,'증정품','드리퍼 + 필터',4000),(39,29,1,'용량','1kg',21600),(40,29,2,'분쇄도','콜드브루(0.5mm)',6750),(41,29,3,'배전도','하이(핸드드립 추천)',-3380),(42,29,4,'증정품','없음',-500);
/*!40000 ALTER TABLE `order_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `order_option_view`
--

DROP TABLE IF EXISTS `order_option_view`;
/*!50001 DROP VIEW IF EXISTS `order_option_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `order_option_view` AS SELECT 
 1 AS `order_option_id`,
 1 AS `order_id`,
 1 AS `payment_id`,
 1 AS `priority_index`,
 1 AS `option_name`,
 1 AS `option_detail_name`,
 1 AS `option_fluctuating_price`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `order_price`
--

DROP TABLE IF EXISTS `order_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_price` (
  `order_id` bigint NOT NULL,
  `price` bigint NOT NULL,
  PRIMARY KEY (`order_id`),
  CONSTRAINT `order_price.FK` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_price`
--

LOCK TABLES `order_price` WRITE;
/*!40000 ALTER TABLE `order_price` DISABLE KEYS */;
INSERT INTO `order_price` VALUES (21,39590),(22,6300),(23,4400),(24,3000),(25,4200),(26,6300),(27,54490),(28,22000),(29,29870),(30,8400),(31,7300),(32,3700);
/*!40000 ALTER TABLE `order_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `order_view`
--

DROP TABLE IF EXISTS `order_view`;
/*!50001 DROP VIEW IF EXISTS `order_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `order_view` AS SELECT 
 1 AS `order_id`,
 1 AS `payment_id`,
 1 AS `user_idx`,
 1 AS `product_name`,
 1 AS `product_code`,
 1 AS `quantity`,
 1 AS `price`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payment_id` bigint NOT NULL,
  `payment_method_code` varchar(6) NOT NULL,
  `total_price` bigint NOT NULL,
  `delivery_price` bigint NOT NULL,
  `payment_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  CONSTRAINT `payment.FK` FOREIGN KEY (`payment_id`) REFERENCES `order_group` (`payment_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (6,'PM001',39590,3000,'2025-06-02 07:50:54'),(12,'PM002',22000,3000,NULL),(13,'PM001',49270,730,'2025-06-05 02:01:33');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `payment_view`
--

DROP TABLE IF EXISTS `payment_view`;
/*!50001 DROP VIEW IF EXISTS `payment_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `payment_view` AS SELECT 
 1 AS `payment_id`,
 1 AS `user_idx`,
 1 AS `payment_method_code`,
 1 AS `total_price`,
 1 AS `delivery_price`,
 1 AS `payment_date`,
 1 AS `postal_code`,
 1 AS `default_address`,
 1 AS `detail_address`,
 1 AS `extra_address`,
 1 AS `courier_company`,
 1 AS `invoice_number`,
 1 AS `delivery_date`,
 1 AS `arrive_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` bigint NOT NULL AUTO_INCREMENT COMMENT '일련번호',
  `miner_category_id` bigint NOT NULL COMMENT '부 카테고리 일련번호',
  `product_code` varchar(65) NOT NULL COMMENT '품번',
  `product_name` varchar(100) NOT NULL COMMENT '품명',
  `product_comments` varchar(100) DEFAULT NULL COMMENT '설명',
  `price` bigint NOT NULL COMMENT '가격',
  `discounted_rate` int NOT NULL DEFAULT '0' COMMENT '할인율',
  `is_recommended` tinyint NOT NULL DEFAULT '0' COMMENT '추천여부',
  `register_date` timestamp NOT NULL COMMENT '등록일',
  `is_valid` tinyint NOT NULL DEFAULT '1' COMMENT '유효성',
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `product_code_UNIQUE` (`product_code`),
  KEY `miner_category.product.FK_idx` (`miner_category_id`),
  CONSTRAINT `miner_category.product.FK` FOREIGN KEY (`miner_category_id`) REFERENCES `miner_category` (`miner_category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,1,'product-1-1-1','케냐 AA 키암부','#와이니함과 은은한 초콜릿 단맛',6100,0,0,'2024-07-08 02:31:00',1),(2,1,'product-1-1-2','에티오피아 예가체프 G2 띠에라','#싱그러운 산미와 허브의 안락함',5400,0,1,'2024-07-08 02:31:00',1),(3,2,'product-1-2-3','스타블랜드','#카라멜 단 맛과 고소한 아몬드',3400,0,1,'2024-07-08 02:31:00',1),(4,1,'product-1-1-4','브라질 프리미엄 세하도 NY2 FC SC17/18 네추럴','#적절한 바디와 너티함',3400,0,0,'2024-07-08 02:31:00',1),(5,1,'product-1-1-5','콜롬비아 수프리모 후일라','#은은한 허브향과 단맛의 조화',4500,0,0,'2024-07-08 02:31:00',1),(6,1,'product-1-1-6','에티오피아 네추럴 예가체프 G4','#기분 좋은 설렘',4300,0,0,'2024-07-08 02:32:00',1),(7,2,'product-1-2-7','홀릭 에스프레소','#강한 바디와 단맛의 조화',4600,0,0,'2024-07-08 02:32:00',1),(8,2,'product-1-2-8','브라질 블렌드','#밸런스 좋은 견과류',3700,0,0,'2024-07-08 02:32:00',1),(9,1,'product-1-1-9','과테말라 SHB 안티구아','#스모키함과 좋은 향나무의 아로마',4500,0,0,'2024-07-08 02:32:00',1),(10,2,'product-1-2-10','홀릭 다크','#깊은 바디감',4500,0,0,'2024-07-08 02:32:00',1),(11,2,'product-1-2-11','콜롬비아 블렌드','#허브의 단맛과 밸런스의 조화',4500,0,0,'2024-07-08 02:32:00',1),(12,1,'product-1-1-12','온드라스 산 안 드레스','#높은 바디감과 초콜릿의 달콤함',4600,0,0,'2024-07-08 02:33:00',1),(13,1,'product-1-1-13','코스타리카 SHB 따라주','#그린애플의 산미와 호두의 고소함',5000,0,1,'2024-07-08 02:33:00',1),(14,1,'product-1-1-14','탄자니아 모시 킬리만자로 롬보 AA','#진하고 달콤한 초콜릿의 단맛과 스모키함',5000,0,0,'2024-07-08 02:33:00',1),(15,1,'product-1-1-15','콜롬비아 메델린','#호두의 고소함과 코코아의 단맛',4900,0,0,'2024-07-08 02:33:00',1),(16,2,'product-1-2-16','에티오피아 블렌드','#옅은 산미와 적절한 바디감',4000,0,0,'2024-07-08 02:33:00',1),(17,1,'product-1-1-17','Light 케냐 AA 키암부','#자몽의 단맛과 풋사과의 상큼함',6100,0,0,'2024-07-08 02:33:00',1),(18,1,'product-1-1-18','에티오피아 시다모 G2 Aida','#와인의 부드러움과 과일의 상큼한 조화',5400,0,1,'2024-07-08 02:33:00',1),(19,2,'product-1-2-19','스프링 블랜드','#밀크초코 은은함',4000,0,0,'2024-07-08 02:35:00',1),(20,1,'product-1-1-20','인도네시아 만델링 G1 수마트라','#기분 좋은 쓴맛',5300,0,0,'2024-07-08 02:35:00',1),(21,1,'product-1-1-21','브라질 산토스 NY2 GC SC17/18','#은은한 산미와 너티의 마일드함',3200,0,0,'2024-07-08 02:35:00',1),(22,1,'product-1-1-22','베트남 로부스타 G1 Wet Polished SC18','#묵직한 바디와 구수한 단맛',2900,0,0,'2024-07-08 02:35:00',1),(23,1,'product-1-1-23','엘살바도르 SHG EP 아파네카','#깔끔함과 복숭아의 단맛',4600,0,0,'2024-07-08 02:35:00',1),(24,1,'product-1-1-24','에티오피아 내추럴 시다모 G4','#과일의 단맛',4000,0,0,'2024-07-08 02:35:00',1),(25,2,'product-1-2-25','홀릭 하우스','#밸런스 좋은 커피',4100,0,0,'2024-07-08 02:35:00',1),(26,1,'product-1-1-26','예멘 모카 마타리 알 함다니','#강렬한 초콜릿의 단맛과 아로마의 조합',12500,0,0,'2024-07-08 02:35:00',1),(27,1,'product-1-1-27','Light 과테말라 SHB 안티구아','#은은한 카라멜향과 옅은 솔잎향',4500,0,0,'2024-07-08 02:35:00',1),(28,2,'product-1-2-28','미미 푸리토','#마일드한 바디의 구수함',3400,0,0,'2024-07-08 02:35:00',1),(29,2,'product-1-2-29','미미 미떼','#버터의 부드러움',3400,0,0,'2024-07-08 02:35:00',1),(30,1,'product-1-1-30','르완드 버본 타바 이스테이트','#오렌지주스 초콜릿',5200,0,0,'2024-07-08 02:35:00',1),(31,2,'product-1-2-31','홀릭 아이스(화이트)','#마일드한 바디감과 달콤함',4200,0,0,'2024-07-08 02:35:00',1),(32,2,'product-1-2-32','인도 몬순 말라바르AA','#곡물의 고소함과 카라멜의 부드러운 단맛',5400,0,0,'2024-07-08 02:35:00',1),(33,3,'product-2-3-33','드립백커피 매니아16 디카페인 콜롬비아 (1종X16개입)','#초콜릿의 단맛과 부드러운 바디감',17500,0,0,'2024-07-08 03:15:00',1),(34,4,'product-2-4-34','드립백커피 과테말라 후에후에 테낭고 SHB','#5개입',4000,0,0,'2024-07-08 03:15:00',1),(35,4,'product-2-4-35','드립백커피 브라질 그란지송 프란시스코','#5개입',4000,0,0,'2024-07-08 03:15:00',1),(36,4,'product-2-4-36','드립백커피 콜롬비아 안티오키아 수프리모','#5개입',4000,0,0,'2024-07-08 03:15:00',1),(37,4,'product-2-4-37','드립백커피 케냐AA','#5개입',4200,0,0,'2024-07-08 03:15:00',1),(38,4,'product-2-4-38','드립백커피 PNG 블루마운틴 아고가','#5개입',4400,0,1,'2024-07-08 03:15:00',1),(39,4,'product-2-4-39','드립백커피 에티오피아 아바야 게이샤 G1','#5개입',4200,0,1,'2024-07-08 03:15:00',1),(40,3,'product-2-3-40','드립백커피 선물세트 1호(3종X5개입)','#아바게이샤G1/브라질세하도/케냐AA',14500,0,0,'2024-07-08 03:15:00',1),(41,3,'product-2-3-41','드립백커피 선물세트 2호(6종X5개입)','#브라질세하도/과테말라/만델링G1/케냐/예가체프G2/PNG블루마운틴',22000,0,0,'2024-07-08 03:15:00',1),(42,4,'product-2-4-42','인도네시아 만델링 G1','#5개입',4000,0,1,'2024-07-08 03:15:00',1),(43,4,'product-2-4-43','에티오피아 예가체프 G2','#5개입',4000,0,1,'2024-07-08 03:16:00',1),(44,3,'product-2-3-44','드립백커피 선물세트 3호(8종X5개입)','#아바야게이샤G1/콜롬비아/브라질/과테말라/만델링G1/케냐AA/예가체프G2/PNG블루마운틴',29500,0,0,'2024-07-08 03:17:00',1),(45,3,'product-2-3-45','드립백커피 버라이어티16 (4종X4입)','#블루마운틴/예가체프/과테말라/콜롬비아',13300,0,0,'2024-07-08 03:17:00',1),(46,3,'product-2-3-46','드립백커피 버라이어티32 (8종X4입)','#블루마운틴/아바야게이샤/케냐/예가체프/인도네시아/과테말라/브라질/콜롬비아',23900,0,0,'2024-07-08 03:17:00',1),(47,6,'product-3-6-47','커피화분(중)','',6000,0,0,'2024-07-08 08:39:00',1),(48,5,'product-3-5-48','FK-06 원목 소형 핸드밀','',19700,0,0,'2024-07-08 08:39:00',1),(49,5,'product-3-5-49','[하리오] 서버 VCS-02B(700ml)','',18000,0,0,'2024-07-08 08:45:00',1),(50,6,'product-3-6-50','더치 스윙병 250ml','',2000,0,0,'2024-07-08 08:46:00',1),(51,5,'product-3-5-51','누보 핸드밀 청소 브러쉬','',6500,0,0,'2024-07-08 08:46:00',1),(52,5,'product-3-5-52','누보 원터치 밀폐용기 1000ml','',16900,0,0,'2024-07-08 08:46:00',1),(53,5,'product-3-5-53','누보 원터치 밀폐용기 700ml','',15400,0,0,'2024-07-08 08:46:00',1),(54,5,'product-3-5-54','스테인레서 드립포트 0.7L (JY-8807)','',17500,0,0,'2024-07-08 08:46:00',1),(55,6,'product-3-6-55','벨크리머 스텐 샷잔 (3온즈/5온즈/8온즈)','',2300,0,0,'2024-07-08 08:46:00',1),(56,6,'product-3-6-56','스팀피처 1000ml','',11500,0,0,'2024-07-08 08:46:00',1),(57,6,'product-3-6-57','스팀피처 600ml','',10000,0,0,'2024-07-08 08:46:00',1),(58,6,'product-3-6-58','스팀피처 350ml','',8500,0,0,'2024-07-08 08:46:00',1),(59,6,'product-3-6-59','디지털 커피 온도계','',12600,0,0,'2024-07-08 08:48:00',1),(60,5,'product-3-5-60','드립백 필터 10매입','',1500,0,0,'2024-07-08 08:48:00',1),(61,5,'product-3-5-61','[하리오] 플라스틱 드리퍼 레드 3-4인용 VD-02R','',5600,0,1,'2024-07-08 08:48:00',1),(62,5,'product-3-5-62','[하리오] 플라스틱 드리퍼 레드 1-2인용 VD-01R','',5000,0,0,'2024-07-08 08:48:00',1),(63,5,'product-3-5-63','라운드 필터 60mm 100P','',3000,0,0,'2024-07-08 08:49:00',1),(64,6,'product-3-6-64','메티에 전용 시럽 펌프','',4000,0,0,'2024-07-08 08:49:00',1),(65,6,'product-3-6-65','면 행주(29 X 45cm)','',1200,0,0,'2024-07-08 08:49:00',1),(66,6,'product-3-6-66','커피머신 파우더 세정제 900g','',16500,0,0,'2024-07-08 08:49:00',1),(67,6,'product-3-6-67','머신 청소용 실리콘 필터(블라인드 가스켓)','',2500,0,0,'2024-07-08 08:49:00',1),(68,6,'product-3-6-68','에스프레소 유리 샷잔 3라인','',2900,0,0,'2024-07-08 08:49:00',1),(69,6,'product-3-6-69','우유 거품 스푼(밀크폼스푼)','',3500,0,0,'2024-07-08 08:49:00',1),(70,6,'product-3-6-70','실버 바 스푼(소)','',3200,0,0,'2024-07-08 08:49:00',1),(71,6,'product-3-6-71','실버 바 스푼(대)','',4000,0,0,'2024-07-08 08:50:00',1),(72,6,'product-3-6-72','범용 시럽 펌프','',3300,0,0,'2024-07-08 08:50:00',1),(73,6,'product-3-6-73','더치 스윙병 500ml','',2300,0,0,'2024-07-08 08:50:00',1),(74,5,'product-3-5-74','드리퍼 받침','',900,0,0,'2024-07-08 08:50:00',1),(75,6,'product-3-6-75','에스프레소 머신 청소솔','',6300,0,0,'2024-07-08 08:50:00',1),(76,5,'product-3-5-76','라운드 필터 56mm 100P','',2700,0,0,'2024-07-08 08:50:00',1),(77,5,'product-3-5-77','천연펄프 드립필터 1X2(3~4인용) 100P','',2500,0,0,'2024-07-08 08:50:00',1),(78,5,'product-3-5-78','천연펄프 드립필터 1X1(1~2인용) 100P','',2300,0,0,'2024-07-08 08:50:00',1),(79,5,'product-3-5-79','천연펄프 드립필터 1X2(5~6인용) 100P','',3000,0,0,'2024-07-08 08:50:00',1),(80,5,'product-3-5-80','드립서버 800ml','',10900,0,0,'2024-07-08 08:50:00',1),(81,5,'product-3-5-81','드립서버 500ml','',9000,0,0,'2024-07-08 08:51:00',1),(82,5,'product-3-5-82','드립서버 300ml','',8200,0,0,'2024-07-08 08:51:00',1),(83,5,'product-3-5-83','도자기 드리퍼 102LD 브라운(3~4인용)','',7300,0,0,'2024-07-08 08:51:00',1),(84,5,'product-3-5-84','도자기 드리퍼 102LD 화이트(3~4인용)','',7300,0,0,'2024-07-08 08:51:00',1),(85,5,'product-3-5-85','도자기 드리퍼 101LD 화이트(1~2인용)','',6600,0,0,'2024-07-08 08:51:00',1),(86,5,'product-3-5-86','친환경 드리퍼 102D(3~4인용)','',3900,0,0,'2024-07-08 08:51:00',1),(87,5,'product-3-5-87','친환경 드리퍼 101D(1~2인용)','',3700,0,0,'2024-07-08 08:51:00',1),(88,5,'product-3-5-88','도자기 드립세트 102LD 브라운(3~4인용)','',18000,0,0,'2024-07-08 08:51:00',1),(89,5,'product-3-5-89','도자기 드립세트 102LD 화이트(3~4인용)','',18000,0,0,'2024-07-08 08:51:00',1),(90,5,'product-3-5-90','[하리오] 드리퍼 VD 02T','',6300,0,1,'2024-07-08 08:51:00',1),(91,5,'product-3-5-91','[하리오] 필터 VCF-02-100W','',5700,0,0,'2024-07-08 08:51:00',1),(92,5,'product-3-5-92','[하리오] 필터 VCF-01-100W','',5300,0,1,'2024-07-08 08:51:00',1),(93,5,'product-3-5-93','[하리오] 필터 VCF-02-100M','',5900,0,0,'2024-07-08 08:51:00',1),(94,5,'product-3-5-94','[하리오] 필터 VCF-01-100M','',5500,0,0,'2024-07-08 08:52:00',1),(95,5,'product-3-5-95','[누보] 라운드필터 60mm(황, 100매)','',3000,0,0,'2024-07-08 08:52:00',1),(96,5,'product-3-5-96','커피 계량스푼 중(13cm)(황, 100매)','',1500,0,0,'2024-07-08 08:52:00',1),(97,5,'product-3-5-97','[코맥] 드리퍼 플라스틱타입 3-4인용','',3700,0,1,'2024-07-08 08:52:00',1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `product_view`
--

DROP TABLE IF EXISTS `product_view`;
/*!50001 DROP VIEW IF EXISTS `product_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `product_view` AS SELECT 
 1 AS `product_id`,
 1 AS `major_category_id`,
 1 AS `miner_category_id`,
 1 AS `product_code`,
 1 AS `product_name`,
 1 AS `product_comments`,
 1 AS `price`,
 1 AS `discounted_rate`,
 1 AS `option_count`,
 1 AS `is_recommended`,
 1 AS `register_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `refresh_token`
--

DROP TABLE IF EXISTS `refresh_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refresh_token` (
  `user_idx` bigint NOT NULL,
  `token` varchar(512) NOT NULL,
  `expires_at` timestamp NOT NULL,
  PRIMARY KEY (`user_idx`),
  CONSTRAINT `user.refresh_token.FK` FOREIGN KEY (`user_idx`) REFERENCES `user` (`user_idx`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refresh_token`
--

LOCK TABLES `refresh_token` WRITE;
/*!40000 ALTER TABLE `refresh_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `refresh_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth`
--

DROP TABLE IF EXISTS `social_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_auth` (
  `user_idx` bigint NOT NULL,
  `auth_provider` varchar(100) NOT NULL,
  `provider_user_id` varchar(100) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone_number` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_idx`),
  CONSTRAINT `user.social.FK` FOREIGN KEY (`user_idx`) REFERENCES `user` (`user_idx`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth`
--

LOCK TABLES `social_auth` WRITE;
/*!40000 ALTER TABLE `social_auth` DISABLE KEYS */;
INSERT INTO `social_auth` VALUES (5,'naver','jKkK9JUz8DKMg1IQVNyazbV61EkZwIyRIsp7_HVBsaY','이상윤','cw282@naver.com','010-6567-3544'),(6,'kakao','4267401024','상윤',NULL,NULL),(7,'google','111051979169760130312','S윤','sylee19960327@gmail.com',NULL);
/*!40000 ALTER TABLE `social_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `social_user_view`
--

DROP TABLE IF EXISTS `social_user_view`;
/*!50001 DROP VIEW IF EXISTS `social_user_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `social_user_view` AS SELECT 
 1 AS `user_idx`,
 1 AS `user_id`,
 1 AS `user_name`,
 1 AS `phone_number`,
 1 AS `email`,
 1 AS `register_date`,
 1 AS `user_permissions_code`,
 1 AS `auth_provider`,
 1 AS `provider_user_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_idx` bigint NOT NULL AUTO_INCREMENT,
  `user_id` varchar(300) NOT NULL,
  `register_date` timestamp NOT NULL,
  `user_permissions_code` varchar(6) NOT NULL DEFAULT 'AR001',
  `auth_method_code` varchar(6) NOT NULL,
  `is_valid` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`user_idx`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','2025-04-30 17:31:59','AR002','AM001',1),(2,'cw7430','2025-04-30 17:31:59','AR001','AM001',1),(3,'cw282','2025-05-15 04:31:54','AR001','AM001',1),(4,'cw6567','2025-05-15 04:30:15','AR001','AM001',1),(5,'naver_jKkK9JUz8DKMg1IQVNyazbV61EkZwIyRIsp7_HVBsaY','2025-05-19 06:16:32','AR001','AM002',1),(6,'kakao_4267401024','2025-05-19 06:16:52','AR001','AM002',1),(7,'google_111051979169760130312','2025-05-19 06:17:08','AR001','AM002',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `cart_option_view`
--

/*!50001 DROP VIEW IF EXISTS `cart_option_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `cart_option_view` AS select `a`.`cart_option_id` AS `cart_option_id`,`a`.`cart_id` AS `cart_id`,`a`.`option_detail_id` AS `option_detail_id`,`b`.`user_idx` AS `user_idx`,`c`.`option_id` AS `option_id`,`d`.`priority_index` AS `priority_index`,`d`.`option_name` AS `option_name`,`d`.`option_type_code` AS `option_type_code`,`c`.`option_detail_name` AS `option_detail_name`,`c`.`option_fluctuating_price` AS `option_fluctuating_price` from (((`cart_option` `a` join `cart` `b` on((`a`.`cart_id` = `b`.`cart_id`))) left join `option_detail` `c` on((`a`.`option_detail_id` = `c`.`option_detail_id`))) left join `option` `d` on((`c`.`option_id` = `d`.`option_id`))) order by `a`.`cart_id`,`d`.`priority_index` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `cart_view`
--

/*!50001 DROP VIEW IF EXISTS `cart_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `cart_view` AS select `a`.`cart_id` AS `cart_id`,`a`.`product_id` AS `product_id`,`b`.`product_name` AS `product_name`,`b`.`product_code` AS `product_code`,`a`.`user_idx` AS `user_idx`,`b`.`price` AS `price`,`b`.`discounted_rate` AS `discounted_rate`,`a`.`quantity` AS `quantity` from (`cart` `a` join `product` `b` on((`a`.`product_id` = `b`.`product_id`))) order by `a`.`cart_date` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `native_user_view`
--

/*!50001 DROP VIEW IF EXISTS `native_user_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `native_user_view` AS select `a`.`user_idx` AS `user_idx`,`a`.`user_id` AS `user_id`,`b`.`user_name` AS `user_name`,`b`.`phone_number` AS `phone_number`,`b`.`email` AS `email`,`a`.`register_date` AS `register_date`,`a`.`user_permissions_code` AS `user_permissions_code` from (`user` `a` join `native_auth` `b` on((`a`.`user_idx` = `b`.`user_idx`))) where (`a`.`is_valid` = true) order by `a`.`user_permissions_code` desc,`a`.`user_idx` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `option_view`
--

/*!50001 DROP VIEW IF EXISTS `option_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `option_view` AS select `a`.`option_detail_id` AS `option_detail_id`,`a`.`option_id` AS `option_id`,`b`.`priority_index` AS `priority_index`,`b`.`major_category_id` AS `major_category_id`,`b`.`option_type_code` AS `option_type_code`,`b`.`option_name` AS `option_name`,`a`.`option_detail_name` AS `option_detail_name`,`a`.`option_fluctuating_price` AS `option_fluctuating_price` from (`option_detail` `a` left join `option` `b` on((`a`.`option_id` = `b`.`option_id`))) where (`a`.`is_valid` = true) order by `b`.`major_category_id`,`b`.`priority_index` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `order_option_view`
--

/*!50001 DROP VIEW IF EXISTS `order_option_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `order_option_view` AS select `a`.`order_option_id` AS `order_option_id`,`a`.`order_id` AS `order_id`,`b`.`payment_id` AS `payment_id`,`a`.`priority_index` AS `priority_index`,`a`.`option_name` AS `option_name`,`a`.`option_detail_name` AS `option_detail_name`,`a`.`option_fluctuating_price` AS `option_fluctuating_price` from (`order_option` `a` join `order` `b` on((`a`.`order_id` = `b`.`order_id`))) order by `b`.`payment_id`,`a`.`order_id`,`a`.`priority_index` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `order_view`
--

/*!50001 DROP VIEW IF EXISTS `order_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `order_view` AS select `a`.`order_id` AS `order_id`,`a`.`payment_id` AS `payment_id`,`b`.`user_idx` AS `user_idx`,`a`.`product_name` AS `product_name`,`a`.`product_code` AS `product_code`,`a`.`quantity` AS `quantity`,`c`.`price` AS `price` from ((`order` `a` join `order_group` `b` on((`a`.`payment_id` = `b`.`payment_id`))) join `order_price` `c` on((`a`.`order_id` = `c`.`order_id`))) order by `a`.`payment_id`,`a`.`order_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `payment_view`
--

/*!50001 DROP VIEW IF EXISTS `payment_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `payment_view` AS select `a`.`payment_id` AS `payment_id`,`c`.`user_idx` AS `user_idx`,`a`.`payment_method_code` AS `payment_method_code`,`a`.`total_price` AS `total_price`,`a`.`delivery_price` AS `delivery_price`,`a`.`payment_date` AS `payment_date`,`b`.`postal_code` AS `postal_code`,`b`.`default_address` AS `default_address`,`b`.`detail_address` AS `detail_address`,`b`.`extra_address` AS `extra_address`,`b`.`courier_company` AS `courier_company`,`b`.`invoice_number` AS `invoice_number`,`b`.`delivery_date` AS `delivery_date`,`b`.`arrive_date` AS `arrive_date` from ((`payment` `a` join `delivery` `b` on((`a`.`payment_id` = `b`.`payment_id`))) join `order_group` `c` on((`a`.`payment_id` = `c`.`payment_id`))) order by `a`.`payment_id` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `product_view`
--

/*!50001 DROP VIEW IF EXISTS `product_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `product_view` AS select `a`.`product_id` AS `product_id`,`b`.`major_category_id` AS `major_category_id`,`a`.`miner_category_id` AS `miner_category_id`,`a`.`product_code` AS `product_code`,`a`.`product_name` AS `product_name`,`a`.`product_comments` AS `product_comments`,`a`.`price` AS `price`,`a`.`discounted_rate` AS `discounted_rate`,ifnull(`opt_counts`.`option_count`,0) AS `option_count`,`a`.`is_recommended` AS `is_recommended`,`a`.`register_date` AS `register_date` from (((`product` `a` join `miner_category` `b` on((`a`.`miner_category_id` = `b`.`miner_category_id`))) join `major_category` `c` on((`b`.`major_category_id` = `c`.`major_category_id`))) left join (select `option`.`major_category_id` AS `major_category_id`,count(0) AS `option_count` from `option` group by `option`.`major_category_id`) `opt_counts` on((`c`.`major_category_id` = `opt_counts`.`major_category_id`))) where (`a`.`is_valid` = true) order by `b`.`major_category_id`,`a`.`is_recommended` desc,`a`.`miner_category_id`,`a`.`register_date` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `social_user_view`
--

/*!50001 DROP VIEW IF EXISTS `social_user_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `social_user_view` AS select `a`.`user_idx` AS `user_idx`,`a`.`user_id` AS `user_id`,`b`.`user_name` AS `user_name`,`b`.`phone_number` AS `phone_number`,`b`.`email` AS `email`,`a`.`register_date` AS `register_date`,`a`.`user_permissions_code` AS `user_permissions_code`,`b`.`auth_provider` AS `auth_provider`,`b`.`provider_user_id` AS `provider_user_id` from (`user` `a` join `social_auth` `b` on((`a`.`user_idx` = `b`.`user_idx`))) where (`a`.`is_valid` = true) order by `a`.`user_permissions_code` desc,`a`.`user_idx` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-10 10:21:44
