package org.example.dao;

import org.example.model.Household;

import java.sql.*;

public class HouseholdDAO
{
    public int insertHousehold(Connection conn, Household household)
    {
        String query = "insert into household(user_id, household_name, household_address) values(?,?,?)";
        try(PreparedStatement pstmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS))
        {
            pstmt.setInt(1,household.getUserId());
            pstmt.setString(2,household.getHouseholdName());
            pstmt.setString(3, household.getHouseholdAddress());

            int rowsAffected = pstmt.executeUpdate();
            if(rowsAffected>0)
            {
                try(ResultSet generatedKeys = pstmt.getGeneratedKeys())
                {
                    if(generatedKeys.next()) return generatedKeys.getInt(1);
                }
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        return  -1;
    }
}
