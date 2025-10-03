package com.sava;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class DBUtil {
    private static final String URL = "jdbc:postgresql://localhost:5432/savadb";
    private static final String USER = "jspuser";       // your DB user
    private static final String PASS = "admin256";   // your DB password

    static {
        try {
            // Load PostgreSQL driver
            Class.forName("org.postgresql.Driver");

            // Create table if it doesn't exist
            try (Connection conn = getConnection();
                 Statement stmt = conn.createStatement()) {
                String sql = "CREATE TABLE IF NOT EXISTS sava_user (" +
                        "id SERIAL PRIMARY KEY," +
                        "username VARCHAR(50) UNIQUE NOT NULL," +
                        "password VARCHAR(100) NOT NULL" +
                        ")";
                stmt.executeUpdate(sql);
                System.out.println("✅ Table 'sava_user' checked/created successfully!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() throws Exception {
        return DriverManager.getConnection(URL, USER, PASS);
    }
}
