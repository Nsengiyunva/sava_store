package com.sava;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.nio.file.*;

@WebServlet("/download")
public class DownloadServlet extends HttpServlet {
    private static final String UPLOAD_DIR = "/Users/user/Documents/SavAppUploads";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String fileName = request.getParameter("file"); // ?file=carpenter.pdf
        File file = new File(UPLOAD_DIR, fileName);

        if (!file.exists()) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        response.setContentType(getServletContext().getMimeType(file.getName()));
        response.setHeader("Content-Disposition", "attachment; filename=\"" + file.getName() + "\"");
        Files.copy(file.toPath(), response.getOutputStream());
    }
}
