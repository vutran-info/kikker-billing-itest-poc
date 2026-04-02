package com.kikker.billing.integrationtests.helpers;

import java.time.Duration;
import java.time.Instant;
import java.util.concurrent.Callable;

public final class WaitHelper {
    private WaitHelper() {
    }

    public static void waitUntil(Callable<Boolean> condition, Duration timeout, Duration pollInterval, String timeoutMessage)
        throws Exception {
        Instant startedAt = Instant.now();
        while (Duration.between(startedAt, Instant.now()).compareTo(timeout) < 0) {
            if (condition.call()) {
                return;
            }

            Thread.sleep(pollInterval.toMillis());
        }

        throw new IllegalStateException(timeoutMessage);
    }
}
