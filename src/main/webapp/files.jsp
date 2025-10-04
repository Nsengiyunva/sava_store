<%@ page import="java.util.List" %>
<%@ page import="com.sava.FileRecord" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Uploaded Files | Tailwind + JSP</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen flex flex-col items-center p-6">

    <div class="w-full max-w-4xl bg-white shadow-xl rounded-2xl p-6">
        <h2 class="text-3xl font-bold text-blue-600 mb-6 text-center">Uploaded Files</h2>

        <div class="overflow-x-auto">
            <table class="min-w-full border border-gray-200 divide-y divide-gray-200">
                <thead class="bg-blue-100">
                    <tr>
                        <th class="px-4 py-2 text-left text-sm font-medium text-gray-700">ID</th>
                        <th class="px-4 py-2 text-left text-sm font-medium text-gray-700">File Name</th>
                        <th class="px-4 py-2 text-left text-sm font-medium text-gray-700">Uploaded At</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-gray-200">
                    <%
                        List<FileRecord> files = (List<FileRecord>) request.getAttribute("files");
                        if (files != null && !files.isEmpty()) {
                            for (FileRecord f : files) {
                    %>
                    <tr class="hover:bg-gray-50">
                        <td class="px-4 py-2 text-sm text-gray-700"><%= f.getId() %></td>
                        <td class="px-4 py-2 text-sm text-gray-700"><%= f.getFileName() %></td>
                        <td class="px-4 py-2 text-sm text-gray-700"><%= f.getUploadedAt() %></td>
                    </tr>
                    <%      }
                        } else { %>
                    <tr>
                        <td colspan="4" class="px-4 py-4 text-center text-gray-500">No files uploaded yet.</td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>

        <div class="mt-6 text-center">
            <a href="welcome.jsp" class="text-blue-600 hover:underline">← Back to Welcome</a>
        </div>
    </div>

</body>
</html>
