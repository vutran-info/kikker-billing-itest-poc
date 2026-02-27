/*
 Navicat Premium Dump SQL

 Source Server         : Kikker Pre-Prod Personal - HOURLY
 Source Server Type    : MySQL
 Source Server Version : 80031 (8.0.31-google)
 Source Host           : 34.141.215.102:3306
 Source Schema         : kikker_hourly

 Target Server Type    : MySQL
 Target Server Version : 80031 (8.0.31-google)
 File Encoding         : 65001

 Date: 26/02/2026 09:02:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for changelog
-- ----------------------------
DROP TABLE IF EXISTS `changelog`;
CREATE TABLE `changelog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` tinyint DEFAULT NULL,
  `version` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `checksum` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `installed_by` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for confidence_level_tracking
-- ----------------------------
DROP TABLE IF EXISTS `confidence_level_tracking`;
CREATE TABLE `confidence_level_tracking` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ean` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `consumption` decimal(20,7) DEFAULT NULL,
  `production` decimal(20,7) DEFAULT NULL,
  `hour_of_day` int DEFAULT NULL,
  `confidence_level` int DEFAULT NULL,
  `changed_date` datetime DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `year` int DEFAULT NULL,
  `month` int DEFAULT NULL,
  `isp` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ean` (`ean`),
  KEY `ean_changed_date` (`ean`,`changed_date`),
  KEY `idx_confidence_level_tracking_isp` (`isp`)
) ENGINE=InnoDB AUTO_INCREMENT=186811117 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for ean_info
-- ----------------------------
DROP TABLE IF EXISTS `ean_info`;
CREATE TABLE `ean_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ean` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `valid_from` datetime DEFAULT NULL,
  `valid_until` datetime DEFAULT NULL,
  `profile_category` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `product_type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `eac_peak` decimal(12,7) DEFAULT NULL,
  `eac_off_peak` decimal(12,7) DEFAULT NULL,
  `production_eac_peak` decimal(12,7) DEFAULT NULL,
  `production_eac_off_peak` decimal(12,7) DEFAULT NULL,
  `grid_area` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `mutation_date` datetime DEFAULT NULL,
  `kikker_feed_in_fee` decimal(12,7) DEFAULT NULL,
  `reseller_feed_in_fee` decimal(12,7) DEFAULT NULL,
  `kikker_top_up_fee` decimal(12,7) DEFAULT NULL,
  `reseller_top_up_fee` decimal(12,7) DEFAULT NULL,
  `last_prepopulate_date` datetime DEFAULT NULL,
  `contract_id` int DEFAULT NULL,
  `multi_factor_peak` decimal(12,7) DEFAULT NULL,
  `multi_factor_off_peak` decimal(12,7) DEFAULT NULL,
  `multi_factor_prod_peak` decimal(12,7) DEFAULT NULL,
  `multi_factor_prod_off_peak` decimal(12,7) DEFAULT NULL,
  `device_installed` tinyint(1) NOT NULL DEFAULT '1',
  `meter_device_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `collect_forecast` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `ean` (`ean`),
  KEY `ean_valid_from_valid_until_last_prepopulate_date` (`ean`,`valid_from`,`valid_until`,`last_prepopulate_date`),
  KEY `ean_contract_id` (`ean`,`contract_id`),
  KEY `idx_ean_info_collect_forecast` (`collect_forecast`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8849 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for feed_in_fees
-- ----------------------------
DROP TABLE IF EXISTS `feed_in_fees`;
CREATE TABLE `feed_in_fees` (
  `ean` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  `contract_id` int NOT NULL,
  `kikker_feed_in_fee` decimal(20,7) DEFAULT NULL,
  `reseller_feed_in_fee` decimal(20,7) DEFAULT NULL,
  PRIMARY KEY (`ean`,`contract_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for hourly_product_elk_price
-- ----------------------------
DROP TABLE IF EXISTS `hourly_product_elk_price`;
CREATE TABLE `hourly_product_elk_price` (
  `id` int NOT NULL AUTO_INCREMENT,
  `day` int NOT NULL,
  `day_of_week` int NOT NULL,
  `day_of_year` int NOT NULL,
  `delivery_day` datetime(6) NOT NULL,
  `epex` decimal(12,7) NOT NULL,
  `hour` int NOT NULL,
  `hour_of_year` int NOT NULL,
  `is_dst` bit(1) NOT NULL,
  `is_low_tariff_normal` bit(1) NOT NULL,
  `is_low_tariff_south` bit(1) NOT NULL,
  `month` int NOT NULL,
  `month_year` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `timestamp` datetime(6) NOT NULL,
  `utctime` datetime(6) NOT NULL,
  `year` int NOT NULL,
  `hour_of_day` int NOT NULL DEFAULT '0',
  `created_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `isp` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `IX_hourly_product_elk_price_delivery_day_isp` (`delivery_day`) USING BTREE,
  KEY `IX_hourly_product_elk_price_id_isp` (`id`) USING BTREE,
  KEY `IX_hourly_product_elk_price_month_year_isp` (`month`,`year`) USING BTREE,
  KEY `IX_hourly_product_elk_price_day_hour_month_year_isp` (`day`,`hour`,`month`,`year`) USING BTREE,
  KEY `IX_hourly_product_elk_price_isp` (`isp`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=179353 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for hourly_product_gas_price
-- ----------------------------
DROP TABLE IF EXISTS `hourly_product_gas_price`;
CREATE TABLE `hourly_product_gas_price` (
  `id` int NOT NULL AUTO_INCREMENT,
  `conversion_factor` decimal(12,7) DEFAULT NULL,
  `day` int DEFAULT NULL,
  `day_of_week` int DEFAULT NULL,
  `day_of_year` int DEFAULT NULL,
  `delivery_day` date NOT NULL,
  `egsi_m3` decimal(12,7) DEFAULT NULL,
  `egsi_mwh` decimal(12,7) DEFAULT NULL,
  `month` int DEFAULT NULL,
  `month_year` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `year` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `day_month_year` (`day`,`month`,`year`),
  KEY `delivery_day` (`delivery_day`),
  KEY `month_year` (`month_year`)
) ENGINE=InnoDB AUTO_INCREMENT=1339 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for hourly_product_tariff
-- ----------------------------
DROP TABLE IF EXISTS `hourly_product_tariff`;
CREATE TABLE `hourly_product_tariff` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ean` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `product_type` int DEFAULT NULL,
  `date` date NOT NULL,
  `year` int NOT NULL DEFAULT '2023',
  `month` int DEFAULT NULL,
  `day` int DEFAULT NULL,
  `year_month` int NOT NULL,
  `year_month_day` int DEFAULT NULL,
  `hour_of_day` int DEFAULT NULL,
  `consumption` decimal(20,7) DEFAULT NULL,
  `production` decimal(20,7) DEFAULT NULL,
  `net_consumption` decimal(20,7) DEFAULT NULL,
  `net_production` decimal(20,7) DEFAULT NULL,
  `pv_price` decimal(12,7) DEFAULT NULL,
  `kt_feed_in` decimal(12,7) DEFAULT NULL,
  `kt_source` decimal(12,7) DEFAULT NULL,
  `rs_feed_in` decimal(12,7) DEFAULT NULL,
  `rs_source` decimal(12,7) DEFAULT NULL,
  `volume_source` int DEFAULT NULL,
  `tariff` decimal(12,7) DEFAULT NULL,
  `cost_consumption` decimal(20,7) DEFAULT NULL,
  `cost_production` decimal(20,7) DEFAULT NULL,
  `hour` int DEFAULT NULL,
  `meter_reading` json DEFAULT NULL,
  `confidence_level` int DEFAULT NULL,
  `last_retry_date` datetime DEFAULT NULL,
  `meter_reading_date` json DEFAULT NULL,
  `volume_status` int DEFAULT NULL,
  `multi_factor` decimal(12,7) DEFAULT NULL,
  `meter_device_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `improved_by` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `isp` int DEFAULT NULL,
  `forecast` decimal(20,7) DEFAULT NULL,
  `forecast_cost` decimal(20,7) DEFAULT NULL,
  `realisation` decimal(20,7) DEFAULT NULL,
  `imbalance` decimal(20,7) DEFAULT NULL,
  `imbalance_cost` decimal(20,7) DEFAULT NULL,
  `imbalance_tariff` decimal(12,7) DEFAULT NULL,
  `idempotency_key` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'SHA256(ean|product_type|year_month_day|isp)',
  PRIMARY KEY (`id`,`year_month`) USING BTREE,
  KEY `idx_ean_date_confidence_level` (`ean`,`date`,`confidence_level`) USING BTREE,
  KEY `idx_ean_date_hourofday` (`ean`,`date`,`hour_of_day`),
  KEY `idx_ean_date_isp` (`ean`,`date`,`isp`),
  KEY `idx_hourly_tariff_yearmonth_ean_date` (`year_month`,`ean`,`date`) USING BTREE,
  KEY `idx_hourly_tariff_ean_date_hour_isp` (`ean`,`date`,`hour_of_day`,`isp`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=263384290 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci
/*!50100 PARTITION BY RANGE (`year_month`)
(PARTITION p202309 VALUES LESS THAN (202310) ENGINE = InnoDB,
 PARTITION p202310 VALUES LESS THAN (202311) ENGINE = InnoDB,
 PARTITION p202311 VALUES LESS THAN (202312) ENGINE = InnoDB,
 PARTITION p202312 VALUES LESS THAN (202401) ENGINE = InnoDB,
 PARTITION p202401 VALUES LESS THAN (202402) ENGINE = InnoDB,
 PARTITION p202402 VALUES LESS THAN (202403) ENGINE = InnoDB,
 PARTITION p202403 VALUES LESS THAN (202404) ENGINE = InnoDB,
 PARTITION p202404 VALUES LESS THAN (202405) ENGINE = InnoDB,
 PARTITION p202405 VALUES LESS THAN (202406) ENGINE = InnoDB,
 PARTITION p202406 VALUES LESS THAN (202407) ENGINE = InnoDB,
 PARTITION p202407 VALUES LESS THAN (202408) ENGINE = InnoDB,
 PARTITION p202408 VALUES LESS THAN (202409) ENGINE = InnoDB,
 PARTITION p202409 VALUES LESS THAN (202410) ENGINE = InnoDB,
 PARTITION p202410 VALUES LESS THAN (202411) ENGINE = InnoDB,
 PARTITION p202411 VALUES LESS THAN (202412) ENGINE = InnoDB,
 PARTITION p202412 VALUES LESS THAN (202501) ENGINE = InnoDB,
 PARTITION p202501 VALUES LESS THAN (202502) ENGINE = InnoDB,
 PARTITION p202502 VALUES LESS THAN (202503) ENGINE = InnoDB,
 PARTITION p202503 VALUES LESS THAN (202504) ENGINE = InnoDB,
 PARTITION p202504 VALUES LESS THAN (202505) ENGINE = InnoDB,
 PARTITION p202505 VALUES LESS THAN (202506) ENGINE = InnoDB,
 PARTITION p202506 VALUES LESS THAN (202507) ENGINE = InnoDB,
 PARTITION p202507 VALUES LESS THAN (202508) ENGINE = InnoDB,
 PARTITION p202508 VALUES LESS THAN (202509) ENGINE = InnoDB,
 PARTITION p202509 VALUES LESS THAN (202510) ENGINE = InnoDB,
 PARTITION p202510 VALUES LESS THAN (202511) ENGINE = InnoDB,
 PARTITION p202511 VALUES LESS THAN (202512) ENGINE = InnoDB,
 PARTITION p202512 VALUES LESS THAN (202601) ENGINE = InnoDB,
 PARTITION p202601 VALUES LESS THAN (202602) ENGINE = InnoDB,
 PARTITION p202602 VALUES LESS THAN (202603) ENGINE = InnoDB,
 PARTITION p202603 VALUES LESS THAN (202604) ENGINE = InnoDB,
 PARTITION p202604 VALUES LESS THAN (202605) ENGINE = InnoDB,
 PARTITION p202605 VALUES LESS THAN (202606) ENGINE = InnoDB,
 PARTITION p202606 VALUES LESS THAN (202607) ENGINE = InnoDB,
 PARTITION p202607 VALUES LESS THAN (202608) ENGINE = InnoDB,
 PARTITION p202608 VALUES LESS THAN (202609) ENGINE = InnoDB,
 PARTITION p202609 VALUES LESS THAN (202610) ENGINE = InnoDB,
 PARTITION p202610 VALUES LESS THAN (202611) ENGINE = InnoDB,
 PARTITION p202611 VALUES LESS THAN (202612) ENGINE = InnoDB,
 PARTITION p202612 VALUES LESS THAN (202701) ENGINE = InnoDB,
 PARTITION p202701 VALUES LESS THAN (202702) ENGINE = InnoDB,
 PARTITION p202702 VALUES LESS THAN (202703) ENGINE = InnoDB,
 PARTITION p202703 VALUES LESS THAN (202704) ENGINE = InnoDB,
 PARTITION p202704 VALUES LESS THAN (202705) ENGINE = InnoDB,
 PARTITION p202705 VALUES LESS THAN (202706) ENGINE = InnoDB,
 PARTITION p202706 VALUES LESS THAN (202707) ENGINE = InnoDB,
 PARTITION p202707 VALUES LESS THAN (202708) ENGINE = InnoDB,
 PARTITION p202708 VALUES LESS THAN (202709) ENGINE = InnoDB,
 PARTITION p202709 VALUES LESS THAN (202710) ENGINE = InnoDB,
 PARTITION p202710 VALUES LESS THAN (202711) ENGINE = InnoDB,
 PARTITION p202711 VALUES LESS THAN (202712) ENGINE = InnoDB,
 PARTITION p202712 VALUES LESS THAN (202801) ENGINE = InnoDB,
 PARTITION p202801 VALUES LESS THAN (202802) ENGINE = InnoDB,
 PARTITION p202802 VALUES LESS THAN (202803) ENGINE = InnoDB,
 PARTITION p202803 VALUES LESS THAN (202804) ENGINE = InnoDB,
 PARTITION p202804 VALUES LESS THAN (202805) ENGINE = InnoDB,
 PARTITION p202805 VALUES LESS THAN (202806) ENGINE = InnoDB,
 PARTITION p202806 VALUES LESS THAN (202807) ENGINE = InnoDB,
 PARTITION p202807 VALUES LESS THAN (202808) ENGINE = InnoDB,
 PARTITION p202808 VALUES LESS THAN (202809) ENGINE = InnoDB,
 PARTITION p202809 VALUES LESS THAN (202810) ENGINE = InnoDB,
 PARTITION p202810 VALUES LESS THAN (202811) ENGINE = InnoDB,
 PARTITION p202811 VALUES LESS THAN (202812) ENGINE = InnoDB,
 PARTITION p202812 VALUES LESS THAN (202901) ENGINE = InnoDB,
 PARTITION pmax VALUES LESS THAN MAXVALUE ENGINE = InnoDB) */;

