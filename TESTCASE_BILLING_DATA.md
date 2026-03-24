# Billing Test-Case Data Note

Muc tieu cua file nay la gom lai cac key data dang duoc seed theo test case cho flow billing hien tai, de export them data con thieu dung target.

## Scope

Contract test case hien tai:

- `contractId`: `18035`
- `contractNumber`: `C20241292`
- `contractExternalId`: `6b7f46c5-38d9-477c-bf8e-3ae460852a5b`
- `contractDuration`: `HOURLY`
- `resellerId`: `321`
- `customerId`: `1237`
- `locationBillingId`: `46300`
- `locationDeliveryId`: `46301`

Lien quan customer/user:

- `customerKey`: `20215441`
- `userId`: `1918`

## Kikkercore

Nguon:

- `docker/test-data/testcase-001/kk_contract.sql`
- `docker/test-data/testcase-001/kk_order.sql`
- `docker/test-data/testcase-001/contract_info_master_lookup_C20241292.sql`
- `docker/test-data/testcase-001/contract_info_data_C20241292.sql`

### Contract

- `kk_contract.id`: `18035`
- `kk_contract.contract_number`: `C20241292`
- `kk_contract.external_id`: `6b7f46c5-38d9-477c-bf8e-3ae460852a5b`
- `kk_contract.customer_id`: `1237`
- `kk_contract.reseller_id`: `321`
- `kk_contract.location_billing_id`: `46300`
- `kk_contract.location_delivery_id`: `46301`
- `kk_contract.order_flow`: `Regular`
- `kk_contract.monthly_amount`: `334.71`

### Reseller

Hien co trong `kikkercore.reseller`, nhung chua co trong `ke-billing.reseller`:

- `reseller.id`: `321`
- `reseller.external_id`: `8563aad0-e524-4842-a159-4242b46fb812`
- `reseller.company_name`: `Truijen Energie Advies`
- `reseller.btw`: `NL862090830B01`
- `reseller.kvk_number`: `81436394`
- `reseller.reseller_type`: `normal`

### Customer and User

- `customer.id`: `1237`
- `customer.customer_key`: `20215441`
- `customer.contact_name`: `customer1237`
- `customer.contact_email`: `customer1237@infodation.com`
- `user.id`: `1918`
- `user.first_name`: `user`
- `user.last_name`: `1918`

### Locations

- `location.id`: `46300`
- `location.id`: `46301`
- `zipcode`: `6004AB`
- `house_number`: `1`
- `street`: `Sint Mathiasstraat`
- `city`: `WEERT`

### Orders

Order dien:

- `orderId`: `31004`
- `orderNumber`: `O202400031004`
- `contractId`: `18035`
- `ean`: `871692493900164636`
- `productType`: `ELK`
- `usageType`: `KVB`
- `orderStatusId`: `5`
- `gridOperatorSubEan`: `8716885000005`
- `energyMeterNumber`: `000000000000023400`
- `captarCode`: `8742010105116`
- `profileCategory`: `E2B`
- `allocationMethod`: `PRF`
- `smartMeterStatus`: `AAN`
- `pvPriceId`: `27797`
- `resellerTopupFeeId`: `2696`
- `resellerDeliveryCostId`: `2267`
- `kikkerTopupFeeId`: `6456`
- `kikkerDeliveryCostId`: `2218`
- `dossierNumber`: `1636476318`

Order gas:

- `orderId`: `31005`
- `orderNumber`: `O202400031005`
- `contractId`: `18035`
- `ean`: `871692493900374813`
- `productType`: `GAS`
- `usageType`: `KVB`
- `orderStatusId`: `5`
- `gridOperatorSubEan`: `8716885000005`
- `energyMeterNumber`: `000000000040229396`
- `captarCode`: `8742010201115`
- `profileCategory`: `G1A`
- `smartMeterStatus`: `AAN`
- `pvPriceId`: `27799`
- `resellerTopupFeeId`: `2697`
- `resellerDeliveryCostId`: `2269`
- `kikkerTopupFeeId`: `6457`
- `kikkerDeliveryCostId`: `2220`
- `dossierNumber`: `1636476319`

### Other seeded lookup in kikkercore

- `order_status.id`: `5` -> `ACTIVE`
- `order_type.id`: `2` -> `SWITCH`
- `kk_contract_history` rows for `contract_id = 18035`: `4` rows

## Ke-auto-billing

Nguon:

- `docker/test-data/testcase-001/contract_auto_prepare.sql`
- `docker/test-data/testcase-001/billing_tasks.sql`

### Contract auto prepare

- `contract_auto_prepare.id`: `12860`
- `contract_number`: `C20241292`
- `contract_external_id`: `6b7f46c5-38d9-477c-bf8e-3ae460852a5b`

### Billing task

- `billing_tasks.id`: `59688`
- `contract_number`: `C20241292`
- `billing_type`: `YEARLY_BILL`
- `from`: `2025-02-09`
- `until`: `2026-02-09`

