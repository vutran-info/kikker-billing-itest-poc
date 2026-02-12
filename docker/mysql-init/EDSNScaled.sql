/*
 Navicat Premium Dump SQL

 Source Server         : Kikker UAT DataMigration
 Source Server Type    : MySQL
 Source Server Version : 80407 (8.4.7-google)
 Source Host           : 35.204.58.137:3306
 Source Schema         : EDSNScaled

 Target Server Type    : MySQL
 Target Server Version : 80407 (8.4.7-google)
 File Encoding         : 65001

 Date: 12/02/2026 16:07:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ContractLosses
-- ----------------------------
DROP TABLE IF EXISTS `ContractLosses`;
CREATE TABLE `ContractLosses` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `ReceivedAt` datetime(6) NOT NULL,
  `EAN` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CancellationDate` datetime(6) NOT NULL,
  `BalanceSupplier` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `DossierID` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `EDSNRequestId` int NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `IX_ContractLosses_EAN` (`EAN`) USING BTREE,
  KEY `IX_ContractLosses_EDSNRequestId` (`EDSNRequestId`) USING BTREE,
  CONSTRAINT `FK_ContractLosses_EDSNRequests_EDSNRequestId` FOREIGN KEY (`EDSNRequestId`) REFERENCES `EDSNRequests` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for Disputes
-- ----------------------------
DROP TABLE IF EXISTS `Disputes`;
CREATE TABLE `Disputes` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `EAN` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Product` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `ReceivedDate` datetime(6) NOT NULL,
  `EnergyMeterID` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `NumberRegisters` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `RegisterData` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `MutationReason` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `ExternalReference` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Initiator` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Consumer` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `DossierId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DisputeDetails` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `EDSNRequestId` int NOT NULL,
  `ExternalId` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `IX_Disputes_EAN` (`EAN`) USING BTREE,
  KEY `IX_Disputes_EDSNRequestId` (`EDSNRequestId`) USING BTREE,
  KEY `IX_Disputes_EAN_DossierId` (`EAN`,`DossierId`) USING BTREE,
  CONSTRAINT `FK_Disputes_EDSNRequests_EDSNRequestId` FOREIGN KEY (`EDSNRequestId`) REFERENCES `EDSNRequests` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for DisputesRegisterData
-- ----------------------------
DROP TABLE IF EXISTS `DisputesRegisterData`;
CREATE TABLE `DisputesRegisterData` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `EAN` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ReceivedDate` datetime(6) NOT NULL,
  `EnergyMeterID` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `MeasureUnit` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `MeteringDirection` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `NumberOfDigits` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `TariffType` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Reading` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `ReadingDate` datetime(6) NOT NULL,
  `ReadingMethod` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `DossierId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EDSNRequestId` int NOT NULL,
  `DisputeID` int NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `IX_DisputesRegisterData_DisputeID` (`DisputeID`) USING BTREE,
  KEY `IX_DisputesRegisterData_EAN` (`EAN`) USING BTREE,
  KEY `IX_DisputesRegisterData_EDSNRequestId` (`EDSNRequestId`) USING BTREE,
  KEY `IX_DisputesRegisterData_EAN_DossierId` (`EAN`,`DossierId`) USING BTREE,
  CONSTRAINT `FK_DisputesRegisterData_Disputes_DisputeID` FOREIGN KEY (`DisputeID`) REFERENCES `Disputes` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK_DisputesRegisterData_EDSNRequests_EDSNRequestId` FOREIGN KEY (`EDSNRequestId`) REFERENCES `EDSNRequests` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for EDSNRequests
-- ----------------------------
DROP TABLE IF EXISTS `EDSNRequests`;
CREATE TABLE `EDSNRequests` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `MessageId` char(36) NOT NULL,
  `RequestDate` datetime(6) NOT NULL,
  `ResponseDate` datetime(6) DEFAULT NULL,
  `EAN` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Request` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Response` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `EDSNResponseCode` int DEFAULT NULL,
  `EDSNRejection` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `EDSNRejectionCode` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `LastRetryDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `IX_EDSNRequests_EAN` (`EAN`) USING BTREE,
  KEY `IX_EDSNRequests_RequestDate` (`RequestDate`) USING BTREE,
  KEY `IX_EDSNRequests_Status` (`Status`) USING BTREE,
  KEY `IX_EDSNRequests_Type` (`Type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=168933 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for LGRUs
-- ----------------------------
DROP TABLE IF EXISTS `LGRUs`;
CREATE TABLE `LGRUs` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `ReceivedAt` datetime(6) NOT NULL,
  `EAN` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ProductType` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `GridOperatorEAN` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `BalanceSupplier` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `BalanceSupplierOld` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `BalanceResponsible` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `BalanceResponsibleOld` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `MeteringResponsible` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `MeteringResponsibleOld` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `PM_ExternalReference` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `PM_MutationDate` datetime(6) NOT NULL,
  `PM_MutationReason` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `PM_DossierID` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Delivered` bit(1) NOT NULL,
  `EDSNRequestId` int NOT NULL,
  `Type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `IX_LGRUs_EAN` (`EAN`) USING BTREE,
  KEY `IX_LGRUs_EDSNRequestId` (`EDSNRequestId`) USING BTREE,
  KEY `IX_LGRUs_Type` (`Type`) USING BTREE,
  CONSTRAINT `FK_LGRUs_EDSNRequests_EDSNRequestId` FOREIGN KEY (`EDSNRequestId`) REFERENCES `EDSNRequests` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=393561 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for MasterDataUpdates
-- ----------------------------
DROP TABLE IF EXISTS `MasterDataUpdates`;
CREATE TABLE `MasterDataUpdates` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `EAN` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ReceivedDate` datetime(6) NOT NULL,
  `UpdateData` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `MutationDate` datetime(6) DEFAULT NULL,
  `MutationType` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `DossierId` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `EDSNRequestId` int NOT NULL,
  `ExternalReference` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `EDSNCreatedTime` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `IX_MasterDataUpdates_EDSNRequestId` (`EDSNRequestId`) USING BTREE,
  KEY `IX_MasterDataUpdates_EAN` (`EAN`) USING BTREE,
  CONSTRAINT `FK_MasterDataUpdates_EDSNRequests_EDSNRequestId` FOREIGN KEY (`EDSNRequestId`) REFERENCES `EDSNRequests` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=82003 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for SoapLog
-- ----------------------------
DROP TABLE IF EXISTS `SoapLog`;
CREATE TABLE `SoapLog` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CorrelationId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `MessageType` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `CreatedTime` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `IX_SoapLog_CorrelationId` (`CorrelationId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=213922 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for __EFMigrationsHistory
-- ----------------------------
DROP TABLE IF EXISTS `__EFMigrationsHistory`;
CREATE TABLE `__EFMigrationsHistory` (
  `MigrationId` varchar(95) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL,
  PRIMARY KEY (`MigrationId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

SET FOREIGN_KEY_CHECKS = 1;
