<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%
   if (session == null || session.getAttribute("user") == null) {
       response.sendRedirect("login.jsp");
   }
%>
<h2>Welcome, <%= session.getAttribute("user") %>!</h2>
<a href="logout">Logout</a>