Note:

- Row nay dang de `customer_id = 0`, `location_id = 0`, `reseller_id = 0`.

## EDSNScaled

Nguon:

- `docker/test-data/testcase-001/MasterDataUpdates_Ean_871692493900164636.sql`
- `docker/test-data/testcase-001/MasterDataUpdates_Ean_871692493900374813.sql`
- `docker/test-data/testcase-001/EDSNRequests_Ean_871692493900164636.sql`
- `docker/test-data/testcase-001/EDSNRequests_Ean_871692493900374813.sql`

### Counts

- `MasterDataUpdates` for `871692493900164636`: `9` rows
- `MasterDataUpdates` for `871692493900374813`: `6` rows
- `EDSNRequests` for `871692493900164636`: `9` rows
- `EDSNRequests` for `871692493900374813`: `6` rows

### Important business keys from master data

Sub/grid operator:

- `GridOperator_Company.ID`: `8716885000005`

PV / BRP EANs seen in `MPCommercialCharacteristics.BalanceResponsibleParty_Company.ID`:

- `8714252005776`
- `8712423015821`
- `8712423028388`
- `5488888000025`

## Kikker P4 EAN Usage

Nguon:

- `docker/test-data/testcase-001/p4_metering_point_ean_871692493900164636.sql`
- `docker/test-data/testcase-001/p4_metering_point_ean_871692493900374813.sql`
- `docker/test-data/testcase-001/p4_register_reading_ean_871692493900164636.sql`
- `docker/test-data/testcase-001/p4_register_reading_ean_871692493900374813.sql`
- `docker/test-data/testcase-001/tmr_mock_data.sql`

### Metering point seed

Electricity EAN:

- `ean`: `871692493900164636`
- `energy_meter_id`: `23400`
- `external_reference` pattern: `871692493900164636:YYYY-MM-DD:DAY`
- `metering_point` rows: `366`

Gas EAN:

- `ean`: `871692493900374813`
- `energy_meter_id`: `40229396`
- `external_reference` pattern: `871692493900374813:YYYY-MM-DD:DAY`
- `metering_point` rows: `366`

### Register reading seed

Electricity EAN:

- `register_reading` rows: `1460`
- Main registers:
- `1.8.1`
- `1.8.2`
- `2.8.1`
- `2.8.2`

Gas EAN:

- `register_reading` rows: `365`
- Main register:
- `1.8.0`

### TMR mock data

- `tmr_mock_data.id`: `29336`
- `ean_id`: `871692493900164636`
- `tmr_mock_data.id`: `29337`
- `ean_id`: `871692493900374813`

## Ke-billing

Nguon test-case hien tai:

- `docker/test-data/testcase-001/grid_operators.sql`
- `docker/test-data/testcase-001/grid_sub_operators.sql`
- `docker/test-data/testcase-001/pvs_ean_*.sql`

Nguon static seed hien tai:

- `docker/mysql-init/ke-reseller-billing-addresses.sql`
- `docker/mysql-init/ke-billing-reseller-all.sql`

### Grid operator seed

- `grid_operators` rows: `100`
- `grid_operators.ean`: `8712423014022`
- `grid_operators.name`: `Enexis`
- `grid_sub_operators` rows: `100`
- `grid_sub_operators.sub_ean`: `8716885000005`
- `grid_sub_operators.sub_name`: `Enexis Limburg`

### PV seed

PV rows da seed:

- `ean = 5488888000025` -> `2284` rows
- `ean = 8712423015821` -> `1` row
- `ean = 8712423028388` -> `1` row
- `ean = 8714252005776` -> `3635` rows

### Reseller and billing address seed

Loai data:

- Static seed
- Import 1 lan
- Khong bi xoa theo test case

Source file:

- `ke-reseller-billing-addresses.sql`
- `ke-billing-reseller-all.sql`

Key cho contract hien tai:

- `ke-billing.reseller.id`: `321`
- `ke-billing.reseller.external_id`: `8563aad0-e524-4842-a159-4242b46fb812`
- `ke-billing.reseller.company_name`: `Truijen Energie Advies`
- `ke-billing.reseller.billing_address_id`: `1487`

Billing address cua reseller `321`:

- `ke-billing.billing_addresses.id`: `1487`
- `city`: `Weert`
- `zipcode`: `6002AM`
- `street`: `Boshoverweg`
- `house_number`: `85`
- `house_number_ext`: `''`

## Gaps currently observed

Nhung data nay dang la gap cho flow `finalbillcalculator`:

- Khong con gap `ke-billing.reseller`
- Khong con gap `ke-billing.billing_addresses`

Data can export tiep toi thieu:

- Chua xac dinh gap moi sau reseller va billing address

Data nen doi chieu tu source da co san:

- `kikkercore.reseller.id = 321`
- `kikkercore.reseller.external_id = 8563aad0-e524-4842-a159-4242b46fb812`
- `kikkercore.reseller.company_name = Truijen Energie Advies`
