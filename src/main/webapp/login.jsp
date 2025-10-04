<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-100 flex items-center justify-center min-h-screen">
    <div class="bg-white shadow-lg rounded-2xl p-8 w-full max-w-md">
        <h1 class="text-3xl font-bold text-center text-[#fb8f0c] mb-6">Sign In</h1>

        <% if (request.getParameter("error") != null) { %>
            <p class="text-red-500 text-center mb-4">Invalid username or password</p>
        <% } %>

        <form method="post" action="login" class="space-y-4">
            <div>
                <label for="username" class="block text-sm font-medium text-gray-700 mb-1">Username</label>
                <input
                    type="text"
                    id="username"
                    name="username"
                    class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-400 focus:outline-none"
                    placeholder="Enter your username"
                    required
                    autocomplete="off"
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
                    autocomplete="off"
                >
            </div>

            <button
                type="submit"
                class="w-full bg-[#fb8f0c] text-white font-semibold py-2 rounded-lg hover:bg-[#fb8f0c] transition duration-200"
            >
                Login
            </button>
        </form>
    </div>
</body>
</html>
