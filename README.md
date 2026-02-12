# kikker-billing-itest-poc

Integration test environment with Docker Compose and centralized image override.

## Goal

Swap any microservice image/tag from Google Artifact Registry in one place, with one command.
Run required infra (`MySQL`, `RabbitMQ`) locally in Docker for integration tests.

## Current Service Image Map

- `ke-auto-billing` -> `europe-west4-docker.pkg.dev/kikker/repository/ke-auto-billing:0.0.221`
- `finalbillcalculator` -> `europe-west4-docker.pkg.dev/kikker/repository/finalbillcalculator:0.0.906`
- `ke-billing-generator` -> `europe-west4-docker.pkg.dev/kikker/repository/ke-billing-generator:0.0.385`
- `ke-hourly-product` -> `europe-west4-docker.pkg.dev/kikker/repository/ke-hourly-product:0.0.449`
- `ke-core` -> `europe-west4-docker.pkg.dev/kikker/kikker/ke-core:0.1.43`
- `ke-pricing` -> `europe-west4-docker.pkg.dev/kikker/kikker-charts/ke-pricing:0.0.1358`
- `ke-edsn-rest-api-poc` -> `europe-west4-docker.pkg.dev/kikker/repository/ke-edsn-rest-api-poc:0.0.109`
- `ke-p4-ean-usage` -> `europe-west4-docker.pkg.dev/kikker/kikker/ke-p4-ean-usage:0.0.231`
- `ke-pdf` -> `europe-west4-docker.pkg.dev/kikker/repository/ke-pdf:0.0.51`
- `ke-calculated-legacy` -> `europe-west4-docker.pkg.dev/kikker/cloud-run-source-deploy/ke-calculated-meter-readings/profile-calculated-meter-reads@sha256:240b546bc94c80f4c12ba9fe157d10de9685ffb42282ae64f8c916df34f89848`
- `ke-calculated-dynamic` -> `europe-west4-docker.pkg.dev/kikker/cloud-run-source-deploy/ke-calculated-meter-readings/dynamic-fractions@sha256:ffed3f1022022fa43767a6af9ccf3af78d370a03f91e10ec2b1d691af9f1c186`

## Files

- `docker-compose.itest.yml`: integration environment definition
- `.env.itest.example`: default image/tag mapping
- `.env.itest`: local override file (generated from example, gitignored)
- `.env.ke-core.example`: baseline runtime env for `ke-core`
- `.env.ke-core`: local `ke-core` env (generated from example, gitignored)
- `.env.ke-p4-ean-usage.example`: baseline runtime env for `ke-p4-ean-usage`
- `.env.ke-p4-ean-usage`: local `ke-p4-ean-usage` env (generated from example, gitignored)
- `.env.ke-pricing.example`: baseline runtime env for `ke-pricing`
- `.env.ke-pricing`: local `ke-pricing` env (generated from example, gitignored)
- `.env.finalbillcalculator.example`: baseline runtime env for `finalbillcalculator`
- `.env.finalbillcalculator`: local `finalbillcalculator` env (generated from example, gitignored)
- `.env.ke-auto-billing.example`: baseline runtime env for `ke-auto-billing`
- `.env.ke-auto-billing`: local `ke-auto-billing` env (generated from example, gitignored)
- `.env.ke-billing-generator.example`: baseline runtime env for `ke-billing-generator`
- `.env.ke-billing-generator`: local `ke-billing-generator` env (generated from example, gitignored)
- `.env.ke-hourly-product.example`: baseline runtime env for `ke-hourly-product`
- `.env.ke-hourly-product`: local `ke-hourly-product` env (generated from example, gitignored)
- `.env.ke-edsn-rest-api-poc.example`: baseline runtime env for `ke-edsn-rest-api-poc`
- `.env.ke-edsn-rest-api-poc`: local `ke-edsn-rest-api-poc` env (generated from example, gitignored)
- `.env.ke-pdf.example`: baseline runtime env for `ke-pdf`
- `.env.ke-pdf`: local `ke-pdf` env (generated from example, gitignored)
- `.env.ke-calculated-legacy.example`: baseline runtime env for `ke-calculated-legacy`
- `.env.ke-calculated-legacy`: local `ke-calculated-legacy` env (generated from example, gitignored)
- `.env.ke-calculated-dynamic.example`: baseline runtime env for `ke-calculated-dynamic`
- `.env.ke-calculated-dynamic`: local `ke-calculated-dynamic` env (generated from example, gitignored)
- `scripts/set-image`: update image/tag for a service
- `scripts/itest-up`: start integration environment
- `scripts/itest-down`: stop integration environment
- `scripts/verify-images`: verify running image per service

