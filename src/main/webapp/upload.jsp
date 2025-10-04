<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%
   if (session == null || session.getAttribute("user") == null) {
       response.sendRedirect("login.jsp");
   }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Upload File | Tailwind + JSP</title>
    <!-- ✅ Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen flex items-center justify-center p-6">

    <div class="bg-white shadow-xl rounded-2xl p-8 w-full max-w-md">
        <h2 class="text-3xl font-bold text-blue-600 mb-6 text-center">Upload a File</h2>

        <form method="post" action="upload" enctype="multipart/form-data" class="space-y-4">
            <div>
                <label for="file" class="block text-sm font-medium text-gray-700 mb-2">
                    Select file to upload
                </label>
                <input
                    type="file"
                    id="file"
                    name="file"
                    required
                    class="w-full border border-gray-300 rounded-lg px-3 py-2 focus:ring-2 focus:ring-blue-400 focus:outline-none"
                >
            </div>

            <button
                type="submit"
                class="w-full bg-blue-600 text-white font-semibold py-2 rounded-lg hover:bg-blue-700 transition duration-200"
            >
                Upload
            </button>
        </form>

        <div class="mt-6 text-center">
            <a href="files" class="text-blue-600 hover:underline">View Uploaded Files</a>
        </div>
    </div>

</body>
</html>