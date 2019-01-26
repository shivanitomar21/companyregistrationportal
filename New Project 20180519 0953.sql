-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.73-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema vfirst
--

CREATE DATABASE IF NOT EXISTS vfirst;
USE vfirst;

--
-- Definition of table `register`
--

DROP TABLE IF EXISTS `register`;
CREATE TABLE `register` (
  `name` varchar(45) NOT NULL,
  `email` varchar(50) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `password` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `role` varchar(45) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `register`
--

/*!40000 ALTER TABLE `register` DISABLE KEYS */;
INSERT INTO `register` (`name`,`email`,`contact`,`password`,`username`,`role`) VALUES 
 ('Amisha Sharma','asharma@gmail.com','9824567898','amisha','amishasharma','IT_USER_NORMAL'),
 ('sachin tomar','isachintomer@gmail.com','8439751551','sachin','sachintomar','IT_USER_NORMAL'),
 ('shivani tomar','shivanitomarbu@gmail.com','9785977606','shivani','shivanitomar','IT_ADMIN'),
 ('Vipin Sanghvi','vsanghvi@gmail.com','7865489353','vipin','vsanghvi','IT_USER_NORMAL');
/*!40000 ALTER TABLE `register` ENABLE KEYS */;


--
-- Definition of table `user_company`
--

DROP TABLE IF EXISTS `user_company`;
CREATE TABLE `user_company` (
  `s_no` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `c_name` varchar(45) NOT NULL,
  `c_address` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL DEFAULT 'unapproved',
  `username` varchar(45) NOT NULL,
  PRIMARY KEY (`s_no`),
  KEY `FK_user_company_1` (`username`),
  CONSTRAINT `FK_user_company_1` FOREIGN KEY (`username`) REFERENCES `register` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_company`
--

/*!40000 ALTER TABLE `user_company` DISABLE KEYS */;
INSERT INTO `user_company` (`s_no`,`c_name`,`c_address`,`status`,`username`) VALUES 
 (10,'ABC Pvt. Ltd.','New Delhi','unapproved','sachintomar'),
 (12,'Sachin Constructions','Meerut','approved','sachintomar'),
 (13,'Shivi Constructions','Bangalore','unapproved','shivanitomar'),
 (14,'happy customers','panjab','unapproved','amishasharma'),
 (15,'band baaja baarat','kashmir','approved','amishasharma'),
 (16,'IBM','Delhi','approved','vsanghvi'),
 (17,'Sanghvi constructions pvt. ltd.','mumbai','unapproved','vsanghvi'),
 (18,'lemon tree','Dehradun','unapproved','shivanitomar'),
 (19,'Oreo','gurugram','unapproved','shivanitomar');
/*!40000 ALTER TABLE `user_company` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
