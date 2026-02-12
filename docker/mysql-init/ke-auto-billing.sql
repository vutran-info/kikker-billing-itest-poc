/*
 Navicat Premium Dump SQL

 Source Server         : Kikker Prod R - BILLING
 Source Server Type    : MySQL
 Source Server Version : 80026 (8.0.26-google)
 Source Host           : 34.32.213.253:3306
 Source Schema         : ke-auto-billing

 Target Server Type    : MySQL
 Target Server Version : 80026 (8.0.26-google)
 File Encoding         : 65001

 Date: 12/02/2026 16:14:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for __EFMigrationsHistory
-- ----------------------------
DROP TABLE IF EXISTS `__EFMigrationsHistory`;
CREATE TABLE `__EFMigrationsHistory` (
  `MigrationId` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProductVersion` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for billing_tasks
-- ----------------------------
DROP TABLE IF EXISTS `billing_tasks`;
CREATE TABLE `billing_tasks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contract_number` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `action` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'WAIT, PROCESS, SOLVED',
  `billing_type` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'FINAL = 0, YEARLY = 1',
  `external_id` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `from` datetime(6) NOT NULL,
  `until` datetime(6) NOT NULL,
  `need_retry` bit(1) NOT NULL,
  `retry_count` int NOT NULL,
  `perform_date` datetime(6) DEFAULT NULL,
  `note` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `reasons` json DEFAULT NULL COMMENT 'multiple reasons delimiter by ;',
  `contract_durations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_date` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_date` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `billing_id` int NOT NULL DEFAULT '0',
  `customer_id` int NOT NULL DEFAULT '0',
  `location_id` int NOT NULL DEFAULT '0',
  `reseller_id` int NOT NULL DEFAULT '0',
  `status` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `billing_external_id` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `is_used_populate` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59787 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for contract_auto_prepare
-- ----------------------------
DROP TABLE IF EXISTS `contract_auto_prepare`;
CREATE TABLE `contract_auto_prepare` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contract_number` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `contract_external_id` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `contract_duration` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `contract_status_id` int NOT NULL,
  `is_uncollectible` bit(1) NOT NULL,
  `start_date` datetime(6) NOT NULL,
  `end_date` datetime(6) NOT NULL,
  `latest_billing_end_date` datetime(6) NOT NULL,
  `contract_duration_change_date` json DEFAULT NULL,
  `created_date` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_date` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `uncollectible_periods` json DEFAULT (_utf8mb4'[]'),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44893 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for contract_auto_prepare_log
-- ----------------------------
DROP TABLE IF EXISTS `contract_auto_prepare_log`;
CREATE TABLE `contract_auto_prepare_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contract_auto_prepare_id` int NOT NULL,
  `data` json DEFAULT NULL,
  `created_date` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_date` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  KEY `IX_contract_auto_prepare_log_contract_auto_prepare_id` (`contract_auto_prepare_id`),
  CONSTRAINT `FK_contract_auto_prepare_log_contract_auto_prepare_contract_aut~` FOREIGN KEY (`contract_auto_prepare_id`) REFERENCES `contract_auto_prepare` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=138255 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Triggers structure for table contract_auto_prepare
-- ----------------------------
DROP TRIGGER IF EXISTS `log_contract_auto_prepare_insert`;
delimiter ;;
CREATE TRIGGER `ke-auto-billing`.`log_contract_auto_prepare_insert` AFTER INSERT ON `contract_auto_prepare` FOR EACH ROW begin
                                        insert into contract_auto_prepare_log (contract_auto_prepare_id, `data`) values (new.id, json_object('ContractNumber', new.contract_number, 'ContractExternalId', new.contract_external_id, 'ContractDuration', new.contract_duration, 'ContractStatusId', new.contract_status_id, 'IsUncollectible', new.is_uncollectible > 0, 'StartDate', new.start_date, 'EndDate', new.end_date, 'LatestBillingEndDate', new.latest_billing_end_date, 'ContractDurationChangeDate', new.contract_duration_change_date));
                                    end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table contract_auto_prepare
-- ----------------------------
DROP TRIGGER IF EXISTS `log_contract_auto_prepare_update`;
delimiter ;;
CREATE TRIGGER `ke-auto-billing`.`log_contract_auto_prepare_update` AFTER UPDATE ON `contract_auto_prepare` FOR EACH ROW begin
                                        insert into contract_auto_prepare_log (contract_auto_prepare_id, `data`) values (new.id, json_object('ContractNumber', new.contract_number, 'ContractExternalId', new.contract_external_id, 'ContractDuration', new.contract_duration, 'ContractStatusId', new.contract_status_id, 'IsUncollectible', new.is_uncollectible > 0, 'StartDate', new.start_date, 'EndDate', new.end_date, 'LatestBillingEndDate', new.latest_billing_end_date, 'ContractDurationChangeDate', new.contract_duration_change_date));
                                    end
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
