# Integration Test Architecture

## Separation of Concerns

This repository separates two concerns that are often mixed together:

1. Environment under test
- Docker Compose services
- runtime environment variables
- database schemas
- static seed data
- testcase seed data

2. Test runner
- triggers HTTP endpoints
- polls for completion
- verifies database side effects
- reports pass or fail

That separation is deliberate.

## Why This Matters

Unit tests usually belong to the application language and source tree.
Integration tests for a distributed system do not need that coupling.

The system under test here is the running microservice topology, not a single codebase.
Because of that, the runner can be written in:

- C#
- Java
- Python
- any other language that can call HTTP and query assertions

The language is an implementation detail. The test spec and environment stay the same.

## Repository Layout

- `docker-compose.itest.yml`
- `docker/mysql-init/`
- `testspec/`
- `runners/csharp/`
- `runners/java/`
- `runners/python/`
- `scripts/`

## Current Runner Strategy

The first runner is implemented in C# because:

- most services in the billing flow are .NET services
- the team can maintain it easily
- xUnit is sufficient for black-box integration testing

This does not make C# a requirement for the integration-test architecture.

## Current Smoke Flow

1. Start the Compose stack.
2. Seed static data and testcase data.
3. Call `ke-auto-billing`.
4. Wait for a new `billing_interaction_log` row for the seeded contract.
5. Assert key side effects in MySQL.

## Future Extensions

- Add Java runner with JUnit/Testcontainers.
- Add Python runner for lightweight orchestration.
- Move assertions into shared spec files where useful.
- Add scenario matrix for multiple contracts and billing types.
