/*
 Navicat Premium Dump SQL

 Source Server         : Kikker PROD - DataMigration
 Source Server Type    : MySQL
 Source Server Version : 80040 (8.0.40-google)
 Source Host           : 35.204.117.84:3306
 Source Schema         : fractions3

 Target Server Type    : MySQL
 Target Server Version : 80040 (8.0.40-google)
 File Encoding         : 65001

 Date: 12/02/2026 16:35:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for caloricfactors
-- ----------------------------
DROP TABLE IF EXISTS `caloricfactors`;
CREATE TABLE `caloricfactors` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `GridArea` varchar(20) COLLATE utf8mb3_bin DEFAULT NULL,
  `YearMonth` int DEFAULT NULL,
  `Year` int DEFAULT NULL,
  `Month` int DEFAULT NULL,
  `Value` decimal(12,10) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `GridYearMonth` (`GridArea`,`YearMonth`)
) ENGINE=InnoDB AUTO_INCREMENT=7818 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- ----------------------------
-- Table structure for dynamic
-- ----------------------------
DROP TABLE IF EXISTS `dynamic`;
CREATE TABLE `dynamic` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CalendarDate` date NOT NULL,
  `GridArea` varchar(20) COLLATE utf8mb3_bin DEFAULT NULL,
  `Quality` int NOT NULL DEFAULT '0',
  `Profile` varchar(10) COLLATE utf8mb3_bin NOT NULL,
  `Direction` int NOT NULL,
  `Consumption` int NOT NULL,
  `Position` tinyint NOT NULL,
  `Fraction` decimal(10,8) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `CalendarDay` (`CalendarDate`),
  KEY `CalendarGridArea` (`CalendarDate`,`GridArea`),
  KEY `GridArea` (`GridArea`),
  KEY `CalendarGridAreaProfileConsumption` (`CalendarDate`,`GridArea`,`Profile`,`Consumption`)
) ENGINE=InnoDB AUTO_INCREMENT=41276709 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- ----------------------------
-- Table structure for dynamicbest
-- ----------------------------
DROP TABLE IF EXISTS `dynamicbest`;
CREATE TABLE `dynamicbest` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CalendarDate` date NOT NULL,
  `GridArea` varchar(20) COLLATE utf8mb3_bin DEFAULT NULL,
  `Quality` int NOT NULL DEFAULT '0',
  `Profile` varchar(10) COLLATE utf8mb3_bin NOT NULL,
  `Direction` int NOT NULL,
  `Consumption` int NOT NULL,
  `Position` tinyint NOT NULL,
  `Fraction` decimal(10,8) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `CalendarDay` (`CalendarDate`),
  KEY `CalendarGridArea` (`CalendarDate`,`GridArea`),
  KEY `GridArea` (`GridArea`),
  KEY `CalendarGridAreaProfileConsumption` (`CalendarDate`,`GridArea`,`Profile`,`Consumption`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- ----------------------------
-- Table structure for dynamicdaily
-- ----------------------------
DROP TABLE IF EXISTS `dynamicdaily`;
CREATE TABLE `dynamicdaily` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CalendarDate` date NOT NULL,
  `GridArea` varchar(20) COLLATE utf8mb3_bin DEFAULT NULL,
  `Quality` int NOT NULL DEFAULT '0',
  `Profile` varchar(10) COLLATE utf8mb3_bin NOT NULL,
  `Direction` int NOT NULL,
  `Consumption` int NOT NULL,
  `OffPeak` tinyint DEFAULT NULL,
  `Fraction` decimal(10,8) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- ----------------------------
-- Table structure for elkdaily
-- ----------------------------
DROP TABLE IF EXISTS `elkdaily`;
CREATE TABLE `elkdaily` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `IndexDate` mediumint NOT NULL,
  `Profile` tinyint NOT NULL,
  `Direction` tinyint NOT NULL DEFAULT '1',
  `Production` tinyint NOT NULL DEFAULT '1',
  `OnPeak` tinyint NOT NULL DEFAULT '0',
  `Fraction` decimal(10,8) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IndexDate` (`IndexDate`)
) ENGINE=InnoDB AUTO_INCREMENT=62181 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for elkdailygrid
-- ----------------------------
DROP TABLE IF EXISTS `elkdailygrid`;
CREATE TABLE `elkdailygrid` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `IndexDate` mediumint NOT NULL,
  `IndexGPC` smallint NOT NULL,
  `Direction` tinyint NOT NULL DEFAULT '1',
  `OnPeak` tinyint NOT NULL DEFAULT '0',
  `Quality` tinyint NOT NULL DEFAULT '99',
  `Fraction` decimal(10,8) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IndexDate` (`IndexDate`),
  KEY `IndexGPC` (`IndexGPC`),
  KEY `DateGPC` (`IndexGPC`,`IndexDate`)
) ENGINE=InnoDB AUTO_INCREMENT=1057081 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for elkflat
-- ----------------------------
DROP TABLE IF EXISTS `elkflat`;
CREATE TABLE `elkflat` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `IndexDate` mediumint NOT NULL,
  `Profile` tinyint NOT NULL,
  `Direction` tinyint NOT NULL DEFAULT '1',
  `Production` tinyint NOT NULL DEFAULT '1',
  `PoD` tinyint NOT NULL,
  `HoD` tinyint NOT NULL,
  `OnPeak` tinyint NOT NULL DEFAULT '0',
  `Fraction` decimal(10,8) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `unique` (`IndexDate`,`Profile`,`Direction`,`Production`,`PoD`,`HoD`),
  KEY `IndexDate` (`IndexDate`)
) ENGINE=InnoDB AUTO_INCREMENT=4206722 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for elkflatgrid
-- ----------------------------
DROP TABLE IF EXISTS `elkflatgrid`;
CREATE TABLE `elkflatgrid` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `IndexDate` mediumint NOT NULL,
  `IndexGPC` smallint NOT NULL,
  `Direction` tinyint NOT NULL DEFAULT '1',
  `PoD` tinyint NOT NULL,
  `HoD` tinyint NOT NULL,
  `OnPeak` tinyint NOT NULL DEFAULT '0',
  `Quality` tinyint NOT NULL DEFAULT '99',
  `Fraction` decimal(10,8) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IndexDate` (`IndexDate`),
  KEY `IndexGPC` (`IndexGPC`),
  KEY `DateGPC` (`IndexGPC`,`IndexDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for elkfraction
-- ----------------------------
DROP TABLE IF EXISTS `elkfraction`;
CREATE TABLE `elkfraction` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Cet` datetime NOT NULL,
  `CestFrom` datetime NOT NULL,
  `CestUntil` datetime NOT NULL,
  `CalendarDate` date NOT NULL,
  `Year` int NOT NULL,
  `Month` int NOT NULL,
  `Day` int NOT NULL,
  `PoD` int NOT NULL,
  `PoY` int NOT NULL,
  `HoD` int NOT NULL,
  `HoY` int NOT NULL,
  `DoY` int NOT NULL,
  `OffPeakNight` tinyint NOT NULL DEFAULT '0',
  `OffPeakEvening` tinyint NOT NULL DEFAULT '0',
  `E1A_AZI_A` decimal(10,8) NOT NULL,
  `E1A_AZI_I` decimal(10,8) NOT NULL,
  `E1A_AMI_A` decimal(10,8) NOT NULL,
  `E1A_AMI_I` decimal(10,8) NOT NULL,
  `E1B_AZI_A` decimal(10,8) NOT NULL,
  `E1B_AZI_I` decimal(10,8) NOT NULL,
  `E1B_AMI_A` decimal(10,8) NOT NULL,
  `E1B_AMI_I` decimal(10,8) NOT NULL,
  `E1C_AZI_A` decimal(10,8) NOT NULL,
  `E1C_AZI_I` decimal(10,8) NOT NULL,
  `E1C_AMI_A` decimal(10,8) NOT NULL,
  `E1C_AMI_I` decimal(10,8) NOT NULL,
  `E2A_AZI_A` decimal(10,8) NOT NULL,
  `E2A_AZI_I` decimal(10,8) NOT NULL,
  `E2A_AMI_A` decimal(10,8) NOT NULL,
  `E2A_AMI_I` decimal(10,8) NOT NULL,
  `E2B_AZI_A` decimal(10,8) NOT NULL,
  `E2B_AZI_I` decimal(10,8) NOT NULL,
  `E2B_AMI_A` decimal(10,8) NOT NULL,
  `E2B_AMI_I` decimal(10,8) NOT NULL,
  `E3A_A` decimal(10,8) NOT NULL,
  `E3A_I` decimal(10,8) NOT NULL,
  `E3B_A` decimal(10,8) NOT NULL,
  `E3B_I` decimal(10,8) NOT NULL,
  `E3C_A` decimal(10,8) NOT NULL,
  `E3C_I` decimal(10,8) NOT NULL,
  `E3D_A` decimal(10,8) NOT NULL,
  `E3D_I` decimal(10,8) NOT NULL,
  `E4A_A` decimal(10,8) NOT NULL,
  `E4A_I` decimal(10,8) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `DateGridAreaPositionQuality` (`CalendarDate`,`PoD`),
  KEY `CestFromIndex` (`CestFrom`),
  KEY `CestUntilIndex` (`CestUntil`),
  KEY `CestFromUntilIndex` (`CestFrom`,`CestUntil`),
  KEY `CalendarDateIndex` (`CalendarDate`),
  KEY `CalendarDateQualityIndex` (`CalendarDate`),
  KEY `CestFromUntilQuality` (`CestFrom`,`CestUntil`)
) ENGINE=InnoDB AUTO_INCREMENT=175302 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for elkhourly
-- ----------------------------
DROP TABLE IF EXISTS `elkhourly`;
CREATE TABLE `elkhourly` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `IndexDate` mediumint NOT NULL,
  `Profile` tinyint NOT NULL,
  `Direction` tinyint NOT NULL DEFAULT '1',
  `Production` tinyint NOT NULL DEFAULT '1',
  `HoD` tinyint NOT NULL,
  `OnPeak` tinyint NOT NULL DEFAULT '0',
  `Fraction` decimal(10,8) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IndexDate` (`IndexDate`)
) ENGINE=InnoDB AUTO_INCREMENT=1051681 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for elkhourlygrid
-- ----------------------------
DROP TABLE IF EXISTS `elkhourlygrid`;
CREATE TABLE `elkhourlygrid` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `IndexDate` mediumint NOT NULL,
  `IndexGPC` smallint NOT NULL,
  `Direction` tinyint NOT NULL DEFAULT '1',
  `HoD` tinyint NOT NULL,
  `OnPeak` tinyint NOT NULL DEFAULT '0',
  `Quality` tinyint NOT NULL DEFAULT '99',
  `Fraction` decimal(10,8) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IndexDate` (`IndexDate`),
  KEY `IndexGPC` (`IndexGPC`),
  KEY `DateGPC` (`IndexGPC`,`IndexDate`)
) ENGINE=InnoDB AUTO_INCREMENT=17966653 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for elkispgrid
-- ----------------------------
DROP TABLE IF EXISTS `elkispgrid`;
CREATE TABLE `elkispgrid` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `IndexDate` mediumint NOT NULL,
  `IndexGPC` smallint NOT NULL,
  `Direction` tinyint NOT NULL DEFAULT '1',
  `Isp` tinyint NOT NULL,
  `OnPeak` tinyint NOT NULL DEFAULT '0',
  `Quality` tinyint NOT NULL DEFAULT '99',
  `Fraction` decimal(10,8) NOT NULL,
  PRIMARY KEY (`Id`,`IndexGPC`),
  UNIQUE KEY `Unique_GPC_Date_Direction_Isp` (`IndexDate`,`IndexGPC`,`Direction`,`Isp`),
  KEY `IndexDate` (`IndexDate`),
  KEY `IndexGPC` (`IndexGPC`),
  KEY `DateGPC` (`IndexGPC`,`IndexDate`)
) ENGINE=InnoDB AUTO_INCREMENT=38570683 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50100 PARTITION BY RANGE (`IndexGPC`)
(PARTITION part0 VALUES LESS THAN (12000) ENGINE = InnoDB,
 PARTITION part1 VALUES LESS THAN (13000) ENGINE = InnoDB,
 PARTITION part2 VALUES LESS THAN (14000) ENGINE = InnoDB,
 PARTITION part3 VALUES LESS THAN (15000) ENGINE = InnoDB,
 PARTITION part4 VALUES LESS THAN (16000) ENGINE = InnoDB,
 PARTITION part5 VALUES LESS THAN (22000) ENGINE = InnoDB,
 PARTITION part6 VALUES LESS THAN (23000) ENGINE = InnoDB,
 PARTITION part7 VALUES LESS THAN (24000) ENGINE = InnoDB,
 PARTITION part8 VALUES LESS THAN (25000) ENGINE = InnoDB,
 PARTITION part9 VALUES LESS THAN (26000) ENGINE = InnoDB) */;