-- ----------------------------
-- Table structure for imbalance_elk_price
-- ----------------------------
DROP TABLE IF EXISTS `imbalance_elk_price`;
CREATE TABLE `imbalance_elk_price` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `short` decimal(20,7) DEFAULT NULL,
  `long` decimal(20,7) DEFAULT NULL,
  `isp` int DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_imbalance_elk_price_date` (`date`)
) ENGINE=InnoDB AUTO_INCREMENT=12485 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for migration_before_october_log
-- ----------------------------
DROP TABLE IF EXISTS `migration_before_october_log`;
CREATE TABLE `migration_before_october_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ean` varchar(64) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `hour_of_day` int DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `message` varchar(512) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `error_message` varchar(512) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `updated_records` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `total_consumption_before` decimal(20,7) DEFAULT NULL,
  `total_consumption_after` decimal(20,7) DEFAULT NULL,
  `total_production_before` decimal(20,7) DEFAULT NULL,
  `total_production_after` decimal(20,7) DEFAULT NULL,
  `total_net_consumption_before` decimal(20,7) DEFAULT NULL,
  `total_net_consumption_after` decimal(20,7) DEFAULT NULL,
  `total_net_production_before` decimal(20,7) DEFAULT NULL,
  `total_net_production_after` decimal(20,7) DEFAULT NULL,
  `total_net_before` decimal(20,7) DEFAULT NULL,
  `total_net_after` decimal(20,7) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=158391 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for parsed_forecast_usage
-- ----------------------------
DROP TABLE IF EXISTS `parsed_forecast_usage`;
CREATE TABLE `parsed_forecast_usage` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ean` varchar(64) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `forecast_date` datetime DEFAULT NULL,
  `time_start_utc` datetime DEFAULT NULL,
  `time_end_utc` datetime DEFAULT NULL,
  `time_start` datetime DEFAULT NULL,
  `time_end` datetime DEFAULT NULL,
  `hour` int DEFAULT NULL,
  `hour_of_day` int DEFAULT NULL,
  `is_dst` tinyint(1) DEFAULT NULL,
  `year` int DEFAULT NULL,
  `month` int DEFAULT NULL,
  `day` int DEFAULT NULL,
  `year_month` int DEFAULT NULL,
  `amount` decimal(20,7) DEFAULT NULL,
  `isp` int DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_parsed_forecast_usage_unique` (`forecast_date`,`ean`,`isp`),
  KEY `idx_parsed_forecast_usage_ean` (`ean`),
  KEY `idx_parsed_forecast_usage_forecast_year_month` (`year_month`)
) ENGINE=InnoDB AUTO_INCREMENT=49549 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for processed_messages
-- ----------------------------
DROP TABLE IF EXISTS `processed_messages`;
CREATE TABLE `processed_messages` (
  `message_id` varchar(255) NOT NULL,
  `event_type` varchar(100) DEFAULT NULL,
  `ean` varchar(64) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `processed_at` datetime DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `error_message` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`message_id`),
  UNIQUE KEY `idx_processed_messages_content` (`event_type`,`ean`,`date`),
  KEY `idx_processed_messages_ean_date_event` (`ean`,`date`,`event_type`),
  KEY `idx_processed_messages_processed_at` (`processed_at`),
  KEY `idx_processed_messages_messageid_status` (`message_id`,`status`),
  KEY `idx_processed_messages_content_idempotency` (`event_type`,`ean`,`date`,`status`),
  KEY `idx_processed_messages_content_latest` (`event_type`,`ean`,`date`,`processed_at` DESC),
  KEY `idx_processed_messages_cleanup_composite` (`processed_at`,`status`,`event_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for raw_forecast_usage
