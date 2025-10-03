package com.sava;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (UserStore.addUser(username, password)) {
            response.sendRedirect("login.jsp");
        } else {
            response.getWriter().println("Username already exists. Go back and try another.");
        }
    }
}
