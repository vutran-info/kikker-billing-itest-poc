package com.kikker.billing.integrationtests;

public record BillingScenarioResult(
    String scenarioKey,
    int billingInteractionLogId,
    int billingId,
    String collectorDataJson,
    int updatedBillingTaskCount
) {
}
