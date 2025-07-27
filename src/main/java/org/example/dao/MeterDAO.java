package org.example.dao;

import org.example.model.Meter;

import java.sql.*;

public class MeterDAO
{
    public int insertMeter(Connection conn, Meter meter)
    {
        String query = "insert into meter(household_id, meter_type_id, serial_number) values(?,?,?)";
        try(PreparedStatement pstmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS))
        {
            pstmt.setInt(1,meter.getHouseholdId());
            pstmt.setInt(2,meter.getMeterTypeId());
            pstmt.setString(3,meter.getSerialNumber());

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
        return -1;
    }
}
