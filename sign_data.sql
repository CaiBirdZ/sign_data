-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.5.20 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出 sign_data 的数据库结构
CREATE DATABASE IF NOT EXISTS `sign_data` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `sign_data`;


-- 导出  表 sign_data.company_data 结构
CREATE TABLE IF NOT EXISTS `company_data` (
  `cpID` varchar(50) NOT NULL,
  `cpName` varchar(50) NOT NULL,
  `cpPosLon` varchar(50) DEFAULT NULL,
  `cpPosLat` varchar(50) DEFAULT NULL,
  `cpKey` varchar(50) NOT NULL,
  `cpHQ` varchar(50) NOT NULL,
  PRIMARY KEY (`cpID`),
  KEY `cpKey` (`cpKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  sign_data.company_data 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `company_data` DISABLE KEYS */;
REPLACE INTO `company_data` (`cpID`, `cpName`, `cpPosLon`, `cpPosLat`, `cpKey`, `cpHQ`) VALUES
	('sylg123', '沈阳理工', '123.488892', '41.726366', 'sasfassaww765432gyff', '沈阳理工大学'),
	('xx123456', '信息学院', '123.48886', '41.72635', 'sasfassaww765432gyff', '沈阳理工大学');
/*!40000 ALTER TABLE `company_data` ENABLE KEYS */;


-- 导出  表 sign_data.err_record 结构
CREATE TABLE IF NOT EXISTS `err_record` (
  `jobNo` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `signDate` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `signTime` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `signOut` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `afterTime` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `afterOut` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `marks` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`jobNo`,`signDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  sign_data.err_record 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `err_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `err_record` ENABLE KEYS */;


-- 导出  表 sign_data.rootuser 结构
CREATE TABLE IF NOT EXISTS `rootuser` (
  `userNum` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `cpKey` varchar(50) NOT NULL,
  PRIMARY KEY (`userNum`),
  KEY `FK_rootuser_company_data` (`cpKey`),
  CONSTRAINT `FK_rootuser_company_data` FOREIGN KEY (`cpKey`) REFERENCES `company_data` (`cpKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  sign_data.rootuser 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `rootuser` DISABLE KEYS */;
REPLACE INTO `rootuser` (`userNum`, `password`, `cpKey`) VALUES
	('root', '123456', 'sasfassaww765432gyff'),
	('zc15734070718', 'chuang521', 'sasfassaww765432gyff');
/*!40000 ALTER TABLE `rootuser` ENABLE KEYS */;


-- 导出  表 sign_data.sylg123sign_record 结构
CREATE TABLE IF NOT EXISTS `sylg123sign_record` (
  `jobNo` varchar(16) NOT NULL,
  `signDate` varchar(20) NOT NULL,
  `signTime` varchar(20) NOT NULL,
  `signOut` varchar(20) DEFAULT NULL,
  `remark` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`jobNo`,`signDate`),
  CONSTRAINT `FK_sylg123Sign_record_user_info` FOREIGN KEY (`jobNo`) REFERENCES `user_info` (`jobNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  sign_data.sylg123sign_record 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `sylg123sign_record` DISABLE KEYS */;
REPLACE INTO `sylg123sign_record` (`jobNo`, `signDate`, `signTime`, `signOut`, `remark`) VALUES
	('sylg1403070131', '2017/01/01', '08:00:00', '17:00:00', '异常');
/*!40000 ALTER TABLE `sylg123sign_record` ENABLE KEYS */;


-- 导出  表 sign_data.user_info 结构
CREATE TABLE IF NOT EXISTS `user_info` (
  `jobNo` varchar(16) NOT NULL,
  `password` varchar(20) DEFAULT '123456',
  `emName` varchar(20) NOT NULL,
  `department` varchar(20) NOT NULL,
  `emTel` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `cpID` varchar(50) NOT NULL,
  PRIMARY KEY (`jobNo`),
  KEY `FK_user_info_company_data` (`cpID`),
  CONSTRAINT `FK_user_info_company_data` FOREIGN KEY (`cpID`) REFERENCES `company_data` (`cpID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  sign_data.user_info 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `user_info` DISABLE KEYS */;
REPLACE INTO `user_info` (`jobNo`, `password`, `emName`, `department`, `emTel`, `email`, `cpID`) VALUES
	('sylg1403070131', '123456', '张闯', '信息院', '15734070718', '1995090@qq.com', 'sylg123'),
	('sylg1564654', '123456', '支持者', '信息院', '15734071565', '11546546@qq.com', 'sylg123');
/*!40000 ALTER TABLE `user_info` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
