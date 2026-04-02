package com.kikker.billing.integrationtests;

import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

final class AutoBillingSmokeTests {
    private static final BillingFlowFixture FIXTURE = BillingFlowFixture.shared();

    @Test
    @Tag("Smoke")
    void autoBillingRunShouldCreateANewBillingInteractionLogForSeededContract() {
        BillingScenarioResult result = FIXTURE.ensureYearlyBillingScenario();

        assertTrue(result.billingInteractionLogId() > 0);
        assertTrue(result.billingId() > 0);
        assertFalse(result.collectorDataJson().isBlank());
        assertTrue(
            result.updatedBillingTaskCount() > 0,
            "Expected billing_tasks.perform_date to be updated for contract " + FIXTURE.options().contractNumber() + "."
        );
    }
}
