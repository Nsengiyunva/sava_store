<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register | Tailwind + JSP</title>
    <!-- ✅ Tailwind CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-100 flex items-center justify-center min-h-screen">
    <div class="bg-white shadow-lg rounded-2xl p-8 w-full max-w-md">
        <h2 class="text-3xl font-bold text-center text-blue-600 mb-6">Registration</h2>

        <% if (request.getParameter("error") != null) { %>
            <p class="text-red-500 text-center mb-4">Registration failed. Try again.</p>
        <% } %>
        <% if (request.getParameter("success") != null) { %>
            <p class="text-green-600 text-center mb-4">Account created successfully!</p>
        <% } %>

        <form method="post" action="register" class="space-y-4">
            <div>
                <label for="username" class="block text-sm font-medium text-gray-700 mb-1">Username</label>
                <input
                    type="text"
                    id="username"
                    name="username"
                    class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-400 focus:outline-none"
                    placeholder="Enter your username"
                    required
                >
            </div>

            <div>
                <label for="password" class="block text-sm font-medium text-gray-700 mb-1">Password</label>
                <input
                    type="password"
                    id="password"
                    name="password"
                    class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-400 focus:outline-none"
                    placeholder="Enter your password"
                    required
                >
            </div>

            <button
                type="submit"
                class="w-full bg-blue-600 text-white font-semibold py-2 rounded-lg hover:bg-blue-700 transition duration-200"
            >
                Register
            </button>
        </form>

        <p class="text-center text-sm text-gray-600 mt-4">
            Already have an account?
            <a href="login.jsp" class="text-blue-600 hover:underline">Login here</a>
        </p>
    </div>
</body>
</html>
