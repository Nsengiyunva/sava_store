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

<body class="bg-gray-100 min-h-screen flex items-center justify-center">
    <div class="bg-white shadow-xl rounded-2xl p-8 w-full max-w-lg">
        <h2 class="text-3xl font-bold text-blue-600 text-center mb-6">
            Welcome, <%= session.getAttribute("user") %>!
        </h2>

        <form method="post" action="upload" enctype="multipart/form-data" class="space-y-4">
            <div>
                <label for="file" class="block text-sm font-medium text-gray-700 mb-2">
                    Choose a file to upload
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
                class="w-full bg-[#fb8f0c] text-white font-semibold py-2 rounded-lg hover:bg-[#fb8f0c] transition duration-200"
            >
                Upload
            </button>
        </form>

        <div class="mt-6 flex justify-between text-sm">
            <a href="files" class="text-[#fb8f0c] hover:underline">View Files</a>
            <a href="logout" class="text-red-600 hover:underline">Logout</a>
        </div>
    </div>
</body>
</html>
