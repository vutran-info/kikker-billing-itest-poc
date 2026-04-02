package com.kikker.billing.integrationtests;

import com.kikker.billing.integrationtests.helpers.ComposeCommandRunner;
import com.kikker.billing.integrationtests.helpers.MySqlComposeClient;
import com.kikker.billing.integrationtests.helpers.WaitHelper;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.time.Duration;
import java.util.Arrays;
import java.util.Set;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.CompletionException;
import java.util.concurrent.ConcurrentHashMap;
import java.util.stream.Collectors;

public final class BillingFlowFixture {
    private static final String SCENARIO_KEY = "yearly-billing-c20241292";
    private static final BillingFlowFixture INSTANCE = new BillingFlowFixture();

    private final ConcurrentHashMap<String, CompletableFuture<BillingScenarioResult>> scenarioRuns = new ConcurrentHashMap<>();
    private final BillingTestOptions options;
    private final ComposeCommandRunner compose;
    private final MySqlComposeClient mySql;
    private final HttpClient http;

    private BillingFlowFixture() {
        this.options = BillingTestOptions.load();
        this.compose = new ComposeCommandRunner(options);
        this.mySql = new MySqlComposeClient(options, compose);
        this.http = HttpClient.newBuilder()
            .connectTimeout(Duration.ofSeconds(30))
            .build();
    }

    public static BillingFlowFixture shared() {
        return INSTANCE;
    }

    public BillingTestOptions options() {
        return options;
    }

    public BillingScenarioResult ensureYearlyBillingScenario() {
        CompletableFuture<BillingScenarioResult> scenario = scenarioRuns.computeIfAbsent(
            SCENARIO_KEY,
            ignored -> CompletableFuture.supplyAsync(() -> {
                try {
                    return runYearlyBillingScenario();
                } catch (Exception exception) {
                    throw new CompletionException(exception);
                }
            })
        );

        return scenario.join();
    }

    private BillingScenarioResult runYearlyBillingScenario() throws Exception {
        assertComposeServiceRunning("ke-auto-billing");
        assertComposeServiceRunning("finalbillcalculator");

        int latestInteractionIdBefore = mySql.queryInt(
            "ke-billing",
            "SELECT COALESCE(MAX(id), 0) FROM billing_interaction_log WHERE contract_number = '" + options.contractNumber() + "'"
        );

        resetBillingTask();

        HttpRequest request = HttpRequest.newBuilder()
            .uri(URI.create(options.autoBillingRunUrl()))
            .GET()
            .timeout(options.waitTimeout().plusSeconds(30))
            .build();

        HttpResponse<Void> response = http.send(request, HttpResponse.BodyHandlers.discarding());
        if (response.statusCode() < 200 || response.statusCode() >= 300) {
            throw new IllegalStateException("Auto billing trigger failed with HTTP status " + response.statusCode());
        }

        WaitHelper.waitUntil(
            () -> mySql.queryInt(
                "ke-billing",
                """
                SELECT COUNT(*)
                FROM billing_interaction_log
                WHERE contract_number = '%s'
                  AND id > %d
                  AND type = 'YEARLY_BILL'
                  AND billing_id > 0
                """.formatted(options.contractNumber(), latestInteractionIdBefore)
            ) > 0,
            options.waitTimeout(),
            Duration.ofSeconds(5),
            "Timed out waiting for a new billing_interaction_log row for contract " + options.contractNumber() + "."
        );

        String[] interactionRow = mySql.queryTabSeparatedRow(
            "ke-billing",
            """
            SELECT id, billing_id, CAST(collector_data AS CHAR)
            FROM billing_interaction_log
            WHERE contract_number = '%s'
              AND id > %d
              AND type = 'YEARLY_BILL'
              AND billing_id > 0
            ORDER BY id DESC
            LIMIT 1;
            """.formatted(options.contractNumber(), latestInteractionIdBefore)
        );

        int updatedBillingTaskCount = mySql.queryInt(
            "ke-auto-billing",
            """
            SELECT COUNT(*)
            FROM billing_tasks
            WHERE contract_number = '%s'
              AND `from` = '%s'
              AND until = '%s'
              AND perform_date IS NOT NULL
            """.formatted(options.contractNumber(), options.fromDate(), options.untilDate())
        );

        return new BillingScenarioResult(
            SCENARIO_KEY,
            Integer.parseInt(interactionRow[0]),
            Integer.parseInt(interactionRow[1]),
            interactionRow[2],
            updatedBillingTaskCount
        );
    }

    private void resetBillingTask() throws IOException, InterruptedException {
        mySql.execute(
            "ke-auto-billing",
            """
            UPDATE billing_tasks
            SET action = 'WAIT',
                need_retry = 0,
                retry_count = 0,
                perform_date = NULL,
                billing_id = 0
            WHERE contract_number = '%s'
              AND `from` = '%s'
              AND until = '%s';
            """.formatted(options.contractNumber(), options.fromDate(), options.untilDate())
        );
    }

    private void assertComposeServiceRunning(String serviceName) throws IOException, InterruptedException {
        Set<String> runningServices = Arrays.stream(compose.run("ps", "--services", "--status", "running").split("\\R"))
            .map(String::trim)
            .filter(value -> !value.isEmpty())
            .collect(Collectors.toSet());

        if (!runningServices.contains(serviceName)) {
            throw new IllegalStateException("Expected service '" + serviceName + "' to be running.");
        }
    }
}
