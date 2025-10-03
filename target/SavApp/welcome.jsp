<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%
   if (session == null || session.getAttribute("user") == null) {
       response.sendRedirect("login.jsp");
   }
%>
<h2>Welcome, <%= session.getAttribute("user") %>!</h2>

<form method="post" action="upload" enctype="multipart/form-data">
    <input type="file" name="file" required>
    <br><br>
    <input type="submit" value="Upload">
</form>

<a href="files">Files List</a>

<a href="logout">Logout</a>
