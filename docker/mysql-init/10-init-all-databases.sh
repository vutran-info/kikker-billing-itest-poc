#!/bin/sh
set -eu

TESTCASE_001_DIR="test-data/testcase-001"

mysql_exec() {
  mysql -uroot -p"${MYSQL_ROOT_PASSWORD}" "$@"
}

db_has_table() {
  db_name="$1"
  table_name="$2"
  result=$(mysql_exec -Nse "SELECT 1 FROM information_schema.tables WHERE table_schema='${db_name}' AND table_name='${table_name}' LIMIT 1" || true)
  [ "$result" = "1" ]
}

table_has_rows() {
  db_name="$1"
  table_name="$2"
  result=$(mysql_exec -Nse "SELECT 1 FROM \`${db_name}\`.\`${table_name}\` LIMIT 1" || true)
  [ "$result" = "1" ]
}

ensure_db() {
  db_name="$1"
  mysql_exec -e "CREATE DATABASE IF NOT EXISTS \`${db_name}\`; GRANT ALL PRIVILEGES ON \`${db_name}\`.* TO '${MYSQL_USER}'@'%';"
}

import_schema_if_missing() {
  db_name="$1"
  sentinel_table="$2"
  sql_file="$3"

  if db_has_table "$db_name" "$sentinel_table"; then
    echo "[mysql-init] Skip schema ${db_name} (table ${sentinel_table} already exists)"
    return
  fi

  echo "[mysql-init] Import schema ${db_name} from ${sql_file}"
  mysql_exec --database="$db_name" < "/docker-entrypoint-initdb.d/${sql_file}"
}

import_history_if_empty() {
  db_name="$1"
  history_table="$2"
  sql_file="$3"

  if table_has_rows "$db_name" "$history_table"; then
    echo "[mysql-init] Skip history ${db_name}.${history_table} (already has rows)"
    return
  fi

  echo "[mysql-init] Import history ${db_name}.${history_table} from ${sql_file}"
  mysql_exec --database="$db_name" < "/docker-entrypoint-initdb.d/${sql_file}"
}

import_data_file() {
  db_name="$1"
  sql_file="$2"

  echo "[mysql-init] Import data ${db_name} from ${sql_file}"
  mysql_exec --database="$db_name" < "/docker-entrypoint-initdb.d/${sql_file}"
}

import_data_file_ignore_fk() {
  db_name="$1"
  sql_file="$2"

  echo "[mysql-init] Import data ${db_name} from ${sql_file} (FOREIGN_KEY_CHECKS=0)"
  mysql_exec --database="$db_name" <<SQL
SET FOREIGN_KEY_CHECKS=0;
SOURCE /docker-entrypoint-initdb.d/${sql_file};
SET FOREIGN_KEY_CHECKS=1;
SQL
}

import_data_if_table_empty() {
  db_name="$1"
  table_name="$2"
  sql_file="$3"

  if table_has_rows "$db_name" "$table_name"; then
    echo "[mysql-init] Skip data ${db_name}.${table_name} (already has rows)"
    return
  fi

  import_data_file_ignore_fk "$db_name" "$sql_file"
}

testcase_001_file() {
  printf '%s/%s' "$TESTCASE_001_DIR" "$1"
}

ensure_hourly_testcase_data_once() {
  ean_info_count=$(mysql_exec -Nse "SELECT COUNT(*) FROM \`kikker_hourly\`.\`ean_info\` WHERE \`ean\` IN ('871692493900164636','871692493900374813')" || true)
  tariff_count_164636=$(mysql_exec -Nse "SELECT COUNT(*) FROM \`kikker_hourly\`.\`hourly_product_tariff\` WHERE \`ean\`='871692493900164636'" || true)
  tariff_count_374813=$(mysql_exec -Nse "SELECT COUNT(*) FROM \`kikker_hourly\`.\`hourly_product_tariff\` WHERE \`ean\`='871692493900374813'" || true)

  if [ "${ean_info_count:-0}" -ge 2 ] \
    && [ "${tariff_count_164636:-0}" -gt 0 ] \
    && [ "${tariff_count_374813:-0}" -gt 0 ]; then
    echo "[mysql-init] Skip hourly testcase seed (already loaded)"
    return
  fi

  echo "[mysql-init] Import hourly testcase seed (one-time)"
  import_data_file_ignore_fk "kikker_hourly" "$(testcase_001_file "ean_info_ean_871692493900164636.sql")"
  import_data_file_ignore_fk "kikker_hourly" "$(testcase_001_file "ean_info_ean_871692493900374813.sql")"
  import_data_file_ignore_fk "kikker_hourly" "$(testcase_001_file "hourly_product_tariff_ean_871692493900164636.sql")"
  import_data_file_ignore_fk "kikker_hourly" "$(testcase_001_file "hourly_product_tariff_ean_871692493900374813.sql")"
}

