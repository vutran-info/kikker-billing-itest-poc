/*
 Navicat Premium Dump SQL

 Source Server         : Kikker UAT DataMigration
 Source Server Type    : MySQL
 Source Server Version : 80407 (8.4.7-google)
 Source Host           : 35.204.58.137:3306
 Source Schema         : kikkercore

 Target Server Type    : MySQL
 Target Server Version : 80407 (8.4.7-google)
 File Encoding         : 65001

 Date: 12/02/2026 15:56:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for CreditInvoices
-- ----------------------------
DROP TABLE IF EXISTS `CreditInvoices`;
CREATE TABLE `CreditInvoices` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `InvoiceNumber` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Amount` double DEFAULT NULL,
  `Contract` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `OriginalInvoice` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `OriginalAmount` double DEFAULT NULL,
  `InvoiceDate` datetime(6) DEFAULT NULL,
  `OriginalFileName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `BucketPath` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

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
  `insurance_amount` decimal(20,7) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for MasterDataUpdate
-- ----------------------------
DROP TABLE IF EXISTS `MasterDataUpdate`;
CREATE TABLE `MasterDataUpdate` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `EAN` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ReceivedDate` datetime DEFAULT NULL,
  `UpdateData` text COLLATE utf8mb3_unicode_ci,
  `MutationDate` datetime DEFAULT NULL,
  `MutationType` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DossierId` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `EDSNRequestId` int DEFAULT NULL,
  `ExternalReference` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=84118 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for NotificationRequest
-- ----------------------------
DROP TABLE IF EXISTS `NotificationRequest`;
CREATE TABLE `NotificationRequest` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `to` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `data` longtext COLLATE utf8mb3_unicode_ci,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8472 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for NotificationResponse
-- ----------------------------
DROP TABLE IF EXISTS `NotificationResponse`;
CREATE TABLE `NotificationResponse` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `request_id` bigint DEFAULT NULL,
  `data` longtext COLLATE utf8mb3_unicode_ci,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8440 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for Sheet1
-- ----------------------------
DROP TABLE IF EXISTS `Sheet1`;
CREATE TABLE `Sheet1` (
  `contract_number` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contract_duration` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `payment_method` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `bank_account` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `bank_account_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `contract_pdf_file_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ean` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `product_type` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `usage_type` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_residence` int DEFAULT NULL,
  `double_meter` int DEFAULT NULL,
  `grid_operator` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `monthly_amount` double DEFAULT NULL,
  `reseller_topup_fee` double DEFAULT NULL,
  `reseller_delivery_cost` double DEFAULT NULL,
  `single_usage_estimation` int DEFAULT NULL,
  `normal_usage_estimation` int DEFAULT NULL,
  `dal_usage_estimation` int DEFAULT NULL,
  `return_delivery` int DEFAULT NULL,
  `kvk_number` int DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `gender` int DEFAULT NULL,
  `zipcode` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `house_number` int DEFAULT NULL,
  `house_number_extension` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `street` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `contact_email` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contact_phone` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contact_office_phone` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contact_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `financial_correspondence_email` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `order_reference` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contract_reference` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `signed_via_mandate` int DEFAULT NULL,
  `is_migrated` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for SignRequestRequest
-- ----------------------------
DROP TABLE IF EXISTS `SignRequestRequest`;
CREATE TABLE `SignRequestRequest` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reseller_id` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contract_id` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `action` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `data` longtext COLLATE utf8mb3_unicode_ci,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16269 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for SignRequestResponse
-- ----------------------------
DROP TABLE IF EXISTS `SignRequestResponse`;
CREATE TABLE `SignRequestResponse` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reseller_id` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `contract_id` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `action` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `data` longtext COLLATE utf8mb3_unicode_ci,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=171585 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for VAT
-- ----------------------------
DROP TABLE IF EXISTS `VAT`;
CREATE TABLE `VAT` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vat` decimal(10,2) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for __EFMigrationsHistory
-- ----------------------------
DROP TABLE IF EXISTS `__EFMigrationsHistory`;
CREATE TABLE `__EFMigrationsHistory` (
  `MigrationId` varchar(95) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ProductVersion` varchar(32) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for app_message
-- ----------------------------
DROP TABLE IF EXISTS `app_message`;
CREATE TABLE `app_message` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `label_color` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `background_color` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `color` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `border_color` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `message_nl` longtext COLLATE utf8mb3_unicode_ci,
  `message_en` longtext COLLATE utf8mb3_unicode_ci,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for archive_order
-- ----------------------------
DROP TABLE IF EXISTS `archive_order`;
CREATE TABLE `archive_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `external_id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `contract_id` int NOT NULL,
  `ean` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `order_number` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `order_status_id` int NOT NULL,
  `product_type` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `usage_type` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `grid_operator` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `double_meter` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `single_usage_estimation` double DEFAULT NULL,
  `normal_usage_estimation` double DEFAULT NULL,
  `dal_usage_estimation` double DEFAULT NULL,
  `is_residence` bit(1) NOT NULL,
  `is_smart_meter` bit(1) NOT NULL,
  `green_energy` bit(1) NOT NULL,
  `physical_capacity` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `monthly_amount` decimal(12,7) DEFAULT NULL,
  `kikker_topup_fee` decimal(20,7) NOT NULL,
  `kikker_topup_fee_id` int NOT NULL,
  `kikker_delivery_cost` decimal(20,7) NOT NULL,
  `kikker_delivery_cost_id` int NOT NULL,
  `reseller_topup_fee` decimal(20,7) NOT NULL,
  `reseller_topup_fee_id` int NOT NULL,
  `pv_price_single` decimal(20,7) NOT NULL,
  `pv_price_normal` decimal(20,7) NOT NULL,
  `pv_price_off_peak` decimal(20,7) NOT NULL,
  `pv_price_id` int NOT NULL,
  `end_date` datetime NOT NULL,
  `start_date` datetime NOT NULL,
  `order_type_id` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `captar_code` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `grid_operator_tariff` decimal(20,7) DEFAULT NULL,
  `kvk_number` varchar(45) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `return_delivery` double DEFAULT NULL,
  `reseller_delivery_cost` decimal(20,7) NOT NULL,
  `reseller_delivery_cost_id` int NOT NULL,
  `variable_delivery_normal` decimal(20,7) NOT NULL,
  `energy_tax_reduction` decimal(20,7) NOT NULL,
  `energy_meter_type` varchar(45) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `technical_communication_sm` varchar(45) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `profile_category` varchar(45) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `variable_delivery_single` decimal(20,7) NOT NULL,
  `variable_delivery_offpeak` decimal(20,7) NOT NULL,
  `eac_off_peak` double(20,5) DEFAULT NULL,
  `eac_peak` double(20,5) DEFAULT NULL,
  `eac_date` datetime DEFAULT NULL,
  `pv_price_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `valid_cancellation_date` datetime DEFAULT NULL,
  `status_updated_date` datetime DEFAULT NULL,
  `dossier_number` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `energy_meter_number` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `green_energy_type_id` int DEFAULT NULL,
  `green_energy_type_name` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `smart_meter_status` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `production_eac_off_peak` double(20,5) DEFAULT NULL,
  `production_eac_peak` double(20,5) DEFAULT NULL,
  `is_sent_edsn` bit(1) DEFAULT b'1',
  `edsn_response_code` int DEFAULT NULL,
  `edsn_response_message` text CHARACTER SET utf8mb3,
  `green_energy_price` decimal(20,7) DEFAULT NULL,
  `latest_reading_date` datetime DEFAULT NULL,
  `mutation_type` varchar(50) CHARACTER SET utf8mb3 DEFAULT NULL,
  `off_peak_latest_reading_number` int DEFAULT NULL,
  `on_peak_latest_reading_number` int DEFAULT NULL,
  `return_off_peak_latest_reading_number` int DEFAULT NULL,
  `return_on_peak_latest_reading_number` int DEFAULT NULL,
  `ended_reason` text CHARACTER SET utf8mb3,
  `monthly_amount_percentage` decimal(12,7) DEFAULT NULL,
  `estimation_compensation_price` decimal(20,7) NOT NULL DEFAULT '0.0000000',
  `energy_delivery_status` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `physical_status` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `kikker_feed_in_fee` decimal(20,7) NOT NULL DEFAULT '0.0000000',
  `reseller_feed_in_fee` decimal(20,7) NOT NULL DEFAULT '0.0000000',
  `kikker_business_fixed_delivery_cost` decimal(20,7) NOT NULL DEFAULT '0.0000000',
  `kikker_business_fixed_delivery_cost_id` int NOT NULL DEFAULT '0',
  `return_tariff` decimal(20,7) DEFAULT NULL,
  `difference_return_tariff` decimal(20,7) DEFAULT NULL,
  `reseller_topup_fee_off_peak` decimal(20,7) DEFAULT NULL,
  `reseller_topup_fee_on_peak` decimal(20,7) DEFAULT NULL,
  `reseller_topup_fee_single` decimal(20,7) DEFAULT NULL,
  `frdc_excel_id` int DEFAULT NULL,
  `kk_frdc` decimal(20,7) DEFAULT NULL,
  `rs_frdc` decimal(20,7) DEFAULT NULL,
  `energy_flow_direction` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `kikker_portfolio_tarifff` decimal(20,7) DEFAULT NULL,
  `reseller_portfolio_tarifff` decimal(20,7) DEFAULT NULL,
  `allocation_method` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contract_archive_order` (`contract_id`),
  KEY `archive_order_status` (`order_status_id`),
  KEY `archive_order_type` (`order_type_id`),
  KEY `idx_ean` (`ean`),
  KEY `idx_archive_order_status` (`contract_id`,`order_status_id`),
  CONSTRAINT `archive_order_status` FOREIGN KEY (`order_status_id`) REFERENCES `order_status` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `archive_order_type` FOREIGN KEY (`order_type_id`) REFERENCES `order_type` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `contract_archive_order` FOREIGN KEY (`contract_id`) REFERENCES `kk_contract` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=18121 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for audit_log
-- ----------------------------
DROP TABLE IF EXISTS `audit_log`;
CREATE TABLE `audit_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action` varchar(1024) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `table_id` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `table_name` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `old_value` text COLLATE utf8mb3_unicode_ci,
  `new_value` text COLLATE utf8mb3_unicode_ci,
  `affected_column` varchar(1024) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_date` datetime(6) NOT NULL,
  `changed_by` varchar(1024) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `triggered_from` varchar(1024) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `client_ip` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `operation_started_at` datetime(3) NOT NULL DEFAULT '0001-01-01 00:00:00.000',
  `user_agent` varchar(512) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_audit_changed_at` (`created_date`),
  KEY `idx_audit_entity` (`table_name`,`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=156655 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for average_usage_house_hold
-- ----------------------------
DROP TABLE IF EXISTS `average_usage_house_hold`;
CREATE TABLE `average_usage_house_hold` (
  `id` int NOT NULL AUTO_INCREMENT,
  `month_name` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  `one` int NOT NULL,
  `two` int NOT NULL,
  `three` int NOT NULL,
  `four` int NOT NULL,
  `five` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for average_usage_house_type
-- ----------------------------
DROP TABLE IF EXISTS `average_usage_house_type`;
CREATE TABLE `average_usage_house_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `month_name` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  `apartment` int NOT NULL,
  `terraced_house` int NOT NULL,
  `corner_house` int NOT NULL,
  `semi_detached_house` int NOT NULL,
  `detached_house` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for billing_payout_xml
-- ----------------------------
DROP TABLE IF EXISTS `billing_payout_xml`;
CREATE TABLE `billing_payout_xml` (
  `id` int NOT NULL AUTO_INCREMENT,
  `invoices` text COLLATE utf8mb3_unicode_ci,
  `status` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `req` longtext COLLATE utf8mb3_unicode_ci,
  `res` longtext COLLATE utf8mb3_unicode_ci,
  `created_date` datetime NOT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for billing_tasks
-- ----------------------------
DROP TABLE IF EXISTS `billing_tasks`;
CREATE TABLE `billing_tasks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contract_id` int NOT NULL,
  `action` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'WAIT,PROCESS,SOLVED',
  `billing_start_date` datetime NOT NULL,
  `billing_end_date` datetime NOT NULL,
  `billing_type` varchar(15) COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'FINAL/YEARLY',
  `reasons` json DEFAULT NULL,
  `note` longtext COLLATE utf8mb3_unicode_ci,
  `need_retry` bit(1) NOT NULL DEFAULT b'0',
  `retry_count` int NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `billing_id` int NOT NULL DEFAULT '0',
  `contract_durations` json DEFAULT NULL,
  `perform_date` datetime DEFAULT NULL,
  `is_archived` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `idx_billing_tasks_contract_id` (`contract_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7024 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for calculated_meter_reading
-- ----------------------------
DROP TABLE IF EXISTS `calculated_meter_reading`;
CREATE TABLE `calculated_meter_reading` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tmr_meter_reading_id` int DEFAULT NULL,
  `ean` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `from_date` datetime DEFAULT NULL,
  `to_date` datetime DEFAULT NULL,
  `on_peak_usage` int DEFAULT NULL,
  `off_peak_usage` int DEFAULT NULL,
  `on_peak_meter_reading_number` int DEFAULT NULL,
  `off_peak_meter_reading_number` int DEFAULT NULL,
  `request` longtext CHARACTER SET utf8mb3,
  `respone` longtext CHARACTER SET utf8mb3,
  `created_date` datetime DEFAULT NULL,
  `return_off_peak_meter_reading_number` int DEFAULT NULL,
  `return_off_peak_usage` int DEFAULT NULL,
  `return_on_peak_meter_reading_number` int DEFAULT NULL,
  `return_on_peak_usage` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29796 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for collective_invoice
-- ----------------------------
DROP TABLE IF EXISTS `collective_invoice`;
CREATE TABLE `collective_invoice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `customer_id` int NOT NULL,
  `customer_number` varchar(100) CHARACTER SET utf8mb3 DEFAULT NULL,
  `reseller_id` int NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `gender` bit(1) NOT NULL,
  `bank_account_name` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `iban` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `location_id` bigint NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `actived` bit(1) DEFAULT NULL,
  `company_name` varchar(250) CHARACTER SET utf8mb3 DEFAULT NULL,
  `kvk_number` varchar(100) CHARACTER SET utf8mb3 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `collective_invoice_location` (`location_id`),
  CONSTRAINT `collective_invoice_location` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for collective_invoice_detail
-- ----------------------------
DROP TABLE IF EXISTS `collective_invoice_detail`;
CREATE TABLE `collective_invoice_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `collective_invoice_id` int NOT NULL,
  `contract_number` varchar(20) CHARACTER SET utf8mb3 DEFAULT NULL,
  `contract_id` int NOT NULL,
  `is_deleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `collective_invoice_id` (`collective_invoice_id`),
  CONSTRAINT `collective_invoice_detail_ibfk_1` FOREIGN KEY (`collective_invoice_id`) REFERENCES `collective_invoice` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=257 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for collective_invoice_history
-- ----------------------------
DROP TABLE IF EXISTS `collective_invoice_history`;
CREATE TABLE `collective_invoice_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `collective_invoice_id` int NOT NULL,
  `old_value` longtext CHARACTER SET utf8mb3,
  `new_value` longtext CHARACTER SET utf8mb3,
  `change_by_role` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `change_by_reseller_uuid` varchar(50) CHARACTER SET utf8mb3 DEFAULT NULL,
  `change_by_user_uuid` varchar(50) CHARACTER SET utf8mb3 DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for common_price
-- ----------------------------
DROP TABLE IF EXISTS `common_price`;
CREATE TABLE `common_price` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `price` double(20,5) NOT NULL,
  `date_from` datetime DEFAULT NULL,
  `date_until` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `common_price_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for config_setting
-- ----------------------------
DROP TABLE IF EXISTS `config_setting`;
CREATE TABLE `config_setting` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for contact
-- ----------------------------
DROP TABLE IF EXISTS `contact`;
CREATE TABLE `contact` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `full_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `department` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `customer_id` bigint DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `middle_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `gender` bit(1) NOT NULL,
  `client_number` varchar(11) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `contact_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=75842 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for contract_billing
-- ----------------------------
DROP TABLE IF EXISTS `contract_billing`;
CREATE TABLE `contract_billing` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contract_number` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contract_uuid` varchar(50) CHARACTER SET utf8mb3 DEFAULT NULL,
  `reseller_uuid` varchar(50) CHARACTER SET utf8mb3 DEFAULT NULL,
  `type` varchar(50) CHARACTER SET utf8mb3 DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `contract_duration` varchar(20) CHARACTER SET utf8mb3 DEFAULT NULL,
  `pdf_link` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `contract_duration_changes` text COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_billing_contract_number` (`contract_number`)
) ENGINE=InnoDB AUTO_INCREMENT=9809 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for contract_billing_amount
-- ----------------------------
DROP TABLE IF EXISTS `contract_billing_amount`;
CREATE TABLE `contract_billing_amount` (
  `id` int NOT NULL AUTO_INCREMENT,
  `billing_id` int NOT NULL,
  `month` datetime NOT NULL,
  `amount` decimal(12,7) DEFAULT NULL,
  `invoice_number` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `payment_status` varchar(50) CHARACTER SET utf8mb3 DEFAULT NULL,
  `unpaid_amount` decimal(12,7) DEFAULT NULL,
  `collection_cost` decimal(12,7) DEFAULT NULL,
  `re_estimation_amount` decimal(12,7) DEFAULT NULL,
  `re_paid_amount` decimal(12,7) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_contract_billing_amount_billing_id` (`billing_id`),
  KEY `index_invoice_number` (`invoice_number`),
  CONSTRAINT `fk_billing_amount` FOREIGN KEY (`billing_id`) REFERENCES `contract_billing` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=87590 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for contract_billing_cancellation_fee
-- ----------------------------
DROP TABLE IF EXISTS `contract_billing_cancellation_fee`;
CREATE TABLE `contract_billing_cancellation_fee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `billing_id` int NOT NULL,
  `product_type` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `remaining_day` int NOT NULL,
  `fee` decimal(12,7) DEFAULT NULL,
  `reason` varchar(100) CHARACTER SET utf8mb3 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_contract_billing_cancellation_fee_billing_id` (`billing_id`),
  CONSTRAINT `fk_billing_cancellation_fee` FOREIGN KEY (`billing_id`) REFERENCES `contract_billing` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=16462 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for contract_billing_cancellation_fee_config
-- ----------------------------
DROP TABLE IF EXISTS `contract_billing_cancellation_fee_config`;
CREATE TABLE `contract_billing_cancellation_fee_config` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contract_duration` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  `remaining_day_threshold` int NOT NULL,
  `fee` decimal(12,7) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for contract_billing_cost
-- ----------------------------
DROP TABLE IF EXISTS `contract_billing_cost`;
CREATE TABLE `contract_billing_cost` (
  `id` int NOT NULL AUTO_INCREMENT,
  `billing_id` int NOT NULL,
  `grid_operator_ean` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `product_type` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `cost_type` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `tariff` decimal(12,7) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `day_count` int NOT NULL,
  `ean` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `grid_operator_name` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `usage` int NOT NULL DEFAULT '0',
  `grid_operator_parent_ean` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `pv_price` decimal(12,7) DEFAULT NULL,
  `vat` decimal(12,7) DEFAULT '1.2100000',
  `factor` decimal(10,7) NOT NULL,
  `energy_delivery_status` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `physical_status` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_contract_billing_cost_billing_id` (`billing_id`),
  CONSTRAINT `fk_billing_cost` FOREIGN KEY (`billing_id`) REFERENCES `contract_billing` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=465470 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for contract_billing_monthly_amount
-- ----------------------------
DROP TABLE IF EXISTS `contract_billing_monthly_amount`;
CREATE TABLE `contract_billing_monthly_amount` (
  `id` int NOT NULL AUTO_INCREMENT,
  `billing_id` int DEFAULT NULL,
  `contract_number` varchar(50) CHARACTER SET utf8mb3 DEFAULT NULL,
  `monthly_amount` decimal(20,7) NOT NULL,
  `created_date` datetime NOT NULL,
  `insert_type` varchar(50) CHARACTER SET utf8mb3 DEFAULT NULL,
  `monthly_amount_detail` json DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5777 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for contract_billing_new
-- ----------------------------
DROP TABLE IF EXISTS `contract_billing_new`;
CREATE TABLE `contract_billing_new` (
  `id` int NOT NULL AUTO_INCREMENT,
  `billing_id` int NOT NULL,
  `billing_external_id` varchar(127) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `real_usage_elk` decimal(20,7) DEFAULT NULL,
  `real_usage_gas` decimal(20,7) DEFAULT NULL,
  `created_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=252 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for contract_billing_price_cap
-- ----------------------------
DROP TABLE IF EXISTS `contract_billing_price_cap`;
CREATE TABLE `contract_billing_price_cap` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `biling_id` int NOT NULL,
  `ean` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `net_usage` decimal(20,7) DEFAULT NULL,
  `price_net_usage` decimal(20,7) DEFAULT NULL,
  `wa_return_tariff` decimal(20,7) DEFAULT NULL,
  `wa_pricecap_tariff` decimal(20,7) DEFAULT NULL,
  `compensation_tariff` decimal(20,7) DEFAULT NULL,
  `compensation_price` decimal(12,7) DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime DEFAULT NULL,
  `message` varchar(1024) CHARACTER SET utf8mb3 DEFAULT NULL,
  `status` varchar(64) CHARACTER SET utf8mb3 DEFAULT NULL,
  `fraction_based_volume` decimal(20,7) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_billing_price_cap` (`biling_id`),
  CONSTRAINT `fk_billing_price_cap` FOREIGN KEY (`biling_id`) REFERENCES `contract_billing` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=11049 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for contract_billing_price_change
-- ----------------------------
DROP TABLE IF EXISTS `contract_billing_price_change`;
CREATE TABLE `contract_billing_price_change` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `change_type` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `change_value` decimal(20,7) NOT NULL,
  `meter_reading_number` int NOT NULL,
  `meter_reading_from` varchar(50) CHARACTER SET utf8mb3 DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ean` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contract_billing_id` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `contract_billing_id` (`contract_billing_id`),
  CONSTRAINT `contract_billing_price_change_ibfk_1` FOREIGN KEY (`contract_billing_id`) REFERENCES `contract_billing` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=335070 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for contract_billing_proccess_payment
-- ----------------------------
DROP TABLE IF EXISTS `contract_billing_proccess_payment`;
CREATE TABLE `contract_billing_proccess_payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contract_number` varchar(20) CHARACTER SET utf8mb3 DEFAULT NULL,
  `invoice_number` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `client_number` varchar(20) CHARACTER SET utf8mb3 DEFAULT NULL,
  `contract_billing_id` int NOT NULL,
  `process_date` datetime NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_auto_payment` bit(1) NOT NULL DEFAULT b'0',
  `is_process` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `contract_billing_id` (`contract_billing_id`),
  KEY `index_invoice_number` (`invoice_number`)
) ENGINE=InnoDB AUTO_INCREMENT=8477 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for contract_billing_proccess_payment_copy1
-- ----------------------------
DROP TABLE IF EXISTS `contract_billing_proccess_payment_copy1`;
CREATE TABLE `contract_billing_proccess_payment_copy1` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contract_number` varchar(20) CHARACTER SET utf8mb3 DEFAULT NULL,
  `invoice_number` varchar(50) CHARACTER SET utf8mb3 DEFAULT NULL,
  `client_number` varchar(20) CHARACTER SET utf8mb3 DEFAULT NULL,
  `contract_billing_id` int NOT NULL,
  `process_date` datetime NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_auto_payment` bit(1) NOT NULL DEFAULT b'0',
  `is_process` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `contract_billing_id` (`contract_billing_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3498 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for contract_billing_reseller_earning
-- ----------------------------
DROP TABLE IF EXISTS `contract_billing_reseller_earning`;
CREATE TABLE `contract_billing_reseller_earning` (
  `id` int NOT NULL AUTO_INCREMENT,
  `billing_id` int NOT NULL,
  `calculation_object` json DEFAULT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cbre_billing_id` (`billing_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8941 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for contract_billing_tax
-- ----------------------------
DROP TABLE IF EXISTS `contract_billing_tax`;
CREATE TABLE `contract_billing_tax` (
  `id` int NOT NULL AUTO_INCREMENT,
  `billing_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `usage` decimal(20,7) NOT NULL,
  `tax_type` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `product_type` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `tariff` decimal(12,7) DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `ean` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `zone_end` int NOT NULL DEFAULT '0',
  `zone_start` int NOT NULL DEFAULT '0',
  `unit` varchar(10) CHARACTER SET utf8mb3 DEFAULT NULL,
  `vat` decimal(10,2) DEFAULT '1.21',
  PRIMARY KEY (`id`),
  KEY `IX_contract_billing_tax_billing_id` (`billing_id`),
  CONSTRAINT `fk_billing_tax` FOREIGN KEY (`billing_id`) REFERENCES `contract_billing` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=290815 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for contract_billing_usage
-- ----------------------------
DROP TABLE IF EXISTS `contract_billing_usage`;
CREATE TABLE `contract_billing_usage` (
  `id` int NOT NULL AUTO_INCREMENT,
  `billing_id` int NOT NULL,
  `unit` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `product_type` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `usage` int NOT NULL,
  `usage_type` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `tariff` decimal(12,7) NOT NULL,
  `ean` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `meter_reading_start` int NOT NULL,
  `meter_reading_end` int NOT NULL,
  `factor` decimal(10,7) NOT NULL,
  `energy_delivery_status` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `physical_status` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_contract_billing_usage_billing_id` (`billing_id`),
  CONSTRAINT `fk_billing_usage` FOREIGN KEY (`billing_id`) REFERENCES `contract_billing` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=267640 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for contract_billing_usage_per_year
-- ----------------------------
DROP TABLE IF EXISTS `contract_billing_usage_per_year`;
CREATE TABLE `contract_billing_usage_per_year` (
  `id` int NOT NULL AUTO_INCREMENT,
  `billing_id` int NOT NULL,
  `unit` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `product_type` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `usage` int NOT NULL,
  `usage_type` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `tariff` decimal(12,7) NOT NULL,
  `ean` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `meter_reading_start` int NOT NULL,
  `meter_reading_end` int NOT NULL,
  `factor` decimal(10,7) NOT NULL,
  `physical_status` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `energy_delivery_status` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_contract_billing_usage_per_year_billing_id` (`billing_id`),
  CONSTRAINT `fk_billing_usage_per_year` FOREIGN KEY (`billing_id`) REFERENCES `contract_billing` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for contract_billing_wa_return_tariff
-- ----------------------------
DROP TABLE IF EXISTS `contract_billing_wa_return_tariff`;
CREATE TABLE `contract_billing_wa_return_tariff` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `biling_id` int NOT NULL,
  `ean` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `wa_return_tariff` decimal(20,7) DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_billing_price_wa_return_tariff` (`biling_id`),
  CONSTRAINT `fk_billing_wa_return_tariff` FOREIGN KEY (`biling_id`) REFERENCES `contract_billing` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=11712 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for contract_configuration
-- ----------------------------
DROP TABLE IF EXISTS `contract_configuration`;
CREATE TABLE `contract_configuration` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contract_number` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT '',
  `config` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_contract_number` (`contract_number`) USING BTREE,
  KEY `idx_config` (`config`) USING BTREE,
  KEY `idx_config_value` (`config`,`value`)
) ENGINE=InnoDB AUTO_INCREMENT=4651 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for contract_detail
-- ----------------------------
DROP TABLE IF EXISTS `contract_detail`;
CREATE TABLE `contract_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `contract_number` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `contract_id` bigint DEFAULT NULL,
  `started_date` datetime DEFAULT NULL,
  `ended_date` datetime DEFAULT NULL,
  `finance_note` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `contract_id` (`contract_id`),
  KEY `idx_contract_number` (`contract_number`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for contract_kfm_fee
-- ----------------------------
DROP TABLE IF EXISTS `contract_kfm_fee`;
CREATE TABLE `contract_kfm_fee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contract_id` int DEFAULT NULL,
  `rs_topup_elk` decimal(20,7) NOT NULL,
  `rs_fixed_elk` decimal(20,7) NOT NULL,
  `rs_fixed_gas` decimal(20,7) NOT NULL,
  `rs_topup_gas` decimal(20,7) NOT NULL,
  `kk_topup_elk` decimal(20,7) NOT NULL,
  `kk_fixed_elk` decimal(20,7) NOT NULL,
  `kk_topup_gas` decimal(20,7) NOT NULL,
  `kk_fixed_gas` decimal(20,7) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `kk_earning_amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `reseller_earning_amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `return_delivery` decimal(20,7) DEFAULT NULL,
  `estimation_external` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `frdc_sheet_id` int DEFAULT NULL,
  `kk_topup_frdc` decimal(20,7) DEFAULT NULL,
  `rs_topup_frdc` decimal(20,7) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fee_contract_id_1` (`contract_id`),
  CONSTRAINT `fee_contract_id_1` FOREIGN KEY (`contract_id`) REFERENCES `kk_contract` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=862 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for contract_notification_loss
-- ----------------------------
DROP TABLE IF EXISTS `contract_notification_loss`;
CREATE TABLE `contract_notification_loss` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contract_number` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ean` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `balance_supplier` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `dossier_id` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `cancellation_date` datetime NOT NULL,
  `received_at` datetime NOT NULL,
  `edsn_poc_id` int NOT NULL,
  `edsn_request_id` int NOT NULL,
  `is_sent_mail` bit(1) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for contract_number_generator
-- ----------------------------
DROP TABLE IF EXISTS `contract_number_generator`;
CREATE TABLE `contract_number_generator` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `year` int NOT NULL,
  `number` int NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for contract_numbers
-- ----------------------------
DROP TABLE IF EXISTS `contract_numbers`;
CREATE TABLE `contract_numbers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contract_number` varchar(11) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `contract_number_unique` (`contract_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for contract_pdf_template
-- ----------------------------
DROP TABLE IF EXISTS `contract_pdf_template`;
CREATE TABLE `contract_pdf_template` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `template_name` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `lang_key` varchar(6) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `template_en` longtext COLLATE utf8mb3_unicode_ci,
  `template_nl` longtext COLLATE utf8mb3_unicode_ci,
  `created_date` datetime DEFAULT NULL,
  `Footer` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `Header` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `contract_template_pdf_name` (`template_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=190 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for contract_pdf_template_rs
-- ----------------------------
DROP TABLE IF EXISTS `contract_pdf_template_rs`;
CREATE TABLE `contract_pdf_template_rs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `template_name` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `lang_key` varchar(6) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `template_en` longtext COLLATE utf8mb3_unicode_ci,
  `template_nl` longtext COLLATE utf8mb3_unicode_ci,
  `created_date` datetime NOT NULL,
  `reseller_id` int NOT NULL,
  `Footer` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `Header` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  PRIMARY KEY (`id`),
  KEY `IX_contract_pdf_template_rs_template_name` (`template_name`),
  KEY `contract_template_pdf_rs_reseller` (`reseller_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3575 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for contract_product_category
-- ----------------------------
DROP TABLE IF EXISTS `contract_product_category`;
CREATE TABLE `contract_product_category` (
  `contract_id` bigint NOT NULL,
  `product_category_id` int NOT NULL,
  PRIMARY KEY (`contract_id`,`product_category_id`),
  KEY `product_category_id` (`product_category_id`),
  CONSTRAINT `contract_product_category_ibfk_2` FOREIGN KEY (`product_category_id`) REFERENCES `product_category` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for contract_redundant_amount
-- ----------------------------
DROP TABLE IF EXISTS `contract_redundant_amount`;
CREATE TABLE `contract_redundant_amount` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contract_number` varchar(20) CHARACTER SET utf8mb3 NOT NULL,
  `total_request` decimal(12,2) unsigned NOT NULL,
  `total_paid` decimal(12,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contract_number` (`contract_number`)
) ENGINE=InnoDB AUTO_INCREMENT=4208 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for contract_status
-- ----------------------------
DROP TABLE IF EXISTS `contract_status`;
CREATE TABLE `contract_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `activated` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for contract_tariff_pdf
-- ----------------------------
DROP TABLE IF EXISTS `contract_tariff_pdf`;
CREATE TABLE `contract_tariff_pdf` (
  `id` int NOT NULL AUTO_INCREMENT,
  `original_file_name` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `s3_file_name_path` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `from_date` datetime NOT NULL,
  `to_date` datetime NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `reseller_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for crm_log
-- ----------------------------
DROP TABLE IF EXISTS `crm_log`;
CREATE TABLE `crm_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `request` json DEFAULT NULL,
  `response` json DEFAULT NULL,
  `status` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for currency
-- ----------------------------
DROP TABLE IF EXISTS `currency`;
CREATE TABLE `currency` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customer_key` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contact_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contact_phone` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contact_office_phone` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contact_email` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contact_website` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `location_primary_id` bigint DEFAULT NULL,
  `date_of_birth` datetime DEFAULT NULL,
  `description` varchar(1000) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `bank_account` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `bank_account_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `activated` bit(1) NOT NULL,
  `activation_key` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `communication_email` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `location_id` (`location_primary_id`) USING BTREE,
  KEY `index_customer_key` (`customer_key`) USING BTREE,
  KEY `index_contact_name` (`contact_name`) USING BTREE,
  KEY `index_company_name` (`company_name`) USING BTREE,
  KEY `idx_communication_email` (`communication_email`),
  KEY `idx_contact_email` (`contact_email`),
  KEY `idx_cs_key_name` (`customer_key`,`contact_name`),
  CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`location_primary_id`) REFERENCES `location` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=36660 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for customer_credit_check
-- ----------------------------
DROP TABLE IF EXISTS `customer_credit_check`;
CREATE TABLE `customer_credit_check` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contract_number` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  `city` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `kvk_no` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `first_name` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `last_name` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `street` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `house_number` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `house_number_extension` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `post_code` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `request_date` datetime DEFAULT NULL,
  `web_data_score` int DEFAULT NULL,
  `ecommerce_score` int DEFAULT NULL,
  `experian_w_value` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `experian_c_value` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `experian_percent` decimal(12,7) DEFAULT NULL,
  `experian_decision` int DEFAULT NULL,
  `kikker_decision` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `experian_external_id` varchar(50) CHARACTER SET utf8mb3 DEFAULT NULL,
  `is_from_cache` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10787 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for customer_credit_check_user_decision_history
-- ----------------------------
DROP TABLE IF EXISTS `customer_credit_check_user_decision_history`;
CREATE TABLE `customer_credit_check_user_decision_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role` varchar(50) CHARACTER SET utf8mb3 DEFAULT NULL,
  `user_name` varchar(50) CHARACTER SET utf8mb3 DEFAULT NULL,
  `from_status` varchar(50) CHARACTER SET utf8mb3 DEFAULT NULL,
  `to_status` varchar(50) CHARACTER SET utf8mb3 DEFAULT NULL,
  `credit_check_id` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `credit_check` (`credit_check_id`),
  CONSTRAINT `credit_check` FOREIGN KEY (`credit_check_id`) REFERENCES `customer_credit_check` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=412 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for daily_invoice_csv
-- ----------------------------
DROP TABLE IF EXISTS `daily_invoice_csv`;
CREATE TABLE `daily_invoice_csv` (
  `id` int NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1267 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for debt_counseling
-- ----------------------------
DROP TABLE IF EXISTS `debt_counseling`;
CREATE TABLE `debt_counseling` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contract_number` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `debt_counseling_status` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `report_date` datetime NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL,
  `notes` text COLLATE utf8mb3_unicode_ci,
  `reference_invoices` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `debt_counselor` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `zipcode` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `excuted_date_eos` datetime DEFAULT NULL,
  `mutation_date_eos` datetime DEFAULT NULL,
  `sent_date` datetime DEFAULT NULL,
  `signal_reference` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `error_code` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `error_message` text COLLATE utf8mb3_unicode_ci,
  `signal_status` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_debt_counseling_contract_number` (`contract_number`)
) ENGINE=InnoDB AUTO_INCREMENT=958 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for debt_counseling_history
-- ----------------------------
DROP TABLE IF EXISTS `debt_counseling_history`;
CREATE TABLE `debt_counseling_history` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `contract_number` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `signal_reference` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `debt_counselor` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `old_signal_status` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `new_signal_status` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL,
  `debt_counseling_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_ContractNumber` (`contract_number`),
  KEY `IX_debt_counseling_history_debt_counseling_id` (`debt_counseling_id`),
  KEY `IX_SignalReference` (`signal_reference`),
  CONSTRAINT `FK_debt_counseling_history_debt_counseling_debt_counseling_id` FOREIGN KEY (`debt_counseling_id`) REFERENCES `debt_counseling` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for decision
-- ----------------------------
DROP TABLE IF EXISTS `decision`;
CREATE TABLE `decision` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb3 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for default_setting
-- ----------------------------
DROP TABLE IF EXISTS `default_setting`;
CREATE TABLE `default_setting` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Key` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `Value` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for device
-- ----------------------------
DROP TABLE IF EXISTS `device`;
CREATE TABLE `device` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_external_id` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `device_type` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `device_token` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `device_id` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `os_version` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `app_version` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `device_token` (`device_token`),
  KEY `device_uuid` (`user_external_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37854 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for dispute
-- ----------------------------
DROP TABLE IF EXISTS `dispute`;
CREATE TABLE `dispute` (
  `id` int NOT NULL AUTO_INCREMENT,
  `external_id` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `received_date` datetime DEFAULT NULL,
  `edsn_request_id` int DEFAULT NULL,
  `ean` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `product_type` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `energy_meter_id` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `number_of_registers` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `consumer` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `external_reference` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `initiator` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `mutation_reason` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb3_unicode_ci,
  `dossier_id` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contract_id` int DEFAULT NULL,
  `deadline_date` datetime DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `dispute_status_id` int NOT NULL DEFAULT '0',
  `updated_date` datetime DEFAULT NULL,
  `note` text COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for dispute_register
-- ----------------------------
DROP TABLE IF EXISTS `dispute_register`;
CREATE TABLE `dispute_register` (
  `id` int NOT NULL AUTO_INCREMENT,
  `measure_unit` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `metering_direction` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `number_of_digits` int DEFAULT NULL,
  `tariff_type` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `reading` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `reading_date` datetime DEFAULT NULL,
  `reading_method` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `dispute_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dispute_id` (`dispute_id`),
  CONSTRAINT `dispute_register_ibfk_1` FOREIGN KEY (`dispute_id`) REFERENCES `dispute` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for dispute_reply
-- ----------------------------
DROP TABLE IF EXISTS `dispute_reply`;
CREATE TABLE `dispute_reply` (
  `id` int NOT NULL AUTO_INCREMENT,
  `is_accept` bit(1) NOT NULL,
  `comment` text COLLATE utf8mb3_unicode_ci,
  `external_reference` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `dispute_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dispute_id` (`dispute_id`),
  CONSTRAINT `dispute_reply_ibfk_1` FOREIGN KEY (`dispute_id`) REFERENCES `dispute` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for dvep_ean
-- ----------------------------
DROP TABLE IF EXISTS `dvep_ean`;
CREATE TABLE `dvep_ean` (
  `id` int NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `product_type` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `usage_type` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_date` datetime NOT NULL,
  `s3_link` varchar(400) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=701 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for dynamiq_contracts
-- ----------------------------
DROP TABLE IF EXISTS `dynamiq_contracts`;
CREATE TABLE `dynamiq_contracts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `contract_number` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `contract_duration` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `payment_method` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `bank_account` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `bank_account_name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `StartDate` datetime(6) DEFAULT NULL,
  `EndDate` datetime(6) DEFAULT NULL,
  `ean` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `product_type` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `usage_type` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `is_residence` bit(1) DEFAULT NULL,
  `is_apply_fdrc` bit(1) DEFAULT NULL,
  `double_meter` bit(1) DEFAULT NULL,
  `monthly_amount` decimal(20,7) DEFAULT NULL,
  `monthly_amount_contract` decimal(20,7) DEFAULT NULL,
  `reseller_topup_fee` decimal(20,7) DEFAULT NULL,
  `reseller_delivery_cost` decimal(20,7) DEFAULT NULL,
  `kikker_topup_fee` decimal(20,7) DEFAULT NULL,
  `kikker_delivery_cost` decimal(20,7) DEFAULT NULL,
  `single_usage_estimation` double DEFAULT NULL,
  `normal_usage_estimation` double DEFAULT NULL,
  `dal_usage_estimation` double DEFAULT NULL,
  `return_delivary` double DEFAULT NULL,
  `kvk_number` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `single_tariff` decimal(20,7) DEFAULT NULL,
  `on_peak_tariff` decimal(20,7) DEFAULT NULL,
  `off_peak_tariff` decimal(20,7) DEFAULT NULL,
  `return_tariff` decimal(20,7) DEFAULT NULL,
  `pv_price_single` decimal(20,7) DEFAULT NULL,
  `pv_price_on_peak` decimal(20,7) DEFAULT NULL,
  `pv_price_off_peak` decimal(20,7) DEFAULT NULL,
  `first_name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `last_name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `gender` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `zipcode` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `house_number` int DEFAULT NULL,
  `house_number_extension` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `street` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `city` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `date_of_birth` datetime(6) DEFAULT NULL,
  `contact_email` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `company_name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `contact_phone` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `contact_office_phone` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `contact_name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `financial_correspondence_email` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `signed_via_mandate` bit(1) DEFAULT NULL,
  `mutation_date` datetime(6) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `error_reason` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `is_migrated` bit(1) DEFAULT NULL,
  `is_user_migrated` bit(1) NOT NULL DEFAULT b'0',
  `updated_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1096 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for ean_loss
-- ----------------------------
DROP TABLE IF EXISTS `ean_loss`;
CREATE TABLE `ean_loss` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ean` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `grid_operator` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `loss_date` datetime DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb3,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5206 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for edsn_log
-- ----------------------------
DROP TABLE IF EXISTS `edsn_log`;
CREATE TABLE `edsn_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contract_number` varchar(20) CHARACTER SET utf8mb3 NOT NULL,
  `ean` varchar(255) CHARACTER SET utf8mb3 NOT NULL,
  `request` text CHARACTER SET utf8mb3,
  `response` text CHARACTER SET utf8mb3,
  `type` varchar(255) CHARACTER SET utf8mb3 NOT NULL,
  `status_code` int NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `url` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27258 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for edsn_retry_process
-- ----------------------------
DROP TABLE IF EXISTS `edsn_retry_process`;
CREATE TABLE `edsn_retry_process` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contract_uuid` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `action` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `retry_count` int NOT NULL,
  `perform_date` datetime NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_retry` bit(1) NOT NULL DEFAULT b'0',
  `ean` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `flow` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for end_of_supply_ean
-- ----------------------------
DROP TABLE IF EXISTS `end_of_supply_ean`;
CREATE TABLE `end_of_supply_ean` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ean` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_active` bit(1) NOT NULL DEFAULT b'1',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_eos_ean` (`ean`)
) ENGINE=InnoDB AUTO_INCREMENT=1223 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for end_of_supply_log
-- ----------------------------
DROP TABLE IF EXISTS `end_of_supply_log`;
CREATE TABLE `end_of_supply_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contract_number` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `order_number` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `ean` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `status_code` int NOT NULL,
  `request` text CHARACTER SET utf8mb3,
  `response` text CHARACTER SET utf8mb3,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `eos_status` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `mutation_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5731 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for energy_tax
-- ----------------------------
DROP TABLE IF EXISTS `energy_tax`;
CREATE TABLE `energy_tax` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `product_type` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `zone_start` int NOT NULL,
  `zone_end` int NOT NULL,
  `daily_cost` decimal(20,7) NOT NULL,
  `yearly_cost` decimal(20,7) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for error_definition
-- ----------------------------
DROP TABLE IF EXISTS `error_definition`;
CREATE TABLE `error_definition` (
  `id` int NOT NULL AUTO_INCREMENT,
  `error_code` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `error_description` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `activated` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for estimation_logging
-- ----------------------------
DROP TABLE IF EXISTS `estimation_logging`;
CREATE TABLE `estimation_logging` (
  `id` int NOT NULL AUTO_INCREMENT,
  `request` text CHARACTER SET utf8mb3,
  `response` text CHARACTER SET utf8mb3,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `external_id` varchar(50) CHARACTER SET utf8mb3 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `external_id` (`external_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7918 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for exact_customer
-- ----------------------------
DROP TABLE IF EXISTS `exact_customer`;
CREATE TABLE `exact_customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `exact_id` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `customer_key` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `bank_account` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `bank_account_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `division_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exact_customer_division` (`division_id`),
  CONSTRAINT `exact_customer_division` FOREIGN KEY (`division_id`) REFERENCES `exact_division` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for exact_division
-- ----------------------------
DROP TABLE IF EXISTS `exact_division`;
CREATE TABLE `exact_division` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reseller_uuid` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `exact_division_id` int DEFAULT NULL,
  `client_id` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `client_secret` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `redirect_uri` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `journal` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `gl_account` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `access_token` varchar(1000) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `refresh_token` varchar(1000) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for exact_invoice
-- ----------------------------
DROP TABLE IF EXISTS `exact_invoice`;
CREATE TABLE `exact_invoice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `exact_id` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `amount` decimal(12,7) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exact_invoice_division` (`customer_id`),
  CONSTRAINT `exact_invoice_division` FOREIGN KEY (`customer_id`) REFERENCES `exact_customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for exact_product
-- ----------------------------
DROP TABLE IF EXISTS `exact_product`;
CREATE TABLE `exact_product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `exact_id` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `name` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `division_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exact_product_division` (`division_id`),
  CONSTRAINT `exact_product_division` FOREIGN KEY (`division_id`) REFERENCES `exact_division` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for excel_for_acm_3
-- ----------------------------
DROP TABLE IF EXISTS `excel_for_acm_3`;
CREATE TABLE `excel_for_acm_3` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ean` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contract_number` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `contract_duration` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `product_type` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `usage_type` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `double_tariff` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `base_peak` decimal(20,7) DEFAULT NULL,
  `base_offpeak` decimal(20,7) DEFAULT NULL,
  `base_single` decimal(20,7) DEFAULT NULL,
  `kikker_topup_fee` decimal(20,7) DEFAULT NULL,
  `reseller_topup_fee` decimal(20,7) DEFAULT NULL,
  `total_peak_tariff` decimal(20,7) DEFAULT NULL,
  `total_offpeak_tariff` decimal(20,7) DEFAULT NULL,
  `total_single_tariff` decimal(20,7) DEFAULT NULL,
  `kikker_fixed_cost` decimal(20,7) DEFAULT NULL,
  `reseller_fixed_cost` decimal(20,7) DEFAULT NULL,
  `total_fixed_cost` decimal(20,7) DEFAULT NULL,
  `reseller_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41840 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for experian_default_rate
-- ----------------------------
DROP TABLE IF EXISTS `experian_default_rate`;
CREATE TABLE `experian_default_rate` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `rated` text CHARACTER SET utf8mb3,
  `cut_line_1` decimal(14,7) DEFAULT NULL,
  `cut_line_2` decimal(14,7) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for external_contract_log
-- ----------------------------
DROP TABLE IF EXISTS `external_contract_log`;
CREATE TABLE `external_contract_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `estimation_logging_external` varchar(50) CHARACTER SET utf8mb3 DEFAULT NULL,
  `request` longtext CHARACTER SET utf8mb3,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=666 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for feedback
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` datetime NOT NULL,
  `created_by` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `score` int NOT NULL,
  `comment` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `feedback_category_id` bigint NOT NULL,
  `reseller_externalId` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `user_type` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `is_send_any_time` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_feedback_feedback_category_id` (`feedback_category_id`),
  CONSTRAINT `FK_feedback_feedback_category_feedback_category_id` FOREIGN KEY (`feedback_category_id`) REFERENCES `feedback_category` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for feedback_category
-- ----------------------------
DROP TABLE IF EXISTS `feedback_category`;
CREATE TABLE `feedback_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` datetime NOT NULL,
  `created_by` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `name_en` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `name_nl` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `is_default` bit(1) NOT NULL,
  `is_invalid` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for final_bill_accounting
-- ----------------------------
DROP TABLE IF EXISTS `final_bill_accounting`;
CREATE TABLE `final_bill_accounting` (
  `id` int NOT NULL AUTO_INCREMENT,
  `final_bill_id` int NOT NULL,
  `data` mediumtext COLLATE utf8mb3_unicode_ci,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL DEFAULT '2021-09-10 09:20:15',
  PRIMARY KEY (`id`),
  KEY `idx_final_bill_id` (`final_bill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8144 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

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
  PRIMARY KEY (`id`),
  KEY `fixed_delivery_cost_end_date` (`end_date`),
  KEY `fixed_delivery_cost_product_type` (`product_type`),
  KEY `fixed_delivery_cost_start_date` (`start_date`)
) ENGINE=InnoDB AUTO_INCREMENT=763 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for flow_kikker_debug
-- ----------------------------
DROP TABLE IF EXISTS `flow_kikker_debug`;
CREATE TABLE `flow_kikker_debug` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `input` varchar(2000) CHARACTER SET utf8mb3 DEFAULT NULL,
  `output` varchar(5000) CHARACTER SET utf8mb3 DEFAULT NULL,
  `correlation_id` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=212086 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for flow_recal_monthly_amount
-- ----------------------------
DROP TABLE IF EXISTS `flow_recal_monthly_amount`;
CREATE TABLE `flow_recal_monthly_amount` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `in_data` text COLLATE utf8mb3_unicode_ci,
  `out_data` text COLLATE utf8mb3_unicode_ci,
  `correlation_id` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `correlation_id` (`correlation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57243 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for government_subsidy
-- ----------------------------
DROP TABLE IF EXISTS `government_subsidy`;
CREATE TABLE `government_subsidy` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ean` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `amount` decimal(12,7) NOT NULL,
  `approval_year` int NOT NULL,
  `approval_month` int NOT NULL,
  `applied_on_invoice` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `government_subsidy_ean_approval_year_approval_month` (`ean`,`approval_year`,`approval_month`)
) ENGINE=InnoDB AUTO_INCREMENT=7823 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for grid_operator
-- ----------------------------
DROP TABLE IF EXISTS `grid_operator`;
CREATE TABLE `grid_operator` (
  `id` int NOT NULL AUTO_INCREMENT,
  `grid_operator_name` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `grid_operator_address` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `grid_operator_kvk` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `grid_operator_btw` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `phone_number` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `parent_ean` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for help_desk_ticket_tracking
-- ----------------------------
DROP TABLE IF EXISTS `help_desk_ticket_tracking`;
CREATE TABLE `help_desk_ticket_tracking` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ticket_id` int NOT NULL,
  `ticket_number` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  `contract_number` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `invoice_numbers` varchar(500) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `reason` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for historical_market_data
-- ----------------------------
DROP TABLE IF EXISTS `historical_market_data`;
CREATE TABLE `historical_market_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `product_type` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `value` decimal(10,0) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for internal_invoice
-- ----------------------------
DROP TABLE IF EXISTS `internal_invoice`;
CREATE TABLE `internal_invoice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uuid` varchar(50) CHARACTER SET utf8mb3 DEFAULT NULL,
  `contract_number` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `invoice_data` longtext CHARACTER SET utf8mb3,
  `paid_amount` decimal(12,7) DEFAULT NULL,
  `paid_status` varchar(50) CHARACTER SET utf8mb3 DEFAULT NULL,
  `paid_date` datetime DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `nanoid` varchar(7) CHARACTER SET utf8mb3 DEFAULT NULL,
  `end_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `start_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=360 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for invoice_batch
-- ----------------------------
DROP TABLE IF EXISTS `invoice_batch`;
CREATE TABLE `invoice_batch` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data` mediumtext COLLATE utf8mb3_unicode_ci,
  `status` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `reseller_id` bigint NOT NULL DEFAULT '0',
  `from` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `to` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `type` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reseller_id` (`reseller_id`),
  CONSTRAINT `invoice_batch_to_reseller` FOREIGN KEY (`reseller_id`) REFERENCES `reseller` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for invoice_customer
-- ----------------------------
DROP TABLE IF EXISTS `invoice_customer`;
CREATE TABLE `invoice_customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reference_number` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `contract_number` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  `reseller_uuid` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `reseller_name` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `client_number` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  `invoice_amount` decimal(20,7) NOT NULL,
  `invoice_paid_amount` decimal(20,7) NOT NULL,
  `invoice_remaining_amount` decimal(20,7) DEFAULT NULL,
  `invoice_status` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  `month` int NOT NULL,
  `year` int NOT NULL,
  `due_date` datetime DEFAULT NULL,
  `paid_date` datetime DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime DEFAULT NULL,
  `city` varchar(40) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `country_code` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `customer_first_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `customer_last_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `house_number` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `house_number_extension` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `iban_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `iban_number` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `orders_number` varchar(70) COLLATE utf8mb3_unicode_ci DEFAULT '',
  `street` varchar(70) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `zipcode` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `cm_reference_number` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `mandate_number` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Term` int NOT NULL,
  `external_id` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `collective_invoice_id` int DEFAULT NULL,
  `is_paid` bit(1) NOT NULL DEFAULT b'0',
  `ended_reason` text COLLATE utf8mb3_unicode_ci,
  `contract_billing_id` int NOT NULL DEFAULT '0',
  `vat_split_response` text COLLATE utf8mb3_unicode_ci,
  `is_sent` bit(1) NOT NULL DEFAULT b'0',
  `linked_invoice_number` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `linked_invoice_type` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sent_mail_date` datetime DEFAULT NULL,
  `old_status` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `manually_created` bit(1) NOT NULL DEFAULT b'0',
  `subsidy` decimal(20,7) NOT NULL,
  `total_expected_payment` decimal(20,7) NOT NULL,
  `manually_linked_invoice_number` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `total_available` decimal(20,7) NOT NULL,
  `total_estimation` decimal(20,7) NOT NULL,
  `total_paid` decimal(20,7) NOT NULL,
  `total_realize` decimal(20,7) NOT NULL,
  `total_request` decimal(20,7) NOT NULL,
  `kk_earning_amount` decimal(20,7) NOT NULL,
  `is_exclude_billing` bit(1) NOT NULL DEFAULT b'0',
  `notes` longtext COLLATE utf8mb3_unicode_ci,
  `is_migrated` bit(1) DEFAULT b'0',
  `sending_method` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `collection_cost` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `current_predict_cost` decimal(20,7) NOT NULL DEFAULT '0.0000000',
  `is_usage_based` bit(1) NOT NULL DEFAULT b'0',
  `last_actual_cost` decimal(20,7) NOT NULL DEFAULT '0.0000000',
  `last_predict_cost` decimal(20,7) NOT NULL DEFAULT '0.0000000',
  `usage_excel_link` varchar(255) CHARACTER SET utf8mb3 DEFAULT '',
  `is_uncollectible` bit(1) NOT NULL DEFAULT b'0',
  `over_paid_amount` decimal(20,7) NOT NULL DEFAULT '0.0000000',
  `invoice_batch_id` int DEFAULT NULL,
  `linked_clone_monthly` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `linked_new_monthly` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `new_billing` bit(1) NOT NULL DEFAULT b'0',
  `new_billing_id` int NOT NULL DEFAULT '0',
  `vat_high` decimal(20,7) NOT NULL DEFAULT '0.0000000',
  `vat_low` decimal(20,7) NOT NULL DEFAULT '0.0000000',
  `vat_special` decimal(20,7) NOT NULL DEFAULT '0.0000000',
  `vat_zero` decimal(20,7) NOT NULL DEFAULT '0.0000000',
  `total_administration_cost` decimal(20,7) DEFAULT NULL,
  `new_billing_gvb` bit(1) NOT NULL DEFAULT b'0',
  `idempotency_key` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_idx_reference_number` (`reference_number`),
  UNIQUE KEY `unique_idx_idempotency_key` (`idempotency_key`),
  KEY `invoice_reference_number` (`reference_number`) USING BTREE,
  KEY `id` (`id`) USING BTREE,
  KEY `reseller_uuid` (`reseller_uuid`) USING BTREE,
  KEY `contract_number` (`contract_number`) USING BTREE,
  KEY `contract_billing_id` (`contract_billing_id`) USING BTREE,
  KEY `index_status_id` (`invoice_status`),
  KEY `index_reseller_uuid` (`reseller_uuid`),
  KEY `index_billing_id` (`contract_billing_id`),
  KEY `index_client_number` (`client_number`),
  KEY `invoice_batch_id` (`invoice_batch_id`),
  KEY `idx_invoice_billing_id` (`contract_billing_id`),
  KEY `idx_ic_contract_number` (`contract_number`),
  CONSTRAINT `invoice_customer_to_invoice_patch` FOREIGN KEY (`invoice_batch_id`) REFERENCES `invoice_batch` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=326322 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for invoice_customer_detail
-- ----------------------------
DROP TABLE IF EXISTS `invoice_customer_detail`;
CREATE TABLE `invoice_customer_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `invoice_id` int NOT NULL,
  `contract_id` int NOT NULL,
  `contract_number` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  `month` int NOT NULL,
  `year` int NOT NULL,
  `amount` decimal(12,7) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `subsidy` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `total_available` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `total_estimation` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `total_paid` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `total_realize` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `total_request` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `kk_earning_amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `invoice_id` (`invoice_id`),
  KEY `contract_number` (`contract_number`) USING BTREE,
  KEY `idx_icdd_contract_id` (`contract_id`),
  CONSTRAINT `invoice_customer_detail_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `invoice_customer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4071 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for invoice_number_generated_saved_failed
-- ----------------------------
DROP TABLE IF EXISTS `invoice_number_generated_saved_failed`;
CREATE TABLE `invoice_number_generated_saved_failed` (
  `id` int NOT NULL AUTO_INCREMENT,
  `invoice_number` varchar(50) CHARACTER SET utf8mb3 DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8mb3 DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for invoice_number_generator
-- ----------------------------
DROP TABLE IF EXISTS `invoice_number_generator`;
CREATE TABLE `invoice_number_generator` (
  `id` int NOT NULL AUTO_INCREMENT,
  `last_invoice_number` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for invoice_number_storage
-- ----------------------------
DROP TABLE IF EXISTS `invoice_number_storage`;
CREATE TABLE `invoice_number_storage` (
  `invoice_number` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `table_name` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`invoice_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for invoice_reseller
-- ----------------------------
DROP TABLE IF EXISTS `invoice_reseller`;
CREATE TABLE `invoice_reseller` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ean` varchar(255) CHARACTER SET utf8mb3 NOT NULL,
  `reseller_id` bigint NOT NULL,
  `connection_id` varchar(25) CHARACTER SET utf8mb3 NOT NULL,
  `transaction_type` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `tariff_description` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `reference` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `ppa` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `benefactor` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `benefactor_asset` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `beneficiary` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `beneficiary_asset` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `period_start` datetime NOT NULL,
  `period_end` datetime NOT NULL,
  `duration` varchar(25) CHARACTER SET utf8mb3 NOT NULL,
  `volume` double(20,5) NOT NULL,
  `volume_unit` varchar(10) CHARACTER SET utf8mb3 DEFAULT NULL,
  `tariff` decimal(20,7) NOT NULL,
  `total_gross` decimal(20,7) NOT NULL,
  `vat` decimal(5,2) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `invoice_number` varchar(50) CHARACTER SET utf8mb3 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_reseller_ibfk_1` (`reseller_id`),
  CONSTRAINT `invoice_reseller_ibfk_1` FOREIGN KEY (`reseller_id`) REFERENCES `reseller` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for invoice_reseller_earning_tracking
-- ----------------------------
DROP TABLE IF EXISTS `invoice_reseller_earning_tracking`;
CREATE TABLE `invoice_reseller_earning_tracking` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contract_number` longtext CHARACTER SET utf8mb3 NOT NULL,
  `invoice_id` int NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `revert_date` datetime(6) DEFAULT NULL,
  `total_available` decimal(20,7) NOT NULL,
  `total_estimation` decimal(20,7) NOT NULL,
  `total_paid` decimal(20,7) NOT NULL,
  `total_realize` decimal(20,7) NOT NULL,
  `total_request` decimal(20,7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_invoice_reseller_earning_tracking_invoice_id` (`invoice_id`),
  CONSTRAINT `FK_invoice_reseller_earning_tracking_invoice_customer_invoice_id` FOREIGN KEY (`invoice_id`) REFERENCES `invoice_customer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4847 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for invoice_status_billing
-- ----------------------------
DROP TABLE IF EXISTS `invoice_status_billing`;
CREATE TABLE `invoice_status_billing` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb3 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for invoice_status_billing_flow
-- ----------------------------
DROP TABLE IF EXISTS `invoice_status_billing_flow`;
CREATE TABLE `invoice_status_billing_flow` (
  `id` int NOT NULL AUTO_INCREMENT,
  `current_status_id` int NOT NULL,
  `next_status_id` int NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for invoice_usage_based
-- ----------------------------
DROP TABLE IF EXISTS `invoice_usage_based`;
CREATE TABLE `invoice_usage_based` (
  `id` int NOT NULL AUTO_INCREMENT,
  `invoice_id` int NOT NULL,
  `data` json DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4698 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `item_name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `item_unit_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `item_unit_id` (`item_unit_id`),
  CONSTRAINT `item_ibfk_1` FOREIGN KEY (`item_unit_id`) REFERENCES `unit` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for kk_contract
-- ----------------------------
DROP TABLE IF EXISTS `kk_contract`;
CREATE TABLE `kk_contract` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contract_number` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `external_id` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `customer_id` bigint DEFAULT NULL,
  `reseller_id` bigint DEFAULT NULL,
  `contract_duration` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime DEFAULT NULL,
  `contract_status_id` int DEFAULT NULL,
  `location_billing_id` bigint DEFAULT NULL,
  `location_delivery_id` bigint DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `created_by` int DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `is_year_billing_error` bit(1) NOT NULL,
  `year_bling_error_message` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `bank_account` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `bank_account_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `monthly_amount` decimal(12,2) DEFAULT NULL,
  `original_amount` decimal(12,2) DEFAULT NULL,
  `payment_method` bit(1) NOT NULL DEFAULT b'0',
  `reseller_monthly_amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `invoice_date` datetime(6) NOT NULL DEFAULT '0001-01-01 00:00:00.000000',
  `company_name` longtext COLLATE utf8mb3_unicode_ci,
  `send_welcome_mail` bit(1) DEFAULT NULL,
  `signed_date` datetime DEFAULT NULL,
  `reseller_earning_amount` decimal(12,2) DEFAULT NULL,
  `overridden_by_contract_id` int DEFAULT NULL,
  `is_override_contract` bit(1) DEFAULT NULL,
  `is_penalty_charge` bit(1) DEFAULT NULL,
  `mailbox_id` int DEFAULT NULL,
  `estimation_external` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sign_request_uuid` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_urgent` bit(1) NOT NULL,
  `mandate_file_id` int DEFAULT NULL,
  `md_update_monthly_amount` decimal(12,2) DEFAULT NULL,
  `is_kikker_invoice` bit(1) NOT NULL,
  `is_kikker_signing` bit(1) NOT NULL,
  `notification_received` varchar(1000) COLLATE utf8mb3_unicode_ci DEFAULT '',
  `ended_reason` text COLLATE utf8mb3_unicode_ci,
  `reference` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `language` varchar(20) CHARACTER SET utf8mb3 NOT NULL DEFAULT 'nl',
  `kikker_earning_amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `bill_date` datetime DEFAULT NULL,
  `move_in` varchar(50) CHARACTER SET utf8mb3 DEFAULT NULL,
  `move_out` varchar(50) CHARACTER SET utf8mb3 DEFAULT NULL,
  `vko` bit(1) NOT NULL DEFAULT b'0',
  `move_out_only` varchar(50) CHARACTER SET utf8mb3 DEFAULT NULL,
  `is_reseller_payout` bit(1) NOT NULL DEFAULT b'0',
  `is_sync_master_data` bit(1) NOT NULL DEFAULT b'0',
  `kikker_email` bit(1) NOT NULL DEFAULT b'0',
  `sync_adc_file` bit(1) NOT NULL DEFAULT b'0',
  `sync_p4_data` bit(1) NOT NULL DEFAULT b'0',
  `is_validation_ma` bit(1) NOT NULL DEFAULT b'0',
  `is_active_location_billing` bit(1) NOT NULL DEFAULT b'1',
  `contract_reference` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `correspondence_address` int NOT NULL DEFAULT '0',
  `is_usage_based` bit(1) NOT NULL DEFAULT b'0',
  `contract_type` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `payment_delivery_type` int NOT NULL DEFAULT '0',
  `order_flow` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_invoice_pdf_attachment` bit(1) NOT NULL DEFAULT b'0',
  `deposit_amount` decimal(12,2) DEFAULT NULL,
  `deposit_percentage` decimal(12,7) DEFAULT NULL,
  `is_apply_frdc` bit(1) NOT NULL DEFAULT b'0',
  `is_apply_eos` bit(1) NOT NULL DEFAULT b'1',
  `is_usage_correction` bit(1) NOT NULL DEFAULT b'0',
  `debt_counseling` bit(1) DEFAULT NULL,
  `smart_meter_allocation` bit(1) NOT NULL DEFAULT b'0',
  `contract_addition` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `is_apply_margin` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `contract_number` (`contract_number`) USING BTREE,
  KEY `contract_status_id` (`contract_status_id`) USING BTREE,
  KEY `customer` (`customer_id`) USING BTREE,
  KEY `localbilling` (`location_billing_id`) USING BTREE,
  KEY `deliverybiling` (`location_delivery_id`) USING BTREE,
  KEY `reseller` (`reseller_id`) USING BTREE,
  KEY `FK_mail_box` (`mailbox_id`) USING BTREE,
  KEY `idx_contract_status` (`contract_status_id`),
  KEY `idx_contract_number` (`contract_number`),
  KEY `idx_kc_status_reseller` (`contract_status_id`,`reseller_id`),
  KEY `idx_kc_contract_number` (`contract_number`),
  CONSTRAINT `customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `deliverybiling` FOREIGN KEY (`location_delivery_id`) REFERENCES `location` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK_mail_box` FOREIGN KEY (`mailbox_id`) REFERENCES `mail_box` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `kk_contract_ibfk_1` FOREIGN KEY (`contract_status_id`) REFERENCES `contract_status` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `localbilling` FOREIGN KEY (`location_billing_id`) REFERENCES `location` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `reseller` FOREIGN KEY (`reseller_id`) REFERENCES `reseller` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=44478 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for kk_contract_history
-- ----------------------------
DROP TABLE IF EXISTS `kk_contract_history`;
CREATE TABLE `kk_contract_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contract_id` int NOT NULL,
  `change_type` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `old_value` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `new_value` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `change_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contract_contractHistory` (`contract_id`),
  KEY `old_value_index` (`old_value`),
  KEY `new_value_index` (`new_value`),
  KEY `change_type_index` (`change_type`),
  CONSTRAINT `contract_contractHistory` FOREIGN KEY (`contract_id`) REFERENCES `kk_contract` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=457076 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for kk_master_data_tracking
-- ----------------------------
DROP TABLE IF EXISTS `kk_master_data_tracking`;
CREATE TABLE `kk_master_data_tracking` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ean` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `ean` (`ean`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=84035 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for kk_master_data_tracking_properties
-- ----------------------------
DROP TABLE IF EXISTS `kk_master_data_tracking_properties`;
CREATE TABLE `kk_master_data_tracking_properties` (
  `id` int NOT NULL AUTO_INCREMENT,
  `master_data_tracking_id` int NOT NULL,
  `ResponseData` longtext COLLATE utf8mb3_unicode_ci,
  `ean` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `hash_id` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `master_data_tracking_id` (`master_data_tracking_id`) USING BTREE,
  KEY `master_data_tracking_ean` (`ean`) USING BTREE,
  KEY `master_data_tracking_hash_id` (`hash_id`) USING BTREE,
  CONSTRAINT `kk_master_data_tracking_id` FOREIGN KEY (`master_data_tracking_id`) REFERENCES `kk_master_data_tracking` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=84038 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for kk_master_data_tracking_property_changes
-- ----------------------------
DROP TABLE IF EXISTS `kk_master_data_tracking_property_changes`;
CREATE TABLE `kk_master_data_tracking_property_changes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `old_md_tracking_property_id` int NOT NULL,
  `new_md_tracking_property_id` int NOT NULL,
  `changed_property_name` varchar(255) CHARACTER SET utf8mb3 NOT NULL,
  `old_property_value` text COLLATE utf8mb3_unicode_ci,
  `new_property_value` text COLLATE utf8mb3_unicode_ci,
  `created_date` datetime NOT NULL,
  `is_sent` bit(1) NOT NULL DEFAULT b'0',
  `ean` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `mutation_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_muataion_date` (`mutation_date`)
) ENGINE=InnoDB AUTO_INCREMENT=75029 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for kk_order
-- ----------------------------
DROP TABLE IF EXISTS `kk_order`;
CREATE TABLE `kk_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `external_id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `contract_id` int NOT NULL,
  `ean` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `order_number` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `order_status_id` int NOT NULL,
  `product_type` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `usage_type` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `grid_operator` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `double_meter` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `single_usage_estimation` double DEFAULT NULL,
  `normal_usage_estimation` double DEFAULT NULL,
  `dal_usage_estimation` double DEFAULT NULL,
  `is_residence` bit(1) NOT NULL,
  `is_smart_meter` bit(1) NOT NULL,
  `green_energy` bit(1) NOT NULL,
  `physical_capacity` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `monthly_amount` decimal(12,2) DEFAULT NULL,
  `kikker_topup_fee` decimal(20,7) NOT NULL,
  `kikker_topup_fee_id` int NOT NULL,
  `kikker_delivery_cost` decimal(20,7) NOT NULL,
  `kikker_delivery_cost_id` int NOT NULL,
  `reseller_topup_fee` decimal(20,7) NOT NULL,
  `reseller_topup_fee_id` int NOT NULL,
  `pv_price_single` decimal(20,7) NOT NULL,
  `pv_price_normal` decimal(20,7) NOT NULL,
  `pv_price_off_peak` decimal(20,7) NOT NULL,
  `pv_price_id` int NOT NULL,
  `end_date` datetime NOT NULL,
  `start_date` datetime NOT NULL,
  `order_type_id` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `captar_code` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `grid_operator_tariff` decimal(20,7) DEFAULT NULL,
  `kvk_number` varchar(45) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `return_delivery` double DEFAULT NULL,
  `energy_tax_reduction` decimal(20,7) NOT NULL DEFAULT '0.0000000',
  `reseller_delivery_cost` decimal(20,7) NOT NULL DEFAULT '0.0000000',
  `reseller_delivery_cost_id` int NOT NULL DEFAULT '0',
  `variable_delivery_single` decimal(20,7) NOT NULL DEFAULT '0.0000000',
  `energy_meter_type` varchar(45) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `technical_communication_sm` varchar(45) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `profile_category` varchar(45) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `variable_delivery_normal` decimal(20,7) NOT NULL DEFAULT '0.0000000',
  `variable_delivery_offpeak` decimal(20,7) NOT NULL DEFAULT '0.0000000',
  `eac_date` datetime DEFAULT NULL,
  `eac_off_peak` double(20,5) DEFAULT NULL,
  `eac_peak` double(20,5) DEFAULT NULL,
  `pv_price_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `valid_cancellation_date` datetime DEFAULT NULL,
  `status_updated_date` datetime DEFAULT NULL,
  `dossier_number` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `energy_meter_number` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `smart_meter_status` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `green_energy_type_id` int DEFAULT NULL,
  `green_energy_type_name` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_sent_edsn` bit(1) DEFAULT b'1',
  `production_eac_off_peak` double(20,5) DEFAULT NULL,
  `production_eac_peak` double(20,5) DEFAULT NULL,
  `green_energy_price` decimal(20,7) DEFAULT NULL,
  `edsn_response_code` int DEFAULT NULL,
  `edsn_response_message` text CHARACTER SET utf8mb3,
  `mutation_type` varchar(50) CHARACTER SET utf8mb3 DEFAULT NULL,
  `latest_reading_date` datetime DEFAULT NULL,
  `off_peak_latest_reading_number` int DEFAULT NULL,
  `on_peak_latest_reading_number` int DEFAULT NULL,
  `return_off_peak_latest_reading_number` int DEFAULT NULL,
  `return_on_peak_latest_reading_number` int DEFAULT NULL,
  `ended_reason` text CHARACTER SET utf8mb3,
  `monthly_amount_percentage` decimal(12,7) DEFAULT NULL,
  `estimation_compensation_price` decimal(20,7) NOT NULL DEFAULT '0.0000000',
  `energy_delivery_status` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `physical_status` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `kikker_feed_in_fee` decimal(20,7) NOT NULL DEFAULT '0.0000000',
  `reseller_feed_in_fee` decimal(20,7) NOT NULL DEFAULT '0.0000000',
  `kikker_business_fixed_delivery_cost` decimal(20,7) NOT NULL DEFAULT '0.0000000',
  `kikker_business_fixed_delivery_cost_id` int NOT NULL DEFAULT '0',
  `return_tariff` decimal(20,7) DEFAULT NULL,
  `difference_return_tariff` decimal(20,7) DEFAULT NULL,
  `reseller_topup_fee_off_peak` decimal(20,7) DEFAULT NULL,
  `reseller_topup_fee_on_peak` decimal(20,7) DEFAULT NULL,
  `reseller_topup_fee_single` decimal(20,7) DEFAULT NULL,
  `frdc_excel_id` int DEFAULT NULL,
  `kk_frdc` decimal(20,7) DEFAULT NULL,
  `rs_frdc` decimal(20,7) DEFAULT NULL,
  `energy_flow_direction` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `kikker_portfolio_tarifff` decimal(20,7) DEFAULT NULL,
  `reseller_portfolio_tarifff` decimal(20,7) DEFAULT NULL,
  `allocation_method` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `contract_order` (`contract_id`) USING BTREE,
  KEY `orderstatus` (`order_status_id`) USING BTREE,
  KEY `ordertype` (`order_type_id`) USING BTREE,
  KEY `idx_ean` (`ean`) USING BTREE,
  KEY `idx_contract_order_status` (`contract_id`,`order_status_id`),
  CONSTRAINT `contract_order` FOREIGN KEY (`contract_id`) REFERENCES `kk_contract` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `orderstatus` FOREIGN KEY (`order_status_id`) REFERENCES `order_status` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `ordertype` FOREIGN KEY (`order_type_id`) REFERENCES `order_type` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=78707 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for kk_order_configuration
-- ----------------------------
DROP TABLE IF EXISTS `kk_order_configuration`;
CREATE TABLE `kk_order_configuration` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ean` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `key` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for language_settings
-- ----------------------------
DROP TABLE IF EXISTS `language_settings`;
CREATE TABLE `language_settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for location
-- ----------------------------
DROP TABLE IF EXISTS `location`;
CREATE TABLE `location` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `zipcode` char(6) COLLATE utf8mb3_unicode_ci NOT NULL,
  `house_number` int NOT NULL,
  `house_number_extension` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `room` varchar(200) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `street` varchar(200) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `city` varchar(200) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `country` varchar(200) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `building_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=99962 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for mail_box
-- ----------------------------
DROP TABLE IF EXISTS `mail_box`;
CREATE TABLE `mail_box` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `mail_box_number` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `zip_code` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `place_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for mail_template
-- ----------------------------
DROP TABLE IF EXISTS `mail_template`;
CREATE TABLE `mail_template` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `mail_name` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `lang_key` varchar(6) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `subject_nl` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `mail_template_en` longtext COLLATE utf8mb3_unicode_ci,
  `mail_template_nl` longtext COLLATE utf8mb3_unicode_ci,
  `footer` longtext COLLATE utf8mb3_unicode_ci,
  `footer_nl` longtext COLLATE utf8mb3_unicode_ci,
  `started_date` datetime DEFAULT NULL,
  `ended_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=259 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for mail_template_rs
-- ----------------------------
DROP TABLE IF EXISTS `mail_template_rs`;
CREATE TABLE `mail_template_rs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `mail_name` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `lang_key` varchar(6) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `subject_nl` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `mail_template_en` longtext COLLATE utf8mb3_unicode_ci,
  `mail_template_nl` longtext COLLATE utf8mb3_unicode_ci,
  `footer` longtext COLLATE utf8mb3_unicode_ci,
  `footer_nl` longtext COLLATE utf8mb3_unicode_ci,
  `reseller_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_mail_template_rs_mail_name` (`mail_name`,`reseller_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15343 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for maintenance_service
-- ----------------------------
DROP TABLE IF EXISTS `maintenance_service`;
CREATE TABLE `maintenance_service` (
  `id` int NOT NULL AUTO_INCREMENT,
  `service` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `message` varchar(500) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for mandate_file
-- ----------------------------
DROP TABLE IF EXISTS `mandate_file`;
CREATE TABLE `mandate_file` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contract_id` int DEFAULT NULL,
  `name` varchar(150) CHARACTER SET utf8mb3 DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `external_id` varchar(50) CHARACTER SET utf8mb3 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mandateFile_externalId` (`external_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4589 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for master_data_monthly_amount
-- ----------------------------
DROP TABLE IF EXISTS `master_data_monthly_amount`;
CREATE TABLE `master_data_monthly_amount` (
  `Id` bigint NOT NULL AUTO_INCREMENT,
  `ean` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `master_data_id` int DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `monthly_amount` decimal(12,2) NOT NULL,
  `created_date` datetime NOT NULL,
  `is_calculated` bit(1) NOT NULL DEFAULT b'0',
  `estimation_logging_external_id` varchar(50) CHARACTER SET utf8mb3 DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `master_data_monthly_amount_ean` (`ean`),
  KEY `master_data_monthly_is_calculated` (`is_calculated`),
  KEY `master_data_monthly_estimation_logging` (`estimation_logging_external_id`)
) ENGINE=InnoDB AUTO_INCREMENT=74492 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for master_data_update_temporary
-- ----------------------------
DROP TABLE IF EXISTS `master_data_update_temporary`;
CREATE TABLE `master_data_update_temporary` (
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
  PRIMARY KEY (`Id`),
  KEY `IX_MasterDataUpdates_EDSNRequestId` (`EDSNRequestId`),
  KEY `IX_MasterDataUpdates_EAN` (`EAN`),
  CONSTRAINT `master_data_update_temporary_ibfk_1` FOREIGN KEY (`EDSNRequestId`) REFERENCES `EDSNRequests` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=1636 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for message_recipients
-- ----------------------------
DROP TABLE IF EXISTS `message_recipients`;
CREATE TABLE `message_recipients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `message_id` int NOT NULL,
  `user_uuid` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `reseller_uuid` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_read` bit(1) NOT NULL DEFAULT b'0',
  `is_flag` bit(1) NOT NULL DEFAULT b'0',
  `status` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'NEW' COMMENT 'Deleted,Archived,New',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_message_recipients_messages` (`message_id`),
  KEY `idx_message_recipients_status` (`status`),
  KEY `idx_message_recipients_user_uuid_reseller_uuid` (`user_uuid`,`reseller_uuid`),
  CONSTRAINT `fk_message_recipients_messages` FOREIGN KEY (`message_id`) REFERENCES `messages` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for messages
-- ----------------------------
DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `external_uuid` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `type` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `category` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'Payments,Contact request,Connections,EDSN,Credit check',
  `title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb3_unicode_ci,
  `params` text COLLATE utf8mb3_unicode_ci,
  `attachment` text COLLATE utf8mb3_unicode_ci COMMENT 'path to attachment folder',
  `correlation_id` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb3_unicode_ci,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_message_category` (`category`),
  KEY `idx_message_external_uuid` (`external_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for meter_device_information
-- ----------------------------
DROP TABLE IF EXISTS `meter_device_information`;
CREATE TABLE `meter_device_information` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `ean` varchar(50) CHARACTER SET utf8mb3 DEFAULT NULL,
  `number_of_register` int DEFAULT NULL,
  `number_of_digit` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `mutiplication_factor` double DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `ean_index` (`ean`)
) ENGINE=InnoDB AUTO_INCREMENT=19062 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for meter_device_information_register
-- ----------------------------
DROP TABLE IF EXISTS `meter_device_information_register`;
CREATE TABLE `meter_device_information_register` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `meter_id` int NOT NULL,
  `register_id` varchar(11) CHARACTER SET utf8mb3 DEFAULT NULL,
  `metering_direction` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `tariff_type` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_meter_device_information_register_meter_id` (`meter_id`),
  CONSTRAINT `MeterDeviceInformation_MeterDeviceInformationRegister` FOREIGN KEY (`meter_id`) REFERENCES `meter_device_information` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=218000 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for meter_read_photo_requests
-- ----------------------------
DROP TABLE IF EXISTS `meter_read_photo_requests`;
CREATE TABLE `meter_read_photo_requests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contract_number` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ean` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `meter_number` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `product_type` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `reason` varchar(500) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_sent_mail` tinyint(1) NOT NULL DEFAULT '0',
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL,
  `usage_external_uuid` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_contract_number` (`contract_number`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for metering_reading_from_customer
-- ----------------------------
DROP TABLE IF EXISTS `metering_reading_from_customer`;
CREATE TABLE `metering_reading_from_customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_uuid` varchar(50) CHARACTER SET utf8mb3 DEFAULT NULL,
  `reseller_uuid` varchar(50) CHARACTER SET utf8mb3 DEFAULT NULL,
  `ean` varchar(50) CHARACTER SET utf8mb3 DEFAULT NULL,
  `metering_type` varchar(50) CHARACTER SET utf8mb3 DEFAULT NULL,
  `meter_1` varchar(11) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `meter_2` varchar(11) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `meter_3` varchar(11) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `meter_4` varchar(11) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `product_type` varchar(20) CHARACTER SET utf8mb3 DEFAULT NULL,
  `meter_reading_date` datetime DEFAULT NULL,
  `contract_number` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `meter_5` varchar(11) CHARACTER SET utf8mb3 DEFAULT NULL,
  `meter_6` varchar(11) CHARACTER SET utf8mb3 DEFAULT NULL,
  `meter_7` varchar(11) CHARACTER SET utf8mb3 DEFAULT NULL,
  `meter_8` varchar(11) CHARACTER SET utf8mb3 DEFAULT NULL,
  `is_help_desk` bit(1) NOT NULL DEFAULT b'0',
  `is_sent_anytime` bit(1) NOT NULL DEFAULT b'0',
  `meter_reading_type` varchar(50) CHARACTER SET utf8mb3 DEFAULT NULL,
  `usage_external_uuid` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8442 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for metering_reading_from_customer_register
-- ----------------------------
DROP TABLE IF EXISTS `metering_reading_from_customer_register`;
CREATE TABLE `metering_reading_from_customer_register` (
  `id` int NOT NULL AUTO_INCREMENT,
  `meter_reading_id` int DEFAULT NULL,
  `register_id` varchar(20) CHARACTER SET utf8mb3 DEFAULT NULL,
  `metering_direction` varchar(20) CHARACTER SET utf8mb3 DEFAULT NULL,
  `tariff_type` varchar(20) CHARACTER SET utf8mb3 DEFAULT NULL,
  `number` varchar(20) CHARACTER SET utf8mb3 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meter_reading_id` (`meter_reading_id`),
  CONSTRAINT `metering_reading_from_customer_register_ibfk_1` FOREIGN KEY (`meter_reading_id`) REFERENCES `metering_reading_from_customer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=11859 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for migration_credit_invoices
-- ----------------------------
DROP TABLE IF EXISTS `migration_credit_invoices`;
CREATE TABLE `migration_credit_invoices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `invoice_number` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `amount` double NOT NULL,
  `contract` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `original_invoice` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `original_amount` double NOT NULL,
  `invoice_date` datetime NOT NULL,
  `original_file_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `bucket_path` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for mobile_notification
-- ----------------------------
DROP TABLE IF EXISTS `mobile_notification`;
CREATE TABLE `mobile_notification` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_uuid` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `reseller_uuid` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb3_unicode_ci,
  `params` text COLLATE utf8mb3_unicode_ci,
  `is_read` bit(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ContentNl` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `TitleNl` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=199553 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for monthly_amount_validation
-- ----------------------------
DROP TABLE IF EXISTS `monthly_amount_validation`;
CREATE TABLE `monthly_amount_validation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contract_number` varchar(20) CHARACTER SET utf8mb3 DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8mb3 DEFAULT NULL,
  `old_monthly_amount` decimal(12,7) DEFAULT NULL,
  `new_monthly_amount` decimal(12,7) DEFAULT NULL,
  `percentage_difference` decimal(12,7) DEFAULT NULL,
  `min` decimal(12,7) DEFAULT NULL,
  `max` decimal(12,7) DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `perform_date` datetime NOT NULL,
  `monthly_amount_type` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `amount_status` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `max_amount_limit` decimal(12,7) DEFAULT NULL COMMENT 'get from pricing',
  `min_amount_limit` decimal(12,7) DEFAULT NULL COMMENT 'get from pricing',
  `new_monthly_amount_apply` decimal(12,7) DEFAULT NULL COMMENT 'apply min/max of MA validation',
  `is_sent_mail` bit(1) DEFAULT b'0',
  `trigger_source` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `user_external_id` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_contract_number` (`contract_number`)
) ENGINE=InnoDB AUTO_INCREMENT=204685 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for monthly_amount_validation_log
-- ----------------------------
DROP TABLE IF EXISTS `monthly_amount_validation_log`;
CREATE TABLE `monthly_amount_validation_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `monthly_amount_validation_id` int NOT NULL,
  `contract_number` varchar(20) CHARACTER SET utf8mb3 DEFAULT NULL,
  `step_name` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `process_log` longtext CHARACTER SET utf8mb3,
  `message` longtext CHARACTER SET utf8mb3,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_contract_number` (`contract_number`),
  KEY `idx_created_date` (`created_date`),
  KEY `idx_id` (`id`),
  KEY `idx_step_name` (`step_name`),
  KEY `idx_MAV_Id` (`monthly_amount_validation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1698147 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for monthly_payment_kikker_detail
-- ----------------------------
DROP TABLE IF EXISTS `monthly_payment_kikker_detail`;
CREATE TABLE `monthly_payment_kikker_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `reference_number` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `report_id` int NOT NULL,
  `type` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  `reseller_id` bigint NOT NULL,
  `amount` decimal(12,7) NOT NULL,
  `created_time` datetime NOT NULL,
  `reseller_name` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `monthly_payment_kikker_report_id` (`report_id`),
  CONSTRAINT `monthly_payment_kikker_report_id` FOREIGN KEY (`report_id`) REFERENCES `monthly_payment_kikker_report` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for monthly_payment_kikker_report
-- ----------------------------
DROP TABLE IF EXISTS `monthly_payment_kikker_report`;
CREATE TABLE `monthly_payment_kikker_report` (
  `id` int NOT NULL AUTO_INCREMENT,
  `month` int NOT NULL,
  `year` int NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_time` datetime NOT NULL,
  `combine_all_reseller_csv_file_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `monthly_payment_kikker_month` (`month`),
  KEY `monthly_payment_kikker_year` (`year`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for monthly_payment_reseller_detail
-- ----------------------------
DROP TABLE IF EXISTS `monthly_payment_reseller_detail`;
CREATE TABLE `monthly_payment_reseller_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `reference_number` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `report_id` int NOT NULL,
  `type` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  `contract_number` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  `amount` decimal(12,7) NOT NULL,
  `amount_kikker` decimal(12,7) DEFAULT NULL,
  `client_number` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  `customer_first_name` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `customer_last_name` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `company_name` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `company_kvk` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `company_address` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `delivery_address` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `payment_address` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `automated_payment` bit(1) NOT NULL,
  `bank_account_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `iban_number` varchar(40) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `monthly_payment_report_id` (`report_id`),
  CONSTRAINT `monthly_payment_report_id` FOREIGN KEY (`report_id`) REFERENCES `monthly_payment_reseller_report` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for monthly_payment_reseller_report
-- ----------------------------
DROP TABLE IF EXISTS `monthly_payment_reseller_report`;
CREATE TABLE `monthly_payment_reseller_report` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reseller_id` bigint NOT NULL,
  `month` int NOT NULL,
  `year` int NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_time` datetime NOT NULL,
  `reseller_name` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `monthly_payment_reseller_month` (`month`),
  KEY `monthly_payment_reseller_year` (`year`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for movein_moveout
-- ----------------------------
DROP TABLE IF EXISTS `movein_moveout`;
CREATE TABLE `movein_moveout` (
  `id` int NOT NULL AUTO_INCREMENT,
  `moveout_contract_number` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `moveout_date` datetime NOT NULL,
  `movein_contract_number` varchar(50) CHARACTER SET utf8mb3 DEFAULT NULL,
  `movein_date` datetime NOT NULL,
  `moveout_status` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `movein_processed_date` datetime DEFAULT NULL,
  `movein_status` varchar(50) CHARACTER SET utf8mb3 DEFAULT NULL,
  `moveout_processed_date` datetime DEFAULT NULL,
  `movein_processed_log` text CHARACTER SET utf8mb3,
  `moveout_processed_log` text CHARACTER SET utf8mb3,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for movein_moveout_confirm
-- ----------------------------
DROP TABLE IF EXISTS `movein_moveout_confirm`;
CREATE TABLE `movein_moveout_confirm` (
  `id` int NOT NULL AUTO_INCREMENT,
  `movein_contract_number` varchar(50) CHARACTER SET utf8mb3 DEFAULT NULL,
  `moveout_contract_number` varchar(50) CHARACTER SET utf8mb3 DEFAULT NULL,
  `confirm_email` text CHARACTER SET utf8mb3,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mail_body` longtext CHARACTER SET utf8mb3,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for moveout
-- ----------------------------
DROP TABLE IF EXISTS `moveout`;
CREATE TABLE `moveout` (
  `id` int NOT NULL AUTO_INCREMENT,
  `moveout_contract_number` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `moveout_date` datetime NOT NULL,
  `moveout_status` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `moveout_processed_date` datetime DEFAULT NULL,
  `moveout_processed_log` text CHARACTER SET utf8mb3,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=548 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for moveout_confirm
-- ----------------------------
DROP TABLE IF EXISTS `moveout_confirm`;
CREATE TABLE `moveout_confirm` (
  `id` int NOT NULL AUTO_INCREMENT,
  `moveout_contract_number` varchar(50) CHARACTER SET utf8mb3 DEFAULT NULL,
  `confirm_email` text CHARACTER SET utf8mb3,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mail_body` longtext CHARACTER SET utf8mb3,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=550 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for order_history
-- ----------------------------
DROP TABLE IF EXISTS `order_history`;
CREATE TABLE `order_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `change_type` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `edsn_id` int DEFAULT NULL,
  `edsn_code` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `edsn_rejection` varchar(500) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `old_value` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `new_value` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `change_date` datetime DEFAULT NULL,
  `ArchiveOrderId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_orderHistory` (`order_id`),
  CONSTRAINT `order_orderHistory` FOREIGN KEY (`order_id`) REFERENCES `kk_order` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=22843 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for order_priceplan
-- ----------------------------
DROP TABLE IF EXISTS `order_priceplan`;
CREATE TABLE `order_priceplan` (
  `order_id` int NOT NULL,
  `priceplan_id` int NOT NULL,
  `date_from` datetime DEFAULT NULL,
  `date_until` datetime DEFAULT NULL,
  PRIMARY KEY (`order_id`,`priceplan_id`),
  KEY `priceplan_id` (`priceplan_id`),
  CONSTRAINT `order_priceplan_ibfk_2` FOREIGN KEY (`priceplan_id`) REFERENCES `priceplan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for order_status
-- ----------------------------
DROP TABLE IF EXISTS `order_status`;
CREATE TABLE `order_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `activated` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for order_type
-- ----------------------------
DROP TABLE IF EXISTS `order_type`;
CREATE TABLE `order_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `activated` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for pay_before_delivery_process
-- ----------------------------
DROP TABLE IF EXISTS `pay_before_delivery_process`;
CREATE TABLE `pay_before_delivery_process` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contract_number` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contract_duration` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'ContractSigned,PaymentExecuted,LvSwitchExecuted,ContractCancelled',
  `mutation_date` datetime NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=307 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for payment_agreement
-- ----------------------------
DROP TABLE IF EXISTS `payment_agreement`;
CREATE TABLE `payment_agreement` (
  `id` int NOT NULL AUTO_INCREMENT,
  `invoice_id` int NOT NULL,
  `contract_number` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `num_term` int NOT NULL,
  `num_day_in_term` int NOT NULL,
  `first_payment_date` datetime NOT NULL,
  `administration_cost_incl_vat` decimal(12,7) NOT NULL,
  `customer_email` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL,
  `num_created_payment` int NOT NULL DEFAULT '0',
  `created_payment_ids` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `updated_by` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_by_role` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `updated_by_role` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_by_reseller` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `updated_by_reseller` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `payment_agreement_status` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'New',
  PRIMARY KEY (`id`),
  KEY `IX_payment_agreement_invoice_id` (`invoice_id`),
  KEY `idx_payment_agreement_status` (`payment_agreement_status`),
  CONSTRAINT `FK_payment_agreement_invoice_customer_invoice_id` FOREIGN KEY (`invoice_id`) REFERENCES `invoice_customer` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for payment_customer
-- ----------------------------
DROP TABLE IF EXISTS `payment_customer`;
CREATE TABLE `payment_customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uuid` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `customer_key` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `customer_bank_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `customer_iban` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `reseller_name` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `reseller_uuid` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `contract_uuid` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `contract_number` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  `contract_start_date` datetime NOT NULL,
  `payment_amount` decimal(12,7) NOT NULL,
  `payment_status` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  `payment_address` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `payment_for_month` datetime NOT NULL,
  `payment_created_date` datetime NOT NULL,
  `payment_last_remind_date` datetime DEFAULT NULL,
  `payment_remind_count` int NOT NULL,
  `payment_updated_date` datetime NOT NULL,
  `reference_number` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `customer_email` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `customer_firstname` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `customer_gender` bit(1) DEFAULT NULL,
  `customer_lastname` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `payment_billing_id` bigint DEFAULT NULL,
  `payment_cm_key` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `payment_order_key` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `cm_payment_method` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `expire_countdown` int DEFAULT NULL,
  `paid_date` datetime DEFAULT NULL,
  `cm_reference_number` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `reminder_email` int DEFAULT NULL,
  `has_unpaid_amount` bit(1) NOT NULL DEFAULT b'0',
  `reminder_emails` longtext COLLATE utf8mb3_unicode_ci,
  `paid_amount` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `collection_cost` decimal(20,7) NOT NULL DEFAULT '0.0000000',
  `invoice_ids` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `payment_customer_uuid` (`uuid`),
  KEY `payment_customer_status` (`payment_status`),
  KEY `payment_customer_ibfk_1` (`payment_billing_id`),
  KEY `payment_referecen_number` (`reference_number`) USING BTREE,
  CONSTRAINT `payment_customer_ibfk_1` FOREIGN KEY (`payment_billing_id`) REFERENCES `location` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=304376 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for payment_customer_history
-- ----------------------------
DROP TABLE IF EXISTS `payment_customer_history`;
CREATE TABLE `payment_customer_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `payment_id` int DEFAULT NULL,
  `payment_status` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `payment_type` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `reason` varchar(5000) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `changed_date` datetime DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=238360 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for payout_payment
-- ----------------------------
DROP TABLE IF EXISTS `payout_payment`;
CREATE TABLE `payout_payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `payout_request_uuid` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `mandate_number` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `payment_cm_key` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `payment_order_key` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `payment_status` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `payment_method` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime DEFAULT NULL,
  `invoice_number` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for payout_payment_history
-- ----------------------------
DROP TABLE IF EXISTS `payout_payment_history`;
CREATE TABLE `payout_payment_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `payout_payment_id` int DEFAULT NULL,
  `payment_status` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `reason` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `changed_date` datetime DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for payout_request
-- ----------------------------
DROP TABLE IF EXISTS `payout_request`;
CREATE TABLE `payout_request` (
  `id` int NOT NULL AUTO_INCREMENT,
  `payout_request_uuid` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `payout_status` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `reseller_uuid` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `reseller_company_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `reseller_iban` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `reseller_bank_account_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `request_amount` decimal(12,2) DEFAULT NULL,
  `current_payment` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `due_date` datetime DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime DEFAULT NULL,
  `paid_amount` decimal(12,2) DEFAULT NULL,
  `paid_date` datetime DEFAULT NULL,
  `invoice_number` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_urgent` bit(1) NOT NULL,
  `additional_fee_urgent_payout_percent` int NOT NULL DEFAULT '0',
  `urgent_fee` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `urgent_fee_include_vat` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_idx_invoice_number` (`invoice_number`)
) ENGINE=InnoDB AUTO_INCREMENT=686 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for potential_customer_question
-- ----------------------------
DROP TABLE IF EXISTS `potential_customer_question`;
CREATE TABLE `potential_customer_question` (
  `id` int NOT NULL AUTO_INCREMENT,
  `post_code` varchar(20) CHARACTER SET utf8mb3 DEFAULT NULL,
  `house_number` varchar(100) CHARACTER SET utf8mb3 DEFAULT NULL,
  `customer_full_name` varchar(100) CHARACTER SET utf8mb3 DEFAULT NULL,
  `customer_email` varchar(100) CHARACTER SET utf8mb3 DEFAULT NULL,
  `question` varchar(1000) CHARACTER SET utf8mb3 DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=231 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for priceplan
-- ----------------------------
DROP TABLE IF EXISTS `priceplan`;
CREATE TABLE `priceplan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `reseller_id` bigint DEFAULT NULL,
  `activated` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reseller_id` (`reseller_id`),
  CONSTRAINT `priceplan_ibfk_1` FOREIGN KEY (`reseller_id`) REFERENCES `reseller` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for priceplan_productprice
-- ----------------------------
DROP TABLE IF EXISTS `priceplan_productprice`;
CREATE TABLE `priceplan_productprice` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `priceplan_id` int NOT NULL,
  `product_id` int NOT NULL,
  `price` double(20,5) NOT NULL,
  `date_from` datetime DEFAULT NULL,
  `date_until` datetime DEFAULT NULL,
  `activated` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `productprice_list_id` (`priceplan_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `priceplan_productprice_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `priceplan_productprice_ibfk_2` FOREIGN KEY (`priceplan_id`) REFERENCES `priceplan` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_category_id` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT '',
  `description` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `source` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `calculation_type` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `activated` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_type_id` (`product_category_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`product_category_id`) REFERENCES `product_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for product_category
-- ----------------------------
DROP TABLE IF EXISTS `product_category`;
CREATE TABLE `product_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `activated` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for pv_price_change
-- ----------------------------
DROP TABLE IF EXISTS `pv_price_change`;
CREATE TABLE `pv_price_change` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_type` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  `contract_duration` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `migrated` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for quartile_percentage
-- ----------------------------
DROP TABLE IF EXISTS `quartile_percentage`;
CREATE TABLE `quartile_percentage` (
  `id` int NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `reseller_uuid` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `conservative_elk` longtext COLLATE utf8mb3_unicode_ci,
  `moderate_elk` longtext COLLATE utf8mb3_unicode_ci,
  `aggressive_elk` longtext COLLATE utf8mb3_unicode_ci,
  `conservative_gas` longtext CHARACTER SET utf8mb3,
  `moderate_gas` longtext CHARACTER SET utf8mb3,
  `aggressive_gas` longtext CHARACTER SET utf8mb3,
  `created_date` datetime NOT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for quota
-- ----------------------------
DROP TABLE IF EXISTS `quota`;
CREATE TABLE `quota` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usage_estimation` double DEFAULT NULL,
  `price_estimation` double DEFAULT NULL,
  `unit_id` int DEFAULT NULL,
  `date_from` datetime DEFAULT NULL,
  `date_to` datetime DEFAULT NULL,
  `reseller_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reseller_id` (`reseller_id`),
  KEY `unit_id` (`unit_id`),
  CONSTRAINT `quota_ibfk_1` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `quota_ibfk_2` FOREIGN KEY (`reseller_id`) REFERENCES `reseller` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for recalculate_mobile_cost_process
-- ----------------------------
DROP TABLE IF EXISTS `recalculate_mobile_cost_process`;
CREATE TABLE `recalculate_mobile_cost_process` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ean` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5474 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for reminder_customer_meter_reading
-- ----------------------------
DROP TABLE IF EXISTS `reminder_customer_meter_reading`;
CREATE TABLE `reminder_customer_meter_reading` (
  `id` int NOT NULL AUTO_INCREMENT,
  `is_meter_reading` bit(1) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL,
  `contract_number` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3795 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for reseller
-- ----------------------------
DROP TABLE IF EXISTS `reseller`;
CREATE TABLE `reseller` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `external_id` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `contact_phone` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contact_email` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contact_zipcode` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contact_house_number` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contact_house_number_extension` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT '',
  `contact_street` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contact_city` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `tax_number` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `template` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `logo_url` varchar(400) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `site_background` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `terms_conditions_url` varchar(400) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `bank_account` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `bank_account_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `exact_account` bit(1) DEFAULT NULL,
  `signed_request_api_key` varchar(45) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `btw` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `kvk_number` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `pdf_background_s3_link` varchar(200) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `logo_contract_url` varchar(400) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_selected_green_energy` bit(1) NOT NULL DEFAULT b'0',
  `sale_chart` bit(1) NOT NULL DEFAULT b'0',
  `reseller_logo_on_invoice` bit(1) NOT NULL DEFAULT b'0',
  `is_Selected_invoice` bit(1) NOT NULL DEFAULT b'0',
  `is_selected_signing` bit(1) NOT NULL DEFAULT b'0',
  `is_sync_invoice_data` bit(1) NOT NULL DEFAULT b'0',
  `is_sync_master_data` bit(1) NOT NULL DEFAULT b'0',
  `threshold` decimal(20,7) NOT NULL DEFAULT '0.0000000',
  `reseller_type` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'normal',
  `domain_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `general_term` varchar(200) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `privacy_term` varchar(200) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `favicon_url` varchar(400) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `kikker_email` bit(1) NOT NULL DEFAULT b'1',
  `reseller_payout` bit(1) NOT NULL DEFAULT b'1',
  `sync_p4_data` bit(1) NOT NULL DEFAULT b'0',
  `sync_adc_file` bit(1) NOT NULL DEFAULT b'0',
  `enable_collection_agency` bit(1) NOT NULL DEFAULT b'1',
  `split_top_up_fee` bit(1) NOT NULL DEFAULT b'0',
  `is_usage_based` bit(1) NOT NULL DEFAULT b'0',
  `payment_delivery_type` int NOT NULL DEFAULT '0',
  `order_flow` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `invoice_batch_email` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `in_activated` bit(1) NOT NULL DEFAULT b'0',
  `is_apply_eos` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `rs_id` (`id`),
  UNIQUE KEY `externalId_index` (`external_id`),
  KEY `idx_rs_external_id` (`external_id`)
) ENGINE=InnoDB AUTO_INCREMENT=501 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for reseller_base_site
-- ----------------------------
DROP TABLE IF EXISTS `reseller_base_site`;
CREATE TABLE `reseller_base_site` (
  `id` int NOT NULL AUTO_INCREMENT,
  `base_background` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `base_logo` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `base_terms_conditions` text COLLATE utf8mb3_unicode_ci,
  `activated` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for reseller_cost_increasing_email_log
-- ----------------------------
DROP TABLE IF EXISTS `reseller_cost_increasing_email_log`;
CREATE TABLE `reseller_cost_increasing_email_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contract_number` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `reason` text COLLATE utf8mb3_unicode_ci,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1674 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for reseller_earning
-- ----------------------------
DROP TABLE IF EXISTS `reseller_earning`;
CREATE TABLE `reseller_earning` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contract_number` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  `reseller_uuid` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `customer_key` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `customer_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `total_earning` decimal(12,2) DEFAULT NULL,
  `total_generated` decimal(12,2) DEFAULT NULL,
  `total_received` decimal(12,2) DEFAULT NULL,
  `total_remaining` decimal(12,2) DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime DEFAULT NULL,
  `total_pending` decimal(12,2) NOT NULL,
  `kikker_earning` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16392 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for reseller_earning_history
-- ----------------------------
DROP TABLE IF EXISTS `reseller_earning_history`;
CREATE TABLE `reseller_earning_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reseller_earning_id` int DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `amount` decimal(12,7) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `payment_id` int DEFAULT NULL,
  `payment_type` varchar(50) CHARACTER SET utf8mb3 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reseller_earning` (`reseller_earning_id`)
) ENGINE=InnoDB AUTO_INCREMENT=297430 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for reseller_product_pv_config
-- ----------------------------
DROP TABLE IF EXISTS `reseller_product_pv_config`;
CREATE TABLE `reseller_product_pv_config` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `reseller_uuid` varchar(64) COLLATE utf8mb3_unicode_ci NOT NULL,
  `reseller_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contract_duration` varchar(32) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `product_type` varchar(8) COLLATE utf8mb3_unicode_ci NOT NULL,
  `usage_type` varchar(8) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `pv_id` varchar(64) COLLATE utf8mb3_unicode_ci NOT NULL,
  `pv_name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_reseller_pv_config_lookup` (`reseller_uuid`,`contract_duration`,`product_type`)
) ENGINE=InnoDB AUTO_INCREMENT=4977 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for reseller_sender_email_info
-- ----------------------------
DROP TABLE IF EXISTS `reseller_sender_email_info`;
CREATE TABLE `reseller_sender_email_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reseller_uuid` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sender_email` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `display_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `bcc_email` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for reseller_signed_request
-- ----------------------------
DROP TABLE IF EXISTS `reseller_signed_request`;
CREATE TABLE `reseller_signed_request` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reseller_uuid` varchar(255) CHARACTER SET utf8mb3 NOT NULL,
  `url` varchar(2550) CHARACTER SET utf8mb3 NOT NULL,
  `redirect_url` varchar(2550) CHARACTER SET utf8mb3 NOT NULL,
  `api_key` varchar(255) CHARACTER SET utf8mb3 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for reseller_webhook_endpoint
-- ----------------------------
DROP TABLE IF EXISTS `reseller_webhook_endpoint`;
CREATE TABLE `reseller_webhook_endpoint` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reseller_uuid` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `type` varchar(50) CHARACTER SET utf8mb3 DEFAULT NULL,
  `endpoint` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `is_authorization` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for reseller_webhook_history
-- ----------------------------
DROP TABLE IF EXISTS `reseller_webhook_history`;
CREATE TABLE `reseller_webhook_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(50) CHARACTER SET utf8mb3 DEFAULT NULL,
  `endpoint` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `status_code` int NOT NULL,
  `request` longtext CHARACTER SET utf8mb3,
  `response` text CHARACTER SET utf8mb3,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=195049 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for samsam_connection
-- ----------------------------
DROP TABLE IF EXISTS `samsam_connection`;
CREATE TABLE `samsam_connection` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contract_number` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `contract_duration` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `payment_method` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `bank_account` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `bank_account_name` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `ean` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `product_type` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `usage_type` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `is_residence` bit(1) DEFAULT NULL,
  `is_apply_frdc` bit(1) DEFAULT NULL,
  `double_meter` bit(1) DEFAULT NULL,
  `monthly_amount` decimal(20,7) DEFAULT NULL,
  `monthly_amount_contract` decimal(20,7) DEFAULT NULL,
  `reseller_topup_fee` decimal(20,7) DEFAULT NULL,
  `reseller_delivery_cost` decimal(20,7) DEFAULT NULL,
  `kikker_topup_fee` decimal(20,7) DEFAULT NULL,
  `kikker_delivery_cost` decimal(20,7) DEFAULT NULL,
  `single_usage_estimation` double DEFAULT NULL,
  `normal_usage_estimation` double DEFAULT NULL,
  `dal_usage_estimation` double DEFAULT NULL,
  `return_delivery` double DEFAULT NULL,
  `kvk_number` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `single_tariff` decimal(20,7) DEFAULT NULL,
  `on_peak_tariff` decimal(20,7) DEFAULT NULL,
  `off_peak_tariff` decimal(20,7) DEFAULT NULL,
  `return_tariff` decimal(20,7) DEFAULT NULL,
  `pv_price_single` decimal(20,7) DEFAULT NULL,
  `pv_price_on_peak` decimal(20,7) DEFAULT NULL,
  `pv_price_off_peak` decimal(20,7) DEFAULT NULL,
  `first_name` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `last_name` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `gender` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `zipcode` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `house_number` int DEFAULT NULL,
  `house_number_extension` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `street` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `city` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `date_of_birth` date DEFAULT NULL,
  `contact_email` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `company_name` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `contact_phone` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `contact_office_phone` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `contact_name` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `financial_correspondence_email` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `signed_via_mandate` bit(1) DEFAULT NULL,
  `mutation_date` date DEFAULT NULL,
  `is_user_migrated` tinyint(1) NOT NULL DEFAULT '0',
  `is_migrated` tinyint(1) NOT NULL DEFAULT '0',
  `is_run_estimation` tinyint(1) NOT NULL DEFAULT '0',
  `is_pdf_generated` tinyint(1) NOT NULL DEFAULT '0',
  `pv_price_id` int DEFAULT NULL,
  `error_reason` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=692 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for send_mail_history
-- ----------------------------
DROP TABLE IF EXISTS `send_mail_history`;
CREATE TABLE `send_mail_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content_mail` text CHARACTER SET utf8mb3,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `email_from` text CHARACTER SET utf8mb3,
  `email_to` text CHARACTER SET utf8mb3,
  `mail_name` text CHARACTER SET utf8mb3,
  `status_code` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28799 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for sending_meter_reading_email_to_customer
-- ----------------------------
DROP TABLE IF EXISTS `sending_meter_reading_email_to_customer`;
CREATE TABLE `sending_meter_reading_email_to_customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contract_number` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `send_mail_date` datetime DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1883 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for sending_meter_reading_to_edsn
-- ----------------------------
DROP TABLE IF EXISTS `sending_meter_reading_to_edsn`;
CREATE TABLE `sending_meter_reading_to_edsn` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_uuid` varchar(50) CHARACTER SET utf8mb3 DEFAULT NULL,
  `reseller_uuid` varchar(50) CHARACTER SET utf8mb3 DEFAULT NULL,
  `contract_number` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `order_number` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ean` varchar(50) CHARACTER SET utf8mb3 DEFAULT NULL,
  `is_sent` bit(1) DEFAULT NULL,
  `request` text CHARACTER SET utf8mb3,
  `response` text CHARACTER SET utf8mb3,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `reading_date` datetime DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `stop_send_edsn` bit(1) DEFAULT b'0',
  `is_next_periodic` bit(1) NOT NULL DEFAULT b'1',
  `send_type` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_triggered` bit(1) DEFAULT b'0',
  `data_source` varchar(50) CHARACTER SET utf8mb3 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91203 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for sms_sent
-- ----------------------------
DROP TABLE IF EXISTS `sms_sent`;
CREATE TABLE `sms_sent` (
  `id` int NOT NULL AUTO_INCREMENT,
  `phone_number_from` varchar(20) CHARACTER SET utf8mb3 DEFAULT NULL,
  `phone_number_to` varchar(20) CHARACTER SET utf8mb3 DEFAULT NULL,
  `message` longtext CHARACTER SET utf8mb3,
  `response` longtext CHARACTER SET utf8mb3,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4062 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `activated` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for tax_cost_ean
-- ----------------------------
DROP TABLE IF EXISTS `tax_cost_ean`;
CREATE TABLE `tax_cost_ean` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contract_number` varchar(20) CHARACTER SET utf8mb3 DEFAULT NULL,
  `ean` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `period_from` datetime NOT NULL,
  `period_until` datetime NOT NULL,
  `month` int NOT NULL,
  `year` int NOT NULL,
  `bracket` int NOT NULL,
  `volume` decimal(20,7) NOT NULL,
  `tariff` decimal(12,7) NOT NULL,
  `amount` decimal(12,7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tax_cost_ean_contract_number_period_from_period_until` (`contract_number`,`period_from`,`period_until`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for ticket_history
-- ----------------------------
DROP TABLE IF EXISTS `ticket_history`;
CREATE TABLE `ticket_history` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ticket_id` int NOT NULL,
  `ticket_number` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  `title` varchar(200) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `content` varchar(5000) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `topic` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `company` varchar(150) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `assignee_id` int DEFAULT NULL,
  `assignee_name` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `owner` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `priority` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `telephone` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contract_type` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_by` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `change_time` datetime DEFAULT NULL,
  `change_by` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=405 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for tmr_meter_reading
-- ----------------------------
DROP TABLE IF EXISTS `tmr_meter_reading`;
CREATE TABLE `tmr_meter_reading` (
  `id` int NOT NULL AUTO_INCREMENT,
  `request` longtext CHARACTER SET utf8mb3,
  `response` longtext CHARACTER SET utf8mb3,
  `ean` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `energy_meter_id` varchar(50) CHARACTER SET utf8mb3 DEFAULT NULL,
  `latest_reading_date` datetime DEFAULT NULL,
  `on_peak_latest_reading_number` int DEFAULT NULL,
  `off_peak_latest_reading_number` int DEFAULT NULL,
  `return_on_peak_latest_reading_number` int DEFAULT NULL,
  `return_off_peak_latest_reading_number` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ean_index` (`ean`)
) ENGINE=InnoDB AUTO_INCREMENT=60636 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for unit
-- ----------------------------
DROP TABLE IF EXISTS `unit`;
CREATE TABLE `unit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `external_id` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `reseller_id` bigint DEFAULT NULL,
  `customer_id` bigint DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contact_phone` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contact_email` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contact_zipcode` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contact_house_number` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contact_house_number_extension` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT '',
  `contact_street` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contact_city` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `gender` bit(1) NOT NULL,
  `profile_image` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `activated` bit(1) NOT NULL,
  `user_type` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `forget_password` bit(1) NOT NULL,
  `pincode` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contact_office_phone` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `mail_sent` varchar(1000) COLLATE utf8mb3_unicode_ci DEFAULT '',
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `customer_id` (`customer_id`) USING BTREE,
  UNIQUE KEY `UC_contact_email` (`contact_email`,`reseller_id`,`user_type`) USING BTREE,
  KEY `reseller_id` (`reseller_id`) USING BTREE,
  KEY `user_contact_email` (`contact_email`) USING BTREE,
  KEY `user_type` (`user_type`) USING BTREE,
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`reseller_id`) REFERENCES `reseller` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=36025 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for vko_energy_saving_repository
-- ----------------------------
DROP TABLE IF EXISTS `vko_energy_saving_repository`;
CREATE TABLE `vko_energy_saving_repository` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lang_key` varchar(2) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `month_name` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  `elk_contract_subject` longtext COLLATE utf8mb3_unicode_ci,
  `elk_contract_body` longtext COLLATE utf8mb3_unicode_ci,
  `gas_contract_subject` longtext COLLATE utf8mb3_unicode_ci,
  `gas_contract_body` longtext COLLATE utf8mb3_unicode_ci,
  `elk_gas_contract_subject` longtext COLLATE utf8mb3_unicode_ci,
  `elk_gas_contract_body` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for vko_mobile
-- ----------------------------
DROP TABLE IF EXISTS `vko_mobile`;
CREATE TABLE `vko_mobile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mobile_notification_id` int NOT NULL,
  `data` text COLLATE utf8mb3_unicode_ci,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `contract_number` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `target_month` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95577 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for volti_connection_raw
-- ----------------------------
DROP TABLE IF EXISTS `volti_connection_raw`;
CREATE TABLE `volti_connection_raw` (
  `contract_number` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contract_duration` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `payment_method` varchar(64) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `bank_account` varchar(127) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `bank_account_name` varchar(127) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `ean` varchar(127) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `product_type` varchar(64) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `usage_type` varchar(64) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_residence` bit(1) DEFAULT NULL,
  `double_meter` bit(1) DEFAULT NULL,
  `grid_operator` varchar(127) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `monthly_amount` decimal(20,7) DEFAULT NULL,
  `monthly_amount_contract` decimal(20,7) DEFAULT NULL,
  `reseller_topup_fee` decimal(20,7) DEFAULT NULL,
  `reseller_topup_fee_single` decimal(20,7) DEFAULT NULL,
  `reseller_topup_fee_onpeak` decimal(20,7) DEFAULT NULL,
  `reseller_topup_fee_offpeak` decimal(20,7) DEFAULT NULL,
  `reseller_delivery_cost` decimal(20,7) DEFAULT NULL,
  `kikker_topup_fee` decimal(20,7) DEFAULT NULL,
  `kikker_delivery_cost` decimal(20,7) DEFAULT NULL,
  `single_usage_estimation` double DEFAULT NULL,
  `normal_usage_estimation` double DEFAULT NULL,
  `dal_usage_estimation` double DEFAULT NULL,
  `return_delivery` double DEFAULT NULL,
  `kvk_number` varchar(127) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `single_tariff` decimal(20,7) DEFAULT NULL,
  `on_peak_tariff` decimal(20,7) DEFAULT NULL,
  `off_peak_tariff` decimal(20,7) DEFAULT NULL,
  `return_tariff` decimal(20,7) DEFAULT NULL,
  `kikker_return_tariff` decimal(20,7) DEFAULT NULL,
  `difference_return_tariff` decimal(20,7) DEFAULT NULL,
  `pv_price_single` decimal(20,7) DEFAULT NULL,
  `pv_price_on_peak` decimal(20,7) DEFAULT NULL,
  `pv_price_off_peak` decimal(20,7) DEFAULT NULL,
  `profile_category` varchar(127) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `gender` varchar(1) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `zipcode` varchar(64) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `house_number` int DEFAULT NULL,
  `house_number_extension` varchar(64) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `street` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `date_of_birth` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contact_email` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contact_phone` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contact_office_phone` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contact_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `financial_correspondence_email` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `order_reference` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `signed_via_mandate` bit(1) DEFAULT NULL,
  `volti_customer_number` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `volti_location` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `volti_login_email` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for volti_connection_user
-- ----------------------------
DROP TABLE IF EXISTS `volti_connection_user`;
CREATE TABLE `volti_connection_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `authorization` text COLLATE utf8mb3_unicode_ci,
  `error_reason` text COLLATE utf8mb3_unicode_ci,
  `is_error` tinyint(1) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `user` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=510 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for volti_connection_v2
-- ----------------------------
DROP TABLE IF EXISTS `volti_connection_v2`;
CREATE TABLE `volti_connection_v2` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contract_number` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contract_uuid` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contract_duration` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `payment_method` varchar(64) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `bank_account` varchar(127) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `bank_account_name` varchar(127) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `ean` varchar(127) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `product_type` varchar(64) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `usage_type` varchar(64) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_residence` bit(1) NOT NULL,
  `double_meter` bit(1) NOT NULL,
  `grid_operator` varchar(127) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `monthly_amount` decimal(20,7) DEFAULT NULL,
  `monthly_amount_contract` decimal(20,7) DEFAULT NULL,
  `reseller_topup_fee` decimal(20,7) DEFAULT NULL,
  `reseller_topup_fee_single` decimal(20,7) DEFAULT NULL,
  `reseller_topup_fee_onpeak` decimal(20,7) DEFAULT NULL,
  `reseller_topup_fee_offpeak` decimal(20,7) DEFAULT NULL,
  `reseller_delivery_cost` decimal(20,7) DEFAULT NULL,
  `kikker_topup_fee` decimal(20,7) DEFAULT NULL,
  `kikker_delivery_cost` decimal(20,7) DEFAULT NULL,
  `single_usage_estimation` double DEFAULT NULL,
  `normal_usage_estimation` double DEFAULT NULL,
  `dal_usage_estimation` double DEFAULT NULL,
  `return_delivery` double DEFAULT NULL,
  `kvk_number` varchar(127) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `single_tariff` decimal(20,7) DEFAULT NULL,
  `on_peak_tariff` decimal(20,7) DEFAULT NULL,
  `off_peak_tariff` decimal(20,7) DEFAULT NULL,
  `return_tariff` decimal(20,7) DEFAULT NULL,
  `kikker_return_tariff` decimal(20,7) DEFAULT NULL,
  `difference_return_tariff` decimal(20,7) DEFAULT NULL,
  `pv_price_single` decimal(20,7) DEFAULT NULL,
  `pv_price_on_peak` decimal(20,7) DEFAULT NULL,
  `pv_price_off_peak` decimal(20,7) DEFAULT NULL,
  `profile_category` varchar(127) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `gender` varchar(1) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `zipcode` varchar(64) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `house_number` int NOT NULL,
  `house_number_extension` varchar(64) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `street` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `contact_email` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contact_phone` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contact_office_phone` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contact_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `financial_correspondence_email` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `order_reference` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `signed_via_mandate` bit(1) DEFAULT NULL,
  `volti_customer_number` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `volti_location` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `volti_login_email` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `pv_price_id` int DEFAULT NULL,
  `error_reason` text COLLATE utf8mb3_unicode_ci,
  `created_date` datetime NOT NULL,
  `updated_date` datetime DEFAULT NULL,
  `is_user_migrated` tinyint(1) NOT NULL,
  `is_migrated` tinyint(1) NOT NULL,
  `mutation_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_contract_number_volti_connection` (`contract_number`),
  KEY `idx_ean_volti_connection` (`ean`)
) ENGINE=InnoDB AUTO_INCREMENT=42491 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for volti_contract_losing
-- ----------------------------
DROP TABLE IF EXISTS `volti_contract_losing`;
CREATE TABLE `volti_contract_losing` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contract_number` varchar(64) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `rs_fdc_gas` decimal(20,7) NOT NULL DEFAULT '0.0000000',
  `PV_tariff_return` decimal(20,7) NOT NULL DEFAULT '0.0000000',
  `rs_fdc_elk` decimal(20,7) NOT NULL DEFAULT '0.0000000',
  `PV_tariff_gas` decimal(20,7) NOT NULL DEFAULT '0.0000000',
  `rs_tu_gas` decimal(20,7) NOT NULL DEFAULT '0.0000000',
  `PV_tariff_elk_single` decimal(20,7) NOT NULL DEFAULT '0.0000000',
  `rs_tu_elk` decimal(20,7) NOT NULL DEFAULT '0.0000000',
  `new_ma` decimal(20,7) DEFAULT NULL,
  `is_sent_mail` bit(1) DEFAULT NULL,
  `is_generated_pdf` bit(1) DEFAULT NULL,
  `is_accepted_on_gui` bit(1) DEFAULT NULL,
  `acceptance_date` datetime(6) DEFAULT NULL,
  `estimate_uuid` varchar(64) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `message_id` int DEFAULT NULL,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) DEFAULT NULL,
  `ke_fdc_elk` decimal(20,7) NOT NULL DEFAULT '0.0000000',
  `ke_fdc_gas` decimal(20,7) NOT NULL DEFAULT '0.0000000',
  `ke_tu_elk` decimal(20,7) NOT NULL DEFAULT '0.0000000',
  `ke_tu_gas` decimal(20,7) NOT NULL DEFAULT '0.0000000',
  `PV_tariff_elk_off_peak` decimal(20,7) NOT NULL DEFAULT '0.0000000',
  `PV_tariff_elk_on_peak` decimal(20,7) NOT NULL DEFAULT '0.0000000',
  `contract_status_id` int NOT NULL DEFAULT '0',
  `is_collected_pdf` bit(1) DEFAULT NULL,
  `change_contract_duration_status` int DEFAULT NULL,
  `reseller_earning` decimal(20,7) DEFAULT NULL,
  `reseller_earning_each_ean` json DEFAULT NULL,
  `estimate_uuid_type_v` varchar(64) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_migration_kikker_earning` bit(1) DEFAULT NULL,
  `is-revert-contract` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_ContractNumber` (`contract_number`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for volti_contract_losing_backup
-- ----------------------------
DROP TABLE IF EXISTS `volti_contract_losing_backup`;
CREATE TABLE `volti_contract_losing_backup` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contract_number` varchar(64) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `rs_fdc_gas` decimal(20,7) NOT NULL DEFAULT '0.0000000',
  `PV_tariff_return` decimal(20,7) NOT NULL DEFAULT '0.0000000',
  `rs_fdc_elk` decimal(20,7) NOT NULL DEFAULT '0.0000000',
  `PV_tariff_gas` decimal(20,7) NOT NULL DEFAULT '0.0000000',
  `rs_tu_gas` decimal(20,7) NOT NULL DEFAULT '0.0000000',
  `PV_tariff_elk_single` decimal(20,7) NOT NULL DEFAULT '0.0000000',
  `rs_tu_elk` decimal(20,7) NOT NULL DEFAULT '0.0000000',
  `new_ma` decimal(20,7) DEFAULT NULL,
  `is_sent_mail` bit(1) DEFAULT NULL,
  `is_generated_pdf` bit(1) DEFAULT NULL,
  `is_accepted_on_gui` bit(1) DEFAULT NULL,
  `acceptance_date` datetime(6) DEFAULT NULL,
  `estimate_uuid` varchar(64) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `message_id` int DEFAULT NULL,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) DEFAULT NULL,
  `ke_fdc_elk` decimal(20,7) NOT NULL DEFAULT '0.0000000',
  `ke_fdc_gas` decimal(20,7) NOT NULL DEFAULT '0.0000000',
  `ke_tu_elk` decimal(20,7) NOT NULL DEFAULT '0.0000000',
  `ke_tu_gas` decimal(20,7) NOT NULL DEFAULT '0.0000000',
  `PV_tariff_elk_off_peak` decimal(20,7) NOT NULL DEFAULT '0.0000000',
  `PV_tariff_elk_on_peak` decimal(20,7) NOT NULL DEFAULT '0.0000000',
  `contract_status_id` int NOT NULL DEFAULT '0',
  `is_collected_pdf` bit(1) DEFAULT NULL,
  `change_contract_duration_status` int DEFAULT NULL,
  `reseller_earning` decimal(20,7) DEFAULT NULL,
  `reseller_earning_each_ean` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_ContractNumber` (`contract_number`)
) ENGINE=InnoDB AUTO_INCREMENT=14841 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for volti_contract_losing_raw
-- ----------------------------
DROP TABLE IF EXISTS `volti_contract_losing_raw`;
CREATE TABLE `volti_contract_losing_raw` (
  `contract_number` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `PV_tariff_elk_on_peak` decimal(20,7) NOT NULL,
  `PV_tariff_elk_off_peak` decimal(20,7) NOT NULL,
  `PV_tariff_elk_single` decimal(20,7) NOT NULL,
  `PV_tariff_gas` decimal(20,7) NOT NULL,
  `PV_tariff_return` decimal(20,7) NOT NULL,
  `ke_tu_elk` decimal(20,7) NOT NULL,
  `ke_tu_gas` decimal(20,7) NOT NULL,
  `ke_fdc_elk` decimal(20,7) NOT NULL,
  `ke_fdc_gas` decimal(20,7) NOT NULL,
  `rs_tu_elk` decimal(20,7) NOT NULL,
  `rs_tu_gas` decimal(20,7) NOT NULL,
  `rs_fdc_elk` decimal(20,7) NOT NULL,
  `rs_fdc_gas` decimal(20,7) NOT NULL,
  KEY `IX_ContractNumber` (`contract_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for volti_contract_remaining
-- ----------------------------
DROP TABLE IF EXISTS `volti_contract_remaining`;
CREATE TABLE `volti_contract_remaining` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contract_number` varchar(64) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `rs_fdc_gas` decimal(20,7) NOT NULL COMMENT 'kk_order.reseller_delivery_cost',
  `PV_tariff_return` decimal(20,7) NOT NULL COMMENT 'kk_order.return_tariff',
  `rs_fdc_elk` decimal(20,7) NOT NULL COMMENT 'kk_order.reseller_delivery_cost',
  `PV_tariff_gas` decimal(20,7) DEFAULT NULL COMMENT 'No Need',
  `rs_tu_gas` decimal(20,7) NOT NULL COMMENT 'kk_order.reseller_topup_fee',
  `PV_tariff_elk_single` decimal(20,7) DEFAULT NULL COMMENT 'No Need',
  `rs_tu_elk` decimal(20,7) NOT NULL COMMENT 'kk_order.reseller_topup_fee',
  `new_ma` decimal(20,7) DEFAULT NULL COMMENT 'kk_contract.monthly_amount',
  `is_sent_mail` bit(1) DEFAULT NULL,
  `is_generated_pdf` bit(1) DEFAULT NULL,
  `is_accepted_on_gui` bit(1) DEFAULT NULL,
  `acceptance_date` datetime(6) DEFAULT NULL,
  `estimate_uuid` varchar(64) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `message_id` int DEFAULT NULL,
  `created_date` datetime(6) NOT NULL COMMENT 'Date when the record was created',
  `updated_date` datetime(6) DEFAULT NULL COMMENT 'Date when the record was last updated',
  `ke_fdc_elk` decimal(20,7) NOT NULL COMMENT 'kk_order.kikker_delivery_cost',
  `ke_fdc_gas` decimal(20,7) NOT NULL COMMENT 'kk_order.kikker_delivery_cost',
  `ke_tu_elk` decimal(20,7) NOT NULL COMMENT 'kk_order.kikker_topup_fee',
  `ke_tu_gas` decimal(20,7) NOT NULL COMMENT 'kk_order.kikker_topup_fee',
  `PV_tariff_elk_off_peak` decimal(20,7) DEFAULT NULL COMMENT 'No Need',
  `PV_tariff_elk_on_peak` decimal(20,7) DEFAULT NULL COMMENT 'No Need',
  `contract_status_id` int NOT NULL COMMENT 'kk_contract.contract_status_id',
  `is_collected_pdf` bit(1) DEFAULT NULL,
  `change_contract_duration_status` int DEFAULT NULL,
  `reseller_earning` decimal(20,7) DEFAULT NULL,
  `estimate_uuid_type_v` varchar(64) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_migration_kikker_earning` bit(1) DEFAULT NULL,
  `contract_duration` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ean` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_ContractNumber` (`contract_number`)
) ENGINE=InnoDB AUTO_INCREMENT=10847 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci COMMENT='Table for storing remaining details of contracts';

-- ----------------------------
-- Table structure for volti_contracts_ma_change
-- ----------------------------
DROP TABLE IF EXISTS `volti_contracts_ma_change`;
CREATE TABLE `volti_contracts_ma_change` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` datetime NOT NULL,
  `created_by` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `contract_number` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `contract_duration` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `monthly_amount` decimal(65,30) NOT NULL,
  `new_monthly_amount` decimal(65,30) NOT NULL,
  `zipcode` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `street` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `city` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `house_number` int NOT NULL,
  `house_number_extension` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `contact_email` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `first_name` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `last_name` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `gender` int NOT NULL,
  `gender_label` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `processing_status` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `run_number` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_contract_number` (`contract_number`)
) ENGINE=InnoDB AUTO_INCREMENT=1644 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for volti_order_losing
-- ----------------------------
DROP TABLE IF EXISTS `volti_order_losing`;
CREATE TABLE `volti_order_losing` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contract_id` int DEFAULT NULL,
  `contract_number` char(64) COLLATE utf8mb3_unicode_ci NOT NULL,
  `contract_status_id` int DEFAULT NULL,
  `ean` char(64) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `order_status_id` int DEFAULT NULL,
  `product_type` char(5) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `usage_type` char(16) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_accepted_on_gui` bit(1) DEFAULT NULL,
  `kikker_topup_fee` decimal(20,7) DEFAULT NULL,
  `reseller_topup_fee` decimal(20,7) DEFAULT NULL,
  `kikker_delivery_cost` decimal(20,7) DEFAULT NULL,
  `reseller_delivery_cost` decimal(20,7) DEFAULT NULL,
  `monthly_amount` decimal(20,7) DEFAULT NULL,
  `rs_earning` decimal(20,7) DEFAULT NULL,
  `rs_earning_json` json DEFAULT NULL,
  `rs_earning_json_filtered` json DEFAULT NULL,
  `pv_price_id` int DEFAULT NULL,
  `single_price` decimal(20,7) DEFAULT NULL,
  `normal_price` decimal(20,7) DEFAULT NULL,
  `off_peak_price` decimal(20,7) DEFAULT NULL,
  `return_tariff` decimal(20,7) DEFAULT NULL,
  `new_ma` decimal(20,7) DEFAULT NULL,
  `new_ma_json` json DEFAULT NULL,
  `new_ma_filtered` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ean` (`ean`),
  KEY `idx_contract_number` (`contract_number`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for wrong_invoice_customer
-- ----------------------------
DROP TABLE IF EXISTS `wrong_invoice_customer`;
CREATE TABLE `wrong_invoice_customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `wrong_invoice_number` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `invoice_number` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `different_amount` decimal(65,30) NOT NULL,
  `invoice_amount` decimal(65,30) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `pdf_link` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `wrong_invoice_amount` decimal(65,30) NOT NULL DEFAULT '0.000000000000000000000000000000',
  `wrong_invoice_status` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `wrong_pdf_link` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `wrong_tariff_types` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `new_invoice_payment_amount` decimal(65,30) NOT NULL DEFAULT '0.000000000000000000000000000000',
  `wrong_invoice_payment_amount` decimal(65,30) NOT NULL DEFAULT '0.000000000000000000000000000000',
  `mail_data` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for yearly_pdf
-- ----------------------------
DROP TABLE IF EXISTS `yearly_pdf`;
CREATE TABLE `yearly_pdf` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reseller_id` bigint NOT NULL,
  `customer_id` bigint NOT NULL,
  `contract_number` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `year` int DEFAULT NULL,
  `create_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_yearly_pdf_customer` (`customer_id`),
  KEY `fk_yearly_pdf_reseller` (`reseller_id`),
  CONSTRAINT `fk_yearly_pdf_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_yearly_pdf_reseller` FOREIGN KEY (`reseller_id`) REFERENCES `reseller` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Table structure for zone_usage
-- ----------------------------
DROP TABLE IF EXISTS `zone_usage`;
CREATE TABLE `zone_usage` (
  `id` int NOT NULL AUTO_INCREMENT,
  `from` int DEFAULT NULL,
  `to` int DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `zone_usage_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
