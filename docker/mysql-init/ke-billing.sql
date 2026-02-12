/*
 Navicat Premium Dump SQL

 Source Server         : Kikker Prod R - BILLING
 Source Server Type    : MySQL
 Source Server Version : 80026 (8.0.26-google)
 Source Host           : 34.32.213.253:3306
 Source Schema         : ke-billing

 Target Server Type    : MySQL
 Target Server Version : 80026 (8.0.26-google)
 File Encoding         : 65001

 Date: 12/02/2026 16:15:42
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
-- Table structure for billing_accounting
-- ----------------------------
DROP TABLE IF EXISTS `billing_accounting`;
CREATE TABLE `billing_accounting` (
  `id` int NOT NULL AUTO_INCREMENT,
  `calculation_id` int NOT NULL,
  `data` json NOT NULL,
  `create_date` datetime(6) NOT NULL,
  `update_date` datetime(6) NOT NULL,
  `accounting_invoice_amount` decimal(20,7) NOT NULL DEFAULT '0.0000000',
  `difference_amount` decimal(20,7) NOT NULL DEFAULT '0.0000000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52952 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for billing_addresses
-- ----------------------------
DROP TABLE IF EXISTS `billing_addresses`;
CREATE TABLE `billing_addresses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `city` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `zipcode` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `street` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `house_number` int NOT NULL,
  `house_number_ext` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for billing_details
-- ----------------------------
DROP TABLE IF EXISTS `billing_details`;
CREATE TABLE `billing_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_fname` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `customer_lname` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `company_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `kvk` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `iban` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `phone_number` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `phone_office_number` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `client_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `contract_reference` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `reseller_id` int DEFAULT NULL,
  `bank_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `contact_name` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `communication_email` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `order_flow` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_billing_details_reseller_id` (`reseller_id`),
  CONSTRAINT `FK_billing_details_reseller_reseller_id` FOREIGN KEY (`reseller_id`) REFERENCES `reseller` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79787 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for billing_interaction_log
-- ----------------------------
DROP TABLE IF EXISTS `billing_interaction_log`;
CREATE TABLE `billing_interaction_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contract_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `collector_data` json DEFAULT NULL,
  `created_date` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `is_generated` bit(1) NOT NULL,
  `is_sent_to_customer` bit(1) NOT NULL,
  `from` datetime(6) NOT NULL,
  `until` datetime(6) NOT NULL,
  `calculation_external_id` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `response` json DEFAULT NULL,
  `request` json DEFAULT NULL,
  `invoice_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `updated_date` datetime(6) DEFAULT NULL,
  `type` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `billing_id` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IX_billing_interaction_log_billing_id` (`billing_id`),
  KEY `IX_calculation_external_id` (`calculation_external_id`) USING BTREE,
  KEY `idx_billing_interaction_logs_contract` (`contract_number`),
  KEY `idx_billing_interaction_logs_invoicenumber` (`invoice_number`),
  KEY `idx_issent` (`is_sent_to_customer`) USING BTREE,
  CONSTRAINT `FK_billing_interaction_log_calculations_billing_id` FOREIGN KEY (`billing_id`) REFERENCES `calculations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=81431 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for calculate_new_ma_log
-- ----------------------------
DROP TABLE IF EXISTS `calculate_new_ma_log`;
CREATE TABLE `calculate_new_ma_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contract_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `calculation_id` int NOT NULL,
  `calculation_external_id` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_date` datetime(6) DEFAULT NULL,
  `updated_date` datetime(6) DEFAULT NULL,
  `from` datetime(6) NOT NULL,
  `until` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_calculate_new_ma_log_calculation_external_id` (`calculation_external_id`),
  KEY `IX_calculate_new_ma_log_calculation_id` (`calculation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38293 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for calculations
-- ----------------------------
DROP TABLE IF EXISTS `calculations`;
CREATE TABLE `calculations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contract_number` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `from` datetime(6) NOT NULL,
  `until` datetime(6) NOT NULL,
  `external_id` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `billing_address_id` int NOT NULL,
  `billing_detail_id` int NOT NULL,
  `activated_days` int NOT NULL DEFAULT '0',
  `remaining_day` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `apply_cancellation_fee` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `invoice_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `pdf_link` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `payment_method` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `mixed_contract` bit(1) NOT NULL DEFAULT b'0',
  `contract_status` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `contract_external_id` char(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `is_apply_frdc` bit(1) NOT NULL DEFAULT b'0',
  `is_used_populate` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `IX_calculations_billing_address_id` (`billing_address_id`),
  KEY `IX_calculations_billing_detail_id` (`billing_detail_id`),
  KEY `IX_calculations_contract_number` (`contract_number`),
  KEY `IX_calculations_external_id` (`external_id`),
  KEY `IX_calculations_invoice_number` (`invoice_number`),
  KEY `idx_calculations_invoice_number` (`invoice_number`),
  KEY `idx_calculations_contract_number` (`contract_number`),
  KEY `idx_calculations_external_id` (`external_id`),
  CONSTRAINT `FK_calculations_billing_addresses_billing_address_id` FOREIGN KEY (`billing_address_id`) REFERENCES `billing_addresses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_calculations_billing_details_billing_detail_id` FOREIGN KEY (`billing_detail_id`) REFERENCES `billing_details` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=79784 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for cancellation_fee
-- ----------------------------
DROP TABLE IF EXISTS `cancellation_fee`;
CREATE TABLE `cancellation_fee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `fee` decimal(16,8) NOT NULL,
  `calculation_id` int NOT NULL DEFAULT '0',
  `reason` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_cancellation_fee_calculation_id` (`calculation_id`),
  CONSTRAINT `FK_cancellation_fee_calculations_calculation_id` FOREIGN KEY (`calculation_id`) REFERENCES `calculations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=142728 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for contract_eans
-- ----------------------------
DROP TABLE IF EXISTS `contract_eans`;
CREATE TABLE `contract_eans` (
  `id` int NOT NULL AUTO_INCREMENT,
  `calculation_id` int NOT NULL,
  `ean` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `product` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `product_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `product_code` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `from` datetime(6) NOT NULL,
  `until` datetime(6) NOT NULL,
  `double_meter` bit(1) NOT NULL,
  `price_cap_status` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_smart_meter` bit(1) NOT NULL DEFAULT b'0',
  `is_residence` bit(1) NOT NULL DEFAULT b'0',
  `double_meter_original` bit(1) NOT NULL DEFAULT b'0',
  `status` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `recalculate_hourly_consumption_percentage` decimal(65,30) NOT NULL DEFAULT '1.000000000000000000000000000000',
  `recalculate_hourly_production_percentage` decimal(65,30) NOT NULL DEFAULT '1.000000000000000000000000000000',
  `is_recalculate_hourly_usage` bit(1) NOT NULL DEFAULT b'0',
  `ean_usage_type` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_contract_eans_calculation_id` (`calculation_id`),
  KEY `idx_contract_eans_ean` (`ean`),
  KEY `idx_contract_eans_calc_ean` (`calculation_id`,`ean`),
  CONSTRAINT `FK_contract_eans_calculations_calculation_id` FOREIGN KEY (`calculation_id`) REFERENCES `calculations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=159859 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for grid_operators
-- ----------------------------
DROP TABLE IF EXISTS `grid_operators`;
CREATE TABLE `grid_operators` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ean` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `from` datetime(6) NOT NULL,
  `until` datetime(6) NOT NULL,
  `iban` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `btw_number` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `split_type_elk` int NOT NULL,
  `split_type_gas` int NOT NULL,
  `address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `kvk_number` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `phone_number` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71475 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for grid_sub_operators
-- ----------------------------
DROP TABLE IF EXISTS `grid_sub_operators`;
CREATE TABLE `grid_sub_operators` (
  `id` int NOT NULL AUTO_INCREMENT,
  `grid_operator_id` int NOT NULL,
  `sub_ean` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sub_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_grid_sub_operators_grid_operator_id` (`grid_operator_id`),
  CONSTRAINT `FK_grid_sub_operators_grid_operators_grid_operator_id` FOREIGN KEY (`grid_operator_id`) REFERENCES `grid_operators` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53141 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for master_data
-- ----------------------------
DROP TABLE IF EXISTS `master_data`;
CREATE TABLE `master_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contract_ean_id` int NOT NULL,
  `from` datetime(6) NOT NULL,
  `until` datetime(6) NOT NULL,
  `captar_code` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `captar_tariff` decimal(16,8) NOT NULL,
  `grid_operator_id` int NOT NULL,
  `grid_operator_ean` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `profile` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `energy_delivery_status` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `physical_status` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pv_ean` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pv_id` int NOT NULL,
  `number_of_digits` int DEFAULT NULL,
  `message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `register` json DEFAULT NULL,
  `grid_area` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `temperature_correction` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_master_data_contract_ean_id` (`contract_ean_id`),
  KEY `IX_master_data_grid_operator_id` (`grid_operator_id`),
  KEY `IX_master_data_pv_id` (`pv_id`),
  KEY `idx_master_data_contract_ean_id` (`contract_ean_id`),
  KEY `idx_master_data_contract_date` (`contract_ean_id`,`from`),
  CONSTRAINT `FK_master_data_contract_eans_contract_ean_id` FOREIGN KEY (`contract_ean_id`) REFERENCES `contract_eans` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_master_data_grid_operators_grid_operator_id` FOREIGN KEY (`grid_operator_id`) REFERENCES `grid_operators` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_master_data_pvs_pv_id` FOREIGN KEY (`pv_id`) REFERENCES `pvs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=267346 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for meter_reads
-- ----------------------------
DROP TABLE IF EXISTS `meter_reads`;
CREATE TABLE `meter_reads` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contract_ean_id` int NOT NULL,
  `meter_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `register` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `unit` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `from` datetime(6) NOT NULL,
  `until` datetime(6) NOT NULL,
  `meter_read_from` decimal(20,7) NOT NULL,
  `meter_read_until` decimal(20,7) NOT NULL,
  `reading_source_from` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `reading_source_until` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `multiplication_factor` decimal(16,8) NOT NULL,
  `volume` decimal(20,7) NOT NULL,
  `volume_without_factor` decimal(20,7) NOT NULL,
  `messages` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `energy_delivery_status` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `physical_status` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_smart_meter` bit(1) NOT NULL DEFAULT b'0',
  `product_code` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `product_name` char(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `is_apply_frdc` bit(1) NOT NULL DEFAULT b'0',
  `base_factor` decimal(20,7) NOT NULL DEFAULT '0.0000000',
  `caloric_factor` decimal(20,7) DEFAULT NULL,
  `volume_conversion_factor` decimal(20,7) DEFAULT NULL,
  `is_used_populate` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `IX_meter_reads_contract_ean_id` (`contract_ean_id`),
  KEY `idx_meter_reads_contract_register` (`contract_ean_id`,`register`),
  KEY `idx_meter_reads_contract_date` (`contract_ean_id`,`from`,`until`),
  CONSTRAINT `FK_meter_reads_contract_eans_contract_ean_id` FOREIGN KEY (`contract_ean_id`) REFERENCES `contract_eans` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1992316 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for monthly_invoice_properties
-- ----------------------------
DROP TABLE IF EXISTS `monthly_invoice_properties`;
CREATE TABLE `monthly_invoice_properties` (
  `id` int NOT NULL AUTO_INCREMENT,
  `monthly_invoice_id` int NOT NULL,
  `amount_btw` decimal(16,8) NOT NULL,
  `amount_including_btw` decimal(16,8) NOT NULL,
  `property_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_monthly_invoice_properties_monthly_invoice_id` (`monthly_invoice_id`),
  KEY `idx_monthly_invoice_props_invoice_type` (`monthly_invoice_id`,`property_type`),
  CONSTRAINT `FK_monthly_invoice_properties_monthly_invoices_monthly_invoice_~` FOREIGN KEY (`monthly_invoice_id`) REFERENCES `monthly_invoices` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6686 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for monthly_invoices
-- ----------------------------
DROP TABLE IF EXISTS `monthly_invoices`;
CREATE TABLE `monthly_invoices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Calculation_Id` int NOT NULL,
  `invoice_number` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `invoice_date` datetime(6) NOT NULL,
  `status` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status_date` datetime(6) NOT NULL,
  `month` int NOT NULL,
  `year` int NOT NULL,
  `amount` decimal(16,8) NOT NULL,
  `invoice_type` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `payment_status` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `total_estimation` decimal(16,8) NOT NULL DEFAULT '0.00000000',
  `total_paid` decimal(16,8) NOT NULL DEFAULT '0.00000000',
  PRIMARY KEY (`id`),
  KEY `IX_monthly_invoices_Calculation_Id` (`Calculation_Id`),
  KEY `idx_monthly_invoices_invoice_number` (`invoice_number`),
  CONSTRAINT `FK_monthly_invoices_calculations_Calculation_Id` FOREIGN KEY (`Calculation_Id`) REFERENCES `calculations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=680920 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for pdf_data
-- ----------------------------
DROP TABLE IF EXISTS `pdf_data`;
CREATE TABLE `pdf_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_date` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `json_pdf` json DEFAULT NULL,
  `html_pdf` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `calculation_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_pdf_data_calculation_id` (`calculation_id`),
  CONSTRAINT `FK_pdf_data_calculations_calculation_id` FOREIGN KEY (`calculation_id`) REFERENCES `calculations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8590 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for period_cost
-- ----------------------------
DROP TABLE IF EXISTS `period_cost`;
CREATE TABLE `period_cost` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usage_total_id` int NOT NULL,
  `contract_ean_id` int DEFAULT NULL,
  `btw_percentage` decimal(8,4) NOT NULL,
  `from` datetime(6) NOT NULL,
  `until` datetime(6) NOT NULL,
  `totals_type` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `grid_operator_id` int DEFAULT NULL,
  `amount` decimal(20,7) NOT NULL,
  `amount_btw` decimal(20,7) NOT NULL,
  `amount_incl_btw` decimal(20,7) NOT NULL,
  `product_code` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_period_cost_contract_ean_id` (`contract_ean_id`),
  KEY `IX_period_cost_grid_operator_id` (`grid_operator_id`),
  KEY `IX_period_cost_usage_total_id` (`usage_total_id`),
  CONSTRAINT `FK_period_cost_contract_eans_contract_ean_id` FOREIGN KEY (`contract_ean_id`) REFERENCES `contract_eans` (`id`),
  CONSTRAINT `FK_period_cost_grid_operators_grid_operator_id` FOREIGN KEY (`grid_operator_id`) REFERENCES `grid_operators` (`id`),
  CONSTRAINT `FK_period_cost_usage_totals_usage_total_id` FOREIGN KEY (`usage_total_id`) REFERENCES `usage_totals` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1406759 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for period_usages
-- ----------------------------
DROP TABLE IF EXISTS `period_usages`;
CREATE TABLE `period_usages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contract_ean_id` int NOT NULL,
  `meter_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `unit` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `multiplication_factor` decimal(16,8) NOT NULL,
  `volume` decimal(20,7) NOT NULL,
  `from` datetime(6) NOT NULL,
  `until` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_period_usages_contract_ean_id` (`contract_ean_id`),
  KEY `idx_period_usage_contract_date` (`contract_ean_id`,`from`),
  CONSTRAINT `FK_period_usages_contract_eans_contract_ean_id` FOREIGN KEY (`contract_ean_id`) REFERENCES `contract_eans` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=175754 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for price_cap_configuration
-- ----------------------------
DROP TABLE IF EXISTS `price_cap_configuration`;
CREATE TABLE `price_cap_configuration` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_type` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `volume` decimal(20,7) NOT NULL,
  `price_with_eb` decimal(20,7) NOT NULL,
  `price_without_eb` decimal(20,7) NOT NULL,
  `created_date` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `updated_date` datetime(6) DEFAULT NULL,
  `from` datetime(6) NOT NULL,
  `until` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for price_cap_volume
-- ----------------------------
DROP TABLE IF EXISTS `price_cap_volume`;
CREATE TABLE `price_cap_volume` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elk_single` decimal(20,7) NOT NULL,
  `elk_on_peak` decimal(20,7) NOT NULL,
  `elk_off_peak` decimal(20,7) NOT NULL,
  `gas` decimal(20,7) NOT NULL,
  `effective_date` datetime(6) NOT NULL,
  `created_date` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_date` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=733 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for price_caps
-- ----------------------------
DROP TABLE IF EXISTS `price_caps`;
CREATE TABLE `price_caps` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contract_ean_id` int NOT NULL,
  `btw_percentage` decimal(8,4) NOT NULL,
  `total_cost` decimal(20,7) NOT NULL,
  `total_volume` decimal(20,7) NOT NULL,
  `weighted_tariff` decimal(20,7) NOT NULL,
  `compensation_tariff` decimal(20,7) NOT NULL,
  `compensation_volume` decimal(20,7) NOT NULL,
  `amount` decimal(20,7) NOT NULL,
  `amount_btw` decimal(20,7) NOT NULL,
  `amount_including_btw` decimal(20,7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_price_caps_contract_ean_id` (`contract_ean_id`),
  CONSTRAINT `FK_price_caps_contract_eans_contract_ean_id` FOREIGN KEY (`contract_ean_id`) REFERENCES `contract_eans` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=159091 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for production_tariffs
-- ----------------------------
DROP TABLE IF EXISTS `production_tariffs`;
CREATE TABLE `production_tariffs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contract_ean_id` int NOT NULL,
  `from` datetime(6) NOT NULL,
  `until` datetime(6) NOT NULL,
  `total_usage_cost` decimal(20,7) NOT NULL,
  `total_usage_volume` decimal(20,7) NOT NULL,
  `tariff` decimal(16,8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_production_tariffs_contract_ean_id` (`contract_ean_id`),
  CONSTRAINT `FK_production_tariffs_contract_eans_contract_ean_id` FOREIGN KEY (`contract_ean_id`) REFERENCES `contract_eans` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for prorated_price_cap_volume
-- ----------------------------
DROP TABLE IF EXISTS `prorated_price_cap_volume`;
CREATE TABLE `prorated_price_cap_volume` (
  `id` int NOT NULL AUTO_INCREMENT,
  `from` datetime(6) NOT NULL,
  `until` datetime(6) NOT NULL,
  `prorated_volume` decimal(20,7) NOT NULL,
  `contract_ean_id` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IX_prorated_price_cap_volume_contract_ean_id` (`contract_ean_id`),
  CONSTRAINT `FK_prorated_price_cap_volume_contract_eans_contract_ean_id` FOREIGN KEY (`contract_ean_id`) REFERENCES `contract_eans` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13098 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for prorated_tax_brackets
-- ----------------------------
DROP TABLE IF EXISTS `prorated_tax_brackets`;
CREATE TABLE `prorated_tax_brackets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contract_ean_id` int NOT NULL,
  `from` datetime(6) NOT NULL,
  `until` datetime(6) NOT NULL,
  `btw_percentage` decimal(8,4) NOT NULL,
  `tax_year` int NOT NULL,
  `tax_bracket` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `energy_tax_type` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `bracket_start` decimal(36,8) NOT NULL,
  `bracket_end` decimal(36,8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_prorated_tax_brackets_contract_ean_id` (`contract_ean_id`),
  CONSTRAINT `FK_prorated_tax_brackets_contract_eans_contract_ean_id` FOREIGN KEY (`contract_ean_id`) REFERENCES `contract_eans` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1087056 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for pvs
-- ----------------------------
DROP TABLE IF EXISTS `pvs`;
CREATE TABLE `pvs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ean` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `split_type` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5930 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for real_usages
-- ----------------------------
DROP TABLE IF EXISTS `real_usages`;
CREATE TABLE `real_usages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contract_ean_id` int NOT NULL,
  `period_usage_id` int NOT NULL,
  `meter_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `register` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `meter_read_from` decimal(16,8) NOT NULL,
  `meter_read_until` decimal(16,8) NOT NULL,
  `reading_source_from` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `reading_source_until` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `multiplication_factor` decimal(16,8) NOT NULL,
  `volume` decimal(20,7) NOT NULL,
  `volume_without_factor` decimal(20,7) NOT NULL,
  `from` datetime(6) NOT NULL,
  `until` datetime(6) NOT NULL,
  `unit` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_real_usages_contract_ean_id` (`contract_ean_id`),
  KEY `IX_real_usages_period_usage_id` (`period_usage_id`),
  KEY `idx_real_usage_contract_date` (`contract_ean_id`,`from`),
  CONSTRAINT `FK_real_usages_contract_eans_contract_ean_id` FOREIGN KEY (`contract_ean_id`) REFERENCES `contract_eans` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_real_usages_period_usages_period_usage_id` FOREIGN KEY (`period_usage_id`) REFERENCES `period_usages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=436569 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for reseller
-- ----------------------------
DROP TABLE IF EXISTS `reseller`;
CREATE TABLE `reseller` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `phone_number` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `logo_url` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `kvk_number` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `btw_number` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `billing_address_id` int NOT NULL,
  `company_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `external_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `logo_contract_url` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_reseller_billing_address_id` (`billing_address_id`),
  CONSTRAINT `FK_reseller_billing_addresses_billing_address_id` FOREIGN KEY (`billing_address_id`) REFERENCES `billing_addresses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=440 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for settings
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for tariff_configs
-- ----------------------------
DROP TABLE IF EXISTS `tariff_configs`;
CREATE TABLE `tariff_configs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contract_ean_id` int NOT NULL,
  `from` datetime(6) NOT NULL,
  `until` datetime(6) NOT NULL,
  `unit` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tariff_type` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tariff` decimal(16,8) NOT NULL,
  `frdc_sheet_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_tariff_configs_contract_ean_id` (`contract_ean_id`),
  CONSTRAINT `FK_tariff_configs_contract_eans_contract_ean_id` FOREIGN KEY (`contract_ean_id`) REFERENCES `contract_eans` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3229877 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for temp_invoice_pairs
-- ----------------------------
DROP TABLE IF EXISTS `temp_invoice_pairs`;
CREATE TABLE `temp_invoice_pairs` (
  `reference_number` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `linked_invoice_number` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for usage_costs
-- ----------------------------
DROP TABLE IF EXISTS `usage_costs`;
CREATE TABLE `usage_costs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `period_cost_id` int NOT NULL,
  `contract_ean_id` int NOT NULL,
  `usage_type` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `unit` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tax_bracket` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `btw_percentage` decimal(8,4) NOT NULL,
  `from` datetime(6) NOT NULL,
  `until` datetime(6) NOT NULL,
  `volume` decimal(16,8) NOT NULL,
  `base_tariff` decimal(16,8) NOT NULL,
  `base_cost` decimal(16,8) NOT NULL,
  `base_cost_btw` decimal(16,8) NOT NULL,
  `base_cost_including_btw` decimal(16,8) NOT NULL,
  `kikker_tariff` decimal(16,8) NOT NULL,
  `kikker_cost` decimal(16,8) NOT NULL,
  `kikker_cost_btw` decimal(16,8) NOT NULL,
  `kikker_cost_including_btw` decimal(16,8) NOT NULL,
  `reseller_tariff` decimal(16,8) NOT NULL,
  `reseller_cost` decimal(16,8) NOT NULL,
  `reseller_cost_btw` decimal(16,8) NOT NULL,
  `reseller_cost_including_btw` decimal(16,8) NOT NULL,
  `tariff` decimal(16,8) NOT NULL,
  `amount` decimal(20,7) NOT NULL,
  `amount_btw` decimal(20,7) NOT NULL,
  `amount_including_btw` decimal(20,7) NOT NULL,
  `pv_id` int DEFAULT NULL,
  `messages` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `kikker_business_cost` decimal(20,7) NOT NULL DEFAULT '0.0000000',
  `kikker_business_cost_btw` decimal(20,7) NOT NULL DEFAULT '0.0000000',
  `kikker_business_cost_including_btw` decimal(20,7) NOT NULL DEFAULT '0.0000000',
  `kikker_business_tariff` decimal(16,8) NOT NULL DEFAULT '0.00000000',
  PRIMARY KEY (`id`),
  KEY `IX_usage_costs_contract_ean_id` (`contract_ean_id`),
  KEY `IX_usage_costs_period_cost_id` (`period_cost_id`),
  KEY `IX_usage_costs_pv_id` (`pv_id`),
  CONSTRAINT `FK_usage_costs_contract_eans_contract_ean_id` FOREIGN KEY (`contract_ean_id`) REFERENCES `contract_eans` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_usage_costs_period_cost_period_cost_id` FOREIGN KEY (`period_cost_id`) REFERENCES `period_cost` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_usage_costs_pvs_pv_id` FOREIGN KEY (`pv_id`) REFERENCES `pvs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2958500 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for usage_totals
-- ----------------------------
DROP TABLE IF EXISTS `usage_totals`;
CREATE TABLE `usage_totals` (
  `id` int NOT NULL AUTO_INCREMENT,
  `totals_type` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `calculation_id` int DEFAULT NULL,
  `amount` decimal(20,7) NOT NULL,
  `amount_btw` decimal(20,7) NOT NULL,
  `amount_including_btw` decimal(20,7) NOT NULL,
  `volume` decimal(20,7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_usage_totals_calculation_id` (`calculation_id`),
  KEY `idx_usage_totals_calc_type` (`calculation_id`,`totals_type`),
  CONSTRAINT `FK_usage_totals_calculations_calculation_id` FOREIGN KEY (`calculation_id`) REFERENCES `calculations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1756705 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for usage_totals_btw
-- ----------------------------
DROP TABLE IF EXISTS `usage_totals_btw`;
CREATE TABLE `usage_totals_btw` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usage_total_id` int NOT NULL,
  `btw_percentage` decimal(8,4) NOT NULL,
  `amount` decimal(20,7) NOT NULL,
  `amount_btw` decimal(20,7) NOT NULL,
  `amount_including_btw` decimal(20,7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_usage_totals_btw_usage_total_id` (`usage_total_id`),
  CONSTRAINT `FK_usage_totals_btw_usage_totals_usage_total_id` FOREIGN KEY (`usage_total_id`) REFERENCES `usage_totals` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=897279 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for volume_total
-- ----------------------------
DROP TABLE IF EXISTS `volume_total`;
CREATE TABLE `volume_total` (
  `id` int NOT NULL AUTO_INCREMENT,
  `calculation_id` int NOT NULL,
  `product_type` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `volume` decimal(20,7) NOT NULL,
  `unit` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `volume_type` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_volume_total_calculation_id` (`calculation_id`),
  CONSTRAINT `FK_volume_total_calculations_calculation_id` FOREIGN KEY (`calculation_id`) REFERENCES `calculations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=537902 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for volume_total_eans
-- ----------------------------
DROP TABLE IF EXISTS `volume_total_eans`;
CREATE TABLE `volume_total_eans` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contract_ean_id` int NOT NULL,
  `volume` decimal(20,7) NOT NULL,
  `unit` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `volume_type` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_volume_total_eans_contract_ean_id` (`contract_ean_id`),
  CONSTRAINT `FK_volume_total_eans_contract_eans_contract_ean_id` FOREIGN KEY (`contract_ean_id`) REFERENCES `contract_eans` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=339274 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for volume_total_eans_real_usage
-- ----------------------------
DROP TABLE IF EXISTS `volume_total_eans_real_usage`;
CREATE TABLE `volume_total_eans_real_usage` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contract_ean_id` int NOT NULL,
  `volume` decimal(20,7) NOT NULL,
  `unit` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `volume_type` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_volume_total_eans_real_usage_contract_ean_id` (`contract_ean_id`),
  CONSTRAINT `FK_volume_total_eans_real_usage_contract_eans_contract_ean_id` FOREIGN KEY (`contract_ean_id`) REFERENCES `contract_eans` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=400215 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SET FOREIGN_KEY_CHECKS = 1;
