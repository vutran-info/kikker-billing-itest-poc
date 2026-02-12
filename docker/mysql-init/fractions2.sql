/*
 Navicat Premium Dump SQL

 Source Server         : Kikker PROD - DataMigration
 Source Server Type    : MySQL
 Source Server Version : 80040 (8.0.40-google)
 Source Host           : 35.204.117.84:3306
 Source Schema         : fractions2

 Target Server Type    : MySQL
 Target Server Version : 80040 (8.0.40-google)
 File Encoding         : 65001

 Date: 12/02/2026 16:36:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for elkdynamicfraction
-- ----------------------------
DROP TABLE IF EXISTS `elkdynamicfraction`;
CREATE TABLE `elkdynamicfraction` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CalendarDate` date NOT NULL,
  `GridArea` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Quality` varchar(10) COLLATE utf8mb3_unicode_ci NOT NULL,
  `Position` int NOT NULL,
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
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=341473 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

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
  `GridArea` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Quality` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Year` decimal(4,0) NOT NULL,
  `Month` decimal(2,0) NOT NULL,
  `Day` decimal(2,0) NOT NULL,
  `PoD` decimal(3,0) NOT NULL,
  `PoY` decimal(6,0) NOT NULL,
  `HoD` decimal(2,0) NOT NULL,
  `HoY` decimal(4,0) NOT NULL,
  `DoY` decimal(3,0) NOT NULL,
  `OnPeak` tinyint NOT NULL DEFAULT '1',
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
  UNIQUE KEY `DateGridAreaPositionQuality` (`CalendarDate`,`Quality`,`PoD`,`GridArea`),
  KEY `CestFromIndex` (`CestFrom`),
  KEY `CestUntilIndex` (`CestUntil`),
  KEY `CestFromUntilIndex` (`CestFrom`,`CestUntil`),
  KEY `CalendarDateIndex` (`CalendarDate`),
  KEY `QualityIndex` (`Quality`),
  KEY `CalendarDateQualityIndex` (`CalendarDate`,`Quality`),
  KEY `CestFromUntilQuality` (`CestFrom`,`CestUntil`,`Quality`)
) ENGINE=InnoDB AUTO_INCREMENT=4612309 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for elkfractionold
-- ----------------------------
DROP TABLE IF EXISTS `elkfractionold`;
CREATE TABLE `elkfractionold` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Cet` datetime DEFAULT NULL,
  `CestFrom` datetime DEFAULT NULL,
  `CestUntil` datetime DEFAULT NULL,
  `E1A` decimal(9,8) DEFAULT NULL,
  `E1B` decimal(9,8) DEFAULT NULL,
  `E1C` decimal(9,8) DEFAULT NULL,
  `E2A` decimal(9,8) DEFAULT NULL,
  `E2B` decimal(9,8) DEFAULT NULL,
  `E3A` decimal(9,8) DEFAULT NULL,
  `E3B` decimal(9,8) DEFAULT NULL,
  `E3C` decimal(9,8) DEFAULT NULL,
  `E3D` decimal(9,8) DEFAULT NULL,
  `E4A` decimal(9,8) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=210337 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=43825 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=43825 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=43825 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=43825 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=43850 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Procedure structure for dailyFractionsWithGridAreaNightOffPeak
-- ----------------------------
DROP PROCEDURE IF EXISTS `dailyFractionsWithGridAreaNightOffPeak`;
delimiter ;;
CREATE PROCEDURE `dailyFractionsWithGridAreaNightOffPeak`(fromdate varchar(25), untildate varchar(25), gridarea varchar(25))
BEGIN
SELECT t.CalendarDate as CalendarDate, t.GridArea as GridArea, t.Quality as Quality, t.offPeakValue as OffPeak,  SUM(t.usageValue) as FractionUsage, SUM(t.productionValue) as FractionProduction
FROM
    (SELECT CalendarDate, HoD, GridArea, Quality, OffPeakNight as offPeakValue,   E2B_AMI_A as usageValue, E2B_AMI_I as productionValue,
            @quality_rank:=IF(@current_date = CalendarDate AND @current_hour = HoD, @quality_rank + 1, 1) AS quality_rank,
            @current_date:=CalendarDate,
            @current_hour:=HoD
    FROM
        elkfraction
    JOIN (SELECT @current_date:=NULL, @current_hour:=NULL, @quality_rank:=0) r
    WHERE
        CalendarDate BETWEEN fromdate AND untildate AND (GridArea = gridarea OR GridArea IS NULL) ORDER BY CalendarDate , HoD , GridArea IS NULL , FIELD(Quality, 'DYN', 'FBL', 'FBR', 'STD')) t
WHERE
    t.quality_rank = 1
    GROUP BY t.CalendarDate, t.GridArea, t.offPeakValue,  t.Quality
ORDER BY CalendarDate;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
