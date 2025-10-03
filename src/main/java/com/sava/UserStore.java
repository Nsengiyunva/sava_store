package com.sava;

import java.sql.*;

public class UserStore {

    // Add a new user
    public static boolean addUser(String username, String password) {
        try (Connection conn = DBUtil.getConnection()) {
            String sql = "INSERT INTO sava_user(username, password) VALUES (?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("Could not add user: " + e.getMessage());
            return false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // Validate login credentials
    public static boolean validate(String username, String password) {
        try (Connection conn = DBUtil.getConnection()) {
            String sql = "SELECT * FROM users WHERE username=? AND password=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
