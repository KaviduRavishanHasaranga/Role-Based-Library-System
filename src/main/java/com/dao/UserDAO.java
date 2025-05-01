package com.dao;

import com.model.User;

import java.sql.*;

public class UserDAO {

    public User validateUser(String username, String password) {
        User user = null;
        String sql = "SELECT * FROM users WHERE username=? AND password=?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setRole(rs.getString("role"));
                // Note: password is usually not set again for security reasons
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
}
