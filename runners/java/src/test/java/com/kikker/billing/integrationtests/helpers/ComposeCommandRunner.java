package com.kikker.billing.integrationtests.helpers;

import com.kikker.billing.integrationtests.BillingTestOptions;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

public final class ComposeCommandRunner {
    private final BillingTestOptions options;

    public ComposeCommandRunner(BillingTestOptions options) {
        this.options = options;
    }

    public String run(String... args) throws IOException, InterruptedException {
        List<String> command = new ArrayList<>();
        command.add("docker");
        command.add("compose");
        command.add("--env-file");
        command.add(options.envFile().toString());
        command.add("-f");
        command.add(options.composeFile().toString());

        for (String arg : args) {
            command.add(arg);
        }

        Process process = new ProcessBuilder(command)
            .directory(options.repositoryRoot().toFile())
            .start();

        String stdout = new String(process.getInputStream().readAllBytes(), StandardCharsets.UTF_8);
        String stderr = new String(process.getErrorStream().readAllBytes(), StandardCharsets.UTF_8);
        int exitCode = process.waitFor();

        if (exitCode != 0) {
            throw new IllegalStateException(
                "docker compose command failed with exit code " + exitCode + System.lineSeparator()
                    + "STDOUT:" + System.lineSeparator() + stdout + System.lineSeparator()
                    + "STDERR:" + System.lineSeparator() + stderr
            );
        }

        return stdout;
    }
}
