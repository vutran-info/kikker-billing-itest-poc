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
        await AssertComposeServiceRunningAsync("ke-auto-billing");
        await AssertComposeServiceRunningAsync("finalbillcalculator");

        var options = fixture.Options;
        await ResetBillingTaskAsync(options);

        var latestInteractionIdBefore = await fixture.MySql.QueryIntAsync(
            "ke-billing",
            $"SELECT COALESCE(MAX(id), 0) FROM billing_interaction_log WHERE contract_number = '{options.ContractNumber}'");

        using var response = await fixture.Http.GetAsync(options.AutoBillingRunUri);
        response.EnsureSuccessStatusCode();

        await WaitHelper.WaitUntilAsync(
            async () =>
            {
                var count = await fixture.MySql.QueryIntAsync(
                    "ke-billing",
                    $@"SELECT COUNT(*)
FROM billing_interaction_log
WHERE contract_number = '{options.ContractNumber}'
  AND id > {latestInteractionIdBefore}
  AND type = 'YEARLY_BILL'
  AND billing_id > 0");

                return count > 0;
            },
            options.WaitTimeout,
            TimeSpan.FromSeconds(5),
            $"Timed out waiting for a new billing_interaction_log row for contract {options.ContractNumber}.");

        var performDateCount = await fixture.MySql.QueryIntAsync(
            "ke-auto-billing",
            $@"SELECT COUNT(*)
FROM billing_tasks
WHERE contract_number = '{options.ContractNumber}'
  AND `from` = '{options.FromDate}'
  AND until = '{options.UntilDate}'
  AND perform_date IS NOT NULL");

        Assert.True(performDateCount > 0, $"Expected billing_tasks.perform_date to be updated for contract {options.ContractNumber}.");
    }

    private async Task ResetBillingTaskAsync(BillingTestOptions options)
    {
        await fixture.MySql.ExecuteAsync(
            "ke-auto-billing",
            $@"
UPDATE billing_tasks
SET action = 'WAIT',
    need_retry = 0,
    retry_count = 0,
    perform_date = NULL,
    billing_id = 0
WHERE contract_number = '{options.ContractNumber}'
  AND `from` = '{options.FromDate}'
  AND until = '{options.UntilDate}';");
    }

    private async Task AssertComposeServiceRunningAsync(string serviceName)
    {
        var output = await fixture.Compose.RunAsync("ps", "--services", "--status", "running");
        var runningServices = output
            .Split(new[] { '\r', '\n' }, StringSplitOptions.RemoveEmptyEntries)
            .Select(service => service.Trim())
            .ToHashSet(StringComparer.OrdinalIgnoreCase);

        Assert.Contains(serviceName, runningServices);
    }
}
