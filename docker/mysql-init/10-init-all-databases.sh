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

mysql_exec -e "FLUSH PRIVILEGES;"
echo "[mysql-init] Done"
