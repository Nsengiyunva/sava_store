<%@ page import="java.util.List" %>
<%@ page import="com.sava.FileRecord" %>

<html>
<head>
    <title>Uploaded Files</title>
</head>
<body>
    <h2>Uploaded Files</h2>

    <table border="1" cellpadding="5" cellspacing="0">
        <tr>
            <th>ID</th>
            <th>File Name</th>
            <th>Uploaded At</th>
            <th>Download</th>
        </tr>

        <%
            List<FileRecord> files = (List<FileRecord>) request.getAttribute("files");
            if (files != null) {
                for (FileRecord f : files) {
        %>
        <tr>
            <td><%= f.getId() %></td>
            <td><%= f.getFileName() %></td>
            <td><%= f.getUploadedAt() %></td>
            <td><a href="<%= f.getFilePath() %>" target="_blank">Download</a></td>
        </tr>
        <%      }
            }
        %>
    </table>
</body>
</html>
