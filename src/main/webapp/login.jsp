<% if (request.getParameter("error") != null) { %>
<p style="color:red;">Invalid username or password</p>
<% } %>

<h1>Sign In(Login)</h1>
<form method="post" action="login">
  Username: <input type="text" name="username"><br>
  Password: <input type="password" name="password"><br>
  <input type="submit" value="Login">
</form>