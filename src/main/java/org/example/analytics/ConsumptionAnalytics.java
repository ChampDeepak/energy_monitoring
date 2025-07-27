package org.example.analytics;

import org.example.DatabaseConnector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class ConsumptionAnalytics
{
    public static void getDailyConsumptionByHousehold(int householdId, String date)
    {
        String query = "select sum(t1.energy_consumed) as energy_consumed \n" +
                "from (select meter_id, sum(case when date(timestamp) = ? \n" +
                "then energy_consumed else 0 end) as energy_consumed\n" +
                "from meter_readings \n" +
                "where meter_id in (select t.meter_id from meter t where t.household_id=?)\n" +
                "group by meter_id) as t1";
        try(Connection conn = DatabaseConnector.getConnection();
            PreparedStatement psmt = conn.prepareStatement(query))
        {
            psmt.setString(1,date);
            psmt.setInt(2,householdId);
            ResultSet rs = psmt.executeQuery();
            double energyConsumed;
            if(rs.next())
            {
                energyConsumed = rs.getDouble("energy_consumed");
                System.out.println();
                System.out.println("On " + date + ", " + energyConsumed + "kwh energy was consumed by the household(id=" + householdId + ")");
            }

        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }

    }

    public static void getPeakUsageHoursAcrossUserBase(String date)
    {
        String query = "select hour(timestamp), sum(energy_consumed) as energy_consumed\n" +
                "from meter_readings \n" +
                "where date(timestamp) = ?" +
                "group by hour(timestamp)\n" +
                "order by sum(energy_consumed) desc limit 3;";
        try(Connection conn = DatabaseConnector.getConnection();
            PreparedStatement psmt = conn.prepareStatement(query))
        {
            psmt.setString(1,date);
            ResultSet rs = psmt.executeQuery();
            boolean temporaryFlag = true;
            while(rs.next())
            {
                if(temporaryFlag)
                {
                    System.out.println();
                    System.out.println("Top 3 Peak Energy Consumption Hours on " + date + ", Across All Users!");
                    temporaryFlag = false;
                }
                String hour = rs.getString("hour(timestamp)");
                Double energy_consumed = rs.getDouble("energy_consumed");
                if(Integer.parseInt(hour)<=12) System.out.println(hour + " AM" + " -> " + energy_consumed + " kwh");
                else  System.out.println(Integer.parseInt(hour)-12 + " PM" + " -> " + energy_consumed + " kwh");
            }
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }
    }

    public static void getApplianceLevelTrends(int householdId, String date)
    {
        String query = "select a1.type, sum(a2.amount_consumed) as amount_consumed\n" +
                "from appliances a1 \n" +
                "join appliance_readings a2 using(appliance_id) \n" +
                "where (a2.household_id = ?) and (date(a2.start_time) = ?) group by a1.type;";
        try(Connection conn = DatabaseConnector.getConnection();
            PreparedStatement psmt = conn.prepareStatement(query))
        {
            psmt.setInt(1,householdId);
            psmt.setString(2,date);
            ResultSet rs = psmt.executeQuery();
            boolean temporaryFlag = true;
            while (rs.next())
            {
                if (temporaryFlag)
                {
                    temporaryFlag = false;
                    System.out.println();
//                    System.out.println("Appliance level trend of the Houshold having household_id = " + householdId + " for the date = " + date);
                    System.out.println("On " + date + " Appliance level trend of the Houshold having id = " + householdId);
                    System.out.println();
                    System.out.println("type -> amount_consumed");
                }
                System.out.println(rs.getString("type") + "->" + rs.getDouble("amount_consumed") + " kwh");

            }
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }

    }


}

//Replace string with local date instance. User can also pass invalid data if data is taken using string data type.
