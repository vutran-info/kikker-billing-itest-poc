package com.kikker.billing.integrationtests.helpers;

import com.kikker.billing.integrationtests.BillingTestOptions;

import java.io.IOException;
import java.util.Arrays;

public final class MySqlComposeClient {
    private final BillingTestOptions options;
    private final ComposeCommandRunner compose;

    public MySqlComposeClient(BillingTestOptions options, ComposeCommandRunner compose) {
        this.options = options;
        this.compose = compose;
    }

    public int queryInt(String database, String sql) throws IOException, InterruptedException {
        return Integer.parseInt(queryScalar(database, sql));
    }

    public void execute(String database, String sql) throws IOException, InterruptedException {
        compose.run(
            "exec",
            "-T",
            "mysql",
            "mysql",
            "-uroot",
            "-p" + options.mysqlRootPassword(),
            "--database=" + database,
            "-e",
            sql
        );
    }

    public String[] queryTabSeparatedRow(String database, String sql) throws IOException, InterruptedException {
        String scalarOutput = queryScalar(database, sql);
        String[] rows = scalarOutput.split("\\R");
        String row = rows.length == 0 ? "" : rows[rows.length - 1].trim();

        if (row.isEmpty()) {
            throw new IllegalStateException("Expected one tab-separated row from MySQL query, but query returned no data.");
        }

        String[] columns = row.split("\t", -1);
        if (columns.length == 0) {
            throw new IllegalStateException("Expected tab-separated columns from MySQL query, but got: " + Arrays.toString(rows));
        }

        return columns;
    }

    public String queryScalar(String database, String sql) throws IOException, InterruptedException {
        return compose.run(
            "exec",
            "-T",
            "mysql",
            "mysql",
            "-uroot",
            "-p" + options.mysqlRootPassword(),
            "--database=" + database,
            "-Nse",
            sql
        ).trim();
    }
}
