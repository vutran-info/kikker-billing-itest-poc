/*
 Navicat Premium Dump SQL

 Source Server         : Kikker UAT DataMigration
 Source Server Type    : MySQL
 Source Server Version : 80407 (8.4.7-google)
 Source Host           : 35.204.58.137:3306
 Source Schema         : pricing

 Target Server Type    : MySQL
 Target Server Version : 80407 (8.4.7-google)
 File Encoding         : 65001

 Date: 12/02/2026 16:05:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for DVEP_pricing_sheet
-- ----------------------------
DROP TABLE IF EXISTS `DVEP_pricing_sheet`;
CREATE TABLE `DVEP_pricing_sheet` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comm_date` datetime NOT NULL,
  `reference_date` datetime NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `insurance_amount_gas` decimal(20,7) NOT NULL DEFAULT '0.0000000',
  `filename` varchar(255) DEFAULT NULL,
  `insurance_amount_elk` decimal(20,7) NOT NULL DEFAULT '0.0000000',
  `s3_link` varchar(500) NOT NULL DEFAULT '',
  `uploaded_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `note` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `DVEP_pricing_sheet_end_date` (`end_date`),
  KEY `DVEP_pricing_sheet_start_date` (`start_date`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for PV_price
-- ----------------------------
DROP TABLE IF EXISTS `PV_price`;
CREATE TABLE `PV_price` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_sheet` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `single_price` decimal(20,7) NOT NULL,
  `normal_price` decimal(20,7) NOT NULL,
  `off_peak_price` decimal(20,7) NOT NULL,
  `product_type` varchar(255) NOT NULL,
  `contract_duration` varchar(255) NOT NULL,
  `usage_type` varchar(255) DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `off_peak_evening_price` decimal(20,7) NOT NULL DEFAULT '0.0000000',
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `sheet` (`id_sheet`),
  CONSTRAINT `sheet` FOREIGN KEY (`id_sheet`) REFERENCES `DVEP_pricing_sheet` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=134513 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for VAT
-- ----------------------------
DROP TABLE IF EXISTS `VAT`;
CREATE TABLE `VAT` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vat` decimal(10,2) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `vat_end_date_index` (`end_date`),
  KEY `vat_start_date_index` (`start_date`),
  KEY `vat_product_type_index` (`vat`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for __EFMigrationsHistory
-- ----------------------------
DROP TABLE IF EXISTS `__EFMigrationsHistory`;
CREATE TABLE `__EFMigrationsHistory` (
  `MigrationId` varchar(95) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for average_monthly_price
-- ----------------------------
DROP TABLE IF EXISTS `average_monthly_price`;
CREATE TABLE `average_monthly_price` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elk_on_peak` double(20,7) DEFAULT NULL,
  `elk_off_peak` double(20,7) DEFAULT NULL,
  `elk_single` double(20,7) DEFAULT NULL,
  `gas_single` double(20,7) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime NOT NULL,
  `ean` varchar(50) DEFAULT NULL,
  `usage_period` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30458 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for calculate_mobile_cost
-- ----------------------------
DROP TABLE IF EXISTS `calculate_mobile_cost`;
CREATE TABLE `calculate_mobile_cost` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ean` varchar(255) DEFAULT NULL,
  `query_date` datetime NOT NULL,
  `query_reason` varchar(255) DEFAULT NULL,
  `request` text,
  `response` text,
  `input` text,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `ean_date_reason` (`ean`,`query_date`,`query_reason`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2033 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for capacity
-- ----------------------------
DROP TABLE IF EXISTS `capacity`;
CREATE TABLE `capacity` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `daily_cost` decimal(20,7) NOT NULL,
  `yearly_cost` decimal(20,7) NOT NULL,
  `area_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `area_id` (`area_id`),
  CONSTRAINT `area_id` FOREIGN KEY (`area_id`) REFERENCES `grid_operator` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for conversion_factor_config
-- ----------------------------
DROP TABLE IF EXISTS `conversion_factor_config`;
CREATE TABLE `conversion_factor_config` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(30) DEFAULT NULL,
  `value` decimal(20,7) NOT NULL,
  `from` datetime DEFAULT NULL,
  `until` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_conversion_factor_config_type_value_from_until` (`type`,`value`,`from`,`until`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for default_setting
-- ----------------------------
DROP TABLE IF EXISTS `default_setting`;
CREATE TABLE `default_setting` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Key` varchar(255) NOT NULL,
  `Value` longtext,
  PRIMARY KEY (`id`),
  KEY `default_setting_key` (`Key`)
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for energy_tax
-- ----------------------------
DROP TABLE IF EXISTS `energy_tax`;
CREATE TABLE `energy_tax` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `product_type` varchar(255) NOT NULL,
  `zone_start` int NOT NULL,
  `zone_end` int NOT NULL,
  `daily_cost` decimal(20,7) NOT NULL,
  `yearly_cost` decimal(20,7) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `energy_tax_end_date` (`end_date`),
  KEY `energy_tax_product_type` (`product_type`),
  KEY `energy_tax_start_date` (`start_date`),
  KEY `energy_tax_zone_end` (`zone_end`),
  KEY `energy_tax_zone_start` (`zone_start`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for estimation_logging
-- ----------------------------
DROP TABLE IF EXISTS `estimation_logging`;
CREATE TABLE `estimation_logging` (
  `id` int NOT NULL AUTO_INCREMENT,
  `request` text,
  `response` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `external_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `external_id` (`external_id`)
) ENGINE=InnoDB AUTO_INCREMENT=684766 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for fixed_delivery_cost
-- ----------------------------
DROP TABLE IF EXISTS `fixed_delivery_cost`;
CREATE TABLE `fixed_delivery_cost` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `product_type` varchar(255) NOT NULL,
  `fee` decimal(20,5) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `reseller_id` bigint NOT NULL DEFAULT '192',
  `contract_type` varchar(255) DEFAULT NULL,
  `usage_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fixed_delivery_cost_end_date` (`end_date`),
  KEY `fixed_delivery_cost_product_type` (`product_type`),
  KEY `fixed_delivery_cost_start_date` (`start_date`)
) ENGINE=InnoDB AUTO_INCREMENT=4669 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for fixed_delivery_cost_history
-- ----------------------------
DROP TABLE IF EXISTS `fixed_delivery_cost_history`;
CREATE TABLE `fixed_delivery_cost_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fixed_delivery_cost_id` int NOT NULL,
  `old_value` varchar(255) DEFAULT NULL,
  `new_value` varchar(255) DEFAULT NULL,
  `change_date` datetime DEFAULT NULL,
  `change_type` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `changed_by` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  PRIMARY KEY (`id`),
  KEY `fixed_delivery_cost_History` (`fixed_delivery_cost_id`),
  CONSTRAINT `fixed_delivery_cost_History` FOREIGN KEY (`fixed_delivery_cost_id`) REFERENCES `fixed_delivery_cost` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=1845 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for fixed_return_delivery_price
-- ----------------------------
DROP TABLE IF EXISTS `fixed_return_delivery_price`;
CREATE TABLE `fixed_return_delivery_price` (
  `id` int NOT NULL AUTO_INCREMENT,
  `frdc_sheet_id` int NOT NULL,
  `volume_from` int NOT NULL,
  `volume_until` int NOT NULL,
  `day_tariff` decimal(12,7) NOT NULL,
  `multiplier` decimal(12,7) NOT NULL,
  `month_tariff` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `month_tariff_incl_btw` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  PRIMARY KEY (`id`),
  KEY `IX_fixed_return_delivery_price_frdc_sheet_id` (`frdc_sheet_id`),
  CONSTRAINT `FK_fixed_return_delivery_price_frdc_sheet_frdc_sheet_id` FOREIGN KEY (`frdc_sheet_id`) REFERENCES `frdc_sheet` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=1441 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for frdc_sheet
-- ----------------------------
DROP TABLE IF EXISTS `frdc_sheet`;
CREATE TABLE `frdc_sheet` (
  `id` int NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) DEFAULT NULL,
  `uploaded_file_name` varchar(255) DEFAULT NULL,
  `uploaded_date` datetime(6) NOT NULL,
  `start_date` datetime(6) NOT NULL,
  `end_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for free_price_base
-- ----------------------------
DROP TABLE IF EXISTS `free_price_base`;
CREATE TABLE `free_price_base` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `on_peak` decimal(20,7) NOT NULL,
  `off_peak` decimal(20,7) NOT NULL,
  `single` decimal(20,7) NOT NULL,
  `product_type` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for free_price_customer
-- ----------------------------
DROP TABLE IF EXISTS `free_price_customer`;
CREATE TABLE `free_price_customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `on_peak` decimal(20,7) NOT NULL,
  `off_peak` decimal(20,7) NOT NULL,
  `single` decimal(20,7) NOT NULL,
  `fixed_delivery_cost` decimal(20,7) NOT NULL,
  `product_type` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for free_price_error
-- ----------------------------
DROP TABLE IF EXISTS `free_price_error`;
CREATE TABLE `free_price_error` (
  `id` int NOT NULL AUTO_INCREMENT,
  `error` tinytext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_date` datetime NOT NULL,
  `correlation_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=278 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for free_price_kikker
-- ----------------------------
DROP TABLE IF EXISTS `free_price_kikker`;
CREATE TABLE `free_price_kikker` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `top_up_fee_on_peak` decimal(20,7) NOT NULL,
  `top_up_fee_off_peak` decimal(20,7) NOT NULL,
  `top_up_fee_single` decimal(20,7) NOT NULL,
  `fixed_delivery_cost` decimal(20,7) NOT NULL,
  `product_type` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for free_price_reseller
-- ----------------------------
DROP TABLE IF EXISTS `free_price_reseller`;
CREATE TABLE `free_price_reseller` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `top_up_fee_on_peak` decimal(20,7) NOT NULL,
  `top_up_fee_off_peak` decimal(20,7) NOT NULL,
  `top_up_fee_single` decimal(20,7) NOT NULL,
  `fixed_delivery_cost` decimal(20,7) NOT NULL,
  `product_type` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for green_energy_price
-- ----------------------------
DROP TABLE IF EXISTS `green_energy_price`;
CREATE TABLE `green_energy_price` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `price` decimal(20,5) NOT NULL,
  `year` int NOT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fixed_delivery_cost_start_date` (`created_date`),
  KEY `fixed_delivery_cost_product_type` (`type`),
  KEY `fixed_delivery_cost_end_date` (`year`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for grid_operator
-- ----------------------------
DROP TABLE IF EXISTS `grid_operator`;
CREATE TABLE `grid_operator` (
  `id` int NOT NULL AUTO_INCREMENT,
  `netbeheerder_id` int NOT NULL,
  `product_type` varchar(255) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `netbeheerder_id` (`netbeheerder_id`),
  KEY `grid_operator_end_date` (`end_date`),
  KEY `grid_operator_product_type` (`product_type`),
  KEY `grid_operator_start_date` (`start_date`),
  CONSTRAINT `netbeheerder_id` FOREIGN KEY (`netbeheerder_id`) REFERENCES `netbeheerder` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for grid_operator_price
-- ----------------------------
DROP TABLE IF EXISTS `grid_operator_price`;
CREATE TABLE `grid_operator_price` (
  `id` int NOT NULL AUTO_INCREMENT,
  `capacity` varchar(255) NOT NULL,
  `connection_service` decimal(10,5) NOT NULL,
  `transport_fixed` decimal(10,5) NOT NULL,
  `transport` decimal(10,5) NOT NULL,
  `smart_meter` decimal(10,5) NOT NULL,
  `profile_category` varchar(255) DEFAULT NULL,
  `area_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `area_grid` (`area_id`),
  KEY `grid_operator_price_capacity` (`capacity`),
  CONSTRAINT `area_grid` FOREIGN KEY (`area_id`) REFERENCES `grid_operator` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for hourly_product_elk_price
-- ----------------------------
DROP TABLE IF EXISTS `hourly_product_elk_price`;
CREATE TABLE `hourly_product_elk_price` (
  `Id` int NOT NULL AUTO_INCREMENT,
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
  `created_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `updated_date` datetime DEFAULT NULL,
  `isp` int DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `IX_hourly_product_elk_price_delivery_day_isp` (`delivery_day`) USING BTREE,
  KEY `IX_hourly_product_elk_price_id_isp` (`Id`) USING BTREE,
  KEY `IX_hourly_product_elk_price_month_year_isp` (`month`,`year`) USING BTREE,
  KEY `IX_hourly_product_elk_price_day_hour_month_year_isp` (`day`,`hour`,`month`,`year`) USING BTREE,
  KEY `IX_hourly_product_elk_price_isp` (`isp`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=299782 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for hourly_product_elk_price_backup
-- ----------------------------
DROP TABLE IF EXISTS `hourly_product_elk_price_backup`;
CREATE TABLE `hourly_product_elk_price_backup` (
  `Id` int NOT NULL AUTO_INCREMENT,
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
  `created_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `updated_date` datetime DEFAULT NULL,
  `isp` int DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `IX_hourly_product_elk_price_delivery_day_isp` (`delivery_day`) USING BTREE,
  KEY `IX_hourly_product_elk_price_id_isp` (`Id`) USING BTREE,
  KEY `IX_hourly_product_elk_price_month_year_isp` (`month`,`year`) USING BTREE,
  KEY `IX_hourly_product_elk_price_day_hour_month_year_isp` (`day`,`hour`,`month`,`year`) USING BTREE,
  KEY `IX_hourly_product_elk_price_isp` (`isp`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=284111 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for hourly_product_elk_price_partition
-- ----------------------------
DROP TABLE IF EXISTS `hourly_product_elk_price_partition`;
CREATE TABLE `hourly_product_elk_price_partition` (
  `Id` int NOT NULL AUTO_INCREMENT,
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
  `created_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `updated_date` datetime DEFAULT NULL,
  `isp` int DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `IX_hourly_product_elk_price_delivery_day_isp` (`delivery_day`) USING BTREE,
  KEY `IX_hourly_product_elk_price_id_isp` (`Id`) USING BTREE,
  KEY `IX_hourly_product_elk_price_month_year_isp` (`month`,`year`) USING BTREE,
  KEY `IX_hourly_product_elk_price_day_hour_month_year_isp` (`day`,`hour`,`month`,`year`) USING BTREE,
  KEY `IX_hourly_product_elk_price_isp` (`isp`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=346707 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for hourly_product_gas_price
-- ----------------------------
DROP TABLE IF EXISTS `hourly_product_gas_price`;
CREATE TABLE `hourly_product_gas_price` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `conversion_factor` decimal(12,7) NOT NULL,
  `day` int NOT NULL,
  `day_of_week` int NOT NULL,
  `day_of_year` int NOT NULL,
  `delivery_day` datetime(6) NOT NULL,
  `egsi_m3` decimal(12,7) NOT NULL,
  `egsi_mwh` decimal(12,7) NOT NULL,
  `month` int NOT NULL,
  `month_year` longtext,
  `year` int NOT NULL,
  `created_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_hourly_product_gas_price_delivery_day` (`delivery_day`),
  KEY `IX_hourly_product_gas_price_id` (`Id`),
  KEY `IX_hourly_product_gas_price_month_year` (`month`,`year`),
  KEY `IX_hourly_product_gas_price_day_month_year` (`day`,`month`,`year`)
) ENGINE=InnoDB AUTO_INCREMENT=1068 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for kikker_business_fixed_delivery_cost
-- ----------------------------
DROP TABLE IF EXISTS `kikker_business_fixed_delivery_cost`;
CREATE TABLE `kikker_business_fixed_delivery_cost` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `product_type` varchar(255) NOT NULL,
  `fee` decimal(20,5) NOT NULL,
  `reseller_id` bigint NOT NULL DEFAULT '192',
  `contract_type` varchar(255) DEFAULT NULL,
  `usage_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kikker_business_fixed_delivery_cost_contract_type` (`contract_type`),
  KEY `kikker_business_fixed_delivery_cost_product_type` (`product_type`)
) ENGINE=InnoDB AUTO_INCREMENT=1219 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for kikker_business_fixed_delivery_cost_history
-- ----------------------------
DROP TABLE IF EXISTS `kikker_business_fixed_delivery_cost_history`;
CREATE TABLE `kikker_business_fixed_delivery_cost_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kikker_business_fixed_delivery_cost_id` int NOT NULL,
  `old_value` varchar(255) DEFAULT NULL,
  `new_value` varchar(255) DEFAULT NULL,
  `change_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kikker_business_fixed_delivery_cost_history_parent_id` (`kikker_business_fixed_delivery_cost_id`),
  CONSTRAINT `kikker_business_fixed_delivery_cost_history_parent_id` FOREIGN KEY (`kikker_business_fixed_delivery_cost_id`) REFERENCES `kikker_business_fixed_delivery_cost` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for kikker_feed_in_fee
-- ----------------------------
DROP TABLE IF EXISTS `kikker_feed_in_fee`;
CREATE TABLE `kikker_feed_in_fee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fee` decimal(20,7) NOT NULL,
  `contract_type` varchar(255) DEFAULT NULL,
  `product_type` varchar(255) NOT NULL,
  `usage_type` varchar(255) DEFAULT NULL,
  `reseller_id` bigint NOT NULL DEFAULT '192',
  PRIMARY KEY (`id`),
  KEY `kikker_feed_in_fee_contract_type` (`contract_type`),
  KEY `id` (`id`),
  KEY `kikker_feed_in_fee_reseller_id` (`reseller_id`),
  KEY `kikker_feed_in_fee_contract_type_product_type_usage_type_reselle` (`contract_type`,`product_type`,`usage_type`,`reseller_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3980 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for kikker_portfolio_fee
-- ----------------------------
DROP TABLE IF EXISTS `kikker_portfolio_fee`;
CREATE TABLE `kikker_portfolio_fee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reseller_id` int NOT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `product_type` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `fee` decimal(65,30) NOT NULL,
  `start_date` datetime(6) DEFAULT NULL,
  `end_date` datetime(6) DEFAULT NULL,
  `contract_type` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `usage_type` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for kikker_topup_fee
-- ----------------------------
DROP TABLE IF EXISTS `kikker_topup_fee`;
CREATE TABLE `kikker_topup_fee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `fee` decimal(20,7) NOT NULL,
  `contract_type` varchar(255) DEFAULT NULL,
  `product_type` varchar(255) NOT NULL,
  `usage_type` varchar(255) DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime DEFAULT NULL,
  `priority` int DEFAULT NULL,
  `reseller_id` bigint NOT NULL DEFAULT '192',
  PRIMARY KEY (`id`),
  KEY `kikker_topup_fee_contract_type` (`contract_type`),
  KEY `kikker_topup_fee_end_date` (`end_date`),
  KEY `kikker_topup_fee_product_type` (`product_type`),
  KEY `kikker_topup_fee_start_date` (`start_date`)
) ENGINE=InnoDB AUTO_INCREMENT=9280 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for kikker_topup_fee_frdc
-- ----------------------------
DROP TABLE IF EXISTS `kikker_topup_fee_frdc`;
CREATE TABLE `kikker_topup_fee_frdc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `fee` decimal(20,7) NOT NULL,
  `contract_type` varchar(255) DEFAULT NULL,
  `product_type` varchar(255) NOT NULL,
  `usage_type` varchar(255) DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime DEFAULT NULL,
  `priority` int DEFAULT NULL,
  `reseller_id` bigint NOT NULL DEFAULT '192',
  PRIMARY KEY (`id`),
  KEY `kikker_topup_fee_frdc_contract_type` (`contract_type`),
  KEY `kikker_topup_fee_frdc_end_date` (`end_date`),
  KEY `kikker_topup_fee_frdc_product_type` (`product_type`),
  KEY `kikker_topup_fee_frdc_start_date` (`start_date`)
) ENGINE=InnoDB AUTO_INCREMENT=8021 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for kikker_topup_fee_frdc_history
-- ----------------------------
DROP TABLE IF EXISTS `kikker_topup_fee_frdc_history`;
CREATE TABLE `kikker_topup_fee_frdc_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kikker_topup_fee_frdc_id` int NOT NULL,
  `old_value` varchar(255) DEFAULT NULL,
  `new_value` varchar(255) DEFAULT NULL,
  `change_date` datetime DEFAULT NULL,
  `change_type` varchar(255) DEFAULT NULL,
  `changed_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kikker_topup_fee_frdc_id` (`kikker_topup_fee_frdc_id`),
  CONSTRAINT `kikker_topup_fee_frdc_history_ibfk_1` FOREIGN KEY (`kikker_topup_fee_frdc_id`) REFERENCES `kikker_topup_fee_frdc` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for kikker_topup_fee_history
-- ----------------------------
DROP TABLE IF EXISTS `kikker_topup_fee_history`;
CREATE TABLE `kikker_topup_fee_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kikker_topup_fee_id` int NOT NULL,
  `old_value` varchar(255) DEFAULT NULL,
  `new_value` varchar(255) DEFAULT NULL,
  `change_date` datetime DEFAULT NULL,
  `change_type` varchar(255) NOT NULL DEFAULT '',
  `changed_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kikker_topup_fee_id` (`kikker_topup_fee_id`),
  CONSTRAINT `kikker_topup_fee_history_ibfk_1` FOREIGN KEY (`kikker_topup_fee_id`) REFERENCES `kikker_topup_fee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=12292 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for latest_monthly_base_price
-- ----------------------------
DROP TABLE IF EXISTS `latest_monthly_base_price`;
CREATE TABLE `latest_monthly_base_price` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contract_number` varchar(30) DEFAULT NULL,
  `ean` varchar(30) DEFAULT NULL,
  `on_peak_price` decimal(20,7) NOT NULL,
  `off_peak_price` decimal(20,7) NOT NULL,
  `single_price` decimal(20,7) NOT NULL,
  `price_date` datetime NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `IX_latest_monthly_base_price_contract_number_ean` (`contract_number`,`ean`)
) ENGINE=InnoDB AUTO_INCREMENT=23390 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for leba_daily_prices
-- ----------------------------
DROP TABLE IF EXISTS `leba_daily_prices`;
CREATE TABLE `leba_daily_prices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `publication_date` datetime DEFAULT NULL,
  `delivery_date` datetime DEFAULT NULL,
  `energy_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `volume` decimal(10,4) NOT NULL,
  `price` decimal(10,4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for leba_kikker_topup_fee
-- ----------------------------
DROP TABLE IF EXISTS `leba_kikker_topup_fee`;
CREATE TABLE `leba_kikker_topup_fee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `fee` decimal(20,5) NOT NULL,
  `contract_type` varchar(255) DEFAULT NULL,
  `product_type` varchar(255) NOT NULL,
  `usage_type` varchar(255) DEFAULT NULL,
  `reseller_id` bigint NOT NULL DEFAULT '192',
  `start_date` datetime NOT NULL,
  `end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `leba_kikker_topup_fee_contract_type` (`contract_type`),
  KEY `leba_kikker_topup_fee_product_type` (`product_type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for leba_monthly_prices
-- ----------------------------
DROP TABLE IF EXISTS `leba_monthly_prices`;
CREATE TABLE `leba_monthly_prices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `publication_date` datetime DEFAULT NULL,
  `energy_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `year` int NOT NULL,
  `month` int NOT NULL,
  `price` decimal(10,4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for leba_pv_topups
-- ----------------------------
DROP TABLE IF EXISTS `leba_pv_topups`;
CREATE TABLE `leba_pv_topups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pv_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `energy_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `from_date` datetime DEFAULT NULL,
  `until_date` datetime DEFAULT NULL,
  `price` decimal(10,6) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for leba_unit_prices
-- ----------------------------
DROP TABLE IF EXISTS `leba_unit_prices`;
CREATE TABLE `leba_unit_prices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `energy_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `from_date` datetime NOT NULL,
  `until_date` datetime DEFAULT NULL,
  `price` decimal(10,6) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for montel_token
-- ----------------------------
DROP TABLE IF EXISTS `montel_token`;
CREATE TABLE `montel_token` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) NOT NULL,
  `expired_time` datetime(6) NOT NULL,
  `token_type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `token` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for monthly_amount_limit
-- ----------------------------
DROP TABLE IF EXISTS `monthly_amount_limit`;
CREATE TABLE `monthly_amount_limit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `minimum` decimal(12,2) NOT NULL,
  `maximum` decimal(12,2) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for monthly_amount_validation_prices
-- ----------------------------
DROP TABLE IF EXISTS `monthly_amount_validation_prices`;
CREATE TABLE `monthly_amount_validation_prices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `single_price` decimal(20,7) NOT NULL,
  `normal_price` decimal(20,7) NOT NULL,
  `off_peak_price` decimal(20,7) NOT NULL,
  `product_type` varchar(255) NOT NULL,
  `contract_duration` varchar(255) NOT NULL,
  `usage_type` varchar(255) DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3519 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for netbeheerder
-- ----------------------------
DROP TABLE IF EXISTS `netbeheerder`;
CREATE TABLE `netbeheerder` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `area` varchar(255) NOT NULL,
  `active` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `netbeheerder_area_id` (`area`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for price_cap_configuration
-- ----------------------------
DROP TABLE IF EXISTS `price_cap_configuration`;
CREATE TABLE `price_cap_configuration` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `volume` decimal(20,7) NOT NULL,
  `price_with_eb` decimal(20,7) NOT NULL,
  `price_without_eb` decimal(20,7) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for price_cap_volume
-- ----------------------------
DROP TABLE IF EXISTS `price_cap_volume`;
CREATE TABLE `price_cap_volume` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `effective_date` datetime NOT NULL,
  `elk_single` decimal(20,7) NOT NULL,
  `elk_on_peak` decimal(20,7) NOT NULL,
  `elk_off_peak` decimal(20,7) NOT NULL,
  `gas` decimal(20,7) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=366 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for price_predictor_logging
-- ----------------------------
DROP TABLE IF EXISTS `price_predictor_logging`;
CREATE TABLE `price_predictor_logging` (
  `id` int NOT NULL AUTO_INCREMENT,
  `raw_data` longtext,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `contract_duration` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8485 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_name_en` varchar(50) DEFAULT NULL,
  `product_name_nl` varchar(50) DEFAULT NULL,
  `product_code` varchar(50) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_actived` bit(1) NOT NULL,
  `is_default` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for reduction_energy_tax
-- ----------------------------
DROP TABLE IF EXISTS `reduction_energy_tax`;
CREATE TABLE `reduction_energy_tax` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `product_type` varchar(255) NOT NULL,
  `daily_cost` decimal(20,7) NOT NULL,
  `yearly_cost` decimal(20,7) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reduction_energy_tax_end_date` (`end_date`),
  KEY `reduction_energy_tax_product_type` (`product_type`),
  KEY `reduction_energy_tax_start_date` (`start_date`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for reseller_company
-- ----------------------------
DROP TABLE IF EXISTS `reseller_company`;
CREATE TABLE `reseller_company` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reseller_company_uuid` varchar(255) DEFAULT NULL,
  `reseller_company_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=627 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for reseller_feed_in_fee
-- ----------------------------
DROP TABLE IF EXISTS `reseller_feed_in_fee`;
CREATE TABLE `reseller_feed_in_fee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fee` decimal(20,7) NOT NULL,
  `contract_type` varchar(255) NOT NULL,
  `product_type` varchar(255) NOT NULL,
  `usage_type` varchar(255) NOT NULL,
  `reseller_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reseller_feed_in_fee_contract_type` (`contract_type`),
  KEY `reseller_feed_in_fee_reseller_id` (`reseller_id`),
  KEY `reseller_feed_in_fee_contract_type_product_type_usage_type_resel` (`contract_type`,`product_type`,`usage_type`,`reseller_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1427 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for reseller_fixed_delivery_cost
-- ----------------------------
DROP TABLE IF EXISTS `reseller_fixed_delivery_cost`;
CREATE TABLE `reseller_fixed_delivery_cost` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reseller_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `product_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `fee` decimal(20,5) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `contract_type` varchar(255) NOT NULL,
  `usage_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fixed_delivery_cost_end_date` (`end_date`),
  KEY `fixed_delivery_cost_product_type` (`product_type`),
  KEY `fixed_delivery_cost_reseller_id` (`reseller_id`),
  KEY `fixed_delivery_cost_start_date` (`start_date`)
) ENGINE=InnoDB AUTO_INCREMENT=4755 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for reseller_fixed_delivery_cost_history
-- ----------------------------
DROP TABLE IF EXISTS `reseller_fixed_delivery_cost_history`;
CREATE TABLE `reseller_fixed_delivery_cost_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fixed_delivery_cost_id` int NOT NULL,
  `old_value` varchar(255) DEFAULT NULL,
  `new_value` varchar(255) DEFAULT NULL,
  `change_date` datetime DEFAULT NULL,
  `change_type` varchar(255) DEFAULT NULL,
  `changed_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fixed_delivery_cost_History` (`fixed_delivery_cost_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13411 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for reseller_margin_config
-- ----------------------------
DROP TABLE IF EXISTS `reseller_margin_config`;
CREATE TABLE `reseller_margin_config` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reseller_id` int NOT NULL,
  `product_type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `contract_type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `fee_type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `min` decimal(20,7) NOT NULL,
  `max` decimal(20,7) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IX_reseller_margin_config_unique` (`reseller_id`,`product_type`,`contract_type`,`fee_type`)
) ENGINE=InnoDB AUTO_INCREMENT=132213 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for reseller_portfolio_fee
-- ----------------------------
DROP TABLE IF EXISTS `reseller_portfolio_fee`;
CREATE TABLE `reseller_portfolio_fee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reseller_id` int NOT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `product_type` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `fee` decimal(65,30) NOT NULL,
  `start_date` datetime(6) DEFAULT NULL,
  `end_date` datetime(6) DEFAULT NULL,
  `contract_type` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `usage_type` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for reseller_product
-- ----------------------------
DROP TABLE IF EXISTS `reseller_product`;
CREATE TABLE `reseller_product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_name_nl` varchar(50) DEFAULT NULL,
  `product_name_en` varchar(50) DEFAULT NULL,
  `product_code` varchar(50) DEFAULT NULL,
  `reseller_uuid` varchar(50) DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  `usage_type` varchar(255) DEFAULT NULL,
  `is_apply_frdc` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_reseller_product_reseller_uuid` (`reseller_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=1609 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for reseller_topup_fee
-- ----------------------------
DROP TABLE IF EXISTS `reseller_topup_fee`;
CREATE TABLE `reseller_topup_fee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reseller_id` int NOT NULL,
  `contract_type` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `product_type` varchar(255) NOT NULL,
  `usage_type` varchar(255) NOT NULL,
  `fee` decimal(20,7) NOT NULL,
  `priority` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reseller_topup_fee_contract_type` (`contract_type`),
  KEY `reseller_topup_fee_product_type` (`product_type`),
  KEY `reseller_topup_fee_reseller_id` (`reseller_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5492 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for reseller_topup_fee_frdc
-- ----------------------------
DROP TABLE IF EXISTS `reseller_topup_fee_frdc`;
CREATE TABLE `reseller_topup_fee_frdc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reseller_id` int NOT NULL,
  `contract_type` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `product_type` varchar(255) NOT NULL,
  `usage_type` varchar(255) NOT NULL,
  `fee` decimal(20,7) NOT NULL,
  `priority` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reseller_topup_fee_frdc_contract_type` (`contract_type`),
  KEY `reseller_topup_fee_frdc_product_type` (`product_type`),
  KEY `reseller_topup_fee_frdc_reseller_id` (`reseller_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5351 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for reseller_topup_fee_frdc_history
-- ----------------------------
DROP TABLE IF EXISTS `reseller_topup_fee_frdc_history`;
CREATE TABLE `reseller_topup_fee_frdc_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reseller_topup_fee_frdc_id` int NOT NULL,
  `old_value` varchar(255) DEFAULT NULL,
  `new_value` varchar(255) DEFAULT NULL,
  `change_date` datetime DEFAULT NULL,
  `change_type` varchar(255) DEFAULT NULL,
  `changed_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reseller_topup_fee_frdc_id` (`reseller_topup_fee_frdc_id`),
  CONSTRAINT `reseller_topup_fee_frdc_history_ibfk_1` FOREIGN KEY (`reseller_topup_fee_frdc_id`) REFERENCES `reseller_topup_fee_frdc` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for reseller_topup_fee_history
-- ----------------------------
DROP TABLE IF EXISTS `reseller_topup_fee_history`;
CREATE TABLE `reseller_topup_fee_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reseller_topup_fee_id` int NOT NULL,
  `old_value` varchar(255) DEFAULT NULL,
  `new_value` varchar(255) DEFAULT NULL,
  `change_date` datetime DEFAULT NULL,
  `change_type` varchar(255) NOT NULL DEFAULT '',
  `changed_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reseller_topup_fee_id` (`reseller_topup_fee_id`),
  CONSTRAINT `reseller_topup_fee_history_ibfk_1` FOREIGN KEY (`reseller_topup_fee_id`) REFERENCES `reseller_topup_fee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=25420 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for return_delivery_tariff
-- ----------------------------
DROP TABLE IF EXISTS `return_delivery_tariff`;
CREATE TABLE `return_delivery_tariff` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `fee` decimal(20,5) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `contract_duration` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `fixed_delivery_cost_end_date` (`end_date`),
  KEY `fixed_delivery_cost_start_date` (`start_date`)
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for smart_meter
-- ----------------------------
DROP TABLE IF EXISTS `smart_meter`;
CREATE TABLE `smart_meter` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `daily_cost` decimal(20,7) NOT NULL,
  `yearly_cost` decimal(20,7) DEFAULT NULL,
  `area_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `area_id_smart_meter` (`area_id`),
  CONSTRAINT `area_id_smart_meter` FOREIGN KEY (`area_id`) REFERENCES `grid_operator` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for sustainable_energy_storage
-- ----------------------------
DROP TABLE IF EXISTS `sustainable_energy_storage`;
CREATE TABLE `sustainable_energy_storage` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `product_type` varchar(255) NOT NULL,
  `zone_start` int NOT NULL,
  `zone_end` int NOT NULL,
  `daily_cost` decimal(20,7) NOT NULL,
  `yearly_cost` decimal(20,7) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sustainable_energy_storage_end_date` (`end_date`),
  KEY `sustainable_energy_storage_product_type` (`product_type`),
  KEY `sustainable_energy_storage_start_date` (`start_date`),
  KEY `sustainable_energy_storage_zone_end` (`zone_end`),
  KEY `sustainable_energy_storage_zone_start` (`zone_start`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for transport_cost
-- ----------------------------
DROP TABLE IF EXISTS `transport_cost`;
CREATE TABLE `transport_cost` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `daily_cost` decimal(10,2) NOT NULL,
  `yearly_cost` decimal(10,2) NOT NULL,
  `area_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `area_id_transport` (`area_id`),
  CONSTRAINT `area_id_transport` FOREIGN KEY (`area_id`) REFERENCES `grid_operator` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for vko_calculate_usage
-- ----------------------------
DROP TABLE IF EXISTS `vko_calculate_usage`;
CREATE TABLE `vko_calculate_usage` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ean_money_id` int NOT NULL,
  `request` text,
  `response` text,
  `input` text,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29011 DEFAULT CHARSET=utf8mb3;

SET FOREIGN_KEY_CHECKS = 1;
