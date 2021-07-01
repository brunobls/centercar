CREATE DATABASE  IF NOT EXISTS `centercar` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `centercar`;
-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: centercar
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `modelo`
--

DROP TABLE IF EXISTS `modelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modelo` (
  `id` varchar(300) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `marca` varchar(100) NOT NULL,
  `ano` int NOT NULL,
  `cor` varchar(45) NOT NULL,
  `estoque` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelo`
--

LOCK TABLES `modelo` WRITE;
/*!40000 ALTER TABLE `modelo` DISABLE KEYS */;
INSERT INTO `modelo` VALUES ('0ead0780-d6df-11eb-b8bc-0242ac130003','Argo','Fiat',2021,'Preto',0),('0ead09ec-d6df-11eb-b8bc-0242ac130003','Mobi','Fiat',2020,'Branco',0),('704965f0-d870-11eb-b8bc-0242ac130003','Cronos','Fiat',2019,'Preto',0),('7049683e-d870-11eb-b8bc-0242ac130003','Ducato','Fiat',2021,'Vermelho',0),('7049692e-d870-11eb-b8bc-0242ac130003','Fiorino','Fiat',2020,'Preto',0),('70496a00-d870-11eb-b8bc-0242ac130003','Toro','Fiat',2018,'Branco',0),('70496c3a-d870-11eb-b8bc-0242ac130003','Uno','Fiat',2017,'Vermelho',0),('70496cf8-d870-11eb-b8bc-0242ac130003','Strada','Fiat',2019,'Preto',0),('70496dac-d870-11eb-b8bc-0242ac130003','Ka','Ford',2021,'Vermelho',0),('70496e60-d870-11eb-b8bc-0242ac130003','Edge','Ford',2020,'Branco',0),('70496f1e-d870-11eb-b8bc-0242ac130003','Ecosport','Ford',2021,'Preto',0),('70496fd2-d870-11eb-b8bc-0242ac130003','Mustang','Ford',2015,'Branco',0),('704971da-d870-11eb-b8bc-0242ac130003','Ranger','Ford',2019,'Vermelho',0),('704972a2-d870-11eb-b8bc-0242ac130003','Focus','Ford',2020,'Preto',0),('70497356-d870-11eb-b8bc-0242ac130003','Fiesta','Ford',2021,'Vermelho',0),('7049740a-d870-11eb-b8bc-0242ac130003','Fox','Volkswagen',2018,'Branco',0),('704974c8-d870-11eb-b8bc-0242ac130003','Gol','Volkswagen',2020,'Preto',0),('7049757c-d870-11eb-b8bc-0242ac130003','Golf','Volkswagen',2019,'Cinza',0),('70497626-d870-11eb-b8bc-0242ac130003','Polo','Volkswagen',2021,'Preto',0),('70497824-d870-11eb-b8bc-0242ac130003','Jetta','Volkswagen',2020,'Cinza',0),('704978d8-d870-11eb-b8bc-0242ac130003','Saveiro','Volkswagen',2019,'Azul',0),('70497996-d870-11eb-b8bc-0242ac130003','Amarok','Volkswagen',2018,'Branco',0);
/*!40000 ALTER TABLE `modelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veiculo`
--

DROP TABLE IF EXISTS `veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veiculo` (
  `id` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `modelo_id` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `placa` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `chassi` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `valor` decimal(20,2) NOT NULL,
  `data_compra` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veiculo`
--

LOCK TABLES `veiculo` WRITE;
/*!40000 ALTER TABLE `veiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `veiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venda`
--

DROP TABLE IF EXISTS `venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venda` (
  `id` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `data` datetime NOT NULL,
  `veiculo_id` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `valor` decimal(20,2) NOT NULL,
  `comissao_vendedor` decimal(20,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda`
--

LOCK TABLES `venda` WRITE;
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
/*!40000 ALTER TABLE `venda` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-01 15:38:06
