# Billing Smoke Flow Spec

## Purpose

Validate that the seeded billing flow can run end-to-end on the local Compose environment.

## Environment

- Compose file: `docker-compose.itest.yml`
- Seed data source: `docker/mysql-init/`
- Contract note: `TESTCASE_BILLING_DATA.md`

## Seeded Contract

- `contractNumber`: `C20241292`
- `contractId`: `18035`
- `resellerId`: `321`
- `from`: `2025-02-09`
- `until`: `2026-02-09`

## Entry Point

- Service: `ke-auto-billing`
- Endpoint: `GET /auto-billing/run`
- Default host execution URL: `http://localhost:8085/auto-billing/run`

## Expected Side Effects

1. The HTTP request returns success.
2. A new row is created in `ke-billing.billing_interaction_log` for `C20241292`.
3. The new row has:
- `type = YEARLY_BILL`
- `billing_id > 0`
4. The source row in `ke-auto-billing.billing_tasks` has `perform_date IS NOT NULL`.

## Notes

- This is a black-box integration test.
- The runner must not reference microservice source code.
- The runner may use HTTP plus SQL assertions only.
- The current C# runner resets the mutable `ke-auto-billing.billing_tasks` row for the seeded contract before triggering the flow, so the smoke test is repeatable.