-- ----------------------------
DROP TABLE IF EXISTS `raw_forecast_usage`;
CREATE TABLE `raw_forecast_usage` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `raw_data` json DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `year` int DEFAULT NULL,
  `month` int DEFAULT NULL,
  `day` int DEFAULT NULL,
  `year_month` int DEFAULT NULL,
  `is_parsed` tinyint(1) DEFAULT NULL,
  `note` varchar(512) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_raw_forecast_usage_year_month` (`year_month`),
  KEY `idx_raw_forecast_usage_is_parsed` (`is_parsed`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for recalculated_hourly_usage
-- ----------------------------
DROP TABLE IF EXISTS `recalculated_hourly_usage`;
CREATE TABLE `recalculated_hourly_usage` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ean` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `product_type` int NOT NULL,
  `date` datetime NOT NULL,
  `year` int NOT NULL DEFAULT '2023',
  `month` int DEFAULT NULL,
  `day` int DEFAULT NULL,
  `year_month` int NOT NULL,
  `year_month_day` int DEFAULT NULL,
  `hour_of_day` int DEFAULT NULL,
  `hour` int DEFAULT NULL,
  `consumption` decimal(20,7) DEFAULT NULL,
  `production` decimal(20,7) DEFAULT NULL,
  `net_consumption` decimal(20,7) DEFAULT NULL,
  `net_production` decimal(20,7) DEFAULT NULL,
  `pv_price` decimal(12,7) DEFAULT NULL,
  `kt_feed_in` decimal(12,7) DEFAULT NULL,
  `kt_source` decimal(12,7) DEFAULT NULL,
  `rs_feed_in` decimal(12,7) DEFAULT NULL,
  `rs_source` decimal(12,7) DEFAULT NULL,
  `volume_source` int DEFAULT NULL,
  `tariff` decimal(12,7) DEFAULT NULL,
  `cost_consumption` decimal(20,7) DEFAULT NULL,
  `cost_production` decimal(20,7) DEFAULT NULL,
  `isp` int DEFAULT NULL,
  PRIMARY KEY (`id`,`year_month`) USING BTREE,
  KEY `idx_hourly_tariff_yearmonth_ean_date` (`year_month`,`ean`,`date`) USING BTREE,
  KEY `idx_hourly_tariff_ean_date_hour_isp` (`ean`,`date`,`hour_of_day`,`isp`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=53980627 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci
/*!50100 PARTITION BY RANGE (`year_month`)
(PARTITION p202309 VALUES LESS THAN (202310) ENGINE = InnoDB,
 PARTITION p202310 VALUES LESS THAN (202311) ENGINE = InnoDB,
 PARTITION p202311 VALUES LESS THAN (202312) ENGINE = InnoDB,
 PARTITION p202312 VALUES LESS THAN (202401) ENGINE = InnoDB,
 PARTITION p202401 VALUES LESS THAN (202402) ENGINE = InnoDB,
 PARTITION p202402 VALUES LESS THAN (202403) ENGINE = InnoDB,
 PARTITION p202403 VALUES LESS THAN (202404) ENGINE = InnoDB,
 PARTITION p202404 VALUES LESS THAN (202405) ENGINE = InnoDB,
 PARTITION p202405 VALUES LESS THAN (202406) ENGINE = InnoDB,
 PARTITION p202406 VALUES LESS THAN (202407) ENGINE = InnoDB,
 PARTITION p202407 VALUES LESS THAN (202408) ENGINE = InnoDB,
 PARTITION p202408 VALUES LESS THAN (202409) ENGINE = InnoDB,
 PARTITION p202409 VALUES LESS THAN (202410) ENGINE = InnoDB,
 PARTITION p202410 VALUES LESS THAN (202411) ENGINE = InnoDB,
 PARTITION p202411 VALUES LESS THAN (202412) ENGINE = InnoDB,
 PARTITION p202412 VALUES LESS THAN (202501) ENGINE = InnoDB,
 PARTITION p202501 VALUES LESS THAN (202502) ENGINE = InnoDB,
 PARTITION p202502 VALUES LESS THAN (202503) ENGINE = InnoDB,
 PARTITION p202503 VALUES LESS THAN (202504) ENGINE = InnoDB,
 PARTITION p202504 VALUES LESS THAN (202505) ENGINE = InnoDB,
 PARTITION p202505 VALUES LESS THAN (202506) ENGINE = InnoDB,
 PARTITION p202506 VALUES LESS THAN (202507) ENGINE = InnoDB,
 PARTITION p202507 VALUES LESS THAN (202508) ENGINE = InnoDB,
 PARTITION p202508 VALUES LESS THAN (202509) ENGINE = InnoDB,
 PARTITION p202509 VALUES LESS THAN (202510) ENGINE = InnoDB,
 PARTITION p202510 VALUES LESS THAN (202511) ENGINE = InnoDB,
 PARTITION p202511 VALUES LESS THAN (202512) ENGINE = InnoDB,
 PARTITION p202512 VALUES LESS THAN (202601) ENGINE = InnoDB,
 PARTITION p202601 VALUES LESS THAN (202602) ENGINE = InnoDB,
 PARTITION p202602 VALUES LESS THAN (202603) ENGINE = InnoDB,
 PARTITION p202603 VALUES LESS THAN (202604) ENGINE = InnoDB,
 PARTITION p202604 VALUES LESS THAN (202605) ENGINE = InnoDB,
 PARTITION p202605 VALUES LESS THAN (202606) ENGINE = InnoDB,
 PARTITION p202606 VALUES LESS THAN (202607) ENGINE = InnoDB,
 PARTITION p202607 VALUES LESS THAN (202608) ENGINE = InnoDB,
 PARTITION p202608 VALUES LESS THAN (202609) ENGINE = InnoDB,
 PARTITION p202609 VALUES LESS THAN (202610) ENGINE = InnoDB,
 PARTITION p202610 VALUES LESS THAN (202611) ENGINE = InnoDB,
 PARTITION p202611 VALUES LESS THAN (202612) ENGINE = InnoDB,
 PARTITION p202612 VALUES LESS THAN (202701) ENGINE = InnoDB,
 PARTITION p202701 VALUES LESS THAN (202702) ENGINE = InnoDB,
 PARTITION p202702 VALUES LESS THAN (202703) ENGINE = InnoDB,
 PARTITION p202703 VALUES LESS THAN (202704) ENGINE = InnoDB,
 PARTITION p202704 VALUES LESS THAN (202705) ENGINE = InnoDB,
 PARTITION p202705 VALUES LESS THAN (202706) ENGINE = InnoDB,
 PARTITION p202706 VALUES LESS THAN (202707) ENGINE = InnoDB,
 PARTITION p202707 VALUES LESS THAN (202708) ENGINE = InnoDB,
 PARTITION p202708 VALUES LESS THAN (202709) ENGINE = InnoDB,
 PARTITION p202709 VALUES LESS THAN (202710) ENGINE = InnoDB,
 PARTITION p202710 VALUES LESS THAN (202711) ENGINE = InnoDB,
 PARTITION p202711 VALUES LESS THAN (202712) ENGINE = InnoDB,
 PARTITION p202712 VALUES LESS THAN (202801) ENGINE = InnoDB,
 PARTITION p202801 VALUES LESS THAN (202802) ENGINE = InnoDB,
 PARTITION p202802 VALUES LESS THAN (202803) ENGINE = InnoDB,
 PARTITION p202803 VALUES LESS THAN (202804) ENGINE = InnoDB,
 PARTITION p202804 VALUES LESS THAN (202805) ENGINE = InnoDB,
 PARTITION p202805 VALUES LESS THAN (202806) ENGINE = InnoDB,
 PARTITION p202806 VALUES LESS THAN (202807) ENGINE = InnoDB,
 PARTITION p202807 VALUES LESS THAN (202808) ENGINE = InnoDB,
 PARTITION p202808 VALUES LESS THAN (202809) ENGINE = InnoDB,
 PARTITION p202809 VALUES LESS THAN (202810) ENGINE = InnoDB,
 PARTITION p202810 VALUES LESS THAN (202811) ENGINE = InnoDB,
 PARTITION p202811 VALUES LESS THAN (202812) ENGINE = InnoDB,
 PARTITION p202812 VALUES LESS THAN (202901) ENGINE = InnoDB,
 PARTITION pmax VALUES LESS THAN MAXVALUE ENGINE = InnoDB) */;

-- ----------------------------
-- Table structure for track_master_data
-- ----------------------------
DROP TABLE IF EXISTS `track_master_data`;
CREATE TABLE `track_master_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ean` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `change_type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `mutation_date` datetime DEFAULT NULL,
  `old_value` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `new_value` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ean_mutation_date` (`ean`,`mutation_date`)
) ENGINE=InnoDB AUTO_INCREMENT=103093 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for waiting_delete_bigquery_ean
-- ----------------------------
DROP TABLE IF EXISTS `waiting_delete_bigquery_ean`;
CREATE TABLE `waiting_delete_bigquery_ean` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ean` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `query_date` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54177 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for weight_tariff_wrong_ean
-- ----------------------------
DROP TABLE IF EXISTS `weight_tariff_wrong_ean`;
CREATE TABLE `weight_tariff_wrong_ean` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ean` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `from` date DEFAULT NULL,
  `until` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

SET FOREIGN_KEY_CHECKS = 1;
