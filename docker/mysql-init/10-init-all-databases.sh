#!/bin/sh
set -eu

LOAD_HOURLY_SCHEMA="${MYSQL_INIT_LOAD_KIKKER_HOURLY_SCHEMA:-false}"

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

pricing_seed_loaded() {
  table_has_rows "pricing" "PV_price" \
    && table_has_rows "pricing" "kikker_topup_fee" \
    && table_has_rows "pricing" "reseller_topup_fee" \
    && table_has_rows "pricing" "reseller_fixed_delivery_cost"
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
if [ "$LOAD_HOURLY_SCHEMA" = "true" ]; then
  import_schema_if_missing "kikker_hourly" "hourly_product_elk_price" "kikker_hourly.sql"
else
  echo "[mysql-init] Skip schema kikker_hourly (MYSQL_INIT_LOAD_KIKKER_HOURLY_SCHEMA=false)"
fi
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
if [ "$LOAD_HOURLY_SCHEMA" = "true" ]; then
  import_history_if_empty "kikker_hourly" "changelog" "changelog.sql"
else
  echo "[mysql-init] Skip history kikker_hourly.changelog (MYSQL_INIT_LOAD_KIKKER_HOURLY_SCHEMA=false)"
fi
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

# Flow sample data (idempotent files use INSERT IGNORE)
import_data_file_ignore_fk "kikkercore" "kk_contract.sql"
import_data_file_ignore_fk "kikkercore" "order_status.sql"
import_data_file_ignore_fk "kikkercore" "kk_order.sql"
import_data_file_ignore_fk "kikkercore" "contract_info_master_lookup_C20241292.sql"
import_data_file_ignore_fk "kikkercore" "contract_info_data_C20241292.sql"
import_data_file_ignore_fk "EDSNScaled" "masterDataUpdate.sql"
import_data_file "ke-auto-billing" "contract_auto_prepare.sql"
import_data_file "ke-auto-billing" "billing_tasks.sql"
import_data_file "kikker_p4_ean_usage" "p4_metering_point_ean_871692493900164636.sql"
import_data_file "kikker_p4_ean_usage" "p4_metering_point_ean_871692493900374813.sql"
import_data_file "kikker_p4_ean_usage" "p4_register_reading_ean_871692493900164636.sql"
import_data_file "kikker_p4_ean_usage" "p4_register_reading_ean_871692493900374813.sql"

mysql_exec -e "FLUSH PRIVILEGES;"
echo "[mysql-init] Done"
