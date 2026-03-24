# Test Data Layout

This directory stores mutable scenario data used by integration test cases.

## Conventions

- One folder per scenario, for example `testcase-001/`.
- Files in this directory are testcase-specific and may be refreshed during `mysql-sync`.
- Schema files, migration history, and static seed stay in `docker/mysql-init/`.

## Current Scenario

- `testcase-001/`
- Seeded billing flow for contract `C20241292`
