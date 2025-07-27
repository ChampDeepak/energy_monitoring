package org.example.dao;

import org.example.model.SmartPlug;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

public class SmartPlugDAO
{
    public int insertSmartPlug(Connection conn, SmartPlug smartPlug)
    {
        String query = "insert into smart_plug(plug_id, household_id) values(?,?)";
        try(PreparedStatement psmt = conn.prepareStatement(query))
        {
            psmt.setInt(1,smartPlug.getPlugId());
            psmt.setInt(2,smartPlug.getHouseholdId());
            int rowsAffected = psmt.executeUpdate();
            if(rowsAffected>0)
            {
                return 1;
            }
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }
        return -1;
    }
}
