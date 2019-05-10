-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.41-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema drugstore
--

CREATE DATABASE IF NOT EXISTS drugstore;
USE drugstore;

--
-- Definition of table `cyclepurchase`
--

DROP TABLE IF EXISTS `cyclepurchase`;
CREATE TABLE `cyclepurchase` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(30) default NULL,
  `pCode` varchar(30) default NULL,
  `quantity` int(11) default NULL,
  `unitPrice` double default NULL,
  `totalPrice` double default NULL,
  `purchaseDate` date default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cyclepurchase`
--

/*!40000 ALTER TABLE `cyclepurchase` DISABLE KEYS */;
INSERT INTO `cyclepurchase` (`id`,`name`,`pCode`,`quantity`,`unitPrice`,`totalPrice`,`purchaseDate`) VALUES 
 (1,'Napa','1001',20,50,1000,'2018-12-04'),
 (2,'Napa Extra','1001',25,110,2750,'2018-12-04'),
 (3,'Ace Plus','1002',50,110,5500,'2018-12-05'),
 (4,'Afun ','1003',20,70,1400,'2018-12-05'),
 (5,'MaxcefTM','1004',27,65,1755,'2018-12-05'),
 (6,'Myonil®','1005',35,59,2065,'2018-12-05'),
 (7,'Cal D','1006',45,70,3150,'2018-12-06');
/*!40000 ALTER TABLE `cyclepurchase` ENABLE KEYS */;


--
-- Definition of table `cyclesales`
--

DROP TABLE IF EXISTS `cyclesales`;
CREATE TABLE `cyclesales` (
  `id` int(11) NOT NULL auto_increment,
  `cname` varchar(30) default NULL,
  `pname` varchar(30) default NULL,
  `pCode` varchar(30) default NULL,
  `quantity` int(11) default NULL,
  `unitPrice` double default NULL,
  `totalPrice` double default NULL,
  `salesDate` date default NULL,
  `pId` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `pId` (`pId`),
  CONSTRAINT `cyclesales_ibfk_1` FOREIGN KEY (`pId`) REFERENCES `cyclepurchase` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cyclesales`
--

/*!40000 ALTER TABLE `cyclesales` DISABLE KEYS */;
INSERT INTO `cyclesales` (`id`,`cname`,`pname`,`pCode`,`quantity`,`unitPrice`,`totalPrice`,`salesDate`,`pId`) VALUES 
 (1,'','Napa','1001',20,55,1100,'2018-12-04',1),
 (2,'Mostafiz','Napa','1001',2,55,110,'2018-12-05',1),
 (3,'Monir','Myonil®','1005',2,65,130,'2018-12-05',6),
 (4,'Anowae','MaxcefTM','1004',4,72,288,'2018-12-05',5),
 (5,'Manzu','Ace Plus','1002',5,121,605,'2018-12-05',3),
 (6,'Mortuza','Cal D','1006',3,77,231,'2018-12-06',7),
 (7,'Rozina','Myonil®','1005',6,65,390,'2018-12-06',6),
 (8,'Moli','Afun','1003',4,77,308,'2018-12-06',4),
 (9,'Susmi','Ace Plus','1002',5,121,605,'2018-12-06',3),
 (10,'Zubayer','MaxcefTM','1004',7,72,504,'2018-12-06',5),
 (11,'Arefeen','Ace Plus','1002',8,121,968,'2018-12-06',3),
 (12,'Mahbub','Cal D','1006',5,77,385,'2018-12-06',7);
/*!40000 ALTER TABLE `cyclesales` ENABLE KEYS */;


--
-- Definition of table `purchasesalessummary`
--

DROP TABLE IF EXISTS `purchasesalessummary`;
CREATE TABLE `purchasesalessummary` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  `pCode` varchar(30) default NULL,
  `totalQuantity` int(11) default NULL,
  `soldQuantity` int(11) default NULL,
  `availableQuantity` int(11) default NULL,
  `lastUpdate` date default NULL,
  `pId` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `pId` (`pId`),
  CONSTRAINT `purchasesalessummary_ibfk_1` FOREIGN KEY (`pId`) REFERENCES `cyclepurchase` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchasesalessummary`
--

/*!40000 ALTER TABLE `purchasesalessummary` DISABLE KEYS */;
INSERT INTO `purchasesalessummary` (`id`,`name`,`pCode`,`totalQuantity`,`soldQuantity`,`availableQuantity`,`lastUpdate`,`pId`) VALUES 
 (1,'Napa','101',20,0,20,'2018-12-04',1),
 (2,'Napa Extra','1001',25,22,3,'2018-12-05',2),
 (3,'Ace Plus','1002',50,18,32,'2018-12-06',3),
 (4,'Afun ','1003',20,4,16,'2018-12-06',4),
 (5,'MaxcefTM','1004',27,11,16,'2018-12-06',5),
 (6,'Myonil®','1005',35,8,27,'2018-12-06',6),
 (7,'Cal D','1006',45,8,37,'2018-12-06',7);
/*!40000 ALTER TABLE `purchasesalessummary` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
