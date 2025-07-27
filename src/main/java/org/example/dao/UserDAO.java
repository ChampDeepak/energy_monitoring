package org.example.dao;
import org.example.DatabaseConnector;
import org.example.model.User;
//import java.util.*;
import java.sql.*;
public class UserDAO
{
    public void getAllUsers()
    {
        String query = "select * from users";
        try(Connection conn = DatabaseConnector.getConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query))
        {
            while(rs.next())
            {
                int userId = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                System.out.println("ID: " + userId + ", Name: "+name+", Email: " + email);
            }


        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
    }
//String name, String mainAddress, String email, String phone
    public int insertUser(Connection conn, User user) {
        String query = "INSERT INTO users(name, main_address, email, phone) VALUES (?, ?, ?, ?)";

        try (PreparedStatement pstmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {

            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getMainAddress());
            pstmt.setString(3, user.getEmail());
            pstmt.setString(4, user.getPhone());

            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                try (ResultSet generatedKeys = pstmt.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        return generatedKeys.getInt(1); // return the generated user_id
                    }
                }
            }

        } catch (SQLException e) {
            e.printStackTrace(); // or better: log it properly
        }

        return -1; // indicate failure
    }

}
