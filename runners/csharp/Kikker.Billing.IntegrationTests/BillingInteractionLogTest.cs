using System.Text.Json;
using Kikker.Billing.IntegrationTests.Fixtures;

namespace Kikker.Billing.IntegrationTests;

[Collection(nameof(BillingFlowCollection))]
public sealed class BillingInteractionLogTest
{
    private readonly BillingFlowFixture fixture;

    public BillingInteractionLogTest(BillingFlowFixture fixture)
    {
        this.fixture = fixture;
    }

    [Fact]
    [Trait("Category", "CollectorData")]
    public async Task Latest_collector_data_should_contain_the_expected_business_payload_for_the_seeded_contract()
    {
        var scenario = await fixture.EnsureYearlyBillingScenarioAsync();
        var options = fixture.Options;
        var collectorDataJson = scenario.CollectorDataJson;
        Assert.False(string.IsNullOrWhiteSpace(collectorDataJson));

        using var document = JsonDocument.Parse(collectorDataJson);
        var root = document.RootElement;

        Assert.Equal(options.ContractNumber, root.GetProperty("ContractNumber").GetString());
        Assert.StartsWith(options.FromDate, root.GetProperty("From").GetString(), StringComparison.Ordinal);
        Assert.StartsWith(options.UntilDate, root.GetProperty("Until").GetString(), StringComparison.Ordinal);
        Assert.True(root.GetProperty("MonthlyAmount").GetProperty("OldMonthlyAmount").GetDecimal() > 0);
        Assert.True(root.GetProperty("SaveDatabase").GetBoolean());
        Assert.False(root.GetProperty("IsErrorCollection").GetBoolean());

        var eans = root.GetProperty("EANs");
        Assert.Equal(2, eans.GetArrayLength());

        var eanValues = eans
            .EnumerateArray()
            .Select(element => element.GetProperty("Ean").GetString())
            .Where(value => !string.IsNullOrWhiteSpace(value))
            .ToHashSet(StringComparer.Ordinal);

        Assert.Contains("871692493900164636", eanValues);
        Assert.Contains("871692493900374813", eanValues);

        foreach (var ean in eans.EnumerateArray())
        {
            Assert.Equal("Activated", ean.GetProperty("Status").GetString());
            Assert.Equal("KVB", ean.GetProperty("UsageType").GetString());
            Assert.True(ean.GetProperty("Tariffs").GetArrayLength() > 0);
            Assert.True(ean.GetProperty("MasterData").GetArrayLength() > 0);
            Assert.True(ean.GetProperty("MeterReads").GetArrayLength() > 0);

            var firstTariff = ean.GetProperty("Tariffs")[0];
            Assert.False(string.IsNullOrWhiteSpace(firstTariff.GetProperty("From").GetString()));
            Assert.False(string.IsNullOrWhiteSpace(firstTariff.GetProperty("Until").GetString()));
            Assert.True(firstTariff.GetProperty("TariffType").GetInt32() > 0);

            var firstMasterData = ean.GetProperty("MasterData")[0];
            Assert.False(string.IsNullOrWhiteSpace(firstMasterData.GetProperty("GridOperatorEAN").GetString()));
            Assert.False(string.IsNullOrWhiteSpace(firstMasterData.GetProperty("MeterDeviceId").GetString()));
            Assert.False(string.IsNullOrWhiteSpace(firstMasterData.GetProperty("CapTarCode").GetString()));

            var firstMeterRead = ean.GetProperty("MeterReads")[0];
            Assert.False(string.IsNullOrWhiteSpace(firstMeterRead.GetProperty("Register").GetString()));
            Assert.True(firstMeterRead.GetProperty("Volume").ValueKind is JsonValueKind.Number);
            Assert.False(string.IsNullOrWhiteSpace(firstMeterRead.GetProperty("MeterID").GetString()));
        }

        var billingDetails = root.GetProperty("BillingDetails");
        Assert.Equal("20215441", billingDetails.GetProperty("CustomerKey").GetString());
        Assert.Equal("20215441", billingDetails.GetProperty("ClientNumber").GetString());
        Assert.Equal("customer1237@infodation.com", billingDetails.GetProperty("Email").GetString());
        Assert.Equal("Regular", billingDetails.GetProperty("OrderFlow").GetString());
        Assert.Equal(321, billingDetails.GetProperty("ResellerId").GetInt32());

        var billingAddress = root.GetProperty("BillingAddress");
        Assert.Equal("WEERT", billingAddress.GetProperty("City").GetString());
        Assert.Equal("Sint Mathiasstraat", billingAddress.GetProperty("Street").GetString());
        Assert.Equal("6004AB", billingAddress.GetProperty("Zipcode").GetString());
        Assert.Equal(1, billingAddress.GetProperty("HouseNumber").GetInt32());
    }
}
