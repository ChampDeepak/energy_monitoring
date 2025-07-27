package org.example.services;

import org.example.DatabaseConnector;
import org.example.model.*;
import org.example.dao.*;

import java.sql.Connection;
import java.sql.SQLException;

public class UserOnboardingService {

    private final UserDAO userDAO = new UserDAO();
    private final HouseholdDAO householdDAO = new HouseholdDAO();
    private final MeterDAO meterDAO = new MeterDAO();
    private final BudgetDAO budgetDAO = new BudgetDAO();

    public boolean onboardUser(User user, Household household, Meter meter, Budget budget) {
        try (Connection conn = DatabaseConnector.getConnection()) {
            conn.setAutoCommit(false);  // Begin transaction

            household.setUserId(userDAO.insertUser(conn, user)); //user added

            int householdId = householdDAO.insertHousehold(conn, household);  //household added

            meter.setHouseholdId(householdId);
            budget.setHouseholdId(householdId);

            meterDAO.insertMeter(conn, meter); //meter added
            budgetDAO.insertBudget(conn, budget); //budget added

//            for(SmartPlug plug : plugs) smartPlugDAO.insertSmartPlug(conn, plug); //plugs added

            conn.commit();
            return true;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