refresh_edsn_testcase_data() {
  echo "[mysql-init] Refresh EDSN testcase seed for EANs 871692493900164636, 871692493900374813"
  mysql_exec --database="EDSNScaled" <<'SQL'
CREATE TEMPORARY TABLE tmp_edsn_request_ids (`id` INT PRIMARY KEY);

INSERT IGNORE INTO tmp_edsn_request_ids (`id`)
SELECT DISTINCT `EDSNRequestId`
FROM `MasterDataUpdates`
WHERE `EAN` IN ('871692493900164636', '871692493900374813');

DELETE FROM `MasterDataUpdates`
WHERE `EAN` IN ('871692493900164636', '871692493900374813');

DELETE r
FROM `EDSNRequests` r
JOIN tmp_edsn_request_ids t ON t.id = r.`Id`;

DROP TEMPORARY TABLE tmp_edsn_request_ids;
SQL

  import_data_file_ignore_fk "EDSNScaled" "$(testcase_001_file "EDSNRequests_Ean_871692493900164636.sql")"
  import_data_file_ignore_fk "EDSNScaled" "$(testcase_001_file "EDSNRequests_Ean_871692493900374813.sql")"
  import_data_file_ignore_fk "EDSNScaled" "$(testcase_001_file "MasterDataUpdates_Ean_871692493900164636.sql")"
  import_data_file_ignore_fk "EDSNScaled" "$(testcase_001_file "MasterDataUpdates_Ean_871692493900374813.sql")"
}

refresh_ke_billing_grid_operator_testcase_data() {
  echo "[mysql-init] Refresh ke-billing grid operator testcase data"
  mysql_exec --database="ke-billing" <<'SQL'
SET FOREIGN_KEY_CHECKS=0;

DELETE s
FROM `grid_sub_operators` s
JOIN `grid_operators` g ON g.`id` = s.`grid_operator_id`
WHERE g.`ean` = '8712423014022';

DELETE FROM `grid_operators`
WHERE `ean` = '8712423014022';

SET FOREIGN_KEY_CHECKS=1;
SQL

  import_data_file_ignore_fk "ke-billing" "$(testcase_001_file "grid_operators.sql")"
  import_data_file_ignore_fk "ke-billing" "$(testcase_001_file "grid_sub_operators.sql")"
}

refresh_ke_billing_pvs_testcase_data() {
  echo "[mysql-init] Refresh ke-billing pvs testcase seed for known BRP EANs"
  mysql_exec --database="ke-billing" <<'SQL'
DELETE FROM `pvs`
WHERE `ean` IN ('5488888000025', '8712423028388', '8712423015821', '8714252005776');
SQL

  import_data_file_ignore_fk "ke-billing" "$(testcase_001_file "pvs_ean_5488888000025.sql")"
  import_data_file_ignore_fk "ke-billing" "$(testcase_001_file "pvs_ean_8712423028388.sql")"
  import_data_file_ignore_fk "ke-billing" "$(testcase_001_file "pvs_ean_8712423015821.sql")"
  import_data_file_ignore_fk "ke-billing" "$(testcase_001_file "pvs_ean_8714252005776.sql")"
}

refresh_p4_tmr_mock_data_testcase_data() {
  echo "[mysql-init] Refresh P4 tmr_mock_data testcase seed for EANs 871692493900164636, 871692493900374813"
  mysql_exec --database="kikker_p4_ean_usage" <<'SQL'
DELETE FROM `tmr_mock_data`
WHERE `ean_id` IN ('871692493900164636', '871692493900374813');
SQL

  import_data_file_ignore_fk "kikker_p4_ean_usage" "$(testcase_001_file "tmr_mock_data.sql")"
}

