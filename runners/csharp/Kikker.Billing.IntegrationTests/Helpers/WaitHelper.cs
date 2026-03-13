namespace Kikker.Billing.IntegrationTests.Helpers;

internal static class WaitHelper
{
    public static async Task WaitUntilAsync(Func<Task<bool>> condition, TimeSpan timeout, TimeSpan pollInterval, string timeoutMessage)
    {
        var startedAt = DateTime.UtcNow;
        while (DateTime.UtcNow - startedAt < timeout)
        {
            if (await condition())
            {
                return;
            }

            await Task.Delay(pollInterval);
        }

        throw new TimeoutException(timeoutMessage);
    }
}
