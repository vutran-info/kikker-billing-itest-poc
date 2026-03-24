namespace Kikker.Billing.IntegrationTests;

public sealed class BillingScenarioResult
{
    public string ScenarioKey { get; init; } = string.Empty;
    public int BillingInteractionLogId { get; init; }
    public int BillingId { get; init; }
    public string CollectorDataJson { get; init; } = string.Empty;
    public int UpdatedBillingTaskCount { get; init; }
}
