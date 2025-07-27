package org.example.analytics;

import org.example.DatabaseConnector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AlertAnalytics {
    public static void getAlertHistoryForUser(int householdId) throws SQLException {
        String query = "SELECT message, read_status, date FROM notifications WHERE (household_id = ?) AND (type = ?)";
        try (Connection conn = DatabaseConnector.getConnection();
             PreparedStatement psmt = conn.prepareStatement(query)) {
            psmt.setInt(1, householdId);
            psmt.setString(2, "alert");

            try (ResultSet rs = psmt.executeQuery()) {
                boolean temporaryFlag = true;
                while (rs.next()) {
                    if(temporaryFlag)
                    {
                        temporaryFlag = false;
                        System.out.println();
                        System.out.println("Alert History for the Household having id = " + householdId);
                        System.out.println();
                    }
                    System.out.println("Date: " + rs.getDate("date"));
                    System.out.println("Message: " + rs.getString("message"));
                    System.out.println("ReadStatus: " + rs.getString("read_status"));
                    System.out.println();
                }
            } catch (SQLException e) {
                System.err.println("Error retrieving alert history for user " + householdId + ": " + e.getMessage());
                e.printStackTrace();
            }
        }
    }
}