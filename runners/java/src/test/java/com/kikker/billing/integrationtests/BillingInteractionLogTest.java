package com.kikker.billing.integrationtests;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;

import java.util.HashSet;
import java.util.Set;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

final class BillingInteractionLogTest {
    private static final BillingFlowFixture FIXTURE = BillingFlowFixture.shared();
    private static final ObjectMapper OBJECT_MAPPER = new ObjectMapper();

    @Test
    @Tag("CollectorData")
    void latestCollectorDataShouldContainTheExpectedBusinessPayloadForTheSeededContract() throws Exception {
        BillingScenarioResult scenario = FIXTURE.ensureYearlyBillingScenario();
        BillingTestOptions options = FIXTURE.options();
        String collectorDataJson = scenario.collectorDataJson();

        assertFalse(collectorDataJson.isBlank());

        JsonNode root = OBJECT_MAPPER.readTree(collectorDataJson);
        assertEquals(options.contractNumber(), root.path("ContractNumber").asText());
        assertTrue(root.path("From").asText().startsWith(options.fromDate()));
        assertTrue(root.path("Until").asText().startsWith(options.untilDate()));
        assertTrue(root.path("MonthlyAmount").path("OldMonthlyAmount").decimalValue().doubleValue() > 0);
        assertTrue(root.path("SaveDatabase").asBoolean());
        assertFalse(root.path("IsErrorCollection").asBoolean());

        JsonNode eans = root.path("EANs");
        assertEquals(2, eans.size());

        Set<String> eanValues = new HashSet<>();
        for (JsonNode ean : eans) {
            String eanValue = ean.path("Ean").asText();
            if (!eanValue.isBlank()) {
                eanValues.add(eanValue);
            }

            assertEquals("Activated", ean.path("Status").asText());
            assertEquals("KVB", ean.path("UsageType").asText());
            assertTrue(ean.path("Tariffs").size() > 0);
            assertTrue(ean.path("MasterData").size() > 0);
            assertTrue(ean.path("MeterReads").size() > 0);

            JsonNode firstTariff = ean.path("Tariffs").get(0);
            assertNotNull(firstTariff);
            assertFalse(firstTariff.path("From").asText().isBlank());
            assertFalse(firstTariff.path("Until").asText().isBlank());
            assertTrue(firstTariff.path("TariffType").asInt() > 0);

            JsonNode firstMasterData = ean.path("MasterData").get(0);
            assertNotNull(firstMasterData);
            assertFalse(firstMasterData.path("GridOperatorEAN").asText().isBlank());
            assertFalse(firstMasterData.path("MeterDeviceId").asText().isBlank());
            assertFalse(firstMasterData.path("CapTarCode").asText().isBlank());

            JsonNode firstMeterRead = ean.path("MeterReads").get(0);
            assertNotNull(firstMeterRead);
            assertFalse(firstMeterRead.path("Register").asText().isBlank());
            assertTrue(firstMeterRead.path("Volume").isNumber());
            assertFalse(firstMeterRead.path("MeterID").asText().isBlank());
        }

        assertTrue(eanValues.contains("871692493900164636"));
        assertTrue(eanValues.contains("871692493900374813"));

        JsonNode billingDetails = root.path("BillingDetails");
        assertEquals("20215441", billingDetails.path("CustomerKey").asText());
        assertEquals("20215441", billingDetails.path("ClientNumber").asText());
        assertEquals("customer1237@infodation.com", billingDetails.path("Email").asText());
        assertEquals("Regular", billingDetails.path("OrderFlow").asText());
        assertEquals(321, billingDetails.path("ResellerId").asInt());

        JsonNode billingAddress = root.path("BillingAddress");
        assertEquals("WEERT", billingAddress.path("City").asText());
        assertEquals("Sint Mathiasstraat", billingAddress.path("Street").asText());
        assertEquals("6004AB", billingAddress.path("Zipcode").asText());
        assertEquals(1, billingAddress.path("HouseNumber").asInt());
    }
}
