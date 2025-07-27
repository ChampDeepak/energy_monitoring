package org.example;
import org.example.analytics.AlertAnalytics;
import org.example.analytics.BillingAnalytics;
import org.example.analytics.ConsumptionAnalytics;


import java.sql.SQLException;


public class Main
{
    public static void main(String[] args) throws SQLException
    {

        ConsumptionAnalytics.getDailyConsumptionByHousehold(1,"2025-07-20");
//        ConsumptionAnalytics.getPeakUsageHoursAcrossUserBase("2025-07-20");
//        BillingAnalytics.getHouseholdsExceedingBudget("2025", "7");
//        ConsumptionAnalytics.getApplianceLevelTrends(1,"2025-07-20");
//        AlertAnalytics.getAlertHistoryForUser(1);
//        BillingAnalytics.getEstimatedVsActualBill(1,"5","2025");




    }
}