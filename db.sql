-- MySQL dump 10.13  Distrib 5.7.39, for Win64 (x86_64)
--
-- Host: localhost    Database: xyz
-- ------------------------------------------------------
-- Server version	5.7.39-log

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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `CustomerID` int(11) NOT NULL AUTO_INCREMENT,
  `NIK` varchar(255) NOT NULL,
  `FullName` varchar(255) DEFAULT NULL,
  `LegalName` varchar(255) DEFAULT NULL,
  `Gaji` int(11) DEFAULT NULL,
  `TanggalLahir` date DEFAULT NULL,
  `TempatLahir` varchar(255) DEFAULT NULL,
  `FotoSelfie` varchar(255) DEFAULT NULL,
  `FotoKTP` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`),
  UNIQUE KEY `NIK` (`NIK`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'1212121212','ramadhani','ramadhani',8000000,'1999-01-01','Bandung','ade.jpg','ktp_ade.jpg'),(2,'3434343434','suryadi','suryadi',9000000,'1999-02-02','Lampung','surya.jpg','ktp_surya.jpg'),(3,'56565656565','raihan warman','raihan',7000000,'1997-01-01','Padang','selfie_56565656565','ktp_56565656565.jpg');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pinjaman`
--

DROP TABLE IF EXISTS `pinjaman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pinjaman` (
  `PinjamanID` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerID` int(11) NOT NULL,
  `Saldo` int(11) DEFAULT NULL,
  `TipeTenor` int(11) DEFAULT NULL,
  `WaktuPinjam` date DEFAULT NULL,
  PRIMARY KEY (`PinjamanID`),
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `pinjaman_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pinjaman`
--

LOCK TABLES `pinjaman` WRITE;
/*!40000 ALTER TABLE `pinjaman` DISABLE KEYS */;
INSERT INTO `pinjaman` VALUES (1,1,10000000,4,NULL),(2,3,5000000,2,NULL),(3,2,7000000,3,NULL),(4,1,5000000,3,NULL),(5,1,1000000,1,NULL),(6,1,2000000,2,NULL);
/*!40000 ALTER TABLE `pinjaman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaksi`
--

DROP TABLE IF EXISTS `transaksi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaksi` (
  `TransaksiID` int(11) NOT NULL AUTO_INCREMENT,
  `PinjamanID` int(11) NOT NULL,
  `Kontrak` varchar(255) NOT NULL,
  `WaktuTransaksi` date DEFAULT NULL,
  `OTR` int(11) DEFAULT NULL,
  `AdminFee` int(11) DEFAULT NULL,
  `JumlahBunga` int(11) DEFAULT NULL,
  `jumlahCicilan` int(11) DEFAULT NULL,
  `NamaAset` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`TransaksiID`),
  UNIQUE KEY `Kontrak` (`Kontrak`),
  KEY `PinjamanID` (`PinjamanID`),
  CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`PinjamanID`) REFERENCES `pinjaman` (`PinjamanID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaksi`
--

LOCK TABLES `transaksi` WRITE;
/*!40000 ALTER TABLE `transaksi` DISABLE KEYS */;
INSERT INTO `transaksi` VALUES (1,1,'1234','2023-02-01',1000000,10000,1,255000,'Kulkas Dua Pintu'),(2,2,'2345','2023-02-01',5000000,10000,1,2527500,'Motor Supra X 2001'),(3,1,'3456','2023-02-02',1000000,10000,1,255000,'Mesin cuci tabung'),(4,3,'4567','2023-02-01',600000,10000,1,204500,'Microwave'),(5,4,'5678','2023-02-01',1500000,10000,1,507500,'Satu Set Sofa Ruang Tamu'),(6,4,'6789','2023-02-02',450000,10000,1,154000,'Kompor GAS');
/*!40000 ALTER TABLE `transaksi` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-02  0:15:02
