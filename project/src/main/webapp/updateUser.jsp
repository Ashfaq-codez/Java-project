<!DOCTYPE html>
<html>
<head>
    <title>Update User</title>
</head>
<body>
    <h2>Update User</h2>
    <form action="UpdateServlet" method="post">
        <input type="hidden" name="username" value="<%= request.getParameter("username") %>">
        Full Name: <input type="text" name="fullname" value="<%= request.getParameter("fullname") %>" required><br>
        Email: <input type="email" name="email" value="<%= request.getParameter("email") %>" required><br>
        <input type="submit" value="Update">
    </form>
</body>
</html>
