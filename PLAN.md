# Integration Test Plan

## Goal

Build a standalone integration-test runner that validates the billing flow against the Docker Compose environment in this repository.

## Principles

- Keep the environment under test independent from the test runner.
- Treat the microservice system as a black box.
- Allow multiple runners in different languages to target the same environment and the same test spec.
- Keep seed data and runtime environment in this repository, not inside any microservice source repository.

## Structure

- `docker-compose.itest.yml`: environment under test
- `docker/mysql-init/`: schema, static seed, testcase seed
- `testspec/`: language-agnostic flow definitions and assertions
- `runners/csharp/`: first implementation of the integration-test runner
- `runners/java/`: placeholder for future Java runner
- `runners/python/`: placeholder for future Python runner
- `scripts/test-csharp`: convenience command for the C# runner

## Execution Phases

1. Stabilize environment boot
- Ensure `./scripts/itest-up` and `./scripts/mysql-sync` are repeatable.
- Keep static seed and testcase seed clearly separated.

2. Define black-box smoke flow
- Trigger billing from public/internal HTTP entrypoint.
- Poll for completion using database side effects.
- Assert the expected records are created for the seeded contract.

3. Implement first runner in C#
- Use xUnit.
- Keep helpers local to the runner project.
- Avoid source-code coupling with any service.

4. Add runner documentation
- Explain the architecture separation.
- Document configuration through environment variables.
- Document how to add another runner in Java or Python.

5. Extend coverage later
- Add more seeded contracts and scenarios.
- Add failure-path assertions.
- Add cleanup helpers for mutable testcase data when needed.

## First Smoke Assertion Set

Contract under test:

- `contractNumber = C20241292`
- `from = 2025-02-09`
- `until = 2026-02-09`

Initial smoke assertions:

- `ke-auto-billing` endpoint responds successfully.
- `ke-billing.billing_interaction_log` gets a newer row for the contract.
- The new interaction log row has `type = YEARLY_BILL`.
- The new interaction log row has `billing_id > 0`.
- `ke-auto-billing.billing_tasks.perform_date` is updated for the contract.

## Out of Scope For First Iteration

- Per-test isolated datasets.
- Parallel test execution.
- Test runner containerization.
- Message-bus assertions.
- Cross-language parity suite.
