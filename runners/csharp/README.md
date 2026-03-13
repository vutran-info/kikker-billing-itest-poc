# C# Integration Runner

This runner executes black-box integration tests against the Docker Compose environment defined in the repository root.

## Scope

- Calls running services over HTTP.
- Verifies side effects through MySQL queries executed via `docker compose exec`.
- Does not reference or depend on any microservice source repository.

## Prerequisites

- Docker Compose stack is running.
- Seed data is loaded.
- `.NET 6 SDK` is installed.

## Quick Start

```bash
./scripts/itest-up
./scripts/test-csharp
```

## Environment Variables

- `KIKKER_ITEST_AUTOBILLING_BASE_URL`
- `KIKKER_ITEST_CONTRACT_NUMBER`
- `KIKKER_ITEST_FROM`
- `KIKKER_ITEST_UNTIL`
- `KIKKER_ITEST_WAIT_TIMEOUT_SECONDS`
- `KIKKER_ITEST_ENV_FILE`
- `KIKKER_ITEST_COMPOSE_FILE`
- `KIKKER_ITEST_MYSQL_ROOT_PASSWORD`

Defaults are aligned with the current seeded smoke scenario.
