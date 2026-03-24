using Kikker.Billing.IntegrationTests.Fixtures;
using Kikker.Billing.IntegrationTests.Helpers;

namespace Kikker.Billing.IntegrationTests;

[Collection(nameof(BillingFlowCollection))]
public sealed class AutoBillingSmokeTests
{
    private readonly BillingFlowFixture fixture;

    public AutoBillingSmokeTests(BillingFlowFixture fixture)
    {
        this.fixture = fixture;
    }

    [Fact]
    [Trait("Category", "Smoke")]
    public async Task AutoBilling_run_should_create_a_new_billing_interaction_log_for_seeded_contract()
    {
        var result = await fixture.EnsureYearlyBillingScenarioAsync();

        Assert.True(result.BillingInteractionLogId > 0);
        Assert.True(result.BillingId > 0);
        Assert.False(string.IsNullOrWhiteSpace(result.CollectorDataJson));
        Assert.True(
            result.UpdatedBillingTaskCount > 0,
            $"Expected billing_tasks.perform_date to be updated for contract {fixture.Options.ContractNumber}.");
    }
}
