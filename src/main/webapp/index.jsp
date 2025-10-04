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
    <title>Welcome | Tailwind + JSP</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex items-center justify-center min-h-screen">

    <div class="bg-white shadow-xl rounded-2xl p-8 w-full max-w-md text-center">
        <h2 class="text-3xl font-bold text-blue-600 mb-4">
            Welcome, <%= session.getAttribute("user") %>!
        </h2>
        <p class="text-gray-600 mb-6">You have successfully logged in.</p>

        <div class="space-y-4">
            <a href="dashboard.jsp"
               class="block w-full bg-blue-600 text-white font-semibold py-2 rounded-lg hover:bg-blue-700 transition duration-200">
               Go to Dashboard
            </a>

            <a href="logout"
               class="block w-full bg-red-500 text-white font-semibold py-2 rounded-lg hover:bg-red-600 transition duration-200">
               Logout
            </a>
        </div>
    </div>

</body>
</html>