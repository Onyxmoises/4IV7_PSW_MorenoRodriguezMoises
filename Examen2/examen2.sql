-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: examen2
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
-- Table structure for table `alumno`
--

DROP TABLE IF EXISTS `alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumno` (
  `alu_boleta` int NOT NULL,
  `alu_nombre` varchar(50) NOT NULL,
  `alu_appat` varchar(50) NOT NULL,
  `alu_apmat` varchar(50) NOT NULL,
  `alu_sexo` varchar(10) NOT NULL,
  `alu_fechaN` varchar(10) NOT NULL,
  `alu_grupo` varchar(5) NOT NULL,
  `alu_correo` varchar(50) NOT NULL,
  `sem_num_alu` int DEFAULT NULL,
  PRIMARY KEY (`alu_boleta`),
  KEY `fk_sem_alu` (`sem_num_alu`),
  CONSTRAINT `fk_sem_alu` FOREIGN KEY (`sem_num_alu`) REFERENCES `semestre` (`sem_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno`
--

LOCK TABLES `alumno` WRITE;
/*!40000 ALTER TABLE `alumno` DISABLE KEYS */;
/*!40000 ALTER TABLE `alumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asignatura`
--

DROP TABLE IF EXISTS `asignatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asignatura` (
  `asi_id` int NOT NULL AUTO_INCREMENT,
  `asi_nombre` varchar(50) DEFAULT NULL,
  `sem_num_asi` int DEFAULT NULL,
  PRIMARY KEY (`asi_id`),
  KEY `fk_sem_asi` (`sem_num_asi`),
  CONSTRAINT `fk_sem_asi` FOREIGN KEY (`sem_num_asi`) REFERENCES `semestre` (`sem_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignatura`
--

LOCK TABLES `asignatura` WRITE;
/*!40000 ALTER TABLE `asignatura` DISABLE KEYS */;
INSERT INTO `asignatura` VALUES (1,'POO',3),(2,'LPTI I',3),(3,'APTI I',3),(4,'PSW',4),(5,'LPTI II',4),(6,'BD',4),(7,'APTI II',4),(8,'TPPC',4),(9,'SWA',5),(10,'LPTI III',5),(11,'IIP',5),(12,'ISD',5),(13,'AP',5),(14,'MAP',6),(15,'LPTI IV',6),(16,'SS',6),(17,'ISB',6);
/*!40000 ALTER TABLE `asignatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipor`
--

DROP TABLE IF EXISTS `equipor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipor` (
  `equ_id` int NOT NULL AUTO_INCREMENT,
  `equ_serie` varchar(20) DEFAULT NULL,
  `equ_numEti` varchar(10) DEFAULT NULL,
  `equ_lab` varchar(6) DEFAULT NULL,
  `equ_asig` varchar(50) DEFAULT NULL,
  `alu_boleta_equ` int DEFAULT NULL,
  PRIMARY KEY (`equ_id`),
  KEY `fk_alu_equ` (`alu_boleta_equ`),
  CONSTRAINT `fk_alu_equ` FOREIGN KEY (`alu_boleta_equ`) REFERENCES `alumno` (`alu_boleta`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipor`
--

LOCK TABLES `equipor` WRITE;
/*!40000 ALTER TABLE `equipor` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporte`
--

DROP TABLE IF EXISTS `reporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reporte` (
  `rep_id` int NOT NULL AUTO_INCREMENT,
  `rep_fecha` varchar(10) DEFAULT NULL,
  `rep_hora` varchar(5) DEFAULT NULL,
  `rep_descripcion` varchar(100) DEFAULT NULL,
  `alu_boleta_rep` int DEFAULT NULL,
  `equ_id_rep` int DEFAULT NULL,
  PRIMARY KEY (`rep_id`),
  KEY `fk_alu_rep` (`alu_boleta_rep`),
  KEY `fk_equ_rep` (`equ_id_rep`),
  CONSTRAINT `fk_alu_rep` FOREIGN KEY (`alu_boleta_rep`) REFERENCES `alumno` (`alu_boleta`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_equ_rep` FOREIGN KEY (`equ_id_rep`) REFERENCES `equipor` (`equ_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporte`
--

LOCK TABLES `reporte` WRITE;
/*!40000 ALTER TABLE `reporte` DISABLE KEYS */;
/*!40000 ALTER TABLE `reporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semestre`
--

DROP TABLE IF EXISTS `semestre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `semestre` (
  `sem_num` int NOT NULL,
  PRIMARY KEY (`sem_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semestre`
--

LOCK TABLES `semestre` WRITE;
/*!40000 ALTER TABLE `semestre` DISABLE KEYS */;
INSERT INTO `semestre` VALUES (3),(4),(5),(6);
/*!40000 ALTER TABLE `semestre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `usu_id` int NOT NULL AUTO_INCREMENT,
  `usu_password` varchar(20) DEFAULT NULL,
  `alu_boleta_usu` int DEFAULT NULL,
  PRIMARY KEY (`usu_id`),
  KEY `fk_alu_usu` (`alu_boleta_usu`),
  CONSTRAINT `fk_alu_usu` FOREIGN KEY (`alu_boleta_usu`) REFERENCES `alumno` (`alu_boleta`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-18 21:04:16
