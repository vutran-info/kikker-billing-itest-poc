using Kikker.Billing.IntegrationTests.Helpers;
using System.Collections.Concurrent;

namespace Kikker.Billing.IntegrationTests.Fixtures;

public sealed class BillingFlowFixture
{
    private readonly ConcurrentDictionary<string, Lazy<Task<BillingScenarioResult>>> scenarioRuns = new();

    public BillingFlowFixture()
    {
        Options = BillingTestOptions.Load();
        Compose = new ComposeCommandRunner(Options);
        MySql = new MySqlComposeClient(Options, Compose);
        Http = new HttpClient
        {
            Timeout = Options.WaitTimeout + TimeSpan.FromSeconds(30)
        };
    }

    public BillingTestOptions Options { get; }
    public ComposeCommandRunner Compose { get; }
    public MySqlComposeClient MySql { get; }
    public HttpClient Http { get; }

    public Task<BillingScenarioResult> EnsureYearlyBillingScenarioAsync()
    {
        const string scenarioKey = "yearly-billing-c20241292";

        var lazyRun = scenarioRuns.GetOrAdd(
            scenarioKey,
            _ => new Lazy<Task<BillingScenarioResult>>(
                RunYearlyBillingScenarioAsync,
                LazyThreadSafetyMode.ExecutionAndPublication));

        return lazyRun.Value;
    }

    private async Task<BillingScenarioResult> RunYearlyBillingScenarioAsync()
    {
        await AssertComposeServiceRunningAsync("ke-auto-billing");
        await AssertComposeServiceRunningAsync("finalbillcalculator");

        var latestInteractionIdBefore = await MySql.QueryIntAsync(
            "ke-billing",
            $"SELECT COALESCE(MAX(id), 0) FROM billing_interaction_log WHERE contract_number = '{Options.ContractNumber}'");

        await ResetBillingTaskAsync();

        using var response = await Http.GetAsync(Options.AutoBillingRunUri);
        response.EnsureSuccessStatusCode();

        await WaitHelper.WaitUntilAsync(
            async () =>
            {
                var count = await MySql.QueryIntAsync(
                    "ke-billing",
                    $@"SELECT COUNT(*)
FROM billing_interaction_log
WHERE contract_number = '{Options.ContractNumber}'
  AND id > {latestInteractionIdBefore}
  AND type = 'YEARLY_BILL'
  AND billing_id > 0");

                return count > 0;
            },
            Options.WaitTimeout,
            TimeSpan.FromSeconds(5),
            $"Timed out waiting for a new billing_interaction_log row for contract {Options.ContractNumber}.");

        var interactionRow = await MySql.QueryTabSeparatedRowAsync(
            "ke-billing",
            $@"
SELECT id, billing_id, CAST(collector_data AS CHAR)
FROM billing_interaction_log
WHERE contract_number = '{Options.ContractNumber}'
  AND id > {latestInteractionIdBefore}
  AND type = 'YEARLY_BILL'
  AND billing_id > 0
ORDER BY id DESC
LIMIT 1;");

        var updatedBillingTaskCount = await MySql.QueryIntAsync(
            "ke-auto-billing",
            $@"SELECT COUNT(*)
FROM billing_tasks
WHERE contract_number = '{Options.ContractNumber}'
  AND `from` = '{Options.FromDate}'
  AND until = '{Options.UntilDate}'
  AND perform_date IS NOT NULL");

        return new BillingScenarioResult
        {
            ScenarioKey = "yearly-billing-c20241292",
            BillingInteractionLogId = int.Parse(interactionRow[0]),
            BillingId = int.Parse(interactionRow[1]),
            CollectorDataJson = interactionRow[2],
            UpdatedBillingTaskCount = updatedBillingTaskCount
        };
    }

    private async Task ResetBillingTaskAsync()
    {
        await MySql.ExecuteAsync(
            "ke-auto-billing",
            $@"
UPDATE billing_tasks
SET action = 'WAIT',
    need_retry = 0,
    retry_count = 0,
    perform_date = NULL,
    billing_id = 0
WHERE contract_number = '{Options.ContractNumber}'
  AND `from` = '{Options.FromDate}'
  AND until = '{Options.UntilDate}';");
    }

    private async Task AssertComposeServiceRunningAsync(string serviceName)
    {
        var output = await Compose.RunAsync("ps", "--services", "--status", "running");
        var runningServices = output
            .Split(new[] { '\r', '\n' }, StringSplitOptions.RemoveEmptyEntries)
            .Select(service => service.Trim())
            .ToHashSet(StringComparer.OrdinalIgnoreCase);

        if (!runningServices.Contains(serviceName))
        {
            throw new InvalidOperationException($"Expected service '{serviceName}' to be running.");
        }
    }
}

[CollectionDefinition(nameof(BillingFlowCollection))]
public sealed class BillingFlowCollection : ICollectionFixture<BillingFlowFixture>
{
}
