<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%
   if (session == null || session.getAttribute("user") == null) {
       response.sendRedirect("login.jsp");
   }
%>
<h2>Upload a File</h2>
<form method="post" action="upload" enctype="multipart/form-data">
    <input type="file" name="file" required>
    <br><br>
    <input type="submit" value="Upload">
</form>
