<%@ page import="java.io.File" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Uploaded Files</title>
    <style>
        table {
            border-collapse: collapse;
            width: 60%;
        }
        th, td {
            border: 1px solid #444;
            padding: 8px;
            text-align: left;
        }
        th {
            background: #ddd;
        }
    </style>
</head>
<body>
<h2>File List</h2>
<table>
    <tr>
        <th>File Name</th>
        <th>Size (KB)</th>
    </tr>
    <%
        File[] files = (File[]) request.getAttribute("files");
        if (files != null) {
            for (File f : files) {
                if (f.isFile()) {
    %>
    <tr>
        <td><a href="uploads/<%= f.getName() %>"><%= f.getName() %></a></td>
        <td><%= f.length() / 1024 %></td>
    </tr>
    <%
                }
            }
        }
    %>
</table>
</body>
</html>
