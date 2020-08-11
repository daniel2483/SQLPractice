CREATE DATABASE  IF NOT EXISTS `archivos_cr` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `archivos_cr`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: 192.168.25.200    Database: archivos_cr
-- ------------------------------------------------------
-- Server version	5.1.61-0ubuntu0.10.10.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `email_notifica`
--

DROP TABLE IF EXISTS `email_notifica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_notifica` (
  `idEmail` int(11) NOT NULL AUTO_INCREMENT,
  `proceso` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idEmail`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `estado_informe`
--

DROP TABLE IF EXISTS `estado_informe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado_informe` (
  `idEstado` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idEstado`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `preventivos_archivos`
--

DROP TABLE IF EXISTS `preventivos_archivos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preventivos_archivos` (
  `averiaId` int(11) NOT NULL DEFAULT '0',
  `nombre` varchar(255) DEFAULT NULL,
  `extension` varchar(255) DEFAULT NULL,
  `archivo` mediumblob,
  `fecha` datetime DEFAULT NULL,
  `idUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`averiaId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `preventivos_datos_archivo`
--

DROP TABLE IF EXISTS `preventivos_datos_archivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preventivos_datos_archivo` (
  `averiaId` int(11) NOT NULL DEFAULT '0',
  `idEstado` int(11) NOT NULL DEFAULT '0',
  `userAprueba` int(11) DEFAULT NULL,
  `userSube` int(11) DEFAULT NULL,
  `asp` varchar(255) DEFAULT NULL,
  `fechaIni` datetime DEFAULT '0000-00-00 00:00:00',
  `fechaSubida` datetime DEFAULT '0000-00-00 00:00:00',
  `fechaAprob` datetime DEFAULT '0000-00-00 00:00:00',
  `fechaRechaza` datetime DEFAULT '0000-00-00 00:00:00',
  `obs` varchar(500) DEFAULT NULL,
  `obsAsp` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`averiaId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'archivos_cr'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-12-13 14:02:46
