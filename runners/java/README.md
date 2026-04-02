# Java Integration Runner

This runner mirrors the C# black-box integration suite in Java using JUnit 5 and Maven.

## Scope

- Calls running services over HTTP.
- Verifies side effects through MySQL queries executed via `docker compose exec`.
- Does not reference or depend on any microservice source repository.

## Project Layout

- `pom.xml`: Maven test project definition
- `src/test/java/com/kikker/billing/integrationtests/`: smoke tests plus shared fixture/helpers

## Prerequisites

- Docker Compose stack is running.
- Seed data is loaded.
- `Java 17+` is installed.
- `Maven 3.9+` is installed.

## Quick Start

```bash
./scripts/itest-up
./scripts/test-java
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
