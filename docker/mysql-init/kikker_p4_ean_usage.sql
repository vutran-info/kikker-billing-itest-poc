/*
 Navicat Premium Dump SQL

 Source Server         : Kikker UAT DataMigration
 Source Server Type    : MySQL
 Source Server Version : 80407 (8.4.7-google)
 Source Host           : 35.204.58.137:3306
 Source Schema         : kikker_p4_ean_usage

 Target Server Type    : MySQL
 Target Server Version : 80407 (8.4.7-google)
 File Encoding         : 65001

 Date: 12/02/2026 15:58:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ean
-- ----------------------------
DROP TABLE IF EXISTS `ean`;
CREATE TABLE `ean` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `receiver_id` varchar(255) NOT NULL,
  `ean_id` varchar(255) NOT NULL,
  `start_date_usage` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ean_id_idx` (`ean_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19793 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for ean_copy1
-- ----------------------------
DROP TABLE IF EXISTS `ean_copy1`;
CREATE TABLE `ean_copy1` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `receiver_id` varchar(255) NOT NULL,
  `ean_id` varchar(255) NOT NULL,
  `start_date_usage` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ean_id_idx` (`ean_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19109 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for failed_request_logging
-- ----------------------------
DROP TABLE IF EXISTS `failed_request_logging`;
CREATE TABLE `failed_request_logging` (
  `id` int NOT NULL AUTO_INCREMENT,
  `receiver_id` varchar(255) DEFAULT NULL,
  `query_date` date DEFAULT NULL,
  `query_reason` varchar(5) DEFAULT NULL,
  `failed_reason` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5585 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for flyway_schema_history
-- ----------------------------
DROP TABLE IF EXISTS `flyway_schema_history`;
CREATE TABLE `flyway_schema_history` (
  `installed_rank` int NOT NULL,
  `version` varchar(50) DEFAULT NULL,
  `description` varchar(200) NOT NULL,
  `type` varchar(20) NOT NULL,
  `script` varchar(1000) NOT NULL,
  `checksum` int DEFAULT NULL,
  `installed_by` varchar(100) NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `execution_time` int NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`installed_rank`),
  KEY `flyway_schema_history_s_idx` (`success`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for loss_ean
-- ----------------------------
DROP TABLE IF EXISTS `loss_ean`;
CREATE TABLE `loss_ean` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ean_id` varchar(255) NOT NULL,
  `end_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_executed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6087 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for metering_point
-- ----------------------------
DROP TABLE IF EXISTS `metering_point`;
CREATE TABLE `metering_point` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ean_id` varchar(255) NOT NULL,
  `external_reference` varchar(255) DEFAULT NULL,
  `query_date` date DEFAULT NULL,
  `query_reason` varchar(5) DEFAULT NULL,
  `energy_meter_id` varchar(255) DEFAULT NULL,
  `retry_count` smallint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sent_to_p4_flow` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `metering_point_query_date` (`query_date`) USING BTREE,
  KEY `meterding_point_query_reason` (`query_reason`) USING BTREE,
  KEY `metering_point_ean` (`ean_id`) USING BTREE,
  KEY `external_reference_idx` (`external_reference`) USING BTREE,
  KEY `idx_get_full` (`ean_id`,`query_date`,`query_reason`,`energy_meter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57032923 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for metering_point_raw
-- ----------------------------
DROP TABLE IF EXISTS `metering_point_raw`;
CREATE TABLE `metering_point_raw` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ean_id` varchar(255) NOT NULL,
  `external_reference` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `data` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `external_reference_idx` (`external_reference`) USING BTREE,
  KEY `status_idx` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=84125120 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for metering_point_raw_bk
-- ----------------------------
DROP TABLE IF EXISTS `metering_point_raw_bk`;
CREATE TABLE `metering_point_raw_bk` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ean_id` varchar(255) NOT NULL,
  `external_reference` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `data` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `external_reference_idx` (`external_reference`) USING BTREE,
  KEY `status_idx` (`status`) USING BTREE,
  FULLTEXT KEY `external_reference_fulltext_idx` (`external_reference`)
) ENGINE=InnoDB AUTO_INCREMENT=17555760 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for metering_point_rejection
-- ----------------------------
DROP TABLE IF EXISTS `metering_point_rejection`;
CREATE TABLE `metering_point_rejection` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `metering_point_id` int DEFAULT NULL,
  `ean_id` varchar(255) NOT NULL,
  `external_reference` varchar(255) DEFAULT NULL,
  `query_date` date DEFAULT NULL,
  `query_reason` varchar(5) DEFAULT NULL,
  `rejection_code` varchar(10) DEFAULT NULL,
  `rejection_text` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `external_reference_idx` (`external_reference`) USING BTREE,
  KEY `idx_get_full` (`ean_id`,`query_date`,`query_reason`),
  KEY `query_reason_idx` (`query_reason`),
  KEY `ean_id_idx` (`ean_id`),
  KEY `query_date_idx` (`query_date`)
) ENGINE=InnoDB AUTO_INCREMENT=1936597 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for register_reading
-- ----------------------------
DROP TABLE IF EXISTS `register_reading`;
CREATE TABLE `register_reading` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `metering_point_id` bigint NOT NULL,
  `external_reference` varchar(255) DEFAULT NULL,
  `register_id` varchar(10) DEFAULT NULL,
  `measure_unit` varchar(10) DEFAULT NULL,
  `reading` double DEFAULT NULL,
  `reading_datetime` datetime DEFAULT NULL,
  `timezone_offset` varchar(6) DEFAULT NULL,
  `register_reading_key` char(32) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `register_reading_key_unique_index` (`register_reading_key`),
  KEY `register_reading_metering_point_fk` (`metering_point_id`) USING BTREE,
  KEY `register_id_index` (`register_id`) USING BTREE,
  KEY `reading_datetime_index` (`reading_datetime`) USING BTREE,
  KEY `reading_number` (`reading`) USING BTREE,
  KEY `external_reference_idx` (`external_reference`) USING BTREE,
  CONSTRAINT `register_reading_metering_point_fk` FOREIGN KEY (`metering_point_id`) REFERENCES `metering_point` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=780913773 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for register_reading_key_management
-- ----------------------------
DROP TABLE IF EXISTS `register_reading_key_management`;
CREATE TABLE `register_reading_key_management` (
  `register_reading_key` char(32) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`register_reading_key`),
  KEY `created_at_idx` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for request_data_from_p4
-- ----------------------------
DROP TABLE IF EXISTS `request_data_from_p4`;
CREATE TABLE `request_data_from_p4` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ean_id` text NOT NULL,
  `receiver_id` varchar(255) NOT NULL,
  `query_date` date DEFAULT NULL,
  `query_reason` varchar(5) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32410 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for settings
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `key` varchar(128) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for soap_logging
-- ----------------------------
DROP TABLE IF EXISTS `soap_logging`;
CREATE TABLE `soap_logging` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `message_id` varchar(255) NOT NULL,
  `request_type` varchar(255) DEFAULT NULL,
  `request` text,
  `response` longtext,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `created_at` (`created_at`) USING BTREE,
  KEY `message_id_idx` (`message_id`) USING BTREE,
  KEY `request_type_idx` (`request_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for tmr_mock_data
-- ----------------------------
DROP TABLE IF EXISTS `tmr_mock_data`;
CREATE TABLE `tmr_mock_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ean_id` varchar(255) NOT NULL,
  `response` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Procedure structure for getAndUpdateMeteringPointRaw
-- ----------------------------
DROP PROCEDURE IF EXISTS `getAndUpdateMeteringPointRaw`;
delimiter ;;
CREATE PROCEDURE `getAndUpdateMeteringPointRaw`()
BEGIN
	SET @update_id:=0; 
	UPDATE metering_point_raw SET `status` = 'PROCESSING', id = (SELECT @update_id:=id) WHERE `status` = 'NEW' LIMIT 1;
	SELECT * FROM metering_point_raw WHERE id = @update_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for getAndUpdateMeteringPointRaw1
-- ----------------------------
DROP PROCEDURE IF EXISTS `getAndUpdateMeteringPointRaw1`;
delimiter ;;
CREATE PROCEDURE `getAndUpdateMeteringPointRaw1`()
BEGIN
    SET @update_id:=0; 
    UPDATE metering_point_raw SET `status` = 'PROCESSING', id = (SELECT @update_id:=id) WHERE `status` = 'NEW' LIMIT 1;
    SELECT * FROM metering_point_raw WHERE id = @update_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for getAndUpdateRequestDataFromP4
-- ----------------------------
DROP PROCEDURE IF EXISTS `getAndUpdateRequestDataFromP4`;
delimiter ;;
CREATE PROCEDURE `getAndUpdateRequestDataFromP4`()
BEGIN
	SET @update_id:=0; 
	UPDATE request_data_from_p4 SET `status` = 'PROCESSING', id = (SELECT @update_id:=id) WHERE `status` = 'NEW' LIMIT 1;
	SELECT * FROM request_data_from_p4 WHERE id = @update_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for getAndUpdateRequestDataFromP4New
-- ----------------------------
DROP PROCEDURE IF EXISTS `getAndUpdateRequestDataFromP4New`;
delimiter ;;
CREATE PROCEDURE `getAndUpdateRequestDataFromP4New`()
BEGIN

SET @update_id:=0;

UPDATE request_data_from_p4 SET `status` = 'PROCESSING', id = (SELECT @update_id:=id) WHERE `status` = 'NEW' LIMIT 1;

SELECT * FROM request_data_from_p4 WHERE id = @update_id;

END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
