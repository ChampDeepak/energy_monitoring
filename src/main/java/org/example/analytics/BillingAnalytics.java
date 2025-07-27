package org.example.analytics;

import org.example.DatabaseConnector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BillingAnalytics
{
    public static void getEstimatedVsActualBill(int householdId, String month, String year)
    {
        String query1 = "select bill_amount,date, date_format(date, '%Y-%m') as date1 from bill where household_id = ? and month(date) = ? and year(date) = ?";
        String query2 = "select amount from estimated_bill where household_id = ? and month(date) = ? and year(date) = ?";
        try(Connection conn = DatabaseConnector.getConnection();
            PreparedStatement pstmt1 = conn.prepareStatement(query1);
            PreparedStatement pstmt2 = conn.prepareStatement(query2)
            )
        {
            pstmt1.setInt(1, householdId);
            pstmt1.setString(2,month);
            pstmt1.setString(3,year);
            pstmt2.setInt(1, householdId);
            pstmt2.setString(2,month);
            pstmt2.setString(3,year);
            ResultSet rs1 = pstmt1.executeQuery();
            ResultSet rs2 = pstmt2.executeQuery();

            int ActualBill = 0;
            int EstimatedBill = 0;
            String Date = "";
            if(rs1.next())
            {
                ActualBill = rs1.getInt("bill_amount");
                Date = rs1.getString("date1");
            }
            if(rs2.next()) EstimatedBill = rs2.getInt("amount");

            System.out.println();
            System.out.println("Bill comparision for Household having id = " + householdId + " for the month " + Date);
            System.out.println();
//            System.out.println("Date: " + Date);
            System.out.println("ActualBill: " + ActualBill);
            System.out.println("EstimatedBill: " + EstimatedBill);

        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }

    }
    public static void getHouseholdsExceedingBudget(String year,String month)
    {
        String query = "select b1.household_id, b1.bill_amount, (b2.budget_amount_kwh*r.rate) as budget, date_format(b1.date, '%Y-%m') as Month \n" +
                "from bill b1\n" +
                "join budget b2 on b2.household_id = b1.household_id and b2.date = b1.date\n" +
                "join bill_rates r on r.date = b1.date where year(b1.date) = ? and month(b1.date) = ? and b1.bill_amount>(b2.budget_amount_kwh*r.rate)";
        try(Connection conn = DatabaseConnector.getConnection();
            PreparedStatement psmt = conn.prepareStatement(query))
        {
            psmt.setString(1,year);
            psmt.setString(2,month);
            ResultSet rs = psmt.executeQuery();
            if(rs.next())
            {
                System.out.println();
                System.out.println("Data of Households exceeding their budget for the Month of "+rs.getString("Month"));
                System.out.println();
                System.out.println("Household_id: "+rs.getInt("household_id"));
                System.out.println("Budget: "+rs.getDouble("budget"));
                System.out.println("Actual Bill: "+rs.getDouble("bill_amount"));
            }
            while(rs.next())
            {
                System.out.println();
                System.out.println("Household_id: "+rs.getInt("household_id"));
                System.out.println("Budget: "+rs.getDouble("budget"));
                System.out.println("Actual Bill: "+rs.getDouble("bill_amount"));
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
    }
}

