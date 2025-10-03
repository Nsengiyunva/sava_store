package com.sava;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;

@WebServlet("/files")
public class FileListServlet extends HttpServlet {

    private static final String UPLOAD_DIR = "/uploads"; // change to your folder

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        File folder = new File(UPLOAD_DIR);
        File[] listOfFiles = folder.listFiles();

        request.setAttribute("files", listOfFiles);
        request.getRequestDispatcher("files.jsp").forward(request, response);
    }
}
