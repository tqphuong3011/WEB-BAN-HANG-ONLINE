-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: shirt_jpa
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `CARTID` bigint NOT NULL,
  PRIMARY KEY (`CARTID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (2),(3),(4),(5),(6),(7),(256),(258);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_lineitem`
--

DROP TABLE IF EXISTS `cart_lineitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_lineitem` (
  `Cart_CARTID` bigint NOT NULL,
  `productList_LINEITEMID` bigint NOT NULL,
  PRIMARY KEY (`Cart_CARTID`,`productList_LINEITEMID`),
  KEY `FK_CART_LINEITEM_productList_LINEITEMID` (`productList_LINEITEMID`),
  CONSTRAINT `FK_CART_LINEITEM_Cart_CARTID` FOREIGN KEY (`Cart_CARTID`) REFERENCES `cart` (`CARTID`),
  CONSTRAINT `FK_CART_LINEITEM_productList_LINEITEMID` FOREIGN KEY (`productList_LINEITEMID`) REFERENCES `lineitem` (`LINEITEMID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_lineitem`
--

LOCK TABLES `cart_lineitem` WRITE;
/*!40000 ALTER TABLE `cart_lineitem` DISABLE KEYS */;
INSERT INTO `cart_lineitem` VALUES (3,301);
/*!40000 ALTER TABLE `cart_lineitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `CATEGORYID` int NOT NULL,
  `CATEGORYNAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CATEGORYID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (51,'Tshirt'),(52,'Shirt'),(53,'Sweater'),(54,'Polo'),(55,'Hoodie');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `IMAGEID` bigint NOT NULL,
  `IMAGEURL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`IMAGEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (52,'https://cdn2.yame.vn/pimg/ao-polo-cool-touch-07-0022751/173b65c5-5696-2100-13dd-001ad0ed874a.jpg?w=540&h=756'),(53,'https://cdn2.yame.vn/pimg/ao-polo-cool-touch-07-0022751/cdfc56db-b308-2200-378c-001ad0ed89ce.jpg?w=540&h=756'),(54,'https://cdn2.yame.vn/pimg/ao-polo-cool-touch-07-0022751/c6181cfc-3b93-8900-024f-001abe110b23.jpg?w=540&h=756'),(56,'https://cdn2.yame.vn/pimg/ao-polo-cool-touch-07-0022752/96bacd81-22c2-1100-2c7f-001ad34e76cb.jpg?w=540&h=756'),(57,'https://cdn2.yame.vn/pimg/ao-polo-cool-touch-07-0022752/a3c84ea5-3219-2400-c29d-001ad0eda373.jpg?w=540&h=756'),(58,'https://cdn2.yame.vn/pimg/ao-polo-cool-touch-07-0022752/04fcb45a-45d7-7f00-aba1-001abe10e1b6.jpg?w=540&h=756'),(60,'https://cdn2.yame.vn/pimg/ao-polo-cool-touch-07-0022753/62ee5d14-7fab-1200-fa87-001ad34e9a5c.jpg?w=540&h=756'),(61,'https://cdn2.yame.vn/pimg/ao-polo-cool-touch-07-0022753/9005bdc5-345e-2600-0148-001ad0edbf0e.jpg?w=540&h=756'),(62,'https://cdn2.yame.vn/pimg/ao-polo-cool-touch-07-0022753/dfbdfd50-107f-6a00-f0d7-001abe109bfa.jpg?w=540&h=756'),(64,'https://cdn2.yame.vn/pimg/ao-polo-cool-touch-07-0022754/aee17d55-4851-1300-7577-001ad34eb2cf.jpg?w=540&h=756'),(65,'https://cdn2.yame.vn/pimg/ao-polo-cool-touch-07-0022754/f99c367a-3ed9-2800-b820-001ad0edd819.jpg?w=540&h=756'),(66,'https://cdn2.yame.vn/pimg/ao-polo-cool-touch-07-0022754/15018746-e29a-7300-fd66-001abe10bfe2.jpg?w=540&h=756'),(68,'https://cdn2.yame.vn/pimg/ao-thun-co-tru-cool-touch-06-0022627/5815e49a-edb1-a200-8c06-001ad360b878.jpg?w=540&h=756'),(69,'https://cdn2.yame.vn/pimg/ao-thun-co-tru-cool-touch-06-0022627/f5227646-11ae-3600-aafe-001ac85cf5e5.jpg?w=540&h=756'),(70,'https://cdn2.yame.vn/pimg/ao-thun-co-tru-cool-touch-06-0022627/78e6c4c8-d5fa-1301-2ee6-001ac86be303.jpg?w=540&h=756'),(72,'https://cdn2.yame.vn/pimg/ao-thun-co-tru-cool-touch-06-0022628/9681037c-27b4-a100-e5e5-001ad360a043.jpg?w=540&h=756'),(73,'https://cdn2.yame.vn/pimg/ao-thun-co-tru-cool-touch-06-0022628/fcaf9fa1-4a0c-4200-4bd0-001ac85d2c1e.jpg?w=540&h=756'),(74,'https://cdn2.yame.vn/pimg/ao-thun-co-tru-cool-touch-06-0022628/daf7c20c-6348-1401-a610-001ac86bf3ef.jpg?w=540&h=756'),(76,'https://cdn2.yame.vn/pimg/ao-thun-co-tru-cool-touch-06-0022629/f4634138-3274-a000-aced-001ad3608483.jpg?w=540&h=756'),(77,'https://cdn2.yame.vn/pimg/ao-thun-co-tru-cool-touch-06-0022629/bed4c2d8-b0db-5000-f521-001ac85e140c.jpg?w=540&h=756'),(78,'https://cdn2.yame.vn/pimg/ao-thun-co-tru-cool-touch-06-0022629/b6998e89-e383-1201-4224-001ac86bcff8.jpg?w=540&h=756'),(80,'https://cdn2.yame.vn/pimg/ao-thun-co-tru-cool-touch-06-0022630/97560446-6849-9f00-5cd3-001ad3606e81.jpg?w=540&h=756'),(81,'https://cdn2.yame.vn/pimg/ao-thun-co-tru-cool-touch-06-0022630/60de818e-3406-5a00-b8e7-001ac85e3d5f.jpg?w=540&h=756'),(82,'https://cdn2.yame.vn/pimg/ao-thun-co-tru-cool-touch-06-0022630/72656c4f-c9e9-1501-afb7-001ac86c2cdc.jpg?w=540&h=756'),(84,'https://cdn2.yame.vn/pimg/ao-thun-sweater-cool-touch-05-0022621/b2031934-8ad5-0d00-23cb-001ad34deb1f.jpg?w=540&h=756'),(85,'https://cdn2.yame.vn/pimg/ao-thun-sweater-cool-touch-05-0022621/c9e5e931-0873-1a00-db97-001ad0ed28f0.jpg?w=540&h=756'),(86,'https://cdn2.yame.vn/pimg/ao-thun-sweater-cool-touch-05-0022621/2546bd2f-e6a6-d400-287e-001abe14d0c9.jpg?w=540&h=756'),(88,'https://cdn2.yame.vn/pimg/ao-thun-sweater-cool-touch-05-0022622/5a12757b-021c-0e00-a500-001ad34e0089.jpg?w=540&h=756'),(89,'https://cdn2.yame.vn/pimg/ao-thun-sweater-cool-touch-05-0022622/3d723e93-e2d6-1c00-2bba-001ad0ed4540.jpg?w=540&h=756'),(90,'https://cdn2.yame.vn/pimg/ao-thun-sweater-cool-touch-05-0022622/dcf0ae09-a9ed-c900-4c8f-001abe139d42.jpg?w=540&h=756'),(92,'https://cdn2.yame.vn/pimg/ao-thun-sweater-cool-touch-05-0022624/65cd506c-674a-1000-78e1-001ad34e38e5.jpg?w=540&h=756'),(93,'https://cdn2.yame.vn/pimg/ao-thun-sweater-cool-touch-05-0022624/fb891bcb-353b-2000-33c7-001ad0ed74d9.jpg?w=540&h=756'),(94,'https://cdn2.yame.vn/pimg/ao-thun-sweater-cool-touch-05-0022624/66d45277-bcf2-bd00-ca59-001abe131ded.jpg?w=540&h=756'),(96,'https://cdn2.yame.vn/pimg/ao-thun-sweater-cool-touch-05-0022623/2091d44b-b101-0f00-2d40-001ad34e221d.jpg?w=540&h=756'),(97,'https://cdn2.yame.vn/pimg/ao-thun-sweater-cool-touch-05-0022623/356df4f0-cc96-1e00-b4a3-001ad0ed5e70.jpg?w=540&h=756'),(98,'https://cdn2.yame.vn/pimg/ao-thun-sweater-cool-touch-05-0022623/66575c89-ae40-b100-cc58-001abe12ee2a.jpg?w=540&h=756'),(100,'https://cdn2.yame.vn/pimg/ao-khoac-classic-cool-touch-02-0022611/07a05d86-66d7-a300-0662-001ad360ce46.jpg?w=540&h=756'),(101,'https://cdn2.yame.vn/pimg/ao-khoac-classic-cool-touch-02-0022611/ef7f1ec1-73c4-2900-6d5c-001ac85ccd37.jpg?w=540&h=756'),(102,'https://cdn2.yame.vn/pimg/ao-khoac-classic-cool-touch-02-0022611/d5ae7bd7-eafb-2a00-6d5c-001ac85ccd37.jpg?w=540&h=756'),(104,'https://cdn2.yame.vn/pimg/ao-khoac-classic-cool-touch-02-0022610/97f4388c-c296-a400-fd7b-001ad360e3b6.jpg?w=540&h=756'),(105,'https://cdn2.yame.vn/pimg/ao-khoac-classic-cool-touch-02-0022610/864726f5-4f82-1c00-1b5d-001ac85c9947.jpg?w=540&h=756'),(106,'https://cdn2.yame.vn/pimg/ao-khoac-classic-cool-touch-02-0022610/cc1d4c98-c635-1d00-c686-001ac85c9949.jpg?w=540&h=756'),(108,'https://cdn2.yame.vn/pimg/ao-khoac-classic-cool-touch-02-0022609/7e113f82-3325-a500-b1e2-001ad360f399.jpg?w=540&h=756'),(109,'https://cdn2.yame.vn/pimg/ao-khoac-classic-cool-touch-02-0022609/def5d830-75b1-0f00-6998-001ac85c6f41.jpg?w=540&h=756'),(110,'https://cdn2.yame.vn/pimg/ao-khoac-classic-cool-touch-02-0022609/be0b6a78-be5c-1000-2e32-001ac85c6f46.jpg?w=540&h=756'),(112,'https://cdn2.yame.vn/pimg/ao-khoac-classic-cool-touch-02-0022608/1e1a6010-781e-a600-9e80-001ad36105e4.jpg?w=540&h=756'),(113,'https://cdn2.yame.vn/pimg/ao-khoac-classic-cool-touch-02-0022608/805ed6df-aecc-0200-80be-001ac85b736b.jpg?w=540&h=756'),(114,'https://cdn2.yame.vn/pimg/ao-khoac-classic-cool-touch-02-0022608/66889746-73f1-0300-247a-001ac85b7371.jpg?w=540&h=756'),(116,'https://cdn2.yame.vn/pimg/ao-so-mi-tay-ngan-soi-modal-wrinkle-free-05-0022469/0d6bd207-d7fe-8f00-a1cb-001ad359d034.jpg?w=540&h=756'),(117,'https://cdn2.yame.vn/pimg/ao-so-mi-tay-ngan-soi-modal-wrinkle-free-05-0022469/930a1918-c1a0-a700-8d4e-001ac2f7dd16.jpg?w=540&h=756'),(118,'https://cdn2.yame.vn/pimg/ao-so-mi-tay-ngan-soi-modal-wrinkle-free-05-0022469/77b27e9a-d4ed-a900-3b29-001ac2f7dd32.jpg?w=540&h=756'),(120,'https://cdn2.yame.vn/pimg/ao-so-mi-tay-ngan-soi-modal-wrinkle-free-05-0022468/26c4ae7b-3ab3-8e00-1bef-001ad359b904.jpg?w=540&h=756'),(121,'https://cdn2.yame.vn/pimg/ao-so-mi-tay-ngan-soi-modal-wrinkle-free-05-0022468/1ac33e05-edce-9b00-7b4c-001ac2f79212.jpg?w=540&h=756'),(122,'https://cdn2.yame.vn/pimg/ao-so-mi-tay-ngan-soi-modal-wrinkle-free-05-0022468/1683e7df-b6e0-9d00-b845-001ac2f7923f.jpg?w=540&h=756'),(124,'https://cdn2.yame.vn/pimg/ao-so-mi-tay-ngan-soi-modal-wrinkle-free-05-0022467/cb15f4b9-0df5-8d00-ea3f-001ad359a682.jpg?w=540&h=756'),(125,'https://cdn2.yame.vn/pimg/ao-so-mi-tay-ngan-soi-modal-wrinkle-free-05-0022467/1d3fffcc-3c94-9000-e6cb-001ac2f76c31.jpg?w=540&h=756'),(126,'https://cdn2.yame.vn/pimg/ao-so-mi-tay-ngan-soi-modal-wrinkle-free-05-0022467/ab7d887a-aecf-9200-abe2-001ac2f76c4c.jpg?w=540&h=756'),(128,'https://cdn2.yame.vn/pimg/ao-so-mi-tay-ngan-soi-modal-wrinkle-free-05-0022466/569c2d73-84d6-8c00-c730-001ad3599411.jpg?w=540&h=756'),(129,'https://cdn2.yame.vn/pimg/ao-so-mi-tay-ngan-soi-modal-wrinkle-free-05-0022466/a1008a0a-19d5-0a00-834c-001ac3bd429b.jpg?w=540&h=756'),(130,'https://cdn2.yame.vn/pimg/ao-so-mi-tay-ngan-soi-modal-wrinkle-free-05-0022466/8a3f0b24-6811-8800-695c-001ac2f74979.jpg?w=540&h=756'),(132,'https://cdn2.yame.vn/pimg/ao-thun-co-tru-premium-26-0022580/b190f9f1-27e0-2700-0e93-001ab9595135.jpg?w=540&h=756'),(133,'https://cdn2.yame.vn/pimg/ao-thun-co-tru-premium-26-0022580/ca906e53-2182-8200-afb2-001aba23effe.jpg?w=540&h=756'),(134,'https://cdn2.yame.vn/pimg/ao-thun-co-tru-premium-26-0022580/664d0838-0cb3-8400-2543-001aba23f018.jpg?w=540&h=756'),(136,'https://cdn2.yame.vn/pimg/ao-thun-co-tru-premium-26-0022581/6fb98ff8-c5ce-2600-97bb-001ab957dbb2.jpg?w=540&h=756'),(137,'https://cdn2.yame.vn/pimg/ao-thun-co-tru-premium-26-0022581/8311b1a4-3b00-8600-7fb0-001aba23fef1.jpg?w=540&h=756'),(138,'https://cdn2.yame.vn/pimg/ao-thun-co-tru-premium-26-0022581/81c6e6a7-c3cc-8800-011c-001aba23ff0d.jpg?w=540&h=756'),(140,'https://cdn2.yame.vn/pimg/ao-khoac-hoodie-zipper-premium-22-0022540/9d076916-ea6b-0600-3dda-001ab94aa341.jpg?w=540&h=756'),(141,'https://cdn2.yame.vn/pimg/ao-khoac-hoodie-zipper-premium-22-0022540/c6362148-0278-5200-6a90-001aba1f29c7.jpg?w=540&h=756'),(142,'https://cdn2.yame.vn/pimg/ao-khoac-hoodie-zipper-premium-22-0022540/55a98f49-2034-5500-89e1-001aba1f29f8.jpg?w=540&h=756'),(144,'https://cdn2.yame.vn/pimg/ao-khoac-hoodie-zipper-premium-22-0022541/79b9b0e1-100e-0700-9318-001ab94cb576.jpg?w=540&h=756'),(145,'https://cdn2.yame.vn/pimg/ao-khoac-hoodie-zipper-premium-22-0022541/47f857e1-f369-5600-1d2f-001aba1f372a.jpg?w=540&h=756'),(146,'https://cdn2.yame.vn/pimg/ao-khoac-hoodie-zipper-premium-22-0022541/8caa9d74-146f-5800-da21-001aba1f3749.jpg?w=540&h=756'),(153,'https://cdn2.yame.vn/pimg/ao-polo-seventy-seven-04-0022727/2dbc8368-d984-1801-b1cc-001ad373d0a1.jpg?w=540&h=756'),(154,'https://cdn2.yame.vn/pimg/ao-polo-seventy-seven-04-0022727/465a22f2-42a3-3e00-9842-001ad1144b8d.jpg?w=540&h=756'),(155,'https://cdn2.yame.vn/pimg/ao-polo-seventy-seven-04-0022727/7a7c53e0-187b-0600-ac45-001ad0389355.jpg?w=540&h=756'),(157,'https://cdn2.yame.vn/pimg/ao-polo-seventy-seven-04-0022725/f27d4036-6dd9-1601-662f-001ad373abc7.jpg?w=540&h=756'),(158,'https://cdn2.yame.vn/pimg/ao-polo-seventy-seven-04-0022725/be2e616e-103b-2e00-6107-001ad112e90e.jpg?w=540&h=756'),(159,'https://cdn2.yame.vn/pimg/ao-polo-seventy-seven-04-0022725/de77d7ea-8c38-0a00-f513-001ad0390e7f.jpg?w=540&h=756'),(202,'https://cdn2.yame.vn/pimg/ao-khoac-blazer-khang-khuan-it-nhan-premium-0022522/fa8c0b67-7e90-0200-dcf2-001ab948e195.jpg?w=540&h=756'),(203,'https://cdn2.yame.vn/pimg/ao-khoac-blazer-khang-khuan-it-nhan-premium-0022522/a125155f-00cd-0200-eb5a-001abade6ace.jpg?w=540&h=756'),(204,'https://cdn2.yame.vn/pimg/ao-khoac-blazer-khang-khuan-it-nhan-premium-0022522/8533cd3e-9a41-0500-fef3-001abade6ae8.jpg?w=540&h=756'),(206,'https://cdn2.yame.vn/pimg/ao-khoac-la-co-premium-19-0022531/8a7525ef-1997-0100-c478-001ab94876d9.jpg?w=540&h=756'),(207,'https://cdn2.yame.vn/pimg/ao-khoac-la-co-premium-19-0022531/eda69f7c-19ed-4200-46ef-001aba1eda35.jpg?w=540&h=756'),(208,'https://cdn2.yame.vn/pimg/ao-khoac-la-co-premium-19-0022531/16bf3258-68db-4500-94b4-001aba1eda5a.jpg?w=540&h=756'),(210,'https://cdn2.yame.vn/pimg/ao-so-mi-cuban-soi-poly-wrinkle-free-04-0022633/d2c5a4b8-c7a0-a700-856f-001ad3633138.jpg?w=540&h=756'),(211,'https://cdn2.yame.vn/pimg/ao-so-mi-cuban-soi-poly-wrinkle-free-04-0022633/a929d5b0-88c2-7100-9594-001ac2f6e200.jpg?w=540&h=756'),(212,'https://cdn2.yame.vn/pimg/ao-so-mi-cuban-soi-poly-wrinkle-free-04-0022633/315688d4-ba2e-7300-a6d7-001ac2f6e21b.jpg?w=540&h=756'),(214,'https://cdn2.yame.vn/pimg/ao-so-mi-tay-dai-soi-bamboo-wrinkle-free-07-0022472/cc23a711-98c1-1d00-1121-001ad3683133.jpg?w=540&h=756'),(215,'https://cdn2.yame.vn/pimg/ao-so-mi-tay-dai-soi-bamboo-wrinkle-free-07-0022472/bf49c9b1-3737-6f00-3366-001ac85ea64b.jpg?w=540&h=756'),(216,'https://cdn2.yame.vn/pimg/ao-so-mi-tay-dai-soi-bamboo-wrinkle-free-07-0022472/708803dd-724d-7100-1ebb-001ac85ea658.jpg?w=540&h=756');
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice` (
  `INVOICEID` bigint NOT NULL,
  `ADDRESS` varchar(255) DEFAULT NULL,
  `CITY` varchar(255) DEFAULT NULL,
  `DISCOUNT` double DEFAULT NULL,
  `DISTRICT` varchar(255) DEFAULT NULL,
  `INVOICEDATE` date DEFAULT NULL,
  `PAYMENTMETHOD` varchar(255) DEFAULT NULL,
  `SUBTOTAL` double DEFAULT NULL,
  `TOTAL` double DEFAULT NULL,
  `USER_USERID` bigint DEFAULT NULL,
  `PROMOTION_PROMOTIONCODE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`INVOICEID`),
  KEY `FK_INVOICE_PROMOTION_PROMOTIONCODE` (`PROMOTION_PROMOTIONCODE`),
  KEY `FK_INVOICE_USER_USERID` (`USER_USERID`),
  CONSTRAINT `FK_INVOICE_PROMOTION_PROMOTIONCODE` FOREIGN KEY (`PROMOTION_PROMOTIONCODE`) REFERENCES `promotioncode` (`PROMOTIONCODE`),
  CONSTRAINT `FK_INVOICE_USER_USERID` FOREIGN KEY (`USER_USERID`) REFERENCES `user` (`USERID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_lineitem`
--

DROP TABLE IF EXISTS `invoice_lineitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice_lineitem` (
  `Invoice_INVOICEID` bigint NOT NULL,
  `productList_LINEITEMID` bigint NOT NULL,
  PRIMARY KEY (`Invoice_INVOICEID`,`productList_LINEITEMID`),
  KEY `FK_INVOICE_LINEITEM_productList_LINEITEMID` (`productList_LINEITEMID`),
  CONSTRAINT `FK_INVOICE_LINEITEM_Invoice_INVOICEID` FOREIGN KEY (`Invoice_INVOICEID`) REFERENCES `invoice` (`INVOICEID`),
  CONSTRAINT `FK_INVOICE_LINEITEM_productList_LINEITEMID` FOREIGN KEY (`productList_LINEITEMID`) REFERENCES `lineitem` (`LINEITEMID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_lineitem`
--

LOCK TABLES `invoice_lineitem` WRITE;
/*!40000 ALTER TABLE `invoice_lineitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_lineitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lineitem`
--

DROP TABLE IF EXISTS `lineitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lineitem` (
  `LINEITEMID` bigint NOT NULL,
  `PRICEUNIT` bigint DEFAULT NULL,
  `QUANTITY` int DEFAULT NULL,
  `PRODUCT_PRODUCTID` int DEFAULT NULL,
  PRIMARY KEY (`LINEITEMID`),
  KEY `FK_LINEITEM_PRODUCT_PRODUCTID` (`PRODUCT_PRODUCTID`),
  CONSTRAINT `FK_LINEITEM_PRODUCT_PRODUCTID` FOREIGN KEY (`PRODUCT_PRODUCTID`) REFERENCES `shirt` (`PRODUCTID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lineitem`
--

LOCK TABLES `lineitem` WRITE;
/*!40000 ALTER TABLE `lineitem` DISABLE KEYS */;
INSERT INTO `lineitem` VALUES (151,271,2,51),(259,271,25,51),(260,271,26,51),(261,271,26,51),(262,192,1,87),(301,271,1,51);
/*!40000 ALTER TABLE `lineitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotioncode`
--

DROP TABLE IF EXISTS `promotioncode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotioncode` (
  `PROMOTIONCODE` varchar(255) NOT NULL,
  `ENDDATE` date DEFAULT NULL,
  `PROMOTIONAMOUNT` double DEFAULT NULL,
  `STARTDATE` date DEFAULT NULL,
  PRIMARY KEY (`PROMOTIONCODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotioncode`
--

LOCK TABLES `promotioncode` WRITE;
/*!40000 ALTER TABLE `promotioncode` DISABLE KEYS */;
INSERT INTO `promotioncode` VALUES ('LOALUSER2023','2023-12-21',10,'2023-11-28'),('P1-2023-NOEL','2024-01-19',15,'2023-12-06'),('PHAMQUYNHNHU','2023-12-24',30,'2023-12-06'),('TRANQUOCPHUONG','2023-12-30',40,'2023-12-06');
/*!40000 ALTER TABLE `promotioncode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence`
--

DROP TABLE IF EXISTS `sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequence` (
  `SEQ_NAME` varchar(50) NOT NULL,
  `SEQ_COUNT` decimal(38,0) DEFAULT NULL,
  PRIMARY KEY (`SEQ_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence`
--

LOCK TABLES `sequence` WRITE;
/*!40000 ALTER TABLE `sequence` DISABLE KEYS */;
INSERT INTO `sequence` VALUES ('SEQ_GEN',350);
/*!40000 ALTER TABLE `sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shirt`
--

DROP TABLE IF EXISTS `shirt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shirt` (
  `PRODUCTID` int NOT NULL,
  `PRODUCTCOLOR` varchar(255) DEFAULT NULL,
  `PRODUCTDECRIPTION` varchar(255) DEFAULT NULL,
  `PRODUCTNAME` varchar(255) DEFAULT NULL,
  `PRODUCTPRICE` bigint DEFAULT NULL,
  `PRODUCTSIZE` varchar(255) DEFAULT NULL,
  `CATEGORY_CATEGORYID` int DEFAULT NULL,
  PRIMARY KEY (`PRODUCTID`),
  KEY `FK_shirt_CATEGORY_CATEGORYID` (`CATEGORY_CATEGORYID`),
  CONSTRAINT `FK_shirt_CATEGORY_CATEGORYID` FOREIGN KEY (`CATEGORY_CATEGORYID`) REFERENCES `category` (`CATEGORYID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shirt`
--

LOCK TABLES `shirt` WRITE;
/*!40000 ALTER TABLE `shirt` DISABLE KEYS */;
INSERT INTO `shirt` VALUES (51,'BEIGE','Áo Thun Cổ Tròn Tay Ngắn Vải Cotton 4 Chiều Thoáng Mát Trơn Dáng Vừa Đơn Giản ','COOL TOUCH #51',271,'S',51),(55,'GRAY','Áo Thun Cổ Tròn Tay Ngắn Vải Cotton 4 Chiều Thoáng Mát Trơn Dáng Vừa Đơn Giản ','COOL TOUCH #55',210,'M',51),(59,'BLACK','Áo Thun Cổ Tròn Tay Ngắn Vải Cotton 4 Chiều Thoáng Mát Trơn Dáng Vừa Đơn Giản ','COOL TOUCH #59',129,'L',51),(63,'WHITE','Áo Thun Cổ Tròn Tay Ngắn Vải Cotton 4 Chiều Thoáng Mát Trơn Dáng Vừa Đơn Giản ','COOL TOUCH #63',157,'XL',51),(67,'BEIGE','Áo Polo Cổ Bẻ Tay Ngắn Vải Cotton 4 Chiều Thấm Hút Trơn Dáng Vừa Đơn Giản','COOL TOUCH #67',186,'S',54),(71,'GRAY','Áo Polo Cổ Bẻ Tay Ngắn Vải Cotton 4 Chiều Thấm Hút Trơn Dáng Vừa Đơn Giản ','COOL TOUCH #71',171,'M',54),(75,'BLACK','Áo Polo Cổ Bẻ Tay Ngắn Vải Cotton 4 Chiều Thấm Hút Trơn Dáng Vừa Đơn Giản ','COOL TOUCH #75',106,'L',54),(79,'WHITE','Áo Polo Cổ Bẻ Tay Ngắn Vải Cotton 4 Chiều Thấm Hút Trơn Dáng Vừa Đơn Giản ','COOL TOUCH #79',221,'XL',54),(83,'BEIGE','Áo Thun Cổ Tròn Tay Dài Vải Cotton 4 Chiều Co Giãn Trơn Dáng Vừa Đơn Giản','COOL TOUCH #83',127,'S',53),(87,'GRAY','Áo Thun Cổ Tròn Tay Dài Vải Cotton 4 Chiều Co Giãn Trơn Dáng Vừa Đơn Giản','COOL TOUCH #87',192,'M',53),(91,'BLACK','Áo Thun Cổ Tròn Tay Dài Vải Cotton 4 Chiều Co Giãn Trơn Dáng Vừa Đơn Giản','COOL TOUCH #91',125,'L',53),(95,'WHITE','Áo Thun Cổ Tròn Tay Dài Vải Cotton 4 Chiều Co Giãn Trơn Dáng Vừa Đơn Giản','COOL TOUCH #95',85,'XL',53),(99,'BEIGE','Áo Khoác Có Nón Vải Thun Mặc Mát Trơn Dáng Vừa Đơn Giản','COOL TOUCH #99',108,'S',55),(103,'GRAY','Áo Khoác Có Nón Vải Thun Mặc Mát Trơn Dáng Vừa Đơn Giản','COOL TOUCH #103',150,'M',55),(107,'BLACK','Áo Khoác Có Nón Vải Thun Mặc Mát Trơn Dáng Vừa Đơn Giản','COOL TOUCH #107',79,'L',55),(111,'WHITE','Áo Khoác Có Nón Vải Thun Mặc Mát Trơn Dáng Vừa Đơn Giản','COOL TOUCH #111',240,'XL',55),(115,'BEIGE','Áo Sơ Mi Cổ Bẻ Tay Ngắn Sợi Modal Ít Nhăn Trơn Dáng Rộng Đơn Giản','WRINKLE FREE #115',84,'S',52),(119,'GRAY','Áo Sơ Mi Cổ Bẻ Tay Ngắn Sợi Modal Ít Nhăn Trơn Dáng Rộng Đơn Giản','WRINKLE FREE #119',113,'M',52),(123,'BLACK','Áo Sơ Mi Cổ Bẻ Tay Ngắn Sợi Modal Ít Nhăn Trơn Dáng Rộng Đơn Giản','WRINKLE FREE #123',81,'L',52),(127,'WHITE','Áo Sơ Mi Cổ Bẻ Tay Ngắn Sợi Modal Ít Nhăn Trơn Dáng Rộng Đơn Giản','WRINKLE FREE #127',108,'XL',52),(131,'BLACK/BROWN','Áo Polo Cổ Bẻ Tay Ngắn Vải Cá Sấu 2 Chiều Thoáng Mát Phối Màu Dáng Vừa Đơn Giản','PREMIUM #131',105,'L',54),(135,'BLACK/GREEN','Áo Polo Cổ Bẻ Tay Ngắn Vải Cá Sấu 2 Chiều Thoáng Mát Phối Màu Dáng Vừa Đơn Giản','PREMIUM #135',271,'XL',54),(139,'PINK','Áo Khoác Có Nón Vải Thun Giữ Ấm Biểu Tượng Dáng Rộng Đơn Giản','PREMIUM #139',100,'L',55),(143,'BLUE','Áo Khoác Có Nón Vải Thun Giữ Ấm Biểu Tượng Dáng Rộng Đơn Giản','PREMIUM #143',100,'L',55),(152,'BEIGE','Áo Thun Cổ Tròn Tay Ngắn Vải Cotton 4 Chiều Mỏng nhẹ Trơn Dáng Vừa Đơn Giản','SEVENTY SEVEN #152',123,'S',51),(156,'GREEN','Áo Thun Cổ Tròn Tay Ngắn Vải Cotton 4 Chiều Mỏng nhẹ Trơn Dáng Vừa Đơn Giản','SEVENTY SEVEN #156',150,'L',51),(201,'BLACK','Áo Khoác Blazer Kháng Khuẩn Ít Nhăn Trơn Dáng Rộng','PREMIUM #201',292,'XL',53),(205,'BLACK/WHITE','Áo Khoác Không Nón Vải Dù Chống Nắng Phối Màu Dáng Rộng Đơn Giản','PREMIUM #205',350,'L',53),(209,'BLUE','Áo Sơ Mi Cổ Mở Tay Ngắn Sợi Modal Ít Nhăn Trơn Dáng Rộng Đơn Giản','WRINKLE FREE #209',170,'M',52),(213,'WHITE','Áo Sơ Mi Cổ Bẻ Tay Dài Sợi Tre Ít Nhăn Trơn Dáng Vừa Đơn Giản','WRINKLE FREE #213',210,'L',52);
/*!40000 ALTER TABLE `shirt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shirt_image`
--

DROP TABLE IF EXISTS `shirt_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shirt_image` (
  `Shirt_PRODUCTID` int NOT NULL,
  `images_IMAGEID` bigint NOT NULL,
  PRIMARY KEY (`Shirt_PRODUCTID`,`images_IMAGEID`),
  KEY `FK_shirt_image_images_IMAGEID` (`images_IMAGEID`),
  CONSTRAINT `FK_shirt_image_images_IMAGEID` FOREIGN KEY (`images_IMAGEID`) REFERENCES `image` (`IMAGEID`),
  CONSTRAINT `FK_shirt_image_Shirt_PRODUCTID` FOREIGN KEY (`Shirt_PRODUCTID`) REFERENCES `shirt` (`PRODUCTID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shirt_image`
--

LOCK TABLES `shirt_image` WRITE;
/*!40000 ALTER TABLE `shirt_image` DISABLE KEYS */;
INSERT INTO `shirt_image` VALUES (51,52),(51,53),(51,54),(55,56),(55,57),(55,58),(59,60),(59,61),(59,62),(63,64),(63,65),(63,66),(67,68),(67,69),(67,70),(71,72),(71,73),(71,74),(75,76),(75,77),(75,78),(79,80),(79,81),(79,82),(83,84),(83,85),(83,86),(87,88),(87,89),(87,90),(91,92),(91,93),(91,94),(95,96),(95,97),(95,98),(99,100),(99,101),(99,102),(103,104),(103,105),(103,106),(107,108),(107,109),(107,110),(111,112),(111,113),(111,114),(115,116),(115,117),(115,118),(119,120),(119,121),(119,122),(123,124),(123,125),(123,126),(127,128),(127,129),(127,130),(131,132),(131,133),(131,134),(135,136),(135,137),(135,138),(139,140),(139,141),(139,142),(143,144),(143,145),(143,146),(152,153),(152,154),(152,155),(156,157),(156,158),(156,159),(201,202),(201,203),(201,204),(205,206),(205,207),(205,208),(209,210),(209,211),(209,212),(213,214),(213,215),(213,216);
/*!40000 ALTER TABLE `shirt_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `USERID` bigint NOT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `FIRSTNAME` varchar(255) DEFAULT NULL,
  `ISADMIN` int DEFAULT NULL,
  `LASTNAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `PHONENUMBER` varchar(255) DEFAULT NULL,
  `CART_CARTID` bigint DEFAULT NULL,
  PRIMARY KEY (`USERID`),
  KEY `FK_user_CART_CARTID` (`CART_CARTID`),
  CONSTRAINT `FK_user_CART_CARTID` FOREIGN KEY (`CART_CARTID`) REFERENCES `cart` (`CARTID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'abc2@gmail.com','Admin',1,'Admin','123456','0342609928',2),(3,'abc3@gmail.com','Van A',0,'Nguyen','123456','0342609928',3),(4,'abc4@gmail.com','Van A',0,'Nguyen','123456','0342609928',4),(5,'abc5@gmail.com','Van A',0,'Nguyen','123456','0342609928',5),(6,'abc6@gmail.com','Van A',0,'Nguyen','123456','0342609928',6),(7,'abc7@gmail.com','Van A',0,'Nguyen','123456','0342609928',7),(255,'quynhnhup78@gmail.com','Phạm Quỳnh',0,'Như','123456','0937412450',256),(257,'tqp30112003@gmail.com','Trần Quốc',0,'Phương','123456','0935288524',258);
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

-- Dump completed on 2023-12-06 20:44:47