pricing_seed_loaded() {
  table_has_rows "pricing" "PV_price" \
    && table_has_rows "pricing" "kikker_topup_fee" \
    && table_has_rows "pricing" "reseller_topup_fee" \
    && table_has_rows "pricing" "reseller_fixed_delivery_cost"
}

ke_pdf_static_seed_loaded() {
  table_has_rows "ke-pdf" "templates" \
    && table_has_rows "ke-pdf" "templates_reseller" \
    && table_has_rows "ke-pdf" "headers"
}

ke_billing_static_seed_loaded() {
  table_has_rows "ke-billing" "billing_addresses" \
    && table_has_rows "ke-billing" "reseller"
}

ensure_db "kikker_p4_ean_usage"
ensure_db "kikkercore"
ensure_db "pricing"
ensure_db "EDSNScaled"
ensure_db "kikker_hourly"
ensure_db "ke-auto-billing"
ensure_db "ke-billing"
ensure_db "ke-pdf"
ensure_db "fractions2"
ensure_db "fractions3"

import_schema_if_missing "kikker_p4_ean_usage" "ean" "kikker_p4_ean_usage.sql"
import_schema_if_missing "kikkercore" "kk_contract" "kikkercore.sql"
import_schema_if_missing "pricing" "PV_price" "pricing.sql"
import_schema_if_missing "EDSNScaled" "EDSNRequests" "EDSNScaled.sql"
import_schema_if_missing "kikker_hourly" "hourly_product_elk_price" "kikker_hourly_schema.sql"
import_schema_if_missing "ke-auto-billing" "billing_tasks" "ke-auto-billing.sql"
import_schema_if_missing "ke-billing" "calculations" "ke-billing.sql"
import_schema_if_missing "ke-pdf" "templates" "ke-pdf.sql"
import_schema_if_missing "fractions2" "elkfraction" "fractions2.sql"
import_schema_if_missing "fractions3" "dynamic" "fractions3.sql"

import_history_if_empty "kikker_p4_ean_usage" "flyway_schema_history" "flyway_schema_history.sql"
import_history_if_empty "kikker_p4_ean_usage" "settings" "p4_settings.sql"
import_history_if_empty "kikkercore" "__EFMigrationsHistory" "__EFMigrationsHistory.sql"
import_history_if_empty "pricing" "__EFMigrationsHistory" "__EFMigrationsHistory_Pricing.sql"
import_history_if_empty "EDSNScaled" "__EFMigrationsHistory" "__EFMigrationsHistory_edsn-poc.sql"
import_history_if_empty "kikker_hourly" "changelog" "changelog.sql"
import_history_if_empty "ke-auto-billing" "__EFMigrationsHistory" "__EFMigrationsHistory_auto-billing.sql"
import_history_if_empty "ke-billing" "__EFMigrationsHistory" "__EFMigrationsHistory_finalbillcalculator.sql"
import_history_if_empty "ke-pdf" "__EFMigrationsHistory" "__EFMigrationsHistory_ke-pdf.sql"

# Pricing static seed (import once; keep across test-case resets)
if pricing_seed_loaded; then
  echo "[mysql-init] Skip pricing static seed (already loaded)"
