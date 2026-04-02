package com.kikker.billing.integrationtests;

import java.nio.file.Files;
import java.nio.file.Path;
import java.time.Duration;

public final class BillingTestOptions {
    private final Path repositoryRoot;
    private final Path composeFile;
    private final Path envFile;
    private final String autoBillingBaseUrl;
    private final String contractNumber;
    private final String fromDate;
    private final String untilDate;
    private final String mysqlRootPassword;
    private final Duration waitTimeout;

    private BillingTestOptions(
        Path repositoryRoot,
        Path composeFile,
        Path envFile,
        String autoBillingBaseUrl,
        String contractNumber,
        String fromDate,
        String untilDate,
        String mysqlRootPassword,
        Duration waitTimeout
    ) {
        this.repositoryRoot = repositoryRoot;
        this.composeFile = composeFile;
        this.envFile = envFile;
        this.autoBillingBaseUrl = autoBillingBaseUrl;
        this.contractNumber = contractNumber;
        this.fromDate = fromDate;
        this.untilDate = untilDate;
        this.mysqlRootPassword = mysqlRootPassword;
        this.waitTimeout = waitTimeout;
    }

    public static BillingTestOptions load() {
        Path repositoryRoot = resolveRepositoryRoot();
        int timeoutSeconds = readInt("KIKKER_ITEST_WAIT_TIMEOUT_SECONDS", 180);

        return new BillingTestOptions(
            repositoryRoot,
            repositoryRoot.resolve(readString("KIKKER_ITEST_COMPOSE_FILE", "docker-compose.itest.yml")).normalize(),
            repositoryRoot.resolve(readString("KIKKER_ITEST_ENV_FILE", ".env.itest")).normalize(),
            readString("KIKKER_ITEST_AUTOBILLING_BASE_URL", "http://localhost:8085"),
            readString("KIKKER_ITEST_CONTRACT_NUMBER", "C20241292"),
            readString("KIKKER_ITEST_FROM", "2025-02-09"),
            readString("KIKKER_ITEST_UNTIL", "2026-02-09"),
            readString("KIKKER_ITEST_MYSQL_ROOT_PASSWORD", "kikker"),
            Duration.ofSeconds(timeoutSeconds)
        );
    }

    public Path repositoryRoot() {
        return repositoryRoot;
    }

    public Path composeFile() {
        return composeFile;
    }

    public Path envFile() {
        return envFile;
    }

    public String autoBillingBaseUrl() {
        return autoBillingBaseUrl;
    }

    public String contractNumber() {
        return contractNumber;
    }

    public String fromDate() {
        return fromDate;
    }

    public String untilDate() {
        return untilDate;
    }

    public String mysqlRootPassword() {
        return mysqlRootPassword;
    }

    public Duration waitTimeout() {
        return waitTimeout;
    }

    public String autoBillingRunUrl() {
        return autoBillingBaseUrl.replaceAll("/+$", "") + "/auto-billing/run";
    }

    private static Path resolveRepositoryRoot() {
        String configuredRoot = System.getenv("KIKKER_ITEST_ROOT");
        if (configuredRoot != null && !configuredRoot.isBlank()) {
            return Path.of(configuredRoot).toAbsolutePath().normalize();
        }

        Path current = Path.of("").toAbsolutePath().normalize();
        while (current != null) {
            if (Files.exists(current.resolve("docker-compose.itest.yml"))) {
                return current;
            }
            current = current.getParent();
        }

        throw new IllegalStateException("Could not locate repository root from the current working directory.");
    }

    private static String readString(String key, String fallback) {
        String value = System.getenv(key);
        return value == null || value.isBlank() ? fallback : value;
    }

    private static int readInt(String key, int fallback) {
        String value = System.getenv(key);
        if (value == null || value.isBlank()) {
            return fallback;
        }

        try {
            return Integer.parseInt(value);
        } catch (NumberFormatException ignored) {
            return fallback;
        }
    }
}
