using System.Globalization;

namespace Kikker.Billing.IntegrationTests;

public sealed class BillingTestOptions
{
    public string RepositoryRoot { get; init; } = string.Empty;
    public string ComposeFile { get; init; } = string.Empty;
    public string EnvFile { get; init; } = string.Empty;
    public string AutoBillingBaseUrl { get; init; } = string.Empty;
    public string ContractNumber { get; init; } = string.Empty;
    public string FromDate { get; init; } = string.Empty;
    public string UntilDate { get; init; } = string.Empty;
    public string MySqlRootPassword { get; init; } = string.Empty;
    public TimeSpan WaitTimeout { get; init; }

    public Uri AutoBillingRunUri => new($"{AutoBillingBaseUrl.TrimEnd('/')}/auto-billing/run");

    public static BillingTestOptions Load()
    {
        var repositoryRoot = ResolveRepositoryRoot();
        var timeoutSeconds = ReadInt("KIKKER_ITEST_WAIT_TIMEOUT_SECONDS", 180);

        return new BillingTestOptions
        {
            RepositoryRoot = repositoryRoot,
            ComposeFile = Path.Combine(repositoryRoot, ReadString("KIKKER_ITEST_COMPOSE_FILE", "docker-compose.itest.yml")),
            EnvFile = Path.Combine(repositoryRoot, ReadString("KIKKER_ITEST_ENV_FILE", ".env.itest")),
            AutoBillingBaseUrl = ReadString("KIKKER_ITEST_AUTOBILLING_BASE_URL", "http://localhost:8085"),
            ContractNumber = ReadString("KIKKER_ITEST_CONTRACT_NUMBER", "C20241292"),
            FromDate = ReadString("KIKKER_ITEST_FROM", "2025-02-09"),
            UntilDate = ReadString("KIKKER_ITEST_UNTIL", "2026-02-09"),
            MySqlRootPassword = ReadString("KIKKER_ITEST_MYSQL_ROOT_PASSWORD", "kikker"),
            WaitTimeout = TimeSpan.FromSeconds(timeoutSeconds)
        };
    }

    private static string ResolveRepositoryRoot()
    {
        var configured = Environment.GetEnvironmentVariable("KIKKER_ITEST_ROOT");
        if (!string.IsNullOrWhiteSpace(configured))
        {
            return Path.GetFullPath(configured);
        }

        var current = new DirectoryInfo(AppContext.BaseDirectory);
        while (current is not null)
        {
            var composePath = Path.Combine(current.FullName, "docker-compose.itest.yml");
            if (File.Exists(composePath))
            {
                return current.FullName;
            }

            current = current.Parent;
        }

        throw new InvalidOperationException("Could not locate repository root from test runner output path.");
    }

    private static string ReadString(string key, string fallback)
    {
        var value = Environment.GetEnvironmentVariable(key);
        return string.IsNullOrWhiteSpace(value) ? fallback : value;
    }

    private static int ReadInt(string key, int fallback)
    {
        var value = Environment.GetEnvironmentVariable(key);
        return int.TryParse(value, NumberStyles.Integer, CultureInfo.InvariantCulture, out var parsed)
            ? parsed
            : fallback;
    }
}