else
  echo "[mysql-init] Import pricing static seed data"
  import_data_file_ignore_fk "pricing" "default_setting.sql"
  import_data_file_ignore_fk "pricing" "reseller_company.sql"
  import_data_file_ignore_fk "pricing" "reseller_product.sql"
  import_data_file_ignore_fk "pricing" "DVEP_pricing_sheet.sql"
  import_data_file_ignore_fk "pricing" "PV_price.sql"
  import_data_file_ignore_fk "pricing" "VAT.sql"
  import_data_file_ignore_fk "pricing" "energy_tax.sql"
  import_data_file_ignore_fk "pricing" "reduction_energy_tax.sql"
  import_data_file_ignore_fk "pricing" "sustainable_energy_storage.sql"
  import_data_file_ignore_fk "pricing" "transport_cost.sql"
  import_data_file_ignore_fk "pricing" "grid_operator.sql"
  import_data_file_ignore_fk "pricing" "grid_operator_price.sql"
  import_data_file_ignore_fk "pricing" "fixed_delivery_cost.sql"
  import_data_file_ignore_fk "pricing" "kikker_business_fixed_delivery_cost.sql"
  import_data_file_ignore_fk "pricing" "kikker_topup_fee.sql"
  import_data_file_ignore_fk "pricing" "reseller_topup_fee.sql"
  import_data_file_ignore_fk "pricing" "kikker_topup_fee_frdc.sql"
  import_data_file_ignore_fk "pricing" "reseller_topup_fee_frdc.sql"
  import_data_file_ignore_fk "pricing" "kikker_feed_in_fee.sql"
  import_data_file_ignore_fk "pricing" "reseller_feed_in_fee.sql"
  import_data_file_ignore_fk "pricing" "kikker_portfolio_fee.sql"
  import_data_file_ignore_fk "pricing" "reseller_portfolio_fee.sql"
  import_data_file_ignore_fk "pricing" "return_delivery_tariff.sql"
  import_data_file_ignore_fk "pricing" "frdc_sheet.sql"
  import_data_file_ignore_fk "pricing" "green_energy_price.sql"
fi

# Additional pricing static tables (import once; keep across test-case resets)
import_data_if_table_empty "pricing" "product" "product.sql"
import_data_if_table_empty "pricing" "price_cap_configuration" "price_cap_configuration.sql"
import_data_if_table_empty "pricing" "monthly_amount_limit" "monthly_amount_limit.sql"
import_data_if_table_empty "pricing" "reduction_energy_tax" "reduction_energy_tax.sql"

# ke-pdf static seed (import once; keep across test-case resets)
if ke_pdf_static_seed_loaded; then
  echo "[mysql-init] Skip ke-pdf static seed (already loaded)"
else
  echo "[mysql-init] Import ke-pdf static seed data"
  import_data_file_ignore_fk "ke-pdf" "templates.sql"
  import_data_file_ignore_fk "ke-pdf" "templates_reseller.sql"
  import_data_file_ignore_fk "ke-pdf" "headers.sql"
  import_data_file_ignore_fk "ke-pdf" "footers.sql"
fi

# ke-billing static seed (import once; keep across test-case resets)
if ke_billing_static_seed_loaded; then
  echo "[mysql-init] Skip ke-billing static seed (already loaded)"
else
  echo "[mysql-init] Import ke-billing static seed data"
  import_data_file_ignore_fk "ke-billing" "ke-reseller-billing-addresses.sql"
  import_data_file_ignore_fk "ke-billing" "ke-billing-reseller-all.sql"
fi

# Flow sample data (idempotent files use INSERT IGNORE)
import_data_file_ignore_fk "kikkercore" "$(testcase_001_file "kk_contract.sql")"
import_data_file_ignore_fk "kikkercore" "order_status.sql"
import_data_file_ignore_fk "kikkercore" "$(testcase_001_file "kk_order.sql")"
import_data_file_ignore_fk "kikkercore" "$(testcase_001_file "contract_info_master_lookup_C20241292.sql")"
import_data_file_ignore_fk "kikkercore" "$(testcase_001_file "contract_info_data_C20241292.sql")"
refresh_edsn_testcase_data
refresh_ke_billing_grid_operator_testcase_data
refresh_ke_billing_pvs_testcase_data
import_data_file "ke-auto-billing" "$(testcase_001_file "contract_auto_prepare.sql")"
import_data_file "ke-auto-billing" "$(testcase_001_file "billing_tasks.sql")"
import_data_file "kikker_p4_ean_usage" "$(testcase_001_file "p4_metering_point_ean_871692493900164636.sql")"
import_data_file "kikker_p4_ean_usage" "$(testcase_001_file "p4_metering_point_ean_871692493900374813.sql")"
import_data_file "kikker_p4_ean_usage" "$(testcase_001_file "p4_register_reading_ean_871692493900164636.sql")"
import_data_file "kikker_p4_ean_usage" "$(testcase_001_file "p4_register_reading_ean_871692493900374813.sql")"
refresh_p4_tmr_mock_data_testcase_data
ensure_hourly_testcase_data_once

mysql_exec -e "FLUSH PRIVILEGES;"
echo "[mysql-init] Done"
