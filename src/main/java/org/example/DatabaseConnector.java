package org.example;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnector {
    private static String DB_URL ;
    private static String DB_USERNAME ;
    private static String DB_PASSWORD ;

    public static void setCredentials(String url, String username, String password) {
        DB_URL = url;
        DB_USERNAME = username;
        DB_PASSWORD = password;
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
    }
    public static void testConnection() throws SQLException
    {
        try(Connection conn = getConnection())
        {
            if(conn!=null) System.out.println("Connected to the Database!");
        }
        catch (SQLException e)
        {
            System.out.println("Database connection failed.");
            e.printStackTrace();
        }
    }
}