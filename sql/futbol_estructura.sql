-- ATENCION: este script elimina y recrea las tablas indicadas.
-- Usar solo para una instalacion nueva, no sobre una base con datos.

CREATE DATABASE IF NOT EXISTS `futbol`
  DEFAULT CHARACTER SET utf8mb4
  COLLATE utf8mb4_0900_ai_ci;

USE `futbol`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: futbol
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `codemast`
--

DROP TABLE IF EXISTS `codemast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `codemast` (
  `Type` varchar(10) NOT NULL DEFAULT '',
  `Code` varchar(10) NOT NULL DEFAULT '',
  `Description` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`Type`,`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `codetype`
--

DROP TABLE IF EXISTS `codetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `codetype` (
  `Type` varchar(10) NOT NULL DEFAULT '',
  `Description` varchar(30) NOT NULL DEFAULT '',
  `Comment` mediumtext,
  PRIMARY KEY (`Type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dflastid`
--

DROP TABLE IF EXISTS `dflastid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dflastid` (
  `UltimoID` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entrenador`
--

DROP TABLE IF EXISTS `entrenador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrenador` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(60) NOT NULL,
  `Apellido` varchar(60) NOT NULL,
  `Nacionalidad` varchar(50) DEFAULT NULL,
  `EquipoID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `uqEntrenadorApellidoID` (`Apellido`,`ID`) USING BTREE,
  UNIQUE KEY `uqEntrenadorEquipo` (`EquipoID`),
  CONSTRAINT `fk_entrenador_equipo` FOREIGN KEY (`EquipoID`) REFERENCES `equipo` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `equipo`
--

DROP TABLE IF EXISTS `equipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipo` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(120) NOT NULL,
  `LigaID` int NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `uqEquipoNombreLiga` (`LigaID`,`Nombre`),
  CONSTRAINT `fk_Equipo_LigaID` FOREIGN KEY (`LigaID`) REFERENCES `liga` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jugador`
--

DROP TABLE IF EXISTS `jugador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jugador` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(60) NOT NULL,
  `Apellido` varchar(60) NOT NULL,
  `Nacionalidad` varchar(50) DEFAULT NULL,
  `EquipoID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `uqJugadorApellidoID` (`Apellido`,`ID`) USING BTREE,
  UNIQUE KEY `uqJugadorEquipoID` (`EquipoID`,`ID`),
  CONSTRAINT `fkJugadorEquipo` FOREIGN KEY (`EquipoID`) REFERENCES `equipo` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jugadorposicion`
--

DROP TABLE IF EXISTS `jugadorposicion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jugadorposicion` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `JugadorID` int NOT NULL,
  `PosicionID` int NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `uqJugadorPosicion` (`JugadorID`,`PosicionID`),
  UNIQUE KEY `uqPosicionJugador` (`PosicionID`,`JugadorID`),
  CONSTRAINT `fkJPJugador` FOREIGN KEY (`JugadorID`) REFERENCES `jugador` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fkJPPosicion` FOREIGN KEY (`PosicionID`) REFERENCES `posicion` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liga`
--

DROP TABLE IF EXISTS `liga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `liga` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Pais` varchar(50) NOT NULL,
  `Equipos` int NOT NULL DEFAULT '0',
  `EquiposMax` int NOT NULL DEFAULT '20',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `uqLigaNombrePais` (`Nombre`,`Pais`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `posicion`
--

DROP TABLE IF EXISTS `posicion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posicion` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `uqPosicionNombre` (`Nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `webappserverprops`
--

DROP TABLE IF EXISTS `webappserverprops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webappserverprops` (
  `Key` varchar(64) NOT NULL DEFAULT '',
  `CreateDate` date NOT NULL DEFAULT '0001-01-01',
  `CreateTime` varchar(12) NOT NULL DEFAULT '',
  `ExpiresDate` date NOT NULL DEFAULT '0001-01-01',
  `ExpiresTime` varchar(12) NOT NULL DEFAULT '',
  `Locked` smallint NOT NULL DEFAULT '0',
  `LockedDate` date NOT NULL DEFAULT '0001-01-01',
  `LockedTime` varchar(12) NOT NULL DEFAULT '',
  `Page` smallint NOT NULL DEFAULT '0',
  `Pages` smallint NOT NULL DEFAULT '0',
  `Data` mediumtext,
  PRIMARY KEY (`Key`,`Page`),
  UNIQUE KEY `WebAppServerProps002` (`ExpiresDate` DESC,`ExpiresTime` DESC,`Key`,`Page`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `webappsession`
--

DROP TABLE IF EXISTS `webappsession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webappsession` (
  `SessionKey` varchar(36) NOT NULL DEFAULT '',
  `CreateDate` date NOT NULL DEFAULT '0001-01-01',
  `CreateTime` varchar(8) NOT NULL DEFAULT '',
  `LastAccessDate` date NOT NULL DEFAULT '0001-01-01',
  `LastAccessTime` varchar(8) NOT NULL DEFAULT '',
  `UseCount` int NOT NULL DEFAULT '0',
  `RemoteAddress` varchar(57) NOT NULL DEFAULT '',
  `LoginName` varchar(20) NOT NULL DEFAULT '',
  `Active` varchar(1) NOT NULL DEFAULT '',
  PRIMARY KEY (`SessionKey`),
  UNIQUE KEY `WebAppSession002` (`CreateDate`,`CreateTime`,`SessionKey`),
  UNIQUE KEY `WebAppSession003` (`LastAccessDate`,`LastAccessTime`,`SessionKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `webappuser`
--

DROP TABLE IF EXISTS `webappuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webappuser` (
  `LoginName` varchar(20) NOT NULL DEFAULT '',
  `Password` varchar(128) NOT NULL DEFAULT '',
  `Rights` smallint NOT NULL DEFAULT '0',
  `FullName` varchar(30) NOT NULL DEFAULT '',
  `LastLogin` date NOT NULL DEFAULT '0001-01-01',
  PRIMARY KEY (`LoginName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-10 17:26:30
