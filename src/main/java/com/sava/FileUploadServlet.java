package com.sava;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/upload")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,       // 1MB
        maxFileSize = 1024 * 1024 * 10,        // 10MB
        maxRequestSize = 1024 * 1024 * 15      // 15MB
)
public class FileUploadServlet extends HttpServlet {

    private static final String UPLOAD_DIR = "uploads";

    private static final String DB_URL = "jdbc:postgresql://localhost:5432/savadb";
    private static final String DB_USER = "jspuser";
    private static final String DB_PASSWORD = "admin256";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ✅ Step 1: Check session
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp?error=unauthorized");
            return;
        }

        // ✅ Step 2: Get form parameters
        String appName = request.getParameter("appName");
        String appVersionStr = request.getParameter("appVersion");
        String appPlatform = request.getParameter("appPlatform");
        String appType = request.getParameter("appType");

        if (appName == null || appVersionStr == null || appPlatform == null || appType == null
                || appName.isEmpty() || appVersionStr.isEmpty() || appPlatform.isEmpty() || appType.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "All fields are required");
            return;
        }

        // ✅ Step 3: Parse numeric version
        int appVersion;
        try {
            appVersion = Integer.parseInt(appVersionStr);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "App version must be a number");
            return;
        }

        // ✅ Step 4: Prepare upload path
        String applicationPath = request.getServletContext().getRealPath("");
        String uploadPath = applicationPath + File.separator + UPLOAD_DIR;

        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        // ✅ Step 5: Handle file upload
        Part filePart = request.getPart("file");
        if (filePart == null || filePart.getSize() == 0) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "No file selected");
            return;
        }

        String fileName = new File(filePart.getSubmittedFileName()).getName();
        String filePath = uploadPath + File.separator + fileName;

        filePart.write(filePath);

        // ✅ Step 6: Insert into PostgreSQL
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(
                     "INSERT INTO uploaded_files " +
                             "(file_name, file_path, uploaded_by, app_name, app_version, app_platform, app_type) " +
                             "VALUES (?, ?, ?, ?, ?, ?, ?)")) {

            stmt.setString(1, fileName);
            stmt.setString(2, filePath);
            stmt.setString(3, session.getAttribute("user").toString());
            stmt.setString(4, appName);
            stmt.setInt(5, appVersion);
            stmt.setString(6, appPlatform);
            stmt.setString(7, appType);

            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("<p style='color:red;'>Database error: " + e.getMessage() + "</p>");
            return;
        }

        // ✅ Step 7: Response to user
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().println("<h3>File <strong>" + fileName + "</strong> uploaded successfully!</h3>");
        response.getWriter().println("<p>App Name: " + appName + " | Version: " + appVersion +
                " | Platform: " + appPlatform + " | Type: " + appType + "</p>");
        response.getWriter().println("<a href='upload.jsp'>Upload another file</a> | <a href='files'>View Files</a>");
    }
}