## Quick Start

```bash
cp .env.itest.example .env.itest
cp .env.ke-core.example .env.ke-core
cp .env.ke-p4-ean-usage.example .env.ke-p4-ean-usage
cp .env.ke-pricing.example .env.ke-pricing
cp .env.finalbillcalculator.example .env.finalbillcalculator
cp .env.ke-auto-billing.example .env.ke-auto-billing
cp .env.ke-billing-generator.example .env.ke-billing-generator
cp .env.ke-hourly-product.example .env.ke-hourly-product
cp .env.ke-edsn-rest-api-poc.example .env.ke-edsn-rest-api-poc
cp .env.ke-pdf.example .env.ke-pdf
cp .env.ke-calculated-legacy.example .env.ke-calculated-legacy
cp .env.ke-calculated-dynamic.example .env.ke-calculated-dynamic
./scripts/itest-up
./scripts/verify-images
```

## Swap Image Fast

Only update `.env.itest` via script.

```bash
# Tag-only (uses existing image repo from .env.itest)
./scripts/set-image ke-core 0.1.44

# Full image + tag
./scripts/set-image ke-core europe-west4-docker.pkg.dev/kikker/kikker/ke-core:0.1.44

# Explicit image and tag as separate args
./scripts/set-image billing-api europe-west4-docker.pkg.dev/kikker/kikker/billing-api 0.1.50
```

Then redeploy:

```bash
./scripts/itest-up
./scripts/verify-images
```

## Testcontainers Usage

Use `docker-compose.itest.yml` and `.env.itest` as the single source for service versions.

- Java Testcontainers can load this compose file and wait for services.
- Keep image changes in `.env.itest` only, not in test code.
- If tests need a dedicated runner container, use Compose profile `itest`:

```bash
./scripts/itest-up --profile itest
```

## Notes

- Current compose file provides baseline services (`postgres`, `ke-core`, `billing-api`).
- `ke-p4-ean-usage` listens on `8082/TCP` in container and is exposed at `http://localhost:8082`.
- `ke-pricing` listens on `80/TCP` in container and is exposed at `http://localhost:8083`.
- `finalbillcalculator` is exposed at `http://localhost:8084`.
- `ke-auto-billing` listens on `80/TCP` in container and is exposed at `http://localhost:8085`.
- `ke-billing-generator` listens on `80/TCP` in container and is exposed at `http://localhost:8086`.
- `ke-hourly-product` listens on `80/TCP` in container and is exposed at `http://localhost:8087`.
- `ke-edsn-rest-api-poc` listens on `80/TCP` in container and is exposed at `http://localhost:8088`.
- `ke-pdf` listens on `80/TCP` in container and is exposed at `http://localhost:8089`.
- `ke-calculated-legacy` listens on `80/TCP` in container and is exposed at `http://localhost:8090`.
- `ke-calculated-dynamic` listens on `80/TCP` in container and is exposed at `http://localhost:8091`.
- Collector routing convention:
  - `CalSetting__BaseUrl` -> `http://ke-calculated-legacy`
  - `CalDynamicSetting__BaseUrl` -> `http://ke-calculated-dynamic`
- Local infra services:
  - `mysql` -> `localhost:3306`
  - `rabbitmq` -> `localhost:5672` (management `localhost:15672`)
- Add more services by following the same `SERVICE_IMAGE` and `SERVICE_TAG` variable pattern.
- If service health endpoints differ, customize `depends_on`/health checks per service.
- For `ke-calculated-meter-readings`, wire the generated image tag from CI into `.env.itest` before `./scripts/itest-up`.
- `ke-core` listens on `80/TCP` in container and is exposed at `http://localhost:8081`.