-- ----------------------------
-- Table structure for gasfraction
-- ----------------------------
DROP TABLE IF EXISTS `gasfraction`;
CREATE TABLE `gasfraction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cet` datetime DEFAULT NULL,
  `cestfrom` datetime DEFAULT NULL,
  `cestuntil` datetime DEFAULT NULL,
  `quality` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT 'STD',
  `g1afraction` decimal(13,10) DEFAULT NULL,
  `g2afraction` decimal(13,10) DEFAULT NULL,
  `g2cfraction` decimal(13,10) DEFAULT NULL,
  `calendarday` date DEFAULT NULL,
  `year` int DEFAULT NULL,
  `month` int DEFAULT NULL,
  `day` int DEFAULT NULL,
  `docy` int DEFAULT NULL,
  `dogy` int DEFAULT NULL,
  `hocd` int DEFAULT NULL,
  `hogd` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70129 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for gasfractionoriginal
-- ----------------------------
DROP TABLE IF EXISTS `gasfractionoriginal`;
CREATE TABLE `gasfractionoriginal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cet` datetime DEFAULT NULL,
  `cestfrom` datetime DEFAULT NULL,
  `cestuntil` datetime DEFAULT NULL,
  `calendarday` date DEFAULT NULL,
  `quality` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT 'STD',
  `year` int DEFAULT NULL,
  `month` int DEFAULT NULL,
  `day` int DEFAULT NULL,
  `docy` int DEFAULT NULL,
  `dogy` int DEFAULT NULL,
  `hocd` int DEFAULT NULL,
  `hogd` int DEFAULT NULL,
  `g1afraction` decimal(13,10) DEFAULT NULL,
  `g2afraction` decimal(13,10) DEFAULT NULL,
  `g2cfraction` decimal(13,10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70129 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for gasprofile
-- ----------------------------
DROP TABLE IF EXISTS `gasprofile`;
CREATE TABLE `gasprofile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cet` datetime DEFAULT NULL,
  `cestfrom` datetime DEFAULT NULL,
  `cestuntil` datetime DEFAULT NULL,
  `g1atst` decimal(13,10) DEFAULT NULL,
  `g1arer` decimal(13,10) DEFAULT NULL,
  `g1atop` decimal(13,10) DEFAULT NULL,
  `g2atst` decimal(13,10) DEFAULT NULL,
  `g2arer` decimal(13,10) DEFAULT NULL,
  `g2atop` decimal(13,10) DEFAULT NULL,
  `g2ctst` decimal(13,10) DEFAULT NULL,
  `g2crer` decimal(13,10) DEFAULT NULL,
  `g2ctop` decimal(13,10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70129 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for gasspt
-- ----------------------------
DROP TABLE IF EXISTS `gasspt`;
CREATE TABLE `gasspt` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cet` datetime DEFAULT NULL,
  `cestfrom` datetime DEFAULT NULL,
  `cestuntil` datetime DEFAULT NULL,
  `spt` decimal(13,10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70129 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for solar
-- ----------------------------
DROP TABLE IF EXISTS `solar`;
CREATE TABLE `solar` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Cet` datetime NOT NULL,
  `CestFrom` datetime NOT NULL,
  `CestUntil` datetime NOT NULL,
  `Fraction` decimal(10,8) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=140161 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for tinfo
-- ----------------------------
DROP TABLE IF EXISTS `tinfo`;
CREATE TABLE `tinfo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `validfrom` datetime DEFAULT NULL,
  `validuntil` datetime DEFAULT NULL,
  `temperature` decimal(13,10) DEFAULT NULL,
  `messageid` varchar(45) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `zoneeancode` varchar(45) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `wholesaleprocessversion` varchar(45) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57976 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

SET FOREIGN_KEY_CHECKS = 1;
