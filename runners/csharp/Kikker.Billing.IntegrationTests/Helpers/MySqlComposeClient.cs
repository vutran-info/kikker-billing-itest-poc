using System.Globalization;

namespace Kikker.Billing.IntegrationTests.Helpers;

public sealed class MySqlComposeClient
{
    private readonly BillingTestOptions options;
    private readonly ComposeCommandRunner compose;

    public MySqlComposeClient(BillingTestOptions options, ComposeCommandRunner compose)
    {
        this.options = options;
        this.compose = compose;
    }

    public async Task<int> QueryIntAsync(string database, string sql)
    {
        var raw = await QueryScalarAsync(database, sql);
        return int.Parse(raw, CultureInfo.InvariantCulture);
    }

    public async Task ExecuteAsync(string database, string sql)
    {
        await compose.RunAsync(
            "exec",
            "-T",
            "mysql",
            "mysql",
            "-uroot",
            $"-p{options.MySqlRootPassword}",
            $"--database={database}",
            "-e",
            sql);
    }

    public async Task<string[]> QueryTabSeparatedRowAsync(string database, string sql)
    {
        var output = await QueryScalarAsync(database, sql);
        var row = output
            .Split('\n', StringSplitOptions.RemoveEmptyEntries)
            .LastOrDefault()?
            .Split('\t');

        if (row is null || row.Length == 0)
        {
            throw new InvalidOperationException("Expected one tab-separated row from MySQL query, but query returned no data.");
        }

        return row;
    }

    public async Task<string> QueryScalarAsync(string database, string sql)
    {
        var output = await compose.RunAsync(
            "exec",
            "-T",
            "mysql",
            "mysql",
            "-uroot",
            $"-p{options.MySqlRootPassword}",
            $"--database={database}",
            "-Nse",
            sql);

        return output.Trim();
    }
}
