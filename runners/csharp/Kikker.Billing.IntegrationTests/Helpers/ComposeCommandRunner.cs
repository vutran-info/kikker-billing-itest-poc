namespace Kikker.Billing.IntegrationTests.Helpers;

public sealed class ComposeCommandRunner
{
    private readonly BillingTestOptions options;

    public ComposeCommandRunner(BillingTestOptions options)
    {
        this.options = options;
    }

    public async Task<string> RunAsync(params string[] args)
    {
        var startInfo = new ProcessStartInfo("docker")
        {
            WorkingDirectory = options.RepositoryRoot,
            RedirectStandardOutput = true,
            RedirectStandardError = true,
            UseShellExecute = false
        };

        startInfo.ArgumentList.Add("compose");
        startInfo.ArgumentList.Add("--env-file");
        startInfo.ArgumentList.Add(options.EnvFile);
        startInfo.ArgumentList.Add("-f");
        startInfo.ArgumentList.Add(options.ComposeFile);

        foreach (var arg in args)
        {
            startInfo.ArgumentList.Add(arg);
        }

        using var process = new Process { StartInfo = startInfo };
        process.Start();

        var stdout = process.StandardOutput.ReadToEndAsync();
        var stderr = process.StandardError.ReadToEndAsync();

        await process.WaitForExitAsync();

        var output = await stdout;
        var error = await stderr;

        if (process.ExitCode != 0)
        {
            throw new InvalidOperationException($"docker compose command failed with exit code {process.ExitCode}.{Environment.NewLine}STDOUT:{Environment.NewLine}{output}{Environment.NewLine}STDERR:{Environment.NewLine}{error}");
        }

        return output;
    }
}
