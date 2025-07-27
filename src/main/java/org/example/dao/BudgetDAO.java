package org.example.dao;

import org.example.model.Budget;

import java.sql.*;
import java.time.LocalDate;

public class BudgetDAO {

    public int insertBudget(Connection conn, Budget budget) {
        String query = "insert into budget(household_id, date, budget_amount_kwh) values (?, ?, ?)";

        try (PreparedStatement psmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
            // Optional: check for duplicate month entry
            if (budgetExists(conn, budget.getHouseholdId(), budget.getDate())) {
                System.out.println("Duplicate budget entry for the same household and month.");
                return -1;
            }

            psmt.setInt(1, budget.getHouseholdId());
            psmt.setDate(2, Date.valueOf(budget.getDate()));
            psmt.setDouble(3, budget.getBudgetAmountKwh());

            int rowsAffected = psmt.executeUpdate();

            if (rowsAffected > 0) {
                try (ResultSet generatedKeys = psmt.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        return generatedKeys.getInt(1);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return -1;
    }

    private boolean budgetExists(Connection conn, int householdId, LocalDate date) throws SQLException {
        String checkQuery = "SELECT 1 FROM budget WHERE household_id = ? AND EXTRACT(YEAR FROM date) = ? AND EXTRACT(MONTH FROM date) = ?";
        try (PreparedStatement ps = conn.prepareStatement(checkQuery)) {
            ps.setInt(1, householdId);
            ps.setInt(2, date.getYear());
            ps.setInt(3, date.getMonthValue());
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        }
    }
}
