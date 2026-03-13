using Kikker.Billing.IntegrationTests.Helpers;

namespace Kikker.Billing.IntegrationTests.Fixtures;

public sealed class BillingFlowFixture
{
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
}

[CollectionDefinition(nameof(BillingFlowCollection))]
public sealed class BillingFlowCollection : ICollectionFixture<BillingFlowFixture>
{
}
