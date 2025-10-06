package com.sava;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/files")
public class FileListServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:postgresql://localhost:5432/savadb";
    private static final String DB_USER = "jspuser";  // adjust
    private static final String DB_PASS = "admin256";  // adjust

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<FileRecord> files = new ArrayList<>();

        try {
            Class.forName("org.postgresql.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);

            String sql = "SELECT DISTINCT id, file_name, file_path, uploaded_at, app_type, app_platform, app_version, app_name FROM uploaded_files ORDER BY uploaded_at DESC";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                FileRecord file = new FileRecord(
                        rs.getInt("id"),
                        rs.getString("file_name"),
                        rs.getString("file_path"),
                        rs.getTimestamp("uploaded_at"),
                        rs.getString("app_type"),
                        rs.getString("app_platform"),
                        rs.getString("app_version"),
                        rs.getString("app_name")
                );
                files.add(file);
            }

            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception e) {
            throw new ServletException(e);
        }

        // put into request scope
        request.setAttribute("files", files);

        // forward to JSP
        request.getRequestDispatcher("files.jsp").forward(request, response);
    }
}
