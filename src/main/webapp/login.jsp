<!DOCTYPE html>
<html>
<head>
    <title>Student Login</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="box">
    <h2>Student Login</h2>

    <% if (request.getParameter("error") != null) { %>
        <p class="error">Invalid email or password</p>
    <% } %>

    <form action="login" method="post">
        <input type="email" name="email" placeholder="Enter Email" required>
        <input type="password" name="password" placeholder="Enter Password" required>
        <button type="submit">Login</button>
    </form>

    <a href="register.jsp">Create new account</a>
</div>
</body>
</html>
